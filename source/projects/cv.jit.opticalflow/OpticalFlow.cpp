/*
 opticalflow
 
 
 Copyright 2010, Jean-Marc Pelletier
 jmp@jmpelletier.com
 
 This file is part of cv.jit.
 
 cv.jit is free software: you can redistribute it and/or modify
 it under the terms of the GNU Lesser General Public License as published 
 by the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 cv.jit is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU Lesser General Public License for more details.
 
 You should have received a copy of the GNU Lesser General Public License
 along with cv.jit.  If not, see <http://www.gnu.org/licenses/>.
 
 */

#include "OpticalFlow.h"


OpticalFlow::OpticalFlow(){
	_init();
}

OpticalFlow::OpticalFlow(OpticalFlow::Optical_flow_methods method){
	_init();
	_method = method; 
}

OpticalFlow::~OpticalFlow(){
	delete[] _previous_data;
}

void OpticalFlow::setBMshiftSize(CvSize size){setBMshiftSize(size.width,size.height);}
void OpticalFlow::setBMshiftSize(unsigned int w, unsigned int h){_bm_shift_size = cvSize(w > 0 ? w : 0,h > 0 ? h : 0);}
void OpticalFlow::setBMblockSize(CvSize size){setBMblockSize(size.width,size.height);}
void OpticalFlow::setBMblockSize(unsigned int w, unsigned int h){_bm_block_size = cvSize(w > 0 ? w : 0,h > 0 ? h : 0);}
void OpticalFlow::setBMmaxRange(CvSize size){setBMmaxRange(size.width,size.height);}
void OpticalFlow::setBMmaxRange(unsigned int w, unsigned int h){_bm_max_range = cvSize(w > 0 ? w : 0,h > 0 ? h : 0);}
void OpticalFlow::setUsePrevious(bool state){_use_previous = state ? 1 : 0;if(state)_fb_flags |= cv::OPTFLOW_USE_INITIAL_FLOW; else _fb_flags ^= cv::OPTFLOW_USE_INITIAL_FLOW;}
bool OpticalFlow::getUsePrevious(){return _use_previous!=0;}

CvSize OpticalFlow::getBMshiftSize(){return _bm_shift_size;}
CvSize OpticalFlow::getBMblockSize(){return _bm_block_size;}
CvSize OpticalFlow::getBMmaxRange(){return _bm_max_range;}

void OpticalFlow::setLKwindowSize(CvSize size){
	_lk_window_size = size;
	if(!(_lk_window_size.width & 1))_lk_window_size.width++;
	if(!(_lk_window_size.height & 1))_lk_window_size.height++;
	if(_lk_window_size.width < 1)_lk_window_size.width = 1;
	if(_lk_window_size.height < 1)_lk_window_size.height = 1;
	if(_lk_window_size.width > 15)_lk_window_size.width = 15;
	if(_lk_window_size.height > 15)_lk_window_size.height = 15;
}

void OpticalFlow::setLKwindowSize(unsigned int w, unsigned int h){
	setLKwindowSize(cvSize(w,h));
}

CvSize OpticalFlow::getLKwindowSize(){return _lk_window_size;}

void OpticalFlow::setHSlambda(double lambda){
	_hs_lambda = lambda > 0. ? lambda : 0.0001;
}

double OpticalFlow::getHSlambda(){return _hs_lambda;}
void OpticalFlow::setHSmaxIterations(unsigned int iterations){_hs_max_iterations = iterations;}
int OpticalFlow::getHSmaxIterations(){return _hs_max_iterations;}
void OpticalFlow::setHSepsilon(double epsilon){_hs_epsilon = epsilon;}
double OpticalFlow::getHSepsilon(){return _hs_epsilon;}

void OpticalFlow::setFBuseGaussian(bool state){if(state)_fb_flags |= cv::OPTFLOW_FARNEBACK_GAUSSIAN; else _fb_flags ^= cv::OPTFLOW_FARNEBACK_GAUSSIAN;}
bool OpticalFlow::getFBuseGaussian(){return (_fb_flags & cv::OPTFLOW_FARNEBACK_GAUSSIAN) != 0;}

