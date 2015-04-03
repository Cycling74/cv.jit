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

#ifndef _OPTICAL_FLOW_CLASS_
#define _OPTICAL_FLOW_CLASS_

#include <iostream>
#include <cctype> 
#include <algorithm>
#include "cv.h"


class OpticalFlow{
private:
	cv::Mat _xflow;
	cv::Mat _yflow;
	cv::Mat _previous;
	char *_previous_data; //Needed for step-matching hack
	int _method;
	
	//Horn-Schunk parameters:
	double _hs_lambda;
	double _hs_epsilon;
	unsigned int _hs_max_iterations;
	
	//Lucas-Kanade parameters:
	CvSize _lk_window_size;
	
	//Block matching parameters:
	CvSize _bm_shift_size;
	CvSize _bm_block_size;
	CvSize _bm_max_range;
	int _use_previous;
	
	//Farneback parameters
	double _fb_pyramid_scale;
	int _fb_levels;
	int _fb_window_size;
	int _fb_iterations;
	int _fb_poly_n;
	double _fb_poly_sigma;
	int _fb_flags;
	
	void _init(){
		_previous_data = 0;
		_method = OpticalFlow::Block_matching;
		_hs_lambda = 0.1;
		_hs_epsilon = 1.;
		_hs_max_iterations = 3;
		_lk_window_size = cvSize(5, 5);
		_bm_shift_size = cvSize(3,3);
		_bm_block_size = cvSize(5,5);
		_bm_max_range = cvSize(3,3);
		_use_previous = 0;
		_fb_flags = 0;
		_fb_iterations = 3;
		_fb_levels = 3;
		_fb_poly_n = 5;
		_fb_poly_sigma = 1.1;
		_fb_pyramid_scale = 0.5;
		_fb_window_size = 7;
	}
	
public:
	//Optical flow algorithm
	enum Optical_flow_methods{
		Horn_Schunk,
		Lucas_Kanade,
		Block_matching,
		Farneback
	};
	
	//Constructors/destructor
	OpticalFlow();
	OpticalFlow(OpticalFlow::Optical_flow_methods method);
	~OpticalFlow();
	
	//Set and get parameters for block matching
	void setBMshiftSize(CvSize size);
	void setBMshiftSize(unsigned int w, unsigned int h);
	void setBMblockSize(CvSize size);
	void setBMblockSize(unsigned int w, unsigned int h);
	void setBMmaxRange(CvSize size);
	void setBMmaxRange(unsigned int w, unsigned int h);
	CvSize getBMshiftSize();
	CvSize getBMblockSize();
	CvSize getBMmaxRange();
	
	//Set and get parameters for Lucas-Kanade
	void setLKwindowSize(CvSize size);
	void setLKwindowSize(unsigned int w, unsigned int h);
	CvSize getLKwindowSize();
	
	//Set and get parameters for Horn-Schunk
	void setHSlambda(double lambda);
	double getHSlambda();
	void setHSmaxIterations(unsigned int iterations);
	int getHSmaxIterations();
	void setHSepsilon(double epsilon);
	double getHSepsilon();
	
	//Set and get parameters for Farneback
	void setFBuseGaussian(bool state);
	bool getFBuseGaussian();
	void setFBpyramidScale(double scale);
	void setFBlevels(int levels);
	void setFBwindowSize(int size);
	void setFBiterations(int iterations);
	void setFBpoly_n(int poly_n);
	void setFBpoly_sigma(double poly_sigma);
	double getFBpyramidScale();
	int getFBlevels();
	int getFBwindowSize();
	int getFBiterations();
	int getFBpoly_n();
	double getFBpoly_sigma();
	
	//These paramters apply to several methods
	void setUsePrevious(bool state);
	bool getUsePrevious();
	
	//Set algorithm using enum
	void setMethod(OpticalFlow::Optical_flow_methods of_method);
	//Set algorithm using a human readable string
	//lk, hs, bm, fb, or full names such as "lucaskanade" or "Lucas-Kanade" or "Lucas kanade"...
	void setMethod(std::string of_method);
	int getMethod(); //Returns an enum value
	std::string getMethodName(); //Returns a readable string (without spaces)
	
	//Calculate optical flow
	//From an image sequence (previous image is saved)
	void compute(CvMat* source);
	void compute(IplImage* source);
	void compute(cv::Mat &src);
	//From a pair of images (no data is saved)
	void compute(CvMat* first,CvMat* second);
	void compute(IplImage* first,IplImage* second);
	void compute(cv::Mat &first, cv::Mat &second);
	
	//Returns an OpenCV matrix containing the optical flow
	cv::Mat getXflow();
	cv::Mat getYflow();
};

#endif

