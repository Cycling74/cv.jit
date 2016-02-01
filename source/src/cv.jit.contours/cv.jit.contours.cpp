

//#include "opencv2/imgproc/imgproc.hpp"
//#include "opencv2/imgcodecs.hpp"
//#include "opencv2/highgui.hpp"
//#include "opencv2/video/tracking.hpp"

/*
#include "osc.h"
#include "osc_bundle_u.h"
#include "osc_bundle_s.h"
#include "osc_timetag.h"
#include "omax_util.h"
*/

#include "jit.common.h"
#include "max.jit.mop.h"
#include "ext_dictobj.h"

#include "opencv2/opencv.hpp"

#include "cv.jit.contour.flow.h"

#define CV_JIT_MAX_IDS 100

using namespace std;
using namespace cv;

typedef struct _cv_contours
{
    t_object    ob;
    void        *obex;
    void        *outlet;
    t_critical  lock;
    
    //attrs
    long        erosion_size;
    long        dilation_size;
    long        gauss_sigma;
    long        gauss_ksize;
    double      resize_scale;
    long        thresh;
    long        invert;
    
    double      track_radius;
    
    t_dictionary *attr_dict; //to do
    
    // dict
    long        dict_mode;
    t_symbol    *dict_name;
    
    ContourFlow flow;
    
    vector<Point2f> prev_centroids;
    vector<int>     prev_centroid_id;
    int             id_used[CV_JIT_MAX_IDS];
    
} t_cv_contours;


BEGIN_USING_C_LINKAGE
void		*cv_contours_new(t_symbol *s, long argc, t_atom *argv);
void		cv_contours_free(t_cv_contours *x);
END_USING_C_LINKAGE

t_class	*cv_contours_class = NULL;

t_symbol *addr_cx;
t_symbol *addr_cy;
t_symbol *addr_centroidx;
t_symbol *addr_centroidy;
t_symbol *addr_sx;
t_symbol *addr_sy;
t_symbol *addr_angle;
t_symbol *addr_area;
t_symbol *addr_parimeter;

t_symbol *addr_hullarea;
t_symbol *addr_area_sort;
t_symbol *addr_child_of;
t_symbol *addr_focus;
t_symbol *addr_convex;
t_symbol *addr_srcdim;
t_symbol *addr_defect_count;
t_symbol *addr_defect_dist_sum;
t_symbol *addr_depth;
t_symbol *addr_defect_ptlist;
t_symbol *addr_hull_count;
t_symbol *addr_hull_pt_array;
t_symbol *addr_contour_count;
t_symbol *addr_x;
t_symbol *addr_y;
t_symbol *addr_startx;
t_symbol *addr_starty;
t_symbol *addr_endx;
t_symbol *addr_endy;
t_symbol *addr_id;
t_symbol *addr_eccentricity;
t_symbol *addr_rotmaj;
t_symbol *addr_rotmin;

t_symbol *temp_addr_minrect;


