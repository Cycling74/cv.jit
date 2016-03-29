/*
 @file cv.jit.getperspective
 
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

#include "c74_jitter.h"
#include "cv.h"
#include "jitOpenCV.h"


// Our Jitter object instance data
typedef struct _cv_jit_getperspective {
	t_object	ob;
	
	CvMat *intrinsic_matrix, *distortion_coeffs, *h;
	
} t_cv_jit_getperspective;


// prototypes
BEGIN_USING_C_LINKAGE
t_jit_err				cv_jit_getperspective_init				(void); 
t_cv_jit_getperspective	*cv_jit_getperspective_new				(void);
void					cv_jit_getperspective_free				(t_cv_jit_getperspective *x);
t_jit_err				cv_jit_getperspective_matrix_calc		(t_cv_jit_getperspective *x, void *inputs, void *outputs);
void					cv_jit_getperspective_print_transfert	(t_cv_jit_getperspective *x);
END_USING_C_LINKAGE


// globals
static void *_cv_jit_getperspective_class = NULL;


/************************************************************************************/

t_jit_err cv_jit_getperspective_init(void) 
{
	t_jit_object	*input, *o, *mop;
	//int i;
	
	_cv_jit_getperspective_class = jit_class_new("cv_jit_getperspective", (method)cv_jit_getperspective_new, (method)cv_jit_getperspective_free, sizeof(t_cv_jit_getperspective), 0);
	
	// add matrix operator (mop)
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop,2,1); //#inputs,#outputs
	//jit_mop_single_type(mop, _jit_sym_float32);
	jit_mop_output_nolink(mop,1);
	
	
	// restrict input matrix
	for ( int i = 0 ; i < 2 ; i++ ) {
		
		input=(t_jit_object *)jit_object_method(mop,_jit_sym_getinput,i+1);
		
		jit_attr_setlong(input,_jit_sym_minplanecount,2);
		jit_attr_setlong(input,_jit_sym_maxplanecount,2);
		jit_attr_setlong(input,_jit_sym_mindimcount, 1);
		jit_attr_setlong(input,_jit_sym_maxdimcount, 2);
		jit_attr_setsym(input,_jit_sym_types,_jit_sym_float32);
	}
	
	
	// restrict matrix outlet
	o=(t_jit_object *)jit_object_method(mop,_jit_sym_getoutput,1);
	
	jit_attr_setlong(o,_jit_sym_minplanecount,1);
	jit_attr_setlong(o,_jit_sym_maxplanecount,1);
	jit_attr_setlong(o,_jit_sym_mindimcount, 2);
	jit_attr_setlong(o,_jit_sym_maxdimcount, 2);
	jit_attr_setsym(o,_jit_sym_types,_jit_sym_float32);
	
	
	jit_class_addadornment(_cv_jit_getperspective_class,mop);
	
	// add method(s)
	jit_class_addmethod(_cv_jit_getperspective_class, (method)cv_jit_getperspective_matrix_calc,		"matrix_calc",		A_CANT,		0);
	
	// add attribute(s)
	
	// finalize class
	jit_class_register(_cv_jit_getperspective_class);
	object_post(NULL, "cv.jit.getperspective by Antoine Villeret - build for Freeka only on the %s at %s.",__DATE__, __TIME__);
	return JIT_ERR_NONE;
}

/************************************************************************************/
// Object Life Cycle

t_cv_jit_getperspective *cv_jit_getperspective_new(void)
{
	t_cv_jit_getperspective	*x = NULL;
	
	x = (t_cv_jit_getperspective*)jit_object_alloc(_cv_jit_getperspective_class);
	if (x) {
		x->h					=	cvCreateMat(3, 3, CV_32FC1);
	} 
	return x;
}


void cv_jit_getperspective_free(t_cv_jit_getperspective *x)
{
	if(x->h) cvReleaseMat(&x->h);
}


/************************************************************************************/
// Methods bound to input/inlets

t_jit_err cv_jit_getperspective_matrix_calc(t_cv_jit_getperspective *x, void *inputs, void *outputs)
{
	t_jit_err			err = JIT_ERR_NONE;
	long				in1_savelock, in2_savelock, out_savelock;
	t_jit_matrix_info	in1_minfo, in2_minfo, out_minfo;
	float				*in1_bp, *in2_bp, *out_bp;
	void				*in1_matrix, *in2_matrix, *out_matrix;
	CvPoint2D32f		*in1_cv, *in2_cv;
	
	in1_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);
	in2_matrix 	= jit_object_method(inputs,_jit_sym_getindex,1);
	out_matrix 	= jit_object_method(outputs,_jit_sym_getindex,0);
	
	if (x && in1_matrix && in2_matrix && out_matrix) {
		in1_savelock = (long) jit_object_method(in1_matrix, _jit_sym_lock, 1);
		in2_savelock = (long) jit_object_method(in2_matrix, _jit_sym_lock, 1);
		out_savelock = (long) jit_object_method(out_matrix, _jit_sym_lock, 1);
		
		jit_object_method(in1_matrix, _jit_sym_getinfo, &in1_minfo);
		jit_object_method(in2_matrix, _jit_sym_getinfo, &in2_minfo)	;		
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
		if (in1_minfo.type != _jit_sym_float32) {
			err = JIT_ERR_MISMATCH_TYPE; 
			goto out;
		}
		
		if (in1_minfo.planecount != 2 || in2_minfo.planecount != 2) {
			err=JIT_ERR_MISMATCH_PLANE; 
			goto out;
		}
		
		if (in1_minfo.dimcount > 2 || in2_minfo.dimcount > 2) {
			err=JIT_ERR_MISMATCH_DIM; 
			goto out;
		}
		
		if( in1_minfo.dim[0] != in2_minfo.dim[0] ) {
			err=JIT_ERR_MISMATCH_DIM; 
			goto out;
		}	
		
		// prepare output
		out_minfo.planecount = 1;
		out_minfo.type = _jit_sym_float32;
		out_minfo.dimcount = 2;
		out_minfo.dim[0] = 3;
		out_minfo.dim[1] = 3;
		jit_object_method(out_matrix, _jit_sym_setinfo, &out_minfo);
		
		cvJitter2CvMat(out_matrix, x->h);
		
		in1_cv = (CvPoint2D32f *) in1_bp;
		in2_cv = (CvPoint2D32f *) in2_bp;
		
		cvGetPerspectiveTransform(in1_cv, in2_cv, x->h);
		
	} 
	else
		return JIT_ERR_INVALID_PTR;
	
out:
	jit_object_method(out_matrix,_jit_sym_lock,out_savelock);
	jit_object_method(in1_matrix,_jit_sym_lock,in1_savelock);
	jit_object_method(in2_matrix,_jit_sym_lock,in2_savelock);
	return err;
}

void cv_jit_getperspective_print_transfert(t_cv_jit_getperspective *x){
	int i, j;
	
	printf("---- Transfert matrix ----\n");
	for ( i = 0 ; i < x->h->rows ; i++ ) {
		for ( j = 0 ; j < x->h->cols ; j++ ) {
			printf("\t%f",CV_MAT_ELEM( *x->h, float, i, j ));
		}
		printf("\n");
	}
	printf("\n------------\n");
}
