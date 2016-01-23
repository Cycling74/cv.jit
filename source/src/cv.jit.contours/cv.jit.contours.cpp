

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

using namespace std;
using namespace cv;

typedef struct _cv_contours
{
    t_object        ob;
    void            *obex;
    
    void            *outlet;
    t_critical      lock;
    
    
    //attrs
    long         erosion_size;
    long         dilation_size;
    long         gauss_sigma;
    long         gauss_ksize;
    double          resize_scale;
    long            thresh;
    long         invert;
    
    
    // dict
    long            dict_mode;
    t_symbol        *dict_name;
    
} t_cv_contours;


BEGIN_USING_C_LINKAGE
void		*cv_contours_new(t_symbol *s, long argc, t_atom *argv);
void		cv_contours_free(t_cv_contours *x);
END_USING_C_LINKAGE

t_class	*cv_contours_class = NULL;

t_symbol *addr_cx;
t_symbol *addr_cy;
t_symbol *addr_sx;
t_symbol *addr_sy;
t_symbol *addr_angle;
t_symbol *addr_area;
t_symbol *addr_hullarea;
t_symbol *addr_area_sort;
t_symbol *addr_child_of;
t_symbol *addr_focus;
t_symbol *addr_convex;
t_symbol *addr_srcdim;
t_symbol *addr_defect_count;
t_symbol *addr_defect_dist_sum;
t_symbol *addr_hull_count;
t_symbol *addr_hull_pt_array;
t_symbol *addr_defect_ptlist;
t_symbol *addr_contour_count;
t_symbol *addr_x;
t_symbol *addr_y;
t_symbol *addr_id;


template <typename T>
struct sort_pred {
    bool operator()(const std::pair<int,T> &left, const std::pair<int,T> &right) {
        return left.second < right.second;
    }
};

template <typename T>
vector<std::pair<int, T> > sort_indexes( const vector<T> &v )
{
    vector<std::pair<int, T> >  idx_v( v.size() );
    for (size_t i = 0; i != idx_v.size(); ++i)
    {
        idx_v[i].first = i;
        idx_v[i].second = v[i];
    }
    
    std::sort( idx_v.begin(), idx_v.end(), sort_pred<T>() );
    
    return idx_v;
}


