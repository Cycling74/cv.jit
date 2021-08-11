/*
 @file cv.jit.findchessboardcorners
 
 @ingroup cv.jit
 
 Copyright 2010 - Antoine Villeret
 antoine.villeret@gmail.com
 */

/*
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

#include "cv.h"
#include "jitOpenCV.h"

#include "cvjit.h"

using namespace c74::max;

// Our Jitter object instance data
typedef struct _cv_jit_findchessboardcorners {
	t_object	ob;

	//CvSize		pattern_size;
	long			pattern_size[2];
	long			window_size[2];
	long			zero_zone[2];
	long		array_size;
	//CvSize		window;
	//CvSize		zero_zone;
	
	IplImage	*color_image, *gray_image;
	
} t_cv_jit_findchessboardcorners;


// prototypes
BEGIN_USING_C_LINKAGE
t_jit_err						cv_jit_findchessboardcorners_init				(void); 
t_cv_jit_findchessboardcorners	*cv_jit_findchessboardcorners_new				(void);
void							cv_jit_findchessboardcorners_free				(t_cv_jit_findchessboardcorners *x);
t_jit_err						cv_jit_findchessboardcorners_matrix_calc		(t_cv_jit_findchessboardcorners *x, void *inputs, void *outputs);
void							cv_jit_findchessboardcorners_findcorners		(t_cv_jit_findchessboardcorners *x, 
																				 t_jit_matrix_info in_minfo, 
																				 t_jit_matrix_info out1_minfo,
																				 void *in_matrix, 
																				 void *out1_matrix,
																				 CvMat in_cv );

void cv_jit_findchessboardcorners_print_matrixinfo		(t_jit_matrix_info minfo) ;
void cv_jit_findchessboardcorners_print_points			(t_cv_jit_findchessboardcorners *x, CvPoint2D32f *point) ;
END_USING_C_LINKAGE

// globals
static void *_cv_jit_findchessboardcorners_class = NULL;


/************************************************************************************/

t_jit_err cv_jit_findchessboardcorners_init(void) 
{
	long attrflags = 0;
	t_jit_object *mop, *out2, *attr;
	
	_cv_jit_findchessboardcorners_class = jit_class_new("cv_jit_findchessboardcorners", (method)cv_jit_findchessboardcorners_new, (method)cv_jit_findchessboardcorners_free, sizeof(t_cv_jit_findchessboardcorners), 0);
	
	// add matrix operator (mop)
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop,1,2); //#inputs,#outputs

	jit_mop_output_nolink(mop,2);

	out2=(t_jit_object *)jit_object_method(mop,_jit_sym_getoutput,2);

	// restrict 2d matrix outlet
	jit_attr_setlong(out2,_jit_sym_minplanecount,2);
	jit_attr_setlong(out2,_jit_sym_maxplanecount,2);
	jit_attr_setlong(out2,_jit_sym_mindimcount, 1);
	jit_attr_setlong(out2,_jit_sym_maxdimcount, 1);
	jit_attr_setsym(out2,_jit_sym_types,_jit_sym_float32);
	

	jit_class_addadornment(_cv_jit_findchessboardcorners_class,mop);
	
	// add attributes

	attr = (t_jit_object *)	jit_object_new(_jit_sym_jit_attr_offset_array,
										   "pattern_size",
										   _jit_sym_long,
										   2,
										   attrflags,
										   (method)0L,
										   (method)0L,
										   calcoffset(t_cv_jit_findchessboardcorners,array_size),
										   calcoffset(t_cv_jit_findchessboardcorners,pattern_size));
	jit_class_addattr(_cv_jit_findchessboardcorners_class,attr);
	
	attr = (t_jit_object *)	jit_object_new(_jit_sym_jit_attr_offset_array,
										   "window_size",
										   _jit_sym_long,
										   2,
										   attrflags,
										   (method)0L,
										   (method)0L,
										   calcoffset(t_cv_jit_findchessboardcorners,array_size),
										   calcoffset(t_cv_jit_findchessboardcorners,window_size));
	jit_class_addattr(_cv_jit_findchessboardcorners_class,attr);

	attr = (t_jit_object *)	jit_object_new(_jit_sym_jit_attr_offset_array,
										   "zero_zone",
										   _jit_sym_long,
										   2,
										   attrflags,
										   (method)0L,
										   (method)0L,
										   calcoffset(t_cv_jit_findchessboardcorners,array_size),
										   calcoffset(t_cv_jit_findchessboardcorners,zero_zone));
	jit_class_addattr(_cv_jit_findchessboardcorners_class,attr);
	
	// add method(s)
	jit_class_addmethod(_cv_jit_findchessboardcorners_class, (method)cv_jit_findchessboardcorners_matrix_calc,		"matrix_calc",		A_CANT,		0);
	
	// finalize class
	jit_class_register(_cv_jit_findchessboardcorners_class);
	//object_post(NULL, "cv.jit.findchessboardcorners by Antoine Villeret - build on the %s at %s.",__DATE__, __TIME__);

	return JIT_ERR_NONE;
}	