static void cv_contours_dict_out(t_cv_contours *x, const Mat frame)
{
    // preprocess
    
    Mat src_gray;
    
    {
        Mat src_color_sized;
        
        if( (frame.size().height * x->resize_scale) < 1.0 )
            x->resize_scale += (1.0/frame.size().height) - x->resize_scale;
            
        cv::resize( frame, src_color_sized, cv::Size(), x->resize_scale, x->resize_scale, INTER_AREA );
        
        if (frame.channels() == 1)
            src_gray = frame.clone();
        else if( frame.channels() == 4 )
            cvtColor(src_color_sized, src_gray, CV_RGBA2GRAY);
        else if (frame.channels() == 3)
            cvtColor(src_color_sized, src_gray, CV_RGB2GRAY);
        else
        {
            object_error((t_object *)x, "unsupported plane number");
            return;
        }
        
        if( src_gray.data == NULL )
            return;
        
    }
    
    if(x->invert > 0)
    {
        bitwise_not(src_gray, src_gray);
    }

    
    GaussianBlur(src_gray, src_gray, cv::Size((int)x->gauss_ksize, (int)x->gauss_ksize), x->gauss_sigma, x->gauss_sigma);
    
    {
        Mat di_element = getStructuringElement( MORPH_RECT,
                                               cv::Size( 2*(int)x->dilation_size + 1, 2*(int)x->dilation_size+1 ),
                                               cv::Point( (int)x->dilation_size, (int)x->dilation_size ) );
        dilate( src_gray, src_gray, di_element );
    }
    
    {
        Mat er_element = getStructuringElement( MORPH_RECT,
                                               cv::Size( 2*(int)x->erosion_size + 1, 2*(int)x->erosion_size+1 ),
                                               cv::Point( (int)x->erosion_size, (int)x->erosion_size ) );
        erode( src_gray, src_gray, er_element );
    }
    
    //analyze
    vector<vector<cv::Point> > contours;
    vector<Vec4i> hierarchy;

    {
        Mat threshold_output;
        threshold( src_gray, threshold_output, x->thresh, 255, THRESH_BINARY );
        
        findContours( threshold_output, contours, hierarchy, CV_RETR_CCOMP, CV_CHAIN_APPROX_SIMPLE, cv::Point(0, 0) );
    }
    

    /// sizes based on contours
    vector<RotatedRect> minRect( contours.size() );
//    vector<RotatedRect> minEllipse( contours.size() ); //<< just using minRect for now
    vector<cv::Rect> boundRect( contours.size() );
    vector<vector<cv::Point> >hullP( contours.size() );
    vector<vector<int> >hullI( contours.size() );
    vector<vector<Vec4i> >defects( contours.size() );
    vector<double>focus_val( contours.size() );
    vector<double>contour_area( contours.size() );
    
    vector<Point2f> centroids( contours.size() );
    
    //flat vector for optical flow
    vector<cv::Point> defect_startpt;
    
    t_dictionary *cv_dict = dictionary_new();
    cv_dict = dictobj_register(cv_dict, &x->dict_name);
    
    t_atomarray *srcdim = atomarray_new(0, NULL);
    
    t_atomarray *contour_count = atomarray_new(0, NULL);
    t_atomarray *cx = atomarray_new(0, NULL);
    t_atomarray *cy = atomarray_new(0, NULL);
    t_atomarray *sx = atomarray_new(0, NULL);
    t_atomarray *sy = atomarray_new(0, NULL);
    
    t_atomarray *centroidx = atomarray_new(0, NULL);
    t_atomarray *centroidy = atomarray_new(0, NULL);
    
    t_atomarray *parimeter = atomarray_new(0, NULL);
    t_atomarray *angle = atomarray_new(0, NULL);
    t_atomarray *eccentricity = atomarray_new(0, NULL);
    t_atomarray *rotmin = atomarray_new(0, NULL);
    t_atomarray *rotmaj = atomarray_new(0, NULL);
    
    t_atomarray *area = atomarray_new(0, NULL);
    t_atomarray *child_of = atomarray_new(0, NULL);

    t_atomarray *focus = atomarray_new(0, NULL);
    
    t_atomarray *convex = atomarray_new(0, NULL);
    t_atomarray *hull_count = atomarray_new(0, NULL);
    t_atomarray *hullarea = atomarray_new(0, NULL);

    t_atomarray *defect_count = atomarray_new(0, NULL);
    t_atomarray *defect_dist_sum = atomarray_new(0, NULL);


    t_atom at;
    atom_setlong(&at, src_gray.size().width);
    atomarray_appendatom(srcdim, &at);
    atom_setlong(&at, src_gray.size().height);
    atomarray_appendatom(srcdim, &at);
    
    long npix = src_gray.size().width * src_gray.size().height;

    char buf[256];
    
    t_dictionary *contour_dict = dictionary_new();
    
    for( int i = 0; i < contours.size(); i++ )
    {
        
        t_dictionary *contour_sub = dictionary_new();
        
        sprintf(buf, "/%d", i);
        t_symbol *idr = gensym(buf);
        dictionary_appendlong(contour_sub, addr_id, i);
        
        atom_setlong(&at, contours[i].size());
        atomarray_appendatom(contour_count, &at);
        
        atom_setlong(&at, hierarchy[i][3] );
        atomarray_appendatom(child_of, &at);

        atom_setfloat(&at, arcLength(contours[i], true));
        atomarray_appendatom(parimeter, &at);

        
        contour_area[i] = contourArea(Mat(contours[i]));
        
        atom_setfloat(&at, contour_area[i] / (double)npix );
        atomarray_appendatom(area, &at);
        
        boundRect[i] = boundingRect( Mat(contours[i]) );
        
        // NOTE: minAreaRect function also computes convex hull internally, so this could be optimized later
        minRect[i] = minAreaRect( Mat(contours[i]) );

        t_dictionary *minrect_pts_sub = dictionary_new();
        t_atomarray *minr_ptx = atomarray_new(0, NULL);
        t_atomarray *minr_pty = atomarray_new(0, NULL);
        
        Point2f pts[4];
        minRect[i].points(pts);
        
        for(int i = 0; i < 4; i++)
        {
//            printf("%f %f\n", pts[i].x, pts[i].y);
            atom_setfloat(&at, pts[i].x / (double)src_gray.size().width );
            atomarray_appendatom(minr_ptx, &at);
            atom_setfloat(&at, 1. - (pts[i].y / (double)src_gray.size().height) );
            atomarray_appendatom(minr_pty, &at);
        }
        
        dictionary_appendatomarray(minrect_pts_sub, addr_x, (t_object *)minr_ptx);
        dictionary_appendatomarray(minrect_pts_sub, addr_y, (t_object *)minr_pty);
        dictionary_appenddictionary(contour_sub, temp_addr_minrect, (t_object *)minrect_pts_sub);
        
        atom_setfloat(&at, minRect[i].size.height / (double)src_gray.size().height);
        atomarray_appendatom(rotmaj, &at);
        
        atom_setfloat(&at, minRect[i].size.width / (double)src_gray.size().width);
        atomarray_appendatom(rotmin, &at);
        
        
        double centerx = minRect[i].center.x;
        double centery = minRect[i].center.y;
        
        atom_setfloat(&at, centerx / (double)src_gray.size().width );
        atomarray_appendatom(cx, &at);
        
        atom_setfloat(&at, 1. - (centery / (double)src_gray.size().height) );
        atomarray_appendatom(cy, &at);
        
        atom_setfloat(&at, boundRect[i].width / (double)src_gray.size().width );
        atomarray_appendatom(sx, &at);
        
        atom_setfloat(&at, boundRect[i].height / (double)src_gray.size().height );
        atomarray_appendatom(sy, &at);
        
        double ctrdx = centerx;
        double ctrdy = centery;

        Moments moms = moments( contours[i] );
        if( moms.m00 != 0.0 )
        {
            ctrdx = moms.m10 / moms.m00;
            ctrdy = moms.m01 / moms.m00;

        }
        
        atom_setfloat(&at, ctrdx / (double)src_gray.size().width );
        atomarray_appendatom(centroidx, &at);
        
        atom_setfloat(&at, 1. - (ctrdy / (double)src_gray.size().height) );
        atomarray_appendatom(centroidy, &at);

        centroids[i].x = ctrdx;
        centroids[i].y = ctrdy;
        
        /*
         double uu20 = moms.mu20/moms.m00;
         double uu02 = moms.mu02/moms.m00;
         double uu11 = moms.mu11/moms.m00;
         
         double duu = uu20 - uu02;
         double theta;
         
         if( duu != 0)
         theta = 0.5 * atan( (2.0 * uu11) / (uu20 - uu02) );
         else
         theta = 0;
         */

        /*
        double cdx = centerx - ctrdx;
        double cdy = centery - ctrdy;
        double cdtheta = atan2(cdy, cdx)*57.2958;
         //idea: make sure angle is the same direction as angle between centroid and minrect center
         // maybe not necessary
         */
        
        double r_angle = minRect[i].angle;
        double out_angle = 0.0;
        if( minRect[i].size.height > minRect[i].size.width )
        {
            out_angle = -r_angle + 90.0;
        }
        else
        {
            out_angle = -r_angle;
        }
//        printf("%d %f %f %f\n", i, out_angle, cdtheta, out_angle - cdtheta);
        
        atom_setfloat(&at, out_angle);
        atomarray_appendatom(angle, &at);
        
        atom_setlong(&at, isContourConvex(Mat(contours[i])) );
        atomarray_appendatom(convex, &at);

        
        // eccentricity (could be just major/minor of min rect?)
        double mumin = moms.mu20 - moms.mu02;
        double muplu = moms.mu20 + moms.mu02;
        double mu11 = moms.mu11;
        double ecc = (mumin*mumin - 4.0*mu11*mu11) / (muplu*muplu);
/*
        double mumin = moms.mu20 - moms.mu02;
        double muplu = moms.mu20 + moms.mu02;
        double eccsqrt = sqrt(mumin*mumin + 4*moms.mu11*moms.mu11);
        double ecc = (muplu + eccsqrt) / (muplu - eccsqrt);
*/
        atom_setfloat(&at, ecc);
        atomarray_appendatom(eccentricity, &at);
        
        // hull
        convexHull( Mat(contours[i]), hullP[i], false );
        convexHull( Mat(contours[i]), hullI[i], false );
        
        if( hullI[i].size() > 3 )
            convexityDefects( contours[i], hullI[i], defects[i] );
        
        t_dictionary *hullpts = dictionary_new();
        t_atomarray *hull_x = atomarray_new(0, NULL);
        t_atomarray *hull_y = atomarray_new(0, NULL);

        for( long hpi = 0; hpi < hullI[i].size(); hpi++ )
        {
            atom_setfloat(&at,  hullP[i][hpi].x / (double)src_gray.size().width );
            atomarray_appendatom( hull_x, &at );
            
            atom_setfloat(&at,  1. - (hullP[i][hpi].y / (double)src_gray.size().height) );
            atomarray_appendatom( hull_y, &at );
        }

        dictionary_appendatomarray(hullpts, addr_x, (t_object *)hull_x);
        dictionary_appendatomarray(hullpts, addr_y, (t_object *)hull_y);
        dictionary_appenddictionary(contour_sub, addr_hull_pt_array, (t_object *)hullpts);

        Mat rot_mtx = getRotationMatrix2D(minRect[i].center, minRect[i].angle, 1.0);

        
        focus_val[i] = 0.0;
        if( (minRect[i].size.width > 15) && (minRect[i].size.height > 15))
        {

            Mat rot;
            Mat roi;
            warpAffine( src_gray, rot, rot_mtx, src_gray.size(), INTER_AREA );
            getRectSubPix(rot, minRect[i].size, minRect[i].center, roi);

//            Mat roi = src_gray( boundRect[i] ); //<< alternate version for focus roi
            
            Mat lap;
            Laplacian(roi, lap, CV_16S, 5);
            Scalar avg = mean(lap);
            focus_val[i] = avg[0];
        }

/*
        if( contours[i].size() > 5 )
        {
            minEllipse[i] = fitEllipse( Mat(contours[i]) );
//            post("%d %f %f", i, minRect[i].angle, minEllipse[i].angle );
        }
*/
        
        Mat convexcontour;
        approxPolyDP(Mat(hullP[i]), convexcontour, 0.001, true);
        
        atom_setfloat(&at, contourArea(convexcontour) / (double)npix );
        atomarray_appendatom(hullarea, &at);
        
        
        atom_setfloat(&at, focus_val[i] );
        atomarray_appendatom(focus, &at);
        
        //(defects[i].size() > 0 ) ? (defects[i].size() / (double)hullI[i].size()) : 0
        atom_setlong(&at, defects[i].size() );
        atomarray_appendatom(defect_count, &at);
        
        atom_setlong(&at, hullI[i].size() );
        atomarray_appendatom(hull_count, &at);
        

        t_dictionary *defectpts = dictionary_new();
        t_atomarray *defect_x = atomarray_new(0, NULL);
        t_atomarray *defect_y = atomarray_new(0, NULL);
        t_atomarray *defect_depth = atomarray_new(0, NULL);

        t_atomarray *defect_startx = atomarray_new(0, NULL);
        t_atomarray *defect_starty = atomarray_new(0, NULL);
        t_atomarray *defect_endx = atomarray_new(0, NULL);
        t_atomarray *defect_endy = atomarray_new(0, NULL);
        
        double dist_sum = 0;
        vector<double> defect_dist;
        vector<Vec4i>::iterator d = defects[i].begin();
        while ( d != defects[i].end() )
        {
            Vec4i& v = (*d);
            cv::Point ptStart(  contours[ i ][ v[0] ] );
            cv::Point ptEnd(    contours[ i ][ v[1] ] );
            cv::Point ptFar(    contours[ i ][ v[2] ] );

            atom_setfloat(&at, ptFar.x / (double)src_gray.size().width );
            atomarray_appendatom(defect_x, &at);

            atom_setfloat(&at, 1. - (ptFar.y / (double)src_gray.size().height)  );
            atomarray_appendatom(defect_y, &at);

            atom_setfloat(&at, ptStart.x / (double)src_gray.size().width );
            atomarray_appendatom(defect_startx, &at);
            
            atom_setfloat(&at, 1. - (ptStart.y / (double)src_gray.size().height)  );
            atomarray_appendatom(defect_starty, &at);
            
            atom_setfloat(&at, ptEnd.x / (double)src_gray.size().width );
            atomarray_appendatom(defect_endx, &at);
            
            atom_setfloat(&at, 1. - (ptEnd.y / (double)src_gray.size().height)  );
            atomarray_appendatom(defect_endy, &at);
            
            atom_setfloat(&at, v[3] / 256.0);
            atomarray_appendatom(defect_depth, &at);

            //float depth = v[3] / 256.; // depth from center of contour
            double dist = norm(ptFar - ptStart);
            dist_sum += dist;
            defect_startpt.push_back( ptStart );
            defect_dist.push_back( dist / npix);

            d++;
        }
        atom_setfloat(&at, dist_sum);
        atomarray_appendatom(defect_dist_sum, &at);
        
        dictionary_appendatomarray(defectpts, addr_startx, (t_object *)defect_startx);
        dictionary_appendatomarray(defectpts, addr_starty, (t_object *)defect_starty);
        dictionary_appendatomarray(defectpts, addr_endx, (t_object *)defect_endx);
        dictionary_appendatomarray(defectpts, addr_endy, (t_object *)defect_endy);
        dictionary_appendatomarray(defectpts, addr_x, (t_object *)defect_x);
        dictionary_appendatomarray(defectpts, addr_y, (t_object *)defect_y);
        dictionary_appendatomarray(defectpts, addr_depth, (t_object *)defect_depth);
        dictionary_appendlong(defectpts, addr_id, i);
        dictionary_appenddictionary(contour_sub, addr_defect_ptlist, (t_object *)defectpts);
        
        // add contour id sub to main dict
        dictionary_appenddictionary(contour_dict, idr, (t_object *)contour_sub);

    }

    t_atomarray *idlist = atomarray_new(0, NULL);
    if( x->prev_centroids.size() == 0 )
    {
        vector<int> new_ids( centroids.size(), -1 );

        for( int i = 0; i < centroids.size(); i++ )
        {
            x->id_used[i] = 1;
            new_ids[i] = i;
//            printf("assigning new %d \n", new_ids[i] );

            atom_setlong(&at, i);
            atomarray_appendatom(idlist, &at);
        }
        
        x->prev_centroids = centroids;
        x->prev_centroid_id = new_ids;
    }
    else
    {
        // if prev centroids are accounted for, then keep the same ids, if not found release id for prev centroid
        vector<int> new_ids( centroids.size(), -1 );
        
        int closest_id = -1;
        double radius_max = x->track_radius * src_gray.size().height;
        double min = radius_max;
        
        // fist check if previous points are found
        for( int j = 0; j < x->prev_centroids.size(); j++ )
        {
//            printf("old check %d %d\n", j, x->prev_centroid_id[j] );

            min = radius_max;
            closest_id = -1;

            for( int i = 0; i < centroids.size(); i++ )
            {
                double delta = norm(centroids[i] - x->prev_centroids[j]);
                
                // if within range and if not yet assigned, do assignment
                if( delta <= radius_max && new_ids[i] == -1 )
                {
                    if( min >= delta )
                    {
                        min = delta;
                        closest_id = i;
                    }
                }
            }
            
            if( closest_id > -1 )
            {
                new_ids[closest_id] = x->prev_centroid_id[j];
            }
            else
            {
                x->id_used[ x->prev_centroid_id[j] ] = 0;
            }
        }
        
        // check for unassigned new_ids, and then find the first unused id number:
        for( int i = 0; i < centroids.size(); i++ )
        {
//            printf("new check %d %d\n", i, new_ids[i] );

            if( new_ids[i] == -1 )
            {
//                printf("assigning new %d \t", i );

                for( int n = 0; n < CV_JIT_MAX_IDS; n++ )
                {
                    if( x->id_used[n] == 0)
                    {
                        new_ids[i] = n;
                        x->id_used[n] = 1;
                        break;
                    }
                }
//                printf("is %d \n", new_ids[i] );
            }
            
            atom_setlong(&at, new_ids[i]);
            atomarray_appendatom(idlist, &at);
        }
     
        x->prev_centroids = centroids;
        x->prev_centroid_id = new_ids;
    }
    
    /*
    printf("*********\n");
    for( int n = 0; n < CV_JIT_MAX_IDS; n++ )
        printf("%d ", x->id_used[n] );
    
    printf("*********\n");
    */
    
    /* TO DO: for better tracking, try using optical flow:
        1) set previous points
        2) do flow calc
        3) check resulting points from flow track
        4) compare with centroids and assign ids based on balence between centriod distances and optical flow pixel tracking
     */
    
    dictionary_appendatomarray(cv_dict, gensym("/ids"), (t_object *)idlist);
    
    
    /*
    t_atomarray *flowPtsx = atomarray_new(0, NULL);
    t_atomarray *flowPtsy = atomarray_new(0, NULL);
    t_atomarray *flowstatus = atomarray_new(0, NULL);

    {
        // after iterating contours, send centroids to optical flow analysis
        vector<uchar> status;
        vector<float> err;
        vector<Point2f> out_points;
        x->flow.processFrame(src_gray, centroids, out_points, status, err);

        for( int i = 0; i < out_points.size(); i++)
        {
            atom_setlong(&at, status[i]);
            atomarray_appendatom(flowstatus, &at);
            atom_setfloat(&at, out_points[i].x / (double)src_gray.size().width );
            atomarray_appendatom(flowPtsx, &at);
            atom_setfloat(&at, 1.0 - (out_points[i].y / (double)src_gray.size().height) );
            atomarray_appendatom(flowPtsy, &at);
        }
        std::swap(centroids, x->prev_centroids);
    }

    dictionary_appendatomarray(cv_dict, gensym("/flow/x"), (t_object *)flowPtsx);
    dictionary_appendatomarray(cv_dict, gensym("/flow/y"), (t_object *)flowPtsy);
    dictionary_appendatomarray(cv_dict, gensym("/flow/status"), (t_object *)flowstatus);
     */
    
    dictionary_appendatomarray(cv_dict, addr_cx, (t_object *)cx);
    dictionary_appendatomarray(cv_dict, addr_cy, (t_object *)cy);
    dictionary_appendatomarray(cv_dict, addr_sx, (t_object *)sx);
    dictionary_appendatomarray(cv_dict, addr_sy, (t_object *)sy);
    dictionary_appendatomarray(cv_dict, addr_centroidx, (t_object *)centroidx);
    dictionary_appendatomarray(cv_dict, addr_centroidy, (t_object *)centroidy);
    dictionary_appendatomarray(cv_dict, addr_eccentricity, (t_object *)eccentricity);
    dictionary_appendatomarray(cv_dict, addr_rotmin, (t_object *)rotmin);
    dictionary_appendatomarray(cv_dict, addr_rotmaj, (t_object *)rotmaj);
    dictionary_appendatomarray(cv_dict, addr_angle, (t_object *)angle);
    dictionary_appendatomarray(cv_dict, addr_area, (t_object *)area);
    dictionary_appendatomarray(cv_dict, addr_hullarea, (t_object *)hullarea);
    dictionary_appendatomarray(cv_dict, addr_parimeter, (t_object *)parimeter);
    dictionary_appendatomarray(cv_dict, addr_convex, (t_object *)convex);
    dictionary_appendatomarray(cv_dict, addr_child_of, (t_object *)child_of);
    dictionary_appendatomarray(cv_dict, addr_focus, (t_object *)focus);
    dictionary_appendatomarray(cv_dict, addr_srcdim, (t_object *)srcdim);
    dictionary_appendatomarray(cv_dict, addr_defect_count, (t_object *)defect_count);
    dictionary_appendatomarray(cv_dict, addr_defect_dist_sum, (t_object *)defect_dist_sum);
    dictionary_appendatomarray(cv_dict, addr_hull_count, (t_object *)hull_count);
    dictionary_appendatomarray(cv_dict, addr_contour_count, (t_object *)contour_count);
    
    dictionary_appenddictionary(cv_dict, gensym("/contour/pts"), (t_object *)contour_dict);
    
    
    atom_setsym(&at, x->dict_name);
    outlet_anything(x->outlet, gensym("dictionary"), 1, &at);
    
    object_free(cv_dict);
    
}