static void cv_contours_dict_out(t_cv_contours *x, const Mat frame)
{
    // preprocess
    
    Mat src_gray;
    
    {
        Mat src_color_sized;
        cv::resize( frame, src_color_sized, cv::Size(), x->resize_scale, x->resize_scale, INTER_AREA );
        
        //        flip(src_color_sized, src_color_sized, 1);
        
        cvtColor(src_color_sized, src_gray, CV_BGR2GRAY);
        
        if(x->invert > 0)
        {
            bitwise_not(src_gray, src_gray);
        }
    }
    
    if( src_gray.data == NULL )
        return;
    
    //blur(src_gray, src_gray, Size(3,3));
    
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
    vector<RotatedRect> minEllipse( contours.size() );
    vector<cv::Rect> boundRect( contours.size() );
    vector<vector<cv::Point> >hullP( contours.size() );
    vector<vector<int> >hullI( contours.size() );
    vector<vector<Vec4i> >defects( contours.size() );
    vector<double>focus_val( contours.size() );
    vector<double>contour_area( contours.size() );
    //flat vector for optical flow
    vector<cv::Point> defect_startpt;
    
    
    t_dictionary *cv_dict = dictionary_new();
    cv_dict = dictobj_register(cv_dict, &x->dict_name);
    
    t_atomarray *cx = atomarray_new(0, NULL);
    t_atomarray *cy = atomarray_new(0, NULL);
    t_atomarray *sx = atomarray_new(0, NULL);
    t_atomarray *sy = atomarray_new(0, NULL);
    t_atomarray *angle = atomarray_new(0, NULL);
    t_atomarray *area = atomarray_new(0, NULL);
    t_atomarray *hullarea = atomarray_new(0, NULL);
    t_atomarray *area_sort = atomarray_new(0, NULL);
    t_atomarray *convex = atomarray_new(0, NULL);
    t_atomarray *child_of = atomarray_new(0, NULL);
    t_atomarray *focus = atomarray_new(0, NULL);
    t_atomarray *srcdim = atomarray_new(0, NULL);
    t_atomarray *defect_count = atomarray_new(0, NULL);
    t_atomarray *defect_dist_sum = atomarray_new(0, NULL);
    t_atomarray *hull_count = atomarray_new(0, NULL);
    t_dictionary *hull_pt_array = dictionary_new();
    t_dictionary *defect_ptlist = dictionary_new();
    t_atomarray *contour_count = atomarray_new(0, NULL);
    
    t_atom at;
    atom_setlong(&at, src_gray.size().width);
    atomarray_appendatom(srcdim, &at);
    atom_setlong(&at, src_gray.size().height);
    atomarray_appendatom(srcdim, &at);
    
    
    long npix = src_gray.size().width * src_gray.size().height;

    char buf[256];
    for( int i = 0; i < contours.size(); i++ )
    {
        atom_setlong(&at, contours[i].size());
        atomarray_appendatom(contour_count, &at);
        
        boundRect[i] = boundingRect( Mat(contours[i]) );
        minRect[i] = minAreaRect( Mat(contours[i]) );
        
        convexHull( Mat(contours[i]), hullP[i], false );
        convexHull( Mat(contours[i]), hullI[i], false );
        
        if( hullI[i].size() > 3 )
            convexityDefects( contours[i], hullI[i], defects[i] );
        
        t_dictionary *hullpts = dictionary_new();
        t_atomarray *hull_x = atomarray_new(0, NULL);
        t_atomarray *hull_y = atomarray_new(0, NULL);
        
        dictionary_appendlong(hullpts, addr_id, i);

        for( long hpi = 0; hpi < hullI[i].size(); hpi++ )
        {
            atom_setfloat(&at,  hullP[i][hpi].x / (double)src_gray.size().width );
            atomarray_appendatom( hull_x, &at );
            
            atom_setfloat(&at,  1. - (hullP[i][hpi].y / (double)src_gray.size().height) );
            atomarray_appendatom( hull_y, &at );
        }

        dictionary_appendatomarray(hullpts, addr_x, (t_object *)hull_x);
        dictionary_appendatomarray(hullpts, addr_y, (t_object *)hull_y);
        
        sprintf(buf, "/%d", i);
        t_symbol *idr = gensym(buf);
        dictionary_appenddictionary(hull_pt_array, idr, (t_object *)hullpts);

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

        if( contours[i].size() > 5 )
        {
            minEllipse[i] = fitEllipse( Mat(contours[i]) );
        }
        
        contour_area[i] = contourArea(Mat(contours[i]));
        
        Mat convexcontour;
        approxPolyDP(Mat(hullP[i]), convexcontour, 0.001, true);
        
        atom_setfloat(&at, contourArea(convexcontour) / (double)npix );
        atomarray_appendatom(hullarea, &at);
        
        atom_setfloat(&at, minRect[i].center.x / (double)src_gray.size().width );
        atomarray_appendatom(cx, &at);
        
        atom_setfloat(&at, 1. - (minRect[i].center.y / (double)src_gray.size().height) );
        atomarray_appendatom(cy, &at);
        
        atom_setfloat(&at, minRect[i].size.width / (double)src_gray.size().width );
        atomarray_appendatom(sx, &at);
        
        atom_setfloat(&at, minRect[i].size.height / (double)src_gray.size().height );
        atomarray_appendatom(sy, &at);
        
        atom_setfloat(&at, minRect[i].angle );
        atomarray_appendatom(angle, &at);
        
        atom_setfloat(&at, contour_area[i] / (double)npix );
        atomarray_appendatom(area, &at);
        
        atom_setlong(&at, isContourConvex(Mat(contours[i])) );
        atomarray_appendatom(convex, &at);
        
        atom_setlong(&at, hierarchy[i][3] );
        atomarray_appendatom(child_of, &at);
        
        atom_setfloat(&at, focus_val[i] );
        atomarray_appendatom(focus, &at);
        
        //(defects[i].size() > 0 ) ? (defects[i].size() / (double)hullI[i].size()) : 0
        atom_setlong(&at, defects[i].size() );
        atomarray_appendatom(defect_count, &at);
        
        atom_setlong(&at, hullI[i].size() );
        atomarray_appendatom(hull_count, &at);
        
        
        // convex hull defects
        // if( contours[i].size() < 300 ) continue; //skip if contour is small
        
        // might want to collect data on all the set of defects and only send general information rather than overloading ... but maybe the points are interesting too...
        
        //        Mat dist_stats = Mat::zeros((int)defects[i].size(), 1, CV_64FC1);
        
        /*
         
         - number of extruding points
         
         - size of concavity... right now this is far-start distance, but maybe should be distance from convex hull line in middle
         -- this might also want to be a min/max/mean situation?  or maybe just send the points and deal with it in max?
         
         
         */
        

        t_dictionary *defectpts = dictionary_new();
        t_atomarray *defect_x = atomarray_new(0, NULL);
        t_atomarray *defect_y = atomarray_new(0, NULL);

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


            //float depth = v[3] / 256.; // depth from center of contour
            double dist = norm(ptFar - ptStart);
            dist_sum += dist;
            defect_startpt.push_back( ptStart );
            defect_dist.push_back( dist / npix);
            // drawing
            //             if( draw && dist > 0 )
            //             {
            //             line( drawing, ptStart, ptFar, color, 1 );
            //             line( drawing, ptFar, ptEnd, color, 1 );
            //             int thick = (dist <= 255 ? dist : 255) / 10;
            //             //  printf("dist %f\n", dist);
            //             circle( drawing, ptStart, 4, color, thick );
            //             }

            d++;
        }
        atom_setfloat(&at, dist_sum);
        atomarray_appendatom(defect_dist_sum, &at);
        
        dictionary_appendatomarray(defectpts, addr_x, (t_object *)defect_x);
        dictionary_appendatomarray(defectpts, addr_y, (t_object *)defect_y);
        
        dictionary_appendlong(defectpts, addr_id, i);
        
        dictionary_appenddictionary(defect_ptlist, idr, (t_object *)defectpts);

    }
    