/************************************************************************************/
// Object Life Cycle

t_cv_jit_findchessboardcorners *cv_jit_findchessboardcorners_new(void)
{
	t_cv_jit_findchessboardcorners	*x = NULL;
	
	x = (t_cv_jit_findchessboardcorners*)jit_object_alloc(_cv_jit_findchessboardcorners_class);
	if (x) {
		// some initialization
		x->pattern_size[0] = 7;
		x->pattern_size[1] = 6;
		x->window_size[0] = 11;
		x->window_size[1] = 11;
		x->zero_zone[0] = -1;
		x->zero_zone[1]	= -1;
		x->array_size = 2;
	} 
	return x;
}


void cv_jit_findchessboardcorners_free(t_cv_jit_findchessboardcorners *x)
{
	// nothing to free
}


/************************************************************************************/
// Methods bound to input/inlets

t_jit_err cv_jit_findchessboardcorners_matrix_calc(t_cv_jit_findchessboardcorners *x, void *inputs, void *outputs)
{
	t_jit_err			err = JIT_ERR_NONE;
	long				in_savelock, 
						out1_savelock,
						out2_savelock;
	t_jit_matrix_info	in_minfo,
						out1_minfo,
						out2_minfo;
	float				*in_bp, 
						*out1_bp,
						*out2_bp;
	void				*in_matrix,
						*out1_matrix,
						*out2_matrix;
	CvMat				in_cv;
	
	int					corners_count, board_point_nb, found, i;
	CvPoint2D32f		*corners = NULL, *corners_data;
	IplImage			*color_image, *gray_image, in_image;
	CvSize				image_size;
	float				*out2_data;
	void				*rgba_matrix = NULL;
	
	in_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);
	out1_matrix 	= jit_object_method(outputs,_jit_sym_getindex,0);
	out2_matrix 	= jit_object_method(outputs,_jit_sym_getindex,1);

	if (x && in_matrix && out1_matrix && out2_matrix) {
		in_savelock = (long) jit_object_method(in_matrix, _jit_sym_lock, 1);
		out1_savelock = (long) jit_object_method(out1_matrix, _jit_sym_lock, 1);
		out2_savelock = (long) jit_object_method(out2_matrix, _jit_sym_lock, 1);
		
		jit_object_method(in_matrix,	_jit_sym_getinfo, &in_minfo);
		jit_object_method(out1_matrix,	_jit_sym_getinfo, &out1_minfo);
		jit_object_method(out2_matrix,	_jit_sym_getinfo, &out2_minfo);
		
		jit_object_method(in_matrix,	_jit_sym_getdata, &in_bp);
		jit_object_method(out1_matrix,	_jit_sym_getdata, &out1_bp);		
		
		if ( !in_bp ) { 
			err=JIT_ERR_INVALID_INPUT; 
			goto out;
		}
		if ( !out1_bp ) { 
			err=JIT_ERR_INVALID_OUTPUT; 
			goto out;
		}		
		if ( in_minfo.type != _jit_sym_char ) {
			err = JIT_ERR_MISMATCH_TYPE; 
			goto out;
		}
		
		// input matrix must have 1 planes
		if ( in_minfo.planecount != 1 && in_minfo.planecount != 4 ) {
			err=JIT_ERR_MISMATCH_PLANE; 
			goto out;
		}
		
		if ( in_minfo.dimcount != 2 ) {
			err=JIT_ERR_MISMATCH_DIM; 
			goto out;
		}
		
		if ( in_minfo.dim[0] < 5 || in_minfo.dim[1] < 5 ) {
			object_error((t_jit_object *)x, "image size must be at leat 5 x 5");
			err = JIT_ERR_MISMATCH_DIM;
			goto out;
		}
		
		if ( x->pattern_size[0] < 3 || x->pattern_size[1] < 3 ) {
			object_error((t_object *) x, "pattern_size must be at least 3 x 3");
			goto out;
		}

		if ( in_minfo.planecount == 4 ) {
			// swap planes
			rgba_matrix = jit_argb_to_cv_rgba(in_matrix);
			if(!rgba_matrix)
				goto out;
			jit_object_method(rgba_matrix, _jit_sym_getdata, &in_bp);
		}

		CvSize pattern_size = cvSize(x->pattern_size[0], x->pattern_size[1]);
		CvSize win = cvSize(x->window_size[0], x->window_size[1]);
		CvSize zero_zone = cvSize(x->zero_zone[0], x->zero_zone[1]);
		board_point_nb = pattern_size.width*pattern_size.height;
		corners = new CvPoint2D32f[board_point_nb];
		
		image_size = cvSize(in_minfo.dim[0], in_minfo.dim[1]);
		
		color_image	=	cvCreateImage(image_size, 8, 4);
		gray_image	=	cvCreateImage(image_size, 8, 1);
		
        in_cv = cvJitter2CvMat(in_minfo, (char *)in_bp);
		
		cvGetImage(&in_cv, &in_image);

		// convert image colorspace
		if ( in_minfo.planecount == 1 ) {
			cvCvtColor(&in_image, color_image, CV_GRAY2RGBA);
			memcpy(gray_image->imageData, in_image.imageData, in_image.imageSize);
		}
		
		else {
			cvCvtColor(&in_image, gray_image, CV_RGBA2GRAY);
			memcpy(color_image->imageData, in_image.imageData, in_image.imageSize);
		}
		
		found = cvFindChessboardCorners(&in_cv, pattern_size, corners, &corners_count, CV_CALIB_CB_ADAPTIVE_THRESH | CV_CALIB_CB_FILTER_QUADS);
		
		//cv_jit_findchessboardcorners_print_points(x, corners);
		
		cvFindCornerSubPix(gray_image, corners, corners_count, win, zero_zone, cvTermCriteria(CV_TERMCRIT_EPS+CV_TERMCRIT_ITER, 30, 0.1));
		
		//cv_jit_findchessboardcorners_print_points(x, corners);
	
		cvDrawChessboardCorners(color_image, pattern_size, corners, corners_count, found);
		
		if ( in_minfo.planecount == 1 ) {
			cvCvtColor(color_image, gray_image, CV_RGBA2GRAY);
			memcpy(out1_bp,gray_image->imageData,gray_image->imageSize);

		}
		
		else {
			//memcpy(out1_bp,color_image->imageData,color_image->imageSize);
			cv_rgba_to_jit_argb(out1_matrix, color_image->imageData, color_image->imageSize);
		}
		
		// jit_object_method(out1_matrix, _jit_sym_data, out1_cv.data.ptr);
		
		// prepare output 2
		out2_minfo.dim[0] = corners_count>0?corners_count:1;
		jit_object_method(out2_matrix,	_jit_sym_setinfo, &out2_minfo);
		jit_object_method(out2_matrix,	_jit_sym_getinfo, &out2_minfo);	
		jit_object_method(out2_matrix,	_jit_sym_getdata, &out2_bp);
		if (!out2_bp) {
			err=JIT_ERR_INVALID_OUTPUT; 
			goto out;
		}
		
		// cv_jit_findchessboardcorners_print_matrixinfo(out2_minfo);
		
		out2_data = (float *)out2_bp;
		corners_data = (CvPoint2D32f *)corners;		
		
		for ( i = 0 ; i < corners_count ; i++) {
			out2_data[0] = (float) corners_data->x;
			out2_data[1] = (float) corners_data->y;
			out2_data += 2;
			corners_data++;
			
		}
		
	} 
	else
		return JIT_ERR_INVALID_PTR;
	
	cvReleaseImage(&color_image);
	cvReleaseImage(&gray_image);