void cv_contours_jit_matrix(t_cv_contours *x, t_symbol *s, long argc, t_atom *argv)
{
    void *matrix = NULL;
    long i, dimcount, dim[JIT_MATRIX_MAX_DIMCOUNT];
    long in_savelock = 0;
    t_jit_matrix_info in_minfo;
    char *in_bp;
    
    if (argc && argv)
    {
        
        matrix = jit_object_findregistered( jit_atom_getsym(argv) );
        
        if (matrix && jit_object_method( matrix, _jit_sym_class_jit_matrix) )
        {
            
            in_savelock = (long) jit_object_method(matrix, _jit_sym_lock, 1);
            jit_object_method( matrix, _jit_sym_getinfo, &in_minfo );
            jit_object_method( matrix, _jit_sym_getdata, &in_bp );
            
            if (!in_bp)
            {
                jit_error_sym( x, _jit_sym_err_calculate );
                jit_object_method( matrix, _jit_sym_lock, in_savelock);
                goto out;
            }
            
            //get dimensions/planecount
            dimcount = in_minfo.dimcount;
            for (i=0;i<dimcount;i++) {
                dim[i] = in_minfo.dim[i];
            }
            
            int type = 0;
            
            if(in_minfo.dimcount != 2)
            {
                object_error((t_object *)x, "invalid dimension count.");
                goto out;
            }
            
            if(in_minfo.type == _jit_sym_char)
            {
                type = CV_MAKETYPE( CV_8U, (int)in_minfo.planecount );
            }
            else
            {
                object_error((t_object *)x, "only supports char input");
                goto out;
            }
            
            cv::Mat frame( (int)in_minfo.dim[1], (int)in_minfo.dim[0], type, in_bp, in_minfo.dimstride[1] );
            cv_contours_dict_out(x, frame);
            
        }
        else
        {
            jit_error_sym(x, _jit_sym_err_calculate);
        }
    }
out:
    jit_object_method(matrix,_jit_sym_lock, in_savelock);
    return;
}