//    vector<std::pair<int, double> > sorted = sort_indexes( contour_area );
    
//    for_each(sorted.begin(), sorted.end(),
//             [&area_sort](int ii){ t_atom aa; atom_setlong(&aa, ii); atomarray_appendatom(area_sort, &aa); });
    
    dictionary_appendatomarray(cv_dict, addr_cx, (t_object *)cx);
    dictionary_appendatomarray(cv_dict, addr_cy, (t_object *)cy);
    dictionary_appendatomarray(cv_dict, addr_sx, (t_object *)sx);
    dictionary_appendatomarray(cv_dict, addr_sy, (t_object *)sy);
    dictionary_appendatomarray(cv_dict, addr_angle, (t_object *)angle);
    dictionary_appendatomarray(cv_dict, addr_area, (t_object *)area);
    dictionary_appendatomarray(cv_dict, addr_hullarea, (t_object *)hullarea);
    dictionary_appendatomarray(cv_dict, addr_area_sort, (t_object *)area_sort);
    dictionary_appendatomarray(cv_dict, addr_convex, (t_object *)convex);
    dictionary_appendatomarray(cv_dict, addr_child_of, (t_object *)child_of);
    dictionary_appendatomarray(cv_dict, addr_focus, (t_object *)focus);
    dictionary_appendatomarray(cv_dict, addr_srcdim, (t_object *)srcdim);
    
    dictionary_appendatomarray(cv_dict, addr_defect_count, (t_object *)defect_count);
    dictionary_appendatomarray(cv_dict, addr_defect_dist_sum, (t_object *)defect_dist_sum);
    dictionary_appendatomarray(cv_dict, addr_hull_count, (t_object *)hull_count);
    
    dictionary_appendatomarray(cv_dict, addr_contour_count, (t_object *)contour_count);
    
    dictionary_appenddictionary(cv_dict, addr_hull_pt_array, (t_object *)hull_pt_array);
    dictionary_appenddictionary(cv_dict, addr_defect_ptlist, (t_object *)defect_ptlist);
    
    
    atom_setsym(&at, x->dict_name);
    outlet_anything(x->outlet, gensym("dictionary"), 1, &at);
    
    object_free(cv_dict);
    
}