void OpticalFlow::setFBpyramidScale(double scale){_fb_pyramid_scale = scale;}
void OpticalFlow::setFBlevels(int levels){_fb_levels = levels;}
void OpticalFlow::setFBwindowSize(int size){_fb_window_size = size > 1 ? size: 2;}
void OpticalFlow::setFBiterations(int iterations){_fb_iterations = iterations;}
void OpticalFlow::setFBpoly_n(int poly_n){_fb_poly_n = poly_n;}
void OpticalFlow::setFBpoly_sigma(double poly_sigma){_fb_poly_sigma = poly_sigma;}
double OpticalFlow::getFBpyramidScale(){return _fb_pyramid_scale;}
int OpticalFlow::getFBlevels(){return _fb_levels;}
int OpticalFlow::getFBwindowSize(){return _fb_window_size;}
int OpticalFlow::getFBiterations(){return _fb_iterations;}
int OpticalFlow::getFBpoly_n(){return _fb_poly_n;}
double OpticalFlow::getFBpoly_sigma(){return _fb_poly_sigma;}

void OpticalFlow::setMethod(OpticalFlow::Optical_flow_methods of_method){_method = of_method;}

void OpticalFlow::setMethod(std::string of_method){
	std::string lowercase_string = of_method;
	std::transform(of_method.begin(), of_method.end(), lowercase_string.begin(), 
				   static_cast < int(*)(int) > (tolower));
	if(((lowercase_string.find("block")!=std::string::npos)&&(lowercase_string.find("matching")!=std::string::npos))||(lowercase_string.compare("bm")==0))
		_method = OpticalFlow::Block_matching;
	else if(((lowercase_string.find("lucas")!=std::string::npos)&&(lowercase_string.find("kanade")!=std::string::npos))||(lowercase_string.compare("lk")==0))
		_method = OpticalFlow::Lucas_Kanade;
	else if(((lowercase_string.find("horn")!=std::string::npos)&&(lowercase_string.find("schunk")!=std::string::npos))||(lowercase_string.compare("hs")==0))
		_method = OpticalFlow::Horn_Schunk;
	else if((lowercase_string.find("farneback")!=std::string::npos)||(lowercase_string.compare("fb")==0))
		_method = OpticalFlow::Farneback;
}

int OpticalFlow::getMethod(){return _method;}

std::string OpticalFlow::getMethodName(){
	switch(_method){
		case OpticalFlow::Horn_Schunk:
			return "Horn_Schunk";
		case OpticalFlow::Lucas_Kanade:
			return "Lucas_Kanade";
		case OpticalFlow::Block_matching:
			return "Block_Matching";
		case OpticalFlow::Farneback:
		default:
			return "Farneback";
	}
}

void OpticalFlow::compute(CvMat* source){
	if(!source)return;
	cv::Mat mat(source);
	compute(mat);
}

void OpticalFlow::compute(IplImage* source){
	if(!source)return;
	cv::Mat mat(source);
	compute(mat);
}

void OpticalFlow::compute(cv::Mat &src){
	if(src.depth() != CV_8U){
		std::cerr << "OpticalFlow::compute(1): input matrix must be of 8-bit integers.\n";
		return;
	}
	if(src.channels() != 1){
		std::cerr << "OpticalFlow::compute(1): input matrix must have only one channel.\n";
		return;
	}
	if((_previous.cols != src.cols)||(_previous.rows != src.rows)||(_previous.step != src.step)){
		//Poblem: with the clone() method, there is apparently no guarantee that step will be the same 
		
		//_previous = src.clone();
		delete[] _previous_data;
		_previous_data = new char[src.step * src.rows];
		if(!_previous_data){
			std::cerr << "OpticalFlow::compute(1): out of memory.\n";
			return;
		}
		
		cv::Mat tmp(src.rows,src.cols,src.type(),_previous_data,src.step);
		_previous = tmp;
		memcpy(_previous_data, src.data, src.step * src.rows);
		_xflow = cvScalarAll(0);; 
		_yflow = cvScalarAll(0);;
		return;
	}
	
	//Calculate
	compute(_previous, src);
	
	//Save matrix for next pass
	//_previous = src.clone();
	memcpy(_previous_data, src.data, src.step * src.rows);
}

