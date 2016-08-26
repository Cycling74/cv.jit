
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
//#include "jit.gl.h"

#include "opencv2/opencv.hpp"
#include "cv.jit.contour.flow.h"


#define CV_JIT_MAX_IDS 100

using namespace std;
using namespace cv;

typedef struct _cv_contours
{
    t_object    ob;
    void        *obex;
    
    void        *matrix;
    t_atom      matrix_name;
    void        *matrix_outlet;
    
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
    long        debug_matrix;
    
    double      max_size;
    double      min_size;
    
    long        parents_only;
    
    t_dictionary *attr_dict; //to do
    
    // dict
    long        dict_mode;
    t_symbol    *dict_name;
    
    ContourFlow flow;
    long        enable_flow;
    Mat         prev_src_gray;
    
    vector<Point2f> prev_centroids;
    vector<int>     prev_centroid_id;
    vector<double>  prev_area;
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
t_symbol *addr_child_of;
t_symbol *addr_focus;
t_symbol *addr_convex;
t_symbol *addr_srcdim;
t_symbol *addr_aspect;
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
t_symbol *addr_ids;

t_symbol *addr_contourpts;

t_symbol *temp_addr_minrect;
t_symbol *ps_dict;

t_symbol *addr_flow_r;
t_symbol *addr_flow_theta;

void mat2Jitter(Mat *mat, void *jitMat)
{
    t_jit_matrix_info info;
    
    if((!jitMat)||(!mat))
    {
        error("Error converting to Jitter matrix: invalid pointer.");
        return;
    }
    
    jit_object_method(jitMat,_jit_sym_getinfo,&info);
    info.dimcount = 2;
    info.planecount = mat->channels() ;
    info.dim[0] = mat->cols;
    info.dim[1] = mat->rows;
    switch(  mat->depth() ){
        case CV_8U:
            info.type = _jit_sym_char;
            info.dimstride[0] = sizeof(char);
            break;
        case CV_32S:
            info.type = _jit_sym_long;
            info.dimstride[0] = sizeof(long);
            break;
        case CV_32F:
            info.type = _jit_sym_float32;
            info.dimstride[0] = sizeof(double);
            break;
        case CV_64F:
            info.type = _jit_sym_float64;
            info.dimstride[0] = sizeof(double);
            break;
        default:
            error("Error converting to Jitter matrix: unsupported depth.");
            return;
    }
    info.dimstride[1] = mat->step;
    info.size = mat->step * mat->rows;
//    info.flags = JIT_MATRIX_DATA_REFERENCE | JIT_MATRIX_DATA_FLAGS_USE;
    jit_object_method(jitMat, _jit_sym_setinfo_ex, &info);
    jit_object_method(jitMat, _jit_sym_data, mat->data);
}

string type2str(int type) {
    string r;
    
    uchar depth = type & CV_MAT_DEPTH_MASK;
    uchar chans = 1 + (type >> CV_CN_SHIFT);
    
    switch ( depth ) {
        case CV_8U:  r = "8U"; break;
        case CV_8S:  r = "8S"; break;
        case CV_16U: r = "16U"; break;
        case CV_16S: r = "16S"; break;
        case CV_32S: r = "32S"; break;
        case CV_32F: r = "32F"; break;
        case CV_64F: r = "64F"; break;
        default:     r = "User"; break;
    }
    
    r += "C";
    r += (chans+'0');
    
    return r;
}

struct Stats {
    double min = std::numeric_limits<double>::max();
    double max = 0;
    double mean = 0;
    double sum = 0;
    double dev_sum = 0;
    double variance = 0;
};


// TODO: send in bounding box to reduce overhead!  I think this will help a lot
//template <typename T>
void getStatsChar( const Mat src, const Mat sobel, const Mat flow, const Mat mask, const cv::Rect roi, vector<Stats>& _stats)
{
    //const int plane, T& min, T& max, T& varience
    
    // test roi
    if( src.size() != mask.size() )
    {
        printf("size mismatch\n");
        return;
    }

    int nchans = src.channels();
    int nstats = nchans + 3; // focus, flow(2)

    int flow_test = !flow.empty();
    
    int focus = nchans;
    int flowx = nchans+1;
    int flowy = nchans+2;
    
    vector<Stats> stats( nstats );
    
    vector<cv::Point> index;
    index.reserve( roi.area() );
    
    const uchar *mask_p = NULL;
    const uchar *src_p = NULL;
    const float *sobel_p = NULL;
    const Point2f *flow_p = NULL;
    
    int row_start = roi.y;
    int row_end = roi.y + roi.height;
    
    int col_start = roi.x;
    int col_end = roi.x + roi.width;
    
    for( int i = row_start; i < row_end; ++i )
    {
        mask_p = mask.ptr<uchar>(i);
        
        // do type check above here
        src_p = src.ptr<uchar>(i);
        sobel_p = sobel.ptr<float>(i);
        flow_p = flow.ptr<Point2f>(i);

        for( int j = col_start; j < col_end; ++j )
        {
            if( mask_p[j] )
            {
                // test emplace_back (
                index.push_back( cv::Point(j, i) );
                
                // src
                for( int c = 0; c < nchans; ++c)
                {
                    if( src_p[j + c] < stats[c].min )
                        stats[c].min = src_p[ j+c ];
                    
                    if( src_p[j + c] > stats[c].max )
                        stats[c].max = src_p[ j+c ];

                    
                    stats[c].sum += src_p[j + c];
                    
                }
                
                //sobel
                if( sobel_p[j] < stats[focus].min )
                    stats[focus].min = sobel_p[j];
                
                if( sobel_p[j] > stats[focus].max )
                    stats[focus].max = sobel_p[j];
                
                stats[focus].sum += sobel_p[j];
                
                
                // flow
                if( flow_test )
                {
                    if( flow_p[j].x < stats[flowx].min )
                    stats[flowx].min = flow_p[j].x;
                    
                    if( flow_p[j].x > stats[flowx].max )
                        stats[flowx].max = flow_p[j].x;
                    
                    stats[flowx].sum += flow_p[j].x;
                    
                    if( flow_p[j].y < stats[flowy].min )
                        stats[flowy].min = flow_p[j].y;
                    
                    if( flow_p[j].y > stats[flowy].max )
                        stats[flowy].max = flow_p[j].y;
                    
                    stats[flowy].sum += flow_p[j].y;
                    
                }
            }
            
        }
    }
    
    for( int c = 0; c < nchans; ++c)
    {
        stats[c].mean = stats[c].sum / index.size();
    }
    
    stats[focus].mean = stats[focus].sum / index.size();
    stats[flowx].mean = stats[flowx].sum / index.size();
    stats[flowy].mean = stats[flowy].sum / index.size();
    
    int row, col;
    int size = index.size();
    for( int i = 0; i < size; ++i )
    {
        col = index[i].x;
        row = index[i].y;
        
        src_p = src.ptr<uchar>(row);
        sobel_p = sobel.ptr<float>(row);
        flow_p = flow.ptr<Point2f>(row);
        
        for( int c = 0; c < nchans; ++c)
        {
            double dx = src_p[ col + c ] - stats[c].mean;
            stats[c].dev_sum += (dx*dx);
        }
        
        double dx = sobel_p[ col ] - stats[focus].mean;
        stats[focus].dev_sum += (dx*dx);
        
        // flow
        if( flow_test )
        {
            dx = flow_p[ col ].x - stats[flowx].mean;
            stats[flowx].dev_sum += (dx*dx);
            
            dx = flow_p[ col ].y - stats[flowy].mean;
            stats[flowy].dev_sum += (dx*dx);
        }
    }
    
    for( int c = 0; c < nchans; ++c)
    {
        stats[c].variance = stats[c].dev_sum / index.size();
    }
    
    stats[focus].variance = stats[focus].dev_sum / index.size();
    stats[flowx].variance = stats[flowx].dev_sum / index.size();
    stats[flowy].variance = stats[flowy].dev_sum / index.size();

    _stats = stats;
//    printf("exit\n");
}

static void cv_contours_dict_out(t_cv_contours *x, Mat frame)
{
    
    // preprocess
    int n_src_channels = frame.channels();
    Mat src_gray, src_blur_gray, src_color_sized;
    
    {
        
        if( (frame.size().height * x->resize_scale) < 1.0 )
            x->resize_scale += (1.0/frame.size().height) - x->resize_scale;
            
        cv::resize( frame, src_color_sized, cv::Size(), x->resize_scale, x->resize_scale, INTER_AREA );
        
        switch ( n_src_channels ) {
            case 1:
                src_gray = src_color_sized.clone();
                break;
            case 4:
                cvtColor(src_color_sized, src_gray, CV_RGBA2GRAY);
                break;
            case 3:
                cvtColor(src_color_sized, src_gray, CV_RGB2GRAY);
                break;
            default:
                object_error((t_object *)x, "unsupported plane number");
                break;
        }
        
        if( src_gray.empty() )
            return;
        
    }
    
    if(x->invert > 0)
    {
        bitwise_not(src_gray, src_gray);
    }

    
    GaussianBlur(src_gray, src_blur_gray, cv::Size((int)x->gauss_ksize, (int)x->gauss_ksize), x->gauss_sigma, x->gauss_sigma);
    
    {
        Mat di_element = getStructuringElement( MORPH_RECT,
                                               cv::Size( 2*(int)x->dilation_size + 1, 2*(int)x->dilation_size+1 ),
                                               cv::Point( (int)x->dilation_size, (int)x->dilation_size ) );
        dilate( src_blur_gray, src_blur_gray, di_element );
    }
    
    {
        Mat er_element = getStructuringElement( MORPH_RECT,
                                               cv::Size( 2*(int)x->erosion_size + 1, 2*(int)x->erosion_size+1 ),
                                               cv::Point( (int)x->erosion_size, (int)x->erosion_size ) );
        erode( src_blur_gray, src_blur_gray, er_element );
    }
    
    //analyze
    vector<vector<cv::Point> > contours;
    vector<Vec4i> hierarchy;

    {
        Mat threshold_output;
        threshold( src_blur_gray, threshold_output, x->thresh, 255, THRESH_BINARY );
        
        findContours( threshold_output, contours, hierarchy, CV_RETR_CCOMP, CV_CHAIN_APPROX_SIMPLE, cv::Point(0, 0) );
    }

    Mat flow;
    if( x->enable_flow && !x->prev_src_gray.empty() && x->prev_src_gray.size() == src_gray.size() )
    {
        
//        float start = (float)getTickCount();
        calcOpticalFlowFarneback( x->prev_src_gray, src_gray, flow, 0.1, 1, 15, 1, 5, 1.1, 0);
//        printf("calcOpticalFlowSF : %lf sec\n", (getTickCount() - start) / getTickFrequency());

    }
    src_gray.copyTo(x->prev_src_gray);
    
    // focus measurement via sobel
    Mat sob;
    Sobel(src_gray, sob, CV_32F, 1, 1);
    
    vector<Point2f> centroids;
    centroids.reserve( contours.size() );
    
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

    t_atomarray *flow_r = atomarray_new(0, NULL);
    t_atomarray *flow_theta = atomarray_new(0, NULL);

    //t_atomarray *channel_means[n_src_channels];
	Vector<t_atomarray *> channel_means(n_src_channels);


    for( int ch = 0; ch < n_src_channels; ++ch )
    {
        channel_means[ch] = atomarray_new(0, NULL);
    }
    
    
    double src_width = (double)src_gray.size().width;
    double src_height = (double)src_gray.size().height;
    
    t_atom at;
    atom_setlong(&at, src_width );
    atomarray_appendatom(srcdim, &at);
    atom_setlong(&at, src_height );
    atomarray_appendatom(srcdim, &at);
    
    double npix = src_width * src_height;
    
    atom_setfloat(&at, src_width / src_height );
    dictionary_appendatom(cv_dict, addr_aspect, &at);

    char buf[256];
    
    t_dictionary *contour_dict = dictionary_new();
    
    long ncontours = contours.size();
    
    int count = 0;
    for( int i = 0; i < ncontours; ++i )
    {
        
        double contour_a = contourArea( Mat(contours[i]) ) / npix;

        if( (contour_a > x->max_size) || (contour_a < x->min_size) || (x->parents_only && (hierarchy[i][3] != -1)) )
           continue;
        
        t_dictionary *contour_sub = dictionary_new();
        
        sprintf( buf, "/%d", count );
        t_symbol *idr = gensym(buf);
        dictionary_appendlong( contour_sub, addr_id, count );
        
        cv::Rect boundRect = boundingRect( Mat(contours[i]) );
        
        // NOTE: minAreaRect function also computes convex hull internally, so this could be optimized later
        RotatedRect minRect = minAreaRect( Mat(contours[i]) );
        
        Mat contour_mask = Mat::zeros( src_color_sized.size(), CV_8UC1 );
        drawContours(contour_mask, contours, i, Scalar(255), CV_FILLED);
        
        vector<Stats> stats;
        getStatsChar(src_color_sized, sob, flow, contour_mask, boundRect, stats);
        /*
         printf("stats: \n");
         printf("\t focus varience %f\n", stats[n_src_channels].variance);
         printf("\t flowx %f\n", stats[n_src_channels+1].mean);
         printf("\t flowy %f\n", stats[n_src_channels+2].mean);
         */
        
        for( int ch = 0; ch < n_src_channels; ++ch )
        {
            atom_setfloat(&at, stats[ch].mean );
            atomarray_appendatom(channel_means[ch], &at);
        }
        
        if( x->enable_flow )
        {
            double flx, fly;
            flx = stats[n_src_channels+1].mean / src_width;
            fly = -1. * stats[n_src_channels+2].mean / src_height;
            
            atom_setfloat(&at, sqrt(flx*flx + fly*fly) );
            atomarray_appendatom(flow_r, &at);
            
            atom_setfloat(&at, atan2(fly, flx) );
            atomarray_appendatom(flow_theta, &at);
            
        }
        
        atom_setfloat(&at, stats[n_src_channels].variance );
        atomarray_appendatom(focus, &at);
        
        
        
        atom_setlong(&at, contours[i].size());
        atomarray_appendatom(contour_count, &at);

        atom_setlong(&at, hierarchy[i][3] );
        atomarray_appendatom(child_of, &at);

        atom_setfloat(&at, arcLength(contours[i], true));
        atomarray_appendatom(parimeter, &at);
        
        atom_setfloat(&at, contour_a );
        atomarray_appendatom(area, &at);
        

        t_dictionary *minrect_pts_sub = dictionary_new();
        t_atomarray *minr_ptx = atomarray_new(0, NULL);
        t_atomarray *minr_pty = atomarray_new(0, NULL);
        
        Point2f pts[4];
        minRect.points( pts );
        
        for( int i = 0; i < 4; ++i )
        {
            atom_setfloat(&at, pts[i].x / src_width );
            atomarray_appendatom(minr_ptx, &at);
            atom_setfloat(&at, 1. - (pts[i].y / src_height) );
            atomarray_appendatom(minr_pty, &at);
        }
        
        dictionary_appendatomarray(minrect_pts_sub, addr_x, (t_object *)minr_ptx);
        dictionary_appendatomarray(minrect_pts_sub, addr_y, (t_object *)minr_pty);
        dictionary_appenddictionary(contour_sub, temp_addr_minrect, (t_object *)minrect_pts_sub);
        
        atom_setfloat(&at, minRect.size.height / src_height);
        atomarray_appendatom(rotmaj, &at);
        
        atom_setfloat(&at, minRect.size.width / src_width);
        atomarray_appendatom(rotmin, &at);
        
        
        double centerx = minRect.center.x;
        double centery = minRect.center.y;
        
        atom_setfloat(&at, centerx / src_width );
        atomarray_appendatom(cx, &at);
        
        atom_setfloat(&at, 1. - (centery / src_height) );
        atomarray_appendatom(cy, &at);
        
        atom_setfloat(&at, boundRect.width / src_width );
        atomarray_appendatom(sx, &at);
        
        atom_setfloat(&at, boundRect.height / src_height );
        atomarray_appendatom(sy, &at);
        
        double ctrdx = centerx;
        double ctrdy = centery;

        Moments moms = moments( contours[i] );
        if( moms.m00 != 0.0 )
        {
            ctrdx = moms.m10 / moms.m00;
            ctrdy = moms.m01 / moms.m00;

        }
        
        atom_setfloat(&at, ctrdx / src_width );
        atomarray_appendatom(centroidx, &at);
        
        atom_setfloat(&at, 1. - (ctrdy / src_height) );
        atomarray_appendatom(centroidy, &at);

        centroids.push_back( Point2f(ctrdx, ctrdy) );

        double r_angle = minRect.angle;
        double out_angle = 0.0;
        if( minRect.size.height > minRect.size.width )
        {
            out_angle = -r_angle + 90.0;
        }
        else
        {
            out_angle = -r_angle;
        }
        
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
        vector<cv::Point> hullP;
        vector<int> hullI;
        vector<Vec4i> defects;
        
        convexHull( Mat(contours[i]), hullP, false );
        convexHull( Mat(contours[i]), hullI, false );

        int hullI_size = hullI.size();
        if( hullI_size > 3 )
            convexityDefects( contours[i], hullI, defects );
        
        t_dictionary *hullpts = dictionary_new();
        t_atomarray *hull_x = atomarray_new(0, NULL);
        t_atomarray *hull_y = atomarray_new(0, NULL);

        for( long hpi = 0; hpi < hullI_size; hpi++ )
        {
            atom_setfloat(&at,  hullP[hpi].x / src_width );
            atomarray_appendatom( hull_x, &at );
            
            atom_setfloat(&at,  1. - (hullP[hpi].y / src_height) );
            atomarray_appendatom( hull_y, &at );
        }

        dictionary_appendatomarray(hullpts, addr_x, (t_object *)hull_x);
        dictionary_appendatomarray(hullpts, addr_y, (t_object *)hull_y);
        dictionary_appenddictionary(contour_sub, addr_hull_pt_array, (t_object *)hullpts);

//        Mat rot_mtx = getRotationMatrix2D(minRect.center, minRect.angle, 1.0);
        
        
        /* todo : compare focus values more carfully
        if( (minRect.size.width > 15) && (minRect.size.height > 15))
        {
 
            Mat rot;
            Mat roi;
            warpAffine( src_gray, rot, rot_mtx, src_gray.size(), INTER_AREA );
            getRectSubPix(rot, minRect.size, minRect.center, roi);


            {
                Mat sob;
                Scalar _mean, _stdv;
                Sobel(roi, sob, CV_32F, 1, 1);
                meanStdDev(sob, _mean, _stdv); // << this could be combined with the stats iteration
                focus_val = (_stdv[0]*_stdv[0]) ;
                printf("\t alt focus varience %f\n", focus_val );

            }

        }
         */
        
       
        
        /*
         if( x->debug_matrix && i == 0)
         {
         mat2Jitter( &mask_roi, x->matrix );
         printf("size %d %d\n", boundRect[i].size().width, boundRect[i].size().height  );
         }
         */
        
/*
        if( contours[i].size() > 5 )
        {
            minEllipse[i] = fitEllipse( Mat(contours[i]) );
//            post("%d %f %f", i, minRect[i].angle, minEllipse[i].angle );
        }
*/
        
        Mat convexcontour;
        approxPolyDP( Mat(hullP), convexcontour, 0.001, true);
        
        atom_setfloat(&at, contourArea(convexcontour) / npix );
        atomarray_appendatom(hullarea, &at);
        
        //(defects[i].size() > 0 ) ? (defects[i].size() / (double)hullI[i].size()) : 0
        atom_setlong(&at, defects.size() );
        atomarray_appendatom(defect_count, &at);
        
        atom_setlong(&at, hullI.size() );
        atomarray_appendatom(hull_count, &at);
        

        t_dictionary *defectpts = dictionary_new();
        t_atomarray *defect_x = atomarray_new(0, NULL);
        t_atomarray *defect_y = atomarray_new(0, NULL);
        t_atomarray *defect_depth = atomarray_new(0, NULL);

        t_atomarray *defect_startx = atomarray_new(0, NULL);
        t_atomarray *defect_starty = atomarray_new(0, NULL);
        t_atomarray *defect_endx = atomarray_new(0, NULL);
        t_atomarray *defect_endy = atomarray_new(0, NULL);
        
//        vector<cv::Point> defect_startpt;
        
        double dist_sum = 0;
        vector<double> defect_dist;
        vector<Vec4i>::iterator d = defects.begin();
        vector<Vec4i>::iterator d_end = defects.end();
        
        while ( d != d_end )
        {
            Vec4i& v = (*d);
            cv::Point ptStart(  contours[ i ][ v[0] ] );
            cv::Point ptEnd(    contours[ i ][ v[1] ] );
            cv::Point ptFar(    contours[ i ][ v[2] ] );

            atom_setfloat(&at, ptFar.x / src_width );
            atomarray_appendatom(defect_x, &at);

            atom_setfloat(&at, 1. - (ptFar.y / src_height)  );
            atomarray_appendatom(defect_y, &at);

            atom_setfloat(&at, ptStart.x / src_width );
            atomarray_appendatom(defect_startx, &at);
            
            atom_setfloat(&at, 1. - (ptStart.y / src_height)  );
            atomarray_appendatom(defect_starty, &at);
            
            atom_setfloat(&at, ptEnd.x / src_width );
            atomarray_appendatom(defect_endx, &at);
            
            atom_setfloat(&at, 1. - (ptEnd.y / src_height)  );
            atomarray_appendatom(defect_endy, &at);
            
            atom_setfloat(&at, v[3] / 256.0);
            atomarray_appendatom(defect_depth, &at);

            /*
            //float depth = v[3] / 256.; // depth from center of contour
            double dist = norm(ptFar - ptStart);
            dist_sum += dist;
            defect_startpt.push_back( ptStart );
            defect_dist.push_back( dist / npix);
             */
            
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
        dictionary_appendlong(defectpts, addr_id, count);
        dictionary_appenddictionary(contour_sub, addr_defect_ptlist, (t_object *)defectpts);
        
        // add contour id sub to main dict
        dictionary_appenddictionary(contour_dict, idr, (t_object *)contour_sub);
        
        count++;

    }

    t_atomarray *idlist = atomarray_new(0, NULL);
    if( x->prev_centroids.size() == 0 )
    {
        vector<int> new_ids( centroids.size(), -1 );

        for( int i = 0; i < centroids.size(); i++ )
        {
            x->id_used[i] = 1;
            new_ids[i] = i;

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
        double radius_max = x->track_radius * src_height;
        double min = radius_max;
        int debug_count = 0;
        
//        printf("max %f\n", radius_max);
        // fist check if previous points are found
        for( int j = 0; j < x->prev_centroids.size(); j++ )
        {
//            printf("old check %d %d\n", j, x->prev_centroid_id[j] );

            min = radius_max;
            closest_id = -1;
            debug_count = 0;

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
//                        debug_count++;
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
            if( new_ids[i] == -1 )
            {
                for( int n = 0; n < CV_JIT_MAX_IDS; n++ )
                {
                    if( x->id_used[n] == 0)
                    {
                        new_ids[i] = n;
                        x->id_used[n] = 1;
                        break;
                    }
                }
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
        4) if flow point is inside the contour, then use preexisting number,
            if there are multiple old points inside the new contour, use the id with the largest area
     */
    
    dictionary_appendatomarray(cv_dict, addr_ids, (t_object *)idlist);
    
    
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
    dictionary_appendatomarray(cv_dict, addr_srcdim, (t_object *)srcdim);
    dictionary_appendatomarray(cv_dict, addr_defect_count, (t_object *)defect_count);
    dictionary_appendatomarray(cv_dict, addr_defect_dist_sum, (t_object *)defect_dist_sum);
    dictionary_appendatomarray(cv_dict, addr_hull_count, (t_object *)hull_count);
    dictionary_appendatomarray(cv_dict, addr_contour_count, (t_object *)contour_count);
    
    dictionary_appendatomarray(cv_dict, addr_focus, (t_object *)focus);
    

    switch (n_src_channels) {
        case 4:
            dictionary_appendatomarray(cv_dict, gensym("/mean/r"), (t_object *)channel_means[0]);
            dictionary_appendatomarray(cv_dict, gensym("/mean/g"), (t_object *)channel_means[1]);
            dictionary_appendatomarray(cv_dict, gensym("/mean/b"), (t_object *)channel_means[2]);
            dictionary_appendatomarray(cv_dict, gensym("/mean/a"), (t_object *)channel_means[3]);
            break;
        case 3:
            dictionary_appendatomarray(cv_dict, gensym("/mean/r"), (t_object *)channel_means[0]);
            dictionary_appendatomarray(cv_dict, gensym("/mean/g"), (t_object *)channel_means[1]);
            dictionary_appendatomarray(cv_dict, gensym("/mean/b"), (t_object *)channel_means[2]);
            break;
        case 1:
            dictionary_appendatomarray(cv_dict, gensym("/mean/lum"), (t_object *)channel_means[0]);
            break;
        default:
            break;
    }

    
    //if( x->enable_flow )
    {
        dictionary_appendatomarray(cv_dict, addr_flow_r, (t_object *)flow_r);
        dictionary_appendatomarray(cv_dict, addr_flow_theta, (t_object *)flow_theta);
    }
    dictionary_appenddictionary(cv_dict, addr_contourpts, (t_object *)contour_dict);
    
    
    atom_setsym(&at, x->dict_name);
    outlet_anything(x->outlet, ps_dict, 1, &at);
    object_free(cv_dict);
    
    
    if( x->debug_matrix )
    {
        
        if(x->matrix)
            outlet_anything(x->matrix_outlet, _jit_sym_jit_matrix, 1, &x->matrix_name);
    }
    
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
    
    if( x->matrix )
        jit_object_free(x->matrix);
    
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
        
        x->matrix = NULL;
        x->debug_matrix = 0;
        x->enable_flow = 0;
        
        x->erosion_size = 0;
        x->dilation_size = 0;
        x->gauss_sigma = 3;
        x->gauss_ksize = (x->gauss_sigma*5)|1;
        x->resize_scale = 0.25;
        x->thresh = 100;
        x->invert = 0;
        x->track_radius = 0.1;
        x->dict_name = symbol_unique();
        
        x->max_size = 0.9;
        x->min_size = 0.;
        x->parents_only = 0;
        
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
        
        if( x->debug_matrix )
        {
            x->matrix_outlet = outlet_new(x, "jit_matrix");
            
            t_jit_matrix_info matrix_info;
            
            t_symbol *matrix_name_unique = symbol_unique();
            jit_matrix_info_default(&matrix_info);
            matrix_info.type = _jit_sym_char;
            matrix_info.planecount = 4;
            matrix_info.dim[0] = 1920;
            matrix_info.dim[1] = 1080;
            x->matrix = jit_object_new(_jit_sym_jit_matrix, &matrix_info);
            x->matrix = jit_object_method(x->matrix, _jit_sym_register, matrix_name_unique);
            atom_setsym( &x->matrix_name, matrix_name_unique );

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
    
    CLASS_ATTR_LONG(c, "dilation", 0, t_cv_contours, dilation_size);
    CLASS_ATTR_FILTER_MIN(c, "dilation", 0);
    
    CLASS_ATTR_LONG(c, "erosion", 0, t_cv_contours, erosion_size);
    CLASS_ATTR_FILTER_MIN(c, "erosion", 0);
    
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
    CLASS_ATTR_STYLE_LABEL(c, "invert", 0, "onoff", "invert b/w");

    CLASS_ATTR_LONG(c, "parents_only", 0, t_cv_contours, parents_only);
    CLASS_ATTR_STYLE_LABEL(c, "parents_only", 0, "onoff", "supress child contours");
    
    CLASS_ATTR_LONG(c, "optical_flow", 0, t_cv_contours, enable_flow);
    CLASS_ATTR_STYLE_LABEL(c, "optical_flow", 0, "onoff", "optical flow on/off");
    
    CLASS_ATTR_DOUBLE(c, "max_size", 0, t_cv_contours, max_size);
    CLASS_ATTR_FILTER_MIN(c, "max_size", 0);
    CLASS_ATTR_FILTER_MAX(c, "max_size", 1);

    CLASS_ATTR_DOUBLE(c, "min_size", 0, t_cv_contours, min_size);
    CLASS_ATTR_FILTER_MIN(c, "min_size", 0);
    CLASS_ATTR_FILTER_MAX(c, "min_size", 1);
    
    CLASS_ATTR_LONG(c, "debug_matrix", 0, t_cv_contours, debug_matrix);
    CLASS_ATTR_INVISIBLE(c, "debug_matrix", 0);
    
    
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
    addr_child_of = gensym("/parent");
    addr_convex = gensym("/isconvex");
    addr_focus = gensym("/focus");
    addr_srcdim = gensym("/dim_xy");
    addr_aspect = gensym("/aspect");
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
    addr_ids = gensym("/ids");
    addr_id = gensym("/id");
    
    addr_flow_r = gensym("/flow/r");
    addr_flow_theta = gensym("/flow/theta");
    
    addr_contourpts = gensym("/contour/pts");
    ps_dict = gensym("dictionary");
    return;
}
END_USING_C_LINKAGE
