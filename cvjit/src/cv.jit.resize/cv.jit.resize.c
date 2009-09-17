/*
cv.jit.resize
	

Copyright 2008, Jean-Marc Pelletier
jmp@iamas.ac.jp

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

#ifdef __cplusplus
extern "C" {
#endif
#include "jit.common.h"
#ifdef __cplusplus 
} //extern "C"
#endif
#include "cv.h"
#include "jitOpenCV.h"

typedef struct _cv_jit_resize 
{
	t_object				ob;
	long					sizecount;
	long					size[2];	
	long					interpolation;
	char					changed;
} t_cv_jit_resize;

void *_cv_jit_resize_class;

t_jit_err 				cv_jit_resize_init(void); 
t_cv_jit_resize			*cv_jit_resize_new(void);
void 					cv_jit_resize_free(t_cv_jit_resize *x);
t_jit_err 				cv_jit_resize_matrix_calc(t_cv_jit_resize *x, void *inputs, void *outputs);

t_jit_err cv_jit_resize_size_set(t_cv_jit_resize *x, void *attr, long ac, t_atom *av) 
{
	//t_jit_matrix_info info;
	if ((ac == 2)&&av) {
		x->size[0] = jit_atom_getlong(&(av[0]));
		x->size[1] = jit_atom_getlong(&(av[1]));
		x->sizecount = 2;
		x->changed = 1;
   } else {
      // no args, don't do anything
	  error("Invalid size argument.");
   }
   return JIT_ERR_NONE;
}

t_jit_err cv_jit_resize_init(void) 
{
	long attrflags=0;
	t_jit_object *attr,*mop,*output;
	t_symbol *atsym;
	
	atsym = gensym("jit_attr_offset");
	
	_cv_jit_resize_class = jit_class_new("cv_jit_resize",(method)cv_jit_resize_new,(method)cv_jit_resize_free, sizeof(t_cv_jit_resize),0L);
   	
	//add mop
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop,1,1);
	output = (t_jit_object *)jit_object_method(mop,_jit_sym_getoutput,1);
	jit_attr_setlong(output,_jit_sym_dimlink,0);
   	   	
	jit_class_addadornment(_cv_jit_resize_class,mop);
	
	//add methods
	jit_class_addmethod(_cv_jit_resize_class, (method)cv_jit_resize_matrix_calc, 		"matrix_calc", 		A_CANT, 0L);

	//add attributes	
	attrflags = JIT_ATTR_GET_DEFER_LOW | JIT_ATTR_SET_USURP_LOW;
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset_array,"size",_jit_sym_long,2,attrflags,
		(method)0L,(method)cv_jit_resize_size_set,calcoffset(t_cv_jit_resize,sizecount),calcoffset(t_cv_jit_resize,size));
	jit_class_addattr(_cv_jit_resize_class,attr);
	
	attr = (t_jit_object *)jit_object_new(	_jit_sym_jit_attr_offset,"interpolation",_jit_sym_long,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_resize,interpolation));			
	jit_attr_addfilterset_clip(attr,0,3,TRUE,TRUE);
	jit_class_addattr(_cv_jit_resize_class, attr);

			
	jit_class_register(_cv_jit_resize_class);

	return JIT_ERR_NONE;
}

t_jit_err cv_jit_resize_matrix_calc(t_cv_jit_resize *x, void *inputs, void *outputs)
{
	t_jit_err err=JIT_ERR_NONE;
	long in_savelock,out_savelock;
	t_jit_matrix_info in_minfo,out_minfo;
	char *in_bp,*out_bp;
	void *in_matrix,*out_matrix;
	CvMat inmat, outmat;
	
	in_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);
	out_matrix 	= jit_object_method(outputs,_jit_sym_getindex,0);

	if (x&&in_matrix&&out_matrix) {
		
		in_savelock = (long) jit_object_method(in_matrix,_jit_sym_lock,1);
		out_savelock = (long) jit_object_method(out_matrix,_jit_sym_lock,1);
		
		jit_object_method(in_matrix,_jit_sym_getinfo,&in_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);
		
		if (in_minfo.type != out_minfo.type) 
		{ 
			err=JIT_ERR_MISMATCH_TYPE; 
			goto out;
		}

		//compatible planes?
		if (in_minfo.planecount!=out_minfo.planecount) { 
			err=JIT_ERR_MISMATCH_PLANE; 
			goto out;
		}	
		
		if (in_minfo.dimcount!=2) { 
			err=JIT_ERR_MISMATCH_DIM; 
			goto out;
		}		
		
		if(x->changed)
		{
			out_minfo.dim[0] = x->size[0];
			out_minfo.dim[1] = x->size[1];
			jit_object_method(out_matrix,_jit_sym_setinfo,&out_minfo);
			jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);
			x->changed = 0;
		}
		
		jit_object_method(in_matrix,_jit_sym_getdata,&in_bp);
		jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);
		
		if (!in_bp) { err=JIT_ERR_INVALID_INPUT; goto out;}
		if (!out_bp) { err=JIT_ERR_INVALID_OUTPUT; goto out;}
		
		//Convert matrix header
		cvJitter2CvMat(in_matrix, &inmat);
		cvJitter2CvMat(out_matrix, &outmat);
		
		//calculate
		cvResize( &inmat, &outmat, x->interpolation );

	} else {
		return JIT_ERR_INVALID_PTR;
	}
	
out:
	jit_object_method(out_matrix,gensym("lock"),out_savelock);
	jit_object_method(in_matrix,gensym("lock"),in_savelock);
	return err;
}


t_cv_jit_resize *cv_jit_resize_new(void)
{
	t_cv_jit_resize *x;

	if (x=(t_cv_jit_resize *)jit_object_alloc(_cv_jit_resize_class)) 
	{
		x->size[0] = 160;
		x->size[1] = 120;
		x->changed = 1;
		x->sizecount = 2;
		x->interpolation = 3;

	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_resize_free(t_cv_jit_resize *x)
{
	
}