t_max_err cv_contours_gauss_sigma_set(t_cv_contours *x, t_object *attr, long argc, t_atom *argv)
{
    
    if(argc == 1 && argv)
    {
        long gauss_sigma = 0;
        
        if(atom_gettype(argv) == A_FLOAT)
            gauss_sigma = (long)atom_getfloat(argv);
        else if(atom_gettype(argv) == A_LONG)
            gauss_sigma = (long)atom_getfloat(argv);
        else if (atom_gettype(argv) == A_SYM )
        {
            object_error((t_object *)x, "unknown dilation size value");
            return -1;
        }
        
        x->gauss_sigma = gauss_sigma;
        x->gauss_ksize = (x->gauss_sigma*5)|1;
        
        return 0;
    }
    
    return -1;
}

t_max_err cv_contours_gauss_sigma_get(t_cv_contours *x, t_object *attr, long *argc, t_atom **argv)
{
    char alloc;
    atom_alloc(argc, argv, &alloc);
    atom_setlong(*argv, x->gauss_sigma);
    
    return 0;
}

BEGIN_USING_C_LINKAGE
void cv_contours_free(t_cv_contours *x)
{
    critical_free(x->lock);
    
    max_jit_object_free(x);
    
}

void *cv_contours_new(t_symbol *s, long argc, t_atom *argv)
{
    t_cv_contours *x;
    x = (t_cv_contours *)max_jit_object_alloc( cv_contours_class, NULL );
    if( x )
    {
        x->outlet = outlet_new(x, NULL);
        critical_new(&(x->lock));
        
        x->erosion_size = 0;
        x->dilation_size = 0;
        x->gauss_sigma = 3;
        x->gauss_ksize = (x->gauss_sigma*5)|1;
        x->resize_scale = 0.5;
        x->thresh = 100;
        x->invert = 0;
        x->track_radius = 0.1;
        x->dict_name = symbol_unique();
        
        for( int i = 0; i < CV_JIT_MAX_IDS; i++ )
        {
            x->id_used[i] = 0;
        }
        t_dictionary *d = NULL;
        d = dictionary_new();
        
        if (d) {
            attr_args_dictionary(d, argc, argv);
            attr_dictionary_process(x, d);
            object_free(d);
        }
        
    }
    return (x);
}

