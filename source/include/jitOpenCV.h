/*
jitOpenCV.h
	

Copyright 2008, Jean-Marc Pelletier
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

/*
This file links to the OpenCV library <http://sourceforge.net/projects/opencvlibrary/>

Please refer to the  Intel License Agreement For Open Source Computer Vision Library.

Please also read the notes concerning technical issues with using the OpenCV library
in Jitter externals.
*/


#ifndef CVJIT_JIT_OPENCV_H
#define CVJIT_JIT_OPENCV_H


#include "c74_jitter.h"

#ifdef CVJIT_LEGACY
#include <opencv/cv.h>
#else
#include <opencv2/opencv.hpp>
#endif

namespace cvjit {

	int get_opencv_type(c74::max::t_jit_matrix_info const & info) {
		if (info.type == c74::max::_jit_sym_char)
		{
			return CV_MAKETYPE(CV_8U, info.planecount);
		}
		else if (info.type == c74::max::_jit_sym_long)
		{
			return CV_MAKETYPE(CV_32S, info.planecount);
		}
		else if (info.type == c74::max::_jit_sym_float32)
		{
			return CV_MAKETYPE(CV_32F, info.planecount);
		}
		else if (info.type == c74::max::_jit_sym_float64)
		{
			return CV_MAKETYPE(CV_64F, info.planecount);
		}
		return 0;
	}

	/**
	 * This function converts a Jitter matrix to an OpenCV Mat.
	 * Note that no memory is copied, and thus the OpenCV Mat should not be released.
	 */
	cv::Mat wrapJitterMatrix(c74::max::t_object * jitterMatrix, c74::max::t_jit_matrix_info const & info, char * data) {
		// char * data = nullptr;

		if (!jitterMatrix)
		{
			c74::max::object_error(jitterMatrix, "Error converting Jitter matrix: invalid pointer.");
			return cv::Mat();
		}

		if (info.dimcount != 2)
		{
			c74::max::object_error(jitterMatrix, "Error converting Jitter matrix: invalid dimension count.");
			return cv::Mat();
		}

		int type = get_opencv_type(info);
		
		// c74::max::object_method(jitterMatrix, c74::max::_jit_sym_getdata, &data);
		return cv::Mat(info.dim[1], info.dim[0], type, data, info.dimstride[1]);
	}

	void copyOpenCVMat2JitterMatrix(cv::Mat const & mat, c74::max::t_object * jitterMatrix) {
		c74::max::t_jit_matrix_info info;

		if (!jitterMatrix)
		{
			c74::max::object_error(NULL, "Error converting to Jitter matrix: invalid pointer.");
			return;
		}

		c74::max::object_method((c74::max::t_object*)jitterMatrix, c74::max::_jit_sym_getinfo, (void*)&info);
		info.dimcount = 2;
		info.planecount = mat.channels();
		info.dim[0] = mat.cols;
		info.dim[1] = mat.rows;
		switch (mat.type()) {
		case CV_8U:
			info.type = c74::max::_jit_sym_char;
			info.dimstride[0] = sizeof(char);
			break;
		case CV_32S:
			info.type = c74::max::_jit_sym_long;
			info.dimstride[0] = sizeof(long);
			break;
		case CV_32F:
			info.type = c74::max::_jit_sym_float32;
			info.dimstride[0] = sizeof(float);
			break;
		case CV_64F:
			info.type = c74::max::_jit_sym_float64;
			info.dimstride[0] = sizeof(double);
			break;
		default:
			c74::max::object_error(NULL, "Error converting to Jitter matrix: unsupported data type.");
			return;
		}
		info.dimstride[1] = (long)mat.step;
		info.size = (long)(mat.step * mat.rows);
		info.flags = JIT_MATRIX_DATA_REFERENCE | JIT_MATRIX_DATA_FLAGS_USE;
		c74::max::object_method(jitterMatrix, c74::max::_jit_sym_setinfo_ex, (void*)&info);
		c74::max::object_method(jitterMatrix, c74::max::_jit_sym_data, (void*)mat.data);
	}
}

// For legacy compatibility

#ifdef CVJIT_LEGACY

// not included in max-api for some reason
typedef struct _matrix_conv_info
{
	long 	flags;									///< flags for whether or not to use interpolation, or source/destination dimensions
	long	planemap[JIT_MATRIX_MAX_PLANECOUNT];	///< plane mapping
	long	srcdimstart[JIT_MATRIX_MAX_DIMCOUNT];	///< source dimension start
	long	srcdimend[JIT_MATRIX_MAX_DIMCOUNT];		///< source dimension end
	long	dstdimstart[JIT_MATRIX_MAX_DIMCOUNT];	///< destination dimension start
	long	dstdimend[JIT_MATRIX_MAX_DIMCOUNT];		///< destination dimension end
} t_matrix_conv_info;

