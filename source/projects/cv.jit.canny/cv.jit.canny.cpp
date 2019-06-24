/*
cv.jit.canny
	

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

/*
This file links to the OpenCV library <http://sourceforge.net/projects/opencvlibrary/>

Please refer to the  Intel License Agreement For Open Source Computer Vision Library.

Please also read the notes concerning technical issues with using the OpenCV library
in Jitter externals.
*/


#include "jitOpenCV.h"
#include "c74_jitter.h"

using namespace c74::max;

typedef struct _cv_jit_canny 
{
	t_object				ob;
	double				threshold;
	double				range;	
} t_cv_jit_canny;

void *_cv_jit_canny_class;

t_jit_err			cv_jit_canny_init(void);
t_cv_jit_canny		*cv_jit_canny_new(void);
void				cv_jit_canny_free(t_cv_jit_canny *x);
t_jit_err			cv_jit_canny_matrix_calc(t_cv_jit_canny *x, void *inputs, void *outputs);

t_jit_err cv_jit_canny_init(void) 
{
	long attrflags=0;
	t_jit_object *attr,*mop;
	
	_cv_jit_canny_class = jit_class_new("cv_jit_canny",(method)cv_jit_canny_new,(method)cv_jit_canny_free, sizeof(t_cv_jit_canny),0L); 

	//add mop
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop,1,1);
	jit_mop_single_type(mop,_jit_sym_char);	
	jit_mop_single_planecount(mop,1);	
	jit_class_addadornment(_cv_jit_canny_class,mop);
	//add methods
	jit_class_addmethod(_cv_jit_canny_class, (method)cv_jit_canny_matrix_calc, 		"matrix_calc", 		A_CANT, 0L);
	
	//add attributes	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"threshold",_jit_sym_float64,attrflags,
		(method)0L,(method)0L,calcoffset(t_cv_jit_canny,threshold));
	jit_attr_addfilterset_clip(attr,0,255,true,true);	//clip to 0-255
	jit_class_addattr(_cv_jit_canny_class,attr);
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"range",_jit_sym_float64,attrflags,
		(method)0L,(method)0L,calcoffset(t_cv_jit_canny,range));
	jit_attr_addfilterset_clip(attr,0,255,true,true);	//clip to 0-255
	jit_class_addattr(_cv_jit_canny_class,attr);
	
	jit_class_register(_cv_jit_canny_class);

	return JIT_ERR_NONE;
}

t_jit_err cv_jit_canny_matrix_calc(t_cv_jit_canny *x, void *inputs, void *outputs)
{
	t_jit_err err = JIT_ERR_NONE;
	void * in_savelock = 0;
	void * out_savelock = 0;
	t_jit_matrix_info in_minfo,out_minfo;
	char *in_bp,*out_bp;
	long i,dimcount,planecount,dim[JIT_MATRIX_MAX_DIMCOUNT];
	c74::max::t_object * in_matrix,*out_matrix;
	
	double thresh1, thresh2;
	
	
	in_matrix 	= (c74::max::t_object *)jit_object_method(inputs,_jit_sym_getindex,0);
	out_matrix 	= (c74::max::t_object *)jit_object_method(outputs,_jit_sym_getindex,0);

	if (x&&in_matrix&&out_matrix) {
		
		in_savelock = jit_object_method(in_matrix,_jit_sym_lock,1);
		out_savelock = jit_object_method(out_matrix,_jit_sym_lock,1);
		
		jit_object_method(in_matrix,_jit_sym_getinfo,&in_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);
		
		jit_object_method(in_matrix,_jit_sym_getdata,&in_bp);
		jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);
		
		if (!in_bp) { err=JIT_ERR_INVALID_INPUT; goto out;}
		if (!out_bp) { err=JIT_ERR_INVALID_OUTPUT; goto out;}
		
		//compatible types?
		if ((in_minfo.type!=_jit_sym_char)||(in_minfo.type!=out_minfo.type)) { 
			err=JIT_ERR_MISMATCH_TYPE; 
			goto out;
		}		

		//compatible planes?
		if ((in_minfo.planecount!=1)||(out_minfo.planecount!=1)) { 
			err=JIT_ERR_MISMATCH_PLANE; 
			goto out;
		}		

		//get dimensions/planecount
		dimcount   = out_minfo.dimcount;
		planecount = out_minfo.planecount;			
		for (i=0;i<dimcount;i++) {
			dim[i] = MIN(in_minfo.dim[i],out_minfo.dim[i]);
		}		
		
		//Convert input and output matrices to OpenCV matrices
		cv::Mat sourceMat = cvjit::wrapJitterMatrix(in_matrix);
		cv::Mat edgeMat = cvjit::wrapJitterMatrix(out_matrix);
		
		//Calculate threshold values
		thresh1 = c74::max::clamp(x->threshold - x->range, 0.0, 255.0);
		thresh2 = c74::max::clamp(x->threshold + x->range, 0.0, 255.0);

		//calculate
		cv::Canny(sourceMat, edgeMat, thresh1, thresh2, 3);
		
	} else {
		return JIT_ERR_INVALID_PTR;
	}
	
out:
	jit_object_method(out_matrix,gensym("lock"),out_savelock);
	jit_object_method(in_matrix,gensym("lock"),in_savelock);
	return err;
}

t_cv_jit_canny *cv_jit_canny_new(void)
{
	t_cv_jit_canny *x;
		
	if ((x=(t_cv_jit_canny *)jit_object_alloc(_cv_jit_canny_class))) {
		x->threshold = 150;
		x->range = 10;
	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_canny_free(t_cv_jit_canny *x)
{
	/*Nothing to free*/
}