void OpticalFlow::compute(CvMat* first,CvMat* second){
	if((!first)||(!second))return;
	cv::Mat mat1(first);
	cv::Mat mat2(second);
	compute(mat1,mat2);
}

void OpticalFlow::compute(IplImage* first,IplImage* second){
	if((!first)||(!second))return;
	cv::Mat mat1(first);
	cv::Mat mat2(second);
	compute(mat1,mat2);
}

void OpticalFlow::compute(cv::Mat &first, cv::Mat &second){
	if((first.cols != second.cols)||(first.rows != second.rows)){
		std::cerr << "OpticalFlow::compute(2): input matrices don't have the same size.\n";
		return;
	}
	if(first.step != second.step){
		std::cerr << "OpticalFlow::compute(2): input matrices don't have the same step.\n";
		return;
	}
	if((first.channels() != 1)||(second.channels() != 1)){
		std::cerr << "OpticalFlow::compute(2): input matrix must have only one channel.\n";
		return;
	}
	if((first.depth() != CV_8U)||(second.depth() != CV_8U)){
		std::cerr << "OpticalFlow::compute(2): input matrix must be of 8-bit integers.\n";
		return;
	}
	
	if(_method == OpticalFlow::Block_matching){
		CvSize velSize =
		{
			(first.cols - _bm_block_size.width + _bm_shift_size.width) / _bm_shift_size.width,
			(first.rows - _bm_block_size.height + _bm_shift_size.height) / _bm_shift_size.height
		};
		_xflow.create(velSize.height, velSize.width, CV_32F);
		_yflow.create(velSize.height, velSize.width, CV_32F);
	}else{
		_xflow.create(first.rows, first.cols, CV_32F);
		_yflow.create(first.rows, first.cols, CV_32F);
	}
	
	CvMat src1 = (CvMat)first;
	CvMat src2 = (CvMat)second;
	CvMat xf = (CvMat)_xflow;
	CvMat yf = (CvMat)_yflow;
	
	
	switch (_method) {
		case OpticalFlow::Horn_Schunk:
			cvCalcOpticalFlowHS(&src1, &src2, 0, &xf, &yf, _hs_lambda, cvTermCriteria(CV_TERMCRIT_EPS|CV_TERMCRIT_ITER, _hs_max_iterations, _hs_epsilon));
			break;
		case OpticalFlow::Block_matching:
			cvCalcOpticalFlowBM(&src1, &src2, _bm_block_size, _bm_shift_size, _bm_max_range, _use_previous, &xf, &yf);
			break;
		case OpticalFlow::Farneback:
		{
			cv::Mat flow;
			std::vector<cv::Mat>channels;
			cv::calcOpticalFlowFarneback(first, second, flow, _fb_pyramid_scale, _fb_levels, _fb_window_size, _fb_iterations, _fb_poly_n, _fb_poly_sigma, _fb_flags);
			//We need to copy flow to output matrices
			channels.push_back(_xflow);
			channels.push_back(_yflow);
			cv::split(flow, channels);
		}
			break;
		case OpticalFlow::Lucas_Kanade:
		default:
			if((_lk_window_size.width < src1.cols)&&(_lk_window_size.height < src1.rows))
				cvCalcOpticalFlowLK(&src1, &src2, _lk_window_size, &xf, &yf);
			break;
	}
}

cv::Mat OpticalFlow::getXflow(){return _xflow;}
cv::Mat OpticalFlow::getYflow(){return _yflow;}

