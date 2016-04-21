/*
 @file cv.jit.perspective
 
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
#include "c74_jitter.h"

using namespace c74::max;

using namespace cv;


// Our Jitter object instance data
typedef struct _cv_jit_perspective {
	t_object	ob;
	
} t_cv_jit_perspective;


// prototypes
BEGIN_USING_C_LINKAGE
t_jit_err				cv_jit_perspective_init				(void); 
t_cv_jit_perspective	*cv_jit_perspective_new				(void);
void					cv_jit_perspective_free				(t_cv_jit_perspective *x);
t_jit_err				cv_jit_perspective_matrix_calc		(t_cv_jit_perspective *x, void *inputs, void *outputs);
void					cv_jit_perspective_print_cvmat		(CvMat *mat);
void					cv_jit_perspective_print_matrixinfo	(t_jit_matrix_info *minfo);
END_USING_C_LINKAGE


// globals
static void *_cv_jit_perspective_class = NULL;


/************************************************************************************/

t_jit_err cv_jit_perspective_init(void) 
{
	t_jit_object	*o, *mop;
	
	_cv_jit_perspective_class = jit_class_new("cv_jit_perspective", (method)cv_jit_perspective_new, (method)cv_jit_perspective_free, sizeof(t_cv_jit_perspective), 0);
	
	// add matrix operator (mop)
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop,2,1); // 2 inputs, 1 output
	jit_mop_single_type(mop, _jit_sym_float32);
	// disable link on the right inlet
	jit_mop_input_nolink(mop, 2);
	o = (t_jit_object *)jit_object_method(mop,_jit_sym_getinput,2);
	jit_object_method(o,_jit_sym_ioproc,jit_mop_ioproc_copy_adapt); 
	
	jit_class_addadornment(_cv_jit_perspective_class,mop);
	
	// add method(s)
	jit_class_addmethod(_cv_jit_perspective_class, (method)cv_jit_perspective_matrix_calc,		"matrix_calc",		A_CANT,		0);
	
	// add attribute(s)

	
	// finalize class
	jit_class_register(_cv_jit_perspective_class);
	object_post(NULL, "cv.jit.perspective by Antoine Villeret - build on the %s at %s.",__DATE__, __TIME__);
	return JIT_ERR_NONE;
}

/************************************************************************************/
// Object Life Cycle

t_cv_jit_perspective *cv_jit_perspective_new(void)
{
	t_cv_jit_perspective	*x = NULL;
	
	x = (t_cv_jit_perspective*)jit_object_alloc(_cv_jit_perspective_class);
	if (x) {		
	// nothing no initialise...
	} 
	return x;
}


void cv_jit_perspective_free(t_cv_jit_perspective *x)
{
	// nothing to free ?
}


/************************************************************************************/
// Methods bound to input/inlets

t_jit_err cv_jit_perspective_matrix_calc(t_cv_jit_perspective *x, void *inputs, void *outputs)
{
	t_jit_err			err = JIT_ERR_NONE;
	long				in1_savelock, in2_savelock, out_savelock;
	t_jit_matrix_info	in1_minfo, in2_minfo, out_minfo;
	float				*in1_bp, *in2_bp, *out_bp;
	void				*in1_matrix, *in2_matrix, *out_matrix;
	CvMat				in1_cv, in2_cv, out_cv;
	
	in1_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);
	in2_matrix 	= jit_object_method(inputs,_jit_sym_getindex,1);
	out_matrix 	= jit_object_method(outputs,_jit_sym_getindex,0);
	
	if (x && in1_matrix && in2_matrix && out_matrix) {
		in1_savelock = (long) jit_object_method(in1_matrix, _jit_sym_lock, 1);
		in2_savelock = (long) jit_object_method(in2_matrix, _jit_sym_lock, 1);
		out_savelock = (long) jit_object_method(out_matrix, _jit_sym_lock, 1);
		
		jit_object_method(in1_matrix, _jit_sym_getinfo, &in1_minfo);
		jit_object_method(in2_matrix, _jit_sym_getinfo, &in2_minfo);		
		jit_object_method(out_matrix, _jit_sym_getinfo, &out_minfo);
		jit_object_method(in1_matrix, _jit_sym_getdata, &in1_bp);
		jit_object_method(in2_matrix, _jit_sym_getdata, &in2_bp);
		jit_object_method(out_matrix, _jit_sym_getdata, &out_bp);
		
		if (!in1_bp) { 
			err=JIT_ERR_INVALID_INPUT; 
			goto out;
		}
		if (!out_bp) { 
			err=JIT_ERR_INVALID_OUTPUT; 
			goto out;
		}		
		
		// both inlets should be float32
		if (in1_minfo.type != _jit_sym_float32 || in2_minfo.type != _jit_sym_float32 ) {
			err = JIT_ERR_MISMATCH_TYPE; 
			goto out;
		}
		
		if ( in1_minfo.planecount != 2 || in2_minfo.planecount != 1 ) {
			err=JIT_ERR_MISMATCH_PLANE; 
			goto out;
		}
		
		// both inputs should be 2-D matrix
		if ( in1_minfo.dimcount > 2 || in2_minfo.dimcount != 2 ) {
			err=JIT_ERR_MISMATCH_DIM; 
			goto out;
		}
		
		// 2d inlet matrix should be 3 x 3
		if( in2_minfo.dim[0] != 3 || in2_minfo.dim[1] != 3 ) {
			err=JIT_ERR_MISMATCH_DIM; 
			goto out;
		}
		
		cvJitter2CvMat(in2_matrix, &in2_cv);
		cvInitMatHeader( &in1_cv, 1, in1_minfo.dim[0], CV_32FC2 , in1_bp, 0 );
		cvInitMatHeader( &out_cv, 1, out_minfo.dim[0], CV_32FC2 , out_bp, 0 );
		
		cvPerspectiveTransform(&in1_cv,&out_cv,&in2_cv);
		
	} 
	else
		return JIT_ERR_INVALID_PTR;
	
out:
	jit_object_method(out_matrix,_jit_sym_lock,out_savelock);
	jit_object_method(in2_matrix,_jit_sym_lock,in2_savelock);
	jit_object_method(in1_matrix,_jit_sym_lock,in1_savelock);
	return err;
}