void * jit_argb_to_cv_rgba(void *in_matrix) {
	void * new_matrix = NULL;
	t_matrix_conv_info convinfo;
	c74::max::t_jit_matrix_info info;
	convinfo.flags = 0;

	// argb to rgba
	convinfo.planemap[0] = 1;
	convinfo.planemap[1] = 2;
	convinfo.planemap[2] = 3;
	convinfo.planemap[3] = 0;

	jit_matrix_info_default(&info);
	c74::max::jit_object_method_imp(in_matrix, c74::max::_jit_sym_getinfo, (void*)&info, 0,0,0,0,0,0,0);
	new_matrix = c74::max::jit_object_new_imp(c74::max::_jit_sym_jit_matrix, (void*)&info, 0,0,0,0,0,0,0,0);
	if(new_matrix)
		c74::max::jit_object_method_imp(new_matrix, c74::max::_jit_sym_frommatrix, (void*)in_matrix, (void*)&convinfo, 0,0,0,0,0,0);
	return new_matrix;
}

void cv_rgba_to_jit_argb(void *out_matrix, char * in_data, int in_size) {
	void * new_matrix = NULL;
	t_matrix_conv_info convinfo;
	c74::max::t_jit_matrix_info info;
	convinfo.flags = 0;

	// rgba to argb
	convinfo.planemap[0] = 3;
	convinfo.planemap[1] = 0;
	convinfo.planemap[2] = 1;
	convinfo.planemap[3] = 2;

	jit_matrix_info_default(&info);
	c74::max::jit_object_method_imp(out_matrix, c74::max::_jit_sym_getinfo, (void*)&info, 0,0,0,0,0,0,0);
	new_matrix = c74::max::jit_object_new_imp(c74::max::_jit_sym_jit_matrix, (void*)&info, 0,0,0,0,0,0,0,0);
	if(new_matrix) {
		char *bp = NULL;
		c74::max::jit_object_method_imp(new_matrix, c74::max::_jit_sym_getdata, (void*)&bp, 0,0,0,0,0,0,0);
		if(bp) {
			memcpy(bp, in_data, in_size);
			c74::max::jit_object_method_imp(out_matrix, c74::max::_jit_sym_frommatrix, (void*)new_matrix, (void*)&convinfo, 0,0,0,0,0,0);
		}
		c74::max::jit_object_free(new_matrix);
	}
}

/*This is simply a utility function for converting a Jitter matrix into a CvMat.*/
CvMat cvJitter2CvMat(c74::max::t_jit_matrix_info & info, char * data)
{
	CvMat mat;

	if (info.dimcount != 2)
	{
		c74::max::object_error(nullptr, "Error converting Jitter matrix: invalid dimension count.");
		cvInitMatHeader(&mat, 0, 0, CV_MAKETYPE(CV_8U, info.planecount));
		return mat;
	}

	cvInitMatHeader(&mat, info.dim[1], info.dim[0], cvjit::get_opencv_type(info), data, info.dimstride[1]);

	return mat;
}

void cvMat2Jitter(CvMat *mat, void *jitMat)
{
	c74::max::t_jit_matrix_info info;
	
	if((!jitMat)||(!mat))
	{
		c74::max::object_error(NULL, "Error converting to Jitter matrix: invalid pointer.");
		return;
	}
	
	c74::max::object_method((c74::max::t_object*)jitMat, c74::max::_jit_sym_getinfo, (void*)&info);
	info.dimcount = 2;
	info.planecount = CV_MAT_CN(mat->type);
	info.dim[0] = mat->cols;
	info.dim[1] = mat->rows;
	switch(CV_MAT_DEPTH(mat->type)){
		case CV_8U:
			info.type = c74::max::_jit_sym_char;
			info.dimstride[0] = sizeof(char);
			break;
		case CV_32S:
			info.type = c74::max::_jit_sym_long;
			info.dimstride[0] = sizeof(long);
			break;
		case CV_32F:
			info.type = c74::max::_jit_sym_float32;
			info.dimstride[0] = sizeof(float);
			break;
		case CV_64F:	
			info.type = c74::max::_jit_sym_float64;
			info.dimstride[0] = sizeof(double);
			break;
		default:
			c74::max::object_error(NULL, "Error converting to Jitter matrix: unsupported depth.");
			return;
	}
	info.dimstride[1] = mat->step;
	info.size = mat->step * mat->rows;
	info.flags = JIT_MATRIX_DATA_REFERENCE | JIT_MATRIX_DATA_FLAGS_USE;
	c74::max::object_method((c74::max::t_object*)jitMat, c74::max::_jit_sym_setinfo_ex, (void*)&info);
	c74::max::object_method((c74::max::t_object*)jitMat, c74::max::_jit_sym_data, (void*)mat->data.ptr);
}

#endif

#endif
