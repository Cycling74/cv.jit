#include "cv.jit.contour.flow.h"

const TermCriteria ContourFlow::m_termcrit = TermCriteria(TermCriteria::COUNT|TermCriteria::EPS,20,0.03);
const cv::Size ContourFlow::m_winSize = cv::Size(31,31);

void ContourFlow::processFrame( Mat& src_gray, vector<Point2f> in_points, vector<Point2f>& out_points, vector<uchar>& status, vector<float>& err)
{
    
    if( m_prevGray.empty() )
        src_gray.copyTo( m_prevGray );

//    if( m_points[0].size() != in_points.size() )

    m_points[0] = in_points;
    
    if( m_points[0].size() > 0 )
    {
        calcOpticalFlowPyrLK( m_prevGray, src_gray, m_points[0], m_points[1], status, err, m_winSize, 3, m_termcrit, 0, 0.001);
        
        Mat flow;
        calcOpticalFlowFarneback(m_prevGray, src_gray, flow, 0.5, 1, 15, 1, 5, 1.1, 0);

        out_points = m_points[1];
        
        /*
        for( ssize_t i = 0; i < status.size(); i++)
        {
            printf("%i", status[i]);
        }
        printf("\n");
*/
    }
    std::swap(m_points[1], m_points[0]);
    cv::swap(m_prevGray, src_gray);
    
};