/*
static void ojit_calc_send(t_cv_contours *x, const Mat frame)
{
    
    
    // preprocess
    
    Mat src_gray;
    
    {
        Mat src_color_sized;
        cv::resize( frame, src_color_sized, cv::Size(), x->resize_scale, x->resize_scale, INTER_AREA );
        
        //        flip(src_color_sized, src_color_sized, 1);
        
        cvtColor(src_color_sized, src_gray, CV_BGR2GRAY);
        
        if(x->invert > 0)
        {
            bitwise_not(src_gray, src_gray);
        }
    }
    
    //blur(src_gray, src_gray, Size(3,3));
    
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
    vector<RotatedRect> minEllipse( contours.size() );
    vector<cv::Rect> boundRect( contours.size() );
    vector<vector<cv::Point> >hullP( contours.size() );
    vector<vector<int> >hullI( contours.size() );
    vector<vector<Vec4i> >defects( contours.size() );
    vector<double>focus_val( contours.size() );
    vector<double>contour_area( contours.size() );
    //flat vector for optical flow
    vector<cv::Point> defect_startpt;
    
    
    //    Mat drawing = Mat::zeros( threshold_output.size(), CV_8UC3 );
    
    t_osc_bndl_u *bndl = osc_bundle_u_alloc();
    t_osc_msg_u *cx = osc_message_u_allocWithAddress((char *)"/center/x");
    t_osc_msg_u *cy = osc_message_u_allocWithAddress((char *)"/center/y");
    t_osc_msg_u *sx = osc_message_u_allocWithAddress((char *)"/size/x");
    t_osc_msg_u *sy = osc_message_u_allocWithAddress((char *)"/size/y");
    t_osc_msg_u *angle = osc_message_u_allocWithAddress((char *)"/angle");
    t_osc_msg_u *area = osc_message_u_allocWithAddress((char *)"/area");
    t_osc_msg_u *hullarea = osc_message_u_allocWithAddress((char *)"/hull/area");
    t_osc_msg_u *area_sort = osc_message_u_allocWithAddress((char *)"/area_sort");
    t_osc_msg_u *convex = osc_message_u_allocWithAddress((char *)"/isconvex");
    t_osc_msg_u *child_of = osc_message_u_allocWithAddress((char *)"/child_of");
    t_osc_msg_u *focus = osc_message_u_allocWithAddress((char *)"/focus");
    t_osc_msg_u *srcdim = osc_message_u_allocWithAddress((char *)"/dim_xy");
    t_osc_msg_u *defect_count = osc_message_u_allocWithAddress((char *)"/defect/count");
    t_osc_msg_u *defect_dist_sum = osc_message_u_allocWithAddress((char *)"/defect/dist_sum");
    t_osc_msg_u *hull_count = osc_message_u_allocWithAddress((char *)"/hull/count");
    
    t_osc_msg_u *hull_pt_array = osc_message_u_allocWithAddress((char *)"/hull/points");
    t_osc_msg_u *defect_ptlist = osc_message_u_allocWithAddress((char *)"/defect/points");
    
    t_osc_msg_u *contour_count = osc_message_u_allocWithAddress((char *)"/contour/count");
    
    
    osc_message_u_appendInt32(srcdim, src_gray.size().width);
    osc_message_u_appendInt32(srcdim, src_gray.size().height);
    
    long npix = src_gray.size().width * src_gray.size().height;
    
    for( int i = 0; i < contours.size(); i++ )
    {
        osc_message_u_appendInt64(contour_count, contours[i].size());
        
        boundRect[i] = boundingRect( Mat(contours[i]) );
        minRect[i] = minAreaRect( Mat(contours[i]) );
        
        convexHull( Mat(contours[i]), hullP[i], false );
        convexHull( Mat(contours[i]), hullI[i], false );
        convexityDefects( contours[i], hullI[i], defects[i] );
        
        
        t_osc_bndl_u *hullpts = osc_bundle_u_alloc();
        t_osc_msg_u *hull_x = osc_message_u_allocWithAddress((char *)"/x");
        t_osc_msg_u *hull_y = osc_message_u_allocWithAddress((char *)"/y");
        
        for( long hpi = 0; hpi < hullI[i].size(); hpi++ )
        {
            osc_message_u_appendDouble(hull_x, hullP[i][hpi].x / (double)src_gray.size().width );
            osc_message_u_appendDouble(hull_y, 1. - (hullP[i][hpi].y / (double)src_gray.size().height) );
        }
        
        osc_bundle_u_addMsg(hullpts, hull_x);
        osc_bundle_u_addMsg(hullpts, hull_y);
        osc_message_u_appendBndl_u(hull_pt_array, hullpts);
        
        Mat rot_mtx = getRotationMatrix2D(minRect[i].center, minRect[i].angle, 1.0);
        Mat rot;
        Mat roi;
        warpAffine( src_gray, rot, rot_mtx, src_gray.size(), INTER_AREA );
        getRectSubPix(rot, minRect[i].size, minRect[i].center, roi);
        
        //        Mat roi = src_gray( boundRect[i] ); //<< slightly faster backup, maybe better result even?
        
        focus_val[i] = 0.0;
        if( minRect[i].size.width > 15  )
        {
            Mat lap;
            Laplacian(roi, lap, CV_16S, 5);
            Scalar avg = mean(lap);
            focus_val[i] = avg[0];
        }
        
        if( contours[i].size() > 5 )
        {
            minEllipse[i] = fitEllipse( Mat(contours[i]) );
        }
        
        //filter by focus
        //        if( focus_val[i] > 1) continue;
        
        contour_area[i] = contourArea(Mat(contours[i]));
        
        Mat convexcontour;
        approxPolyDP(Mat(hullP[i]), convexcontour, 0.001, true);
        osc_message_u_appendFloat(hullarea, contourArea(convexcontour) / (double)npix );
        
        osc_message_u_appendFloat(cx, minRect[i].center.x / (double)src_gray.size().width);
        osc_message_u_appendFloat(cy, 1. - (minRect[i].center.y / (double)src_gray.size().height));
        osc_message_u_appendFloat(sx, minRect[i].size.width / (double)src_gray.size().width);
        osc_message_u_appendFloat(sy, minRect[i].size.height / (double)src_gray.size().height);
        osc_message_u_appendFloat(angle, minRect[i].angle);
        osc_message_u_appendFloat(area, contour_area[i] / (double)npix);
        osc_message_u_appendInt32(convex, isContourConvex(Mat(contours[i])));
        osc_message_u_appendInt32(child_of, hierarchy[i][3]);
        osc_message_u_appendDouble(focus, focus_val[i]);
        osc_message_u_appendDouble(defect_count, defects[i].size() / (double)hullI[i].size());
        osc_message_u_appendInt64(hull_count, hullI[i].size());
        
        
        
        // convex hull defects
        // if( contours[i].size() < 300 ) continue; //skip if contour is small
        
        // might want to collect data on all the set of defects and only send general information rather than overloading ... but maybe the points are interesting too...
        
        //        Mat dist_stats = Mat::zeros((int)defects[i].size(), 1, CV_64FC1);

        
        t_osc_bndl_u *defectpts = osc_bundle_u_alloc();
        t_osc_msg_u *defect_x = osc_message_u_allocWithAddress((char *)"/x");
        t_osc_msg_u *defect_y = osc_message_u_allocWithAddress((char *)"/y");
        
        double dist_sum = 0;
        vector<double> defect_dist;
        vector<Vec4i>::iterator d = defects[i].begin();
        while ( d != defects[i].end() )
        {
            Vec4i& v = (*d);
            cv::Point ptStart(  contours[ i ][ v[0] ] );
            cv::Point ptEnd(    contours[ i ][ v[1] ] );
            cv::Point ptFar(    contours[ i ][ v[2] ] );
            
            osc_message_u_appendDouble(defect_x, ptFar.x / (double)src_gray.size().width );
            osc_message_u_appendDouble(defect_y, 1. - (ptFar.y / (double)src_gray.size().height) );
            
            
            //float depth = v[3] / 256.; // depth from center of contour
            double dist = norm(ptFar - ptStart);
            dist_sum += dist;
            defect_startpt.push_back( ptStart );
            defect_dist.push_back( dist / npix);

            
            d++;
        }
        osc_message_u_appendDouble(defect_dist_sum, dist_sum);
        
        osc_bundle_u_addMsg(defectpts, defect_x);
        osc_bundle_u_addMsg(defectpts, defect_y);
        osc_message_u_appendBndl_u(defect_ptlist, defectpts);
        
        
    }
    
    
//
//     Mat stat, err;
//     if( prev_pts.size() > 0)
//     calcOpticalFlowPyrLK(prev_frame, threshold_output, prev_pts, defect_startpt, stat, err);
//     prev_pts = defect_startpt;
//     prev_frame = threshold_output.clone();

    t_osc_msg_u *tmsg = osc_message_u_allocWithAddress((char *)"/timetag");
    osc_message_u_appendTimetag(tmsg, osc_timetag_now());
    
    vector<size_t> sorted = sort_indexes( contour_area );
    for_each(sorted.begin(), sorted.end(),
             [&area_sort](int ii){ osc_message_u_appendInt32(area_sort, ii); });
    
    
    osc_bundle_u_addMsg(bndl, cx);
    osc_bundle_u_addMsg(bndl, cy);
    osc_bundle_u_addMsg(bndl, sx);
    osc_bundle_u_addMsg(bndl, sy);
    osc_bundle_u_addMsg(bndl, angle);
    osc_bundle_u_addMsg(bndl, area);
    osc_bundle_u_addMsg(bndl, convex);
    osc_bundle_u_addMsg(bndl, child_of);
    osc_bundle_u_addMsg(bndl, focus);
    osc_bundle_u_addMsg(bndl, tmsg);
    osc_bundle_u_addMsg(bndl, contour_count);
    osc_bundle_u_addMsg(bndl, area_sort);
    osc_bundle_u_addMsg(bndl, srcdim);
    osc_bundle_u_addMsg(bndl, defect_count);
    osc_bundle_u_addMsg(bndl, defect_dist_sum);
    osc_bundle_u_addMsg(bndl, hull_count);
    osc_bundle_u_addMsg(bndl, hullarea);
    osc_bundle_u_addMsg(bndl, hull_pt_array);
    osc_bundle_u_addMsg(bndl, defect_ptlist);
    
    omax_util_outletOSC_u(x->bndl_out, bndl);
    
    if(bndl)
        osc_bundle_u_free(bndl);
    
}
*/

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
                object_error((t_object *)x, "Error converting Jitter matrix: invalid dimension count.");
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
        
        x->dict_name = symbol_unique();
        
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
    
    CLASS_ATTR_LONG(c, "thresh", 0, t_cv_contours, thresh);
    CLASS_ATTR_STYLE_LABEL(c, "thresh", 0, "text", "threshold");
    CLASS_ATTR_FILTER_MIN(c, "thresh", 0);
    
    CLASS_ATTR_LONG(c, "invert", 0, t_cv_contours, invert);
    CLASS_ATTR_STYLE_LABEL(c, "invert", 0, "onoff", "invert cv image b/w");
    
    class_register(CLASS_BOX, c);
    cv_contours_class = c;
    
    addr_cx = gensym("/center/x");
    addr_cy = gensym("/center/y");
    addr_sx = gensym("/size/x");
    addr_sy = gensym("/size/y");
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
    addr_contour_count = gensym("/contour/count");
    addr_x = gensym("/x");
    addr_y = gensym("/y");
    addr_id = gensym("/id");
    return;
}
END_USING_C_LINKAGE
