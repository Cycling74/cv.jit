/*
 @file cv.jit.findhomography
 
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
// #include "OpticalFlow.h"
#include "cvjit.h"

using namespace c74::max;


typedef struct _cv_jit_findhomography 
{
	t_object				ob;
	
	//attribute variables
	long fb_poly_n;
	long fb_iterations;
	long fb_window_size;
	long fb_levels;
	long use_previous;
	long bm_max_range;
	long bm_block_size;
	long bm_shift_size;
	long lk_window_size;
	long hs_max_iterations;
	double fb_poly_sigma;
	double fb_pyramid_scale;
	double hs_epsilon;
	double hs_lambda;
	t_atom method;
	
	//In C++, the calcoffset macro used when defining attributes requires this structure to be POD-type.
	//This means that the object below cannot be a member. The solution is to store only a pointer.
	// OpticalFlow				*of; 
	
} t_cv_jit_findhomography;

void *_cv_jit_findhomography_class;

t_jit_err 				cv_jit_findhomography_init(void); 
t_cv_jit_findhomography			*cv_jit_findhomography_new(void);
void 					cv_jit_findhomography_free(t_cv_jit_findhomography *x);
t_jit_err 				cv_jit_findhomography_matrix_calc(t_cv_jit_findhomography *x, void *inputs, void *outputs);

t_jit_err cv_jit_findhomography_init(void) 
{
	long attrflags=0;
	t_jit_object *mop, *input, *output;
	//t_symbol *atsym;
	
	//atsym = gensym("jit_attr_offset");
	
	_cv_jit_findhomography_class = jit_class_new("cv_jit_findhomography",(method)cv_jit_findhomography_new,(method)cv_jit_findhomography_free, sizeof(t_cv_jit_findhomography),0L);
   	
	//add mop
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop,2,1);

	jit_mop_output_nolink(mop,1);
	
	
	// restrict input matrix
	for ( int i = 0 ; i < 2 ; i++ ) {
		
		input=(t_jit_object *)jit_object_method(mop,_jit_sym_getinput,i+1);
		
		jit_attr_setlong(input,_jit_sym_minplanecount,1);
		jit_attr_setlong(input,_jit_sym_maxplanecount,2);
		jit_attr_setlong(input,_jit_sym_mindimcount, 1);
		jit_attr_setlong(input,_jit_sym_maxdimcount, 2);
		jit_attr_setsym(input,_jit_sym_types,_jit_sym_float32);
	}
	
	output =(t_jit_object *)jit_object_method(mop,_jit_sym_getoutput,1);
	
	jit_attr_setlong(output,_jit_sym_minplanecount,1);
	jit_attr_setlong(output,_jit_sym_maxplanecount,1);
	jit_attr_setlong(output,_jit_sym_mindimcount, 2);
	jit_attr_setlong(output,_jit_sym_maxdimcount, 2);
	jit_attr_setsym(output,_jit_sym_types,_jit_sym_float32);
	
	
	jit_class_addadornment(_cv_jit_findhomography_class,mop);
	
	//add methods
	jit_class_addmethod(_cv_jit_findhomography_class, (method)cv_jit_findhomography_matrix_calc, 		"matrix_calc", 		A_CANT, 0L);
	
	//add attributes	
	attrflags = ATTR_GET_DEFER_LOW | ATTR_SET_USURP_LOW;
	
	jit_class_register(_cv_jit_findhomography_class);
	
	//object_post(NULL, "cv.jit.findhomogragphy by Antoine Villeret - build on the %s at %s.",__DATE__, __TIME__);
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_findhomography_matrix_calc(t_cv_jit_findhomography *x, void *inputs, void *outputs)
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
		
		if (in1_minfo.planecount != 1 || in2_minfo.planecount != 1) {
			err=JIT_ERR_MISMATCH_PLANE; 
			goto out;
		}
		
		if (in1_minfo.dimcount > 2 || in2_minfo.dimcount > 2) {
			err=JIT_ERR_MISMATCH_DIM; 
			goto out;
		}
		
		if( in1_minfo.dim[1] != 2 || in2_minfo.dim[1] != 2) {
			err=JIT_ERR_MISMATCH_DIM; 
			goto out;
		}
		
		if( in1_minfo.dim[0] < 4 || in2_minfo.dim[0] < 4 ) {
			goto out;
		}
		
		//prepare output 
		out_minfo.dim[0] = 3;
		out_minfo.dim[1] = 3;
		jit_object_method(out_matrix, _jit_sym_setinfo, &out_minfo);
		
		// convert Jitter matrix to cvmat
        in1_cv = cvJitter2CvMat(in1_minfo, (char *)in1_bp);
        in2_cv = cvJitter2CvMat(in2_minfo, (char *)in2_bp);
        out_cv = cvJitter2CvMat(out_minfo, (char *)out_bp);
    
		cvFindHomography(&in1_cv, &in2_cv, &out_cv,  0, 0, NULL);
		
		
	} else {
		return JIT_ERR_INVALID_PTR;
	}
	
out:
	jit_object_method(out_matrix,_jit_sym_lock,out_savelock);
	jit_object_method(in1_matrix,_jit_sym_lock,in1_savelock);
	jit_object_method(in2_matrix,_jit_sym_lock,in2_savelock);
	return err;
}


t_cv_jit_findhomography *cv_jit_findhomography_new(void)
{
	t_cv_jit_findhomography *x;
	
	if ((x=(t_cv_jit_findhomography *)jit_object_alloc(_cv_jit_findhomography_class)))
	{
			// nothing to initialize
	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_findhomography_free(t_cv_jit_findhomography *x)
{
	// nothing to free
}