void ext_main(void* unused)
{
    t_class *c;
    
    c = class_new("cv.jit.contours",
                  (method)cv_contours_new,
                  (method)cv_contours_free,
                  sizeof(t_cv_contours), NULL, A_GIMME, 0);
    
    max_jit_class_obex_setup(c, calcoffset(t_cv_contours, obex));
    
    class_addmethod(c, (method)cv_contours_jit_matrix, (char *)"jit_matrix", A_GIMME, 0);
    
    CLASS_ATTR_LONG(c, "dilation_size", 0, t_cv_contours, dilation_size);
    CLASS_ATTR_FILTER_MIN(c, "dilation_size", 0);
    
    CLASS_ATTR_LONG(c, "erosion_size", 0, t_cv_contours, erosion_size);
    CLASS_ATTR_FILTER_MIN(c, "erosion_size", 0);
    
    CLASS_ATTR_LONG(c, "gauss_sigma", 0, t_cv_contours, gauss_sigma);
    CLASS_ATTR_ACCESSORS(c, "gauss_sigma", cv_contours_gauss_sigma_get, cv_contours_gauss_sigma_set);
    CLASS_ATTR_FILTER_MIN(c, "gauss_sigma", 0);
    
    CLASS_ATTR_DOUBLE(c, "resize_scale", 0, t_cv_contours, resize_scale);
    CLASS_ATTR_FILTER_MIN(c, "resize_scale", 0);

    CLASS_ATTR_DOUBLE(c, "track_radius", 0, t_cv_contours, track_radius);
    CLASS_ATTR_FILTER_MIN(c, "track_radius", 0);
    
    CLASS_ATTR_LONG(c, "thresh", 0, t_cv_contours, thresh);
    CLASS_ATTR_STYLE_LABEL(c, "thresh", 0, "text", "threshold");
    CLASS_ATTR_FILTER_MIN(c, "thresh", 0);
    
    CLASS_ATTR_LONG(c, "invert", 0, t_cv_contours, invert);
    CLASS_ATTR_STYLE_LABEL(c, "invert", 0, "onoff", "invert cv image b/w");
    
    class_register(CLASS_BOX, c);
    cv_contours_class = c;
    
    addr_cx = gensym("/center/x");
    addr_cy = gensym("/center/y");
    addr_rotmaj = gensym("/rotrect/major");
    addr_rotmin= gensym("/rotrect/minor");
    addr_sx = gensym("/size/x");
    addr_sy = gensym("/size/y");
    
    addr_centroidx = gensym("/centroid/x");
    addr_centroidy = gensym("/centroid/y");
    addr_angle = gensym("/angle");
    
    addr_area = gensym("/area");
    addr_hullarea = gensym("/hull/area");
    addr_area_sort = gensym("/area_sort");
    addr_child_of = gensym("/child_of");
    addr_convex = gensym("/isconvex");
    addr_focus = gensym("/focus");
    addr_srcdim = gensym("/dim_xy");
    addr_defect_count = gensym("/defect/count");
    addr_defect_dist_sum = gensym("/defect/dist_sum");
    addr_hull_count = gensym("/hull/count");
    addr_hull_pt_array = gensym("/hull/points");
    addr_defect_ptlist = gensym("/defect/points");
    addr_depth = gensym("/depth");
    addr_contour_count = gensym("/contour/count");
    addr_x = gensym("/x");
    addr_y = gensym("/y");
    addr_startx = gensym("/start/x");
    addr_starty = gensym("/start/y");
    addr_endx = gensym("/end/x");
    addr_endy = gensym("/end/y");
    addr_eccentricity = gensym("/eccentricity");

    addr_parimeter = gensym("/parimeter");
    temp_addr_minrect = gensym("/minrect");
    
    addr_id = gensym("/id");
    return;
}
END_USING_C_LINKAGE