out:
	jit_object_method(out2_matrix,_jit_sym_lock,out2_savelock);
	jit_object_method(out1_matrix,_jit_sym_lock,out1_savelock);
	jit_object_method(in_matrix,_jit_sym_lock,in_savelock);

	if(rgba_matrix)
		jit_object_free(rgba_matrix);

	if( corners ) delete corners;
	return err;
}

/************************/
/*	Set and get method	*/
/************************/

void cv_jit_findchessboardcorners_print_matrixinfo(t_jit_matrix_info minfo) {
	printf("---------MATRIX INFO---------\n");
	printf("size : %ld bytes\n", minfo.size);
	printf("type : %s\n", minfo.type->s_name);
	printf("flag : %ld\n", minfo.flags);
	printf("dimcount : %ld\n", minfo.dimcount);
	printf("dim : %ld x %ld\n", minfo.dim[0],minfo.dim[1]);
	printf("dimstride : %ld, %ld\n", minfo.dimstride[0],minfo.dimstride[1]);
	printf("planecount : %ld\n", minfo.planecount);
	printf("-----------------------------\n");
}

void cv_jit_findchessboardcorners_print_points(t_cv_jit_findchessboardcorners *x, CvPoint2D32f *point) {
	int i;
	
	printf("corners coordinates\n");
	for ( i = 0 ; i < x->pattern_size[0] * x->pattern_size[1] ; i++, point++ ) {
		printf("%d :\t%lf\t%lf\n",i,point->x,point->y);
	}
	}
