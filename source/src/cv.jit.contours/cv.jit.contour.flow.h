
#ifndef __cv_jit__cv_jit_contour__
#define __cv_jit__cv_jit_contour__

#include "opencv2/opencv.hpp"
#include "opencv2/video/tracking.hpp"

using namespace cv;

class ContourFlow
{
    
public:
    ContourFlow(){};
    ~ContourFlow(){};
    
    void processFrame( Mat& src_gray, vector<Point2f> in_points, vector<Point2f>& out_points, vector<uchar>& status, vector<float>& err);
    
private:
    static const TermCriteria m_termcrit;
    static const cv::Size m_winSize;
    
    const int m_max_count = 500;

    Mat m_prevGray;
    vector<vector<cv::Point> > m_prev_contours;
    vector<Point2f> m_points[2];
    
};

#endif /* defined(__cv_jit__cv_jit_contour__) */
