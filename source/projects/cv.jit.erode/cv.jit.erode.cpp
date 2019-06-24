/*
cv.jit.erode
	

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
Note:
	This external is written slightly differently than other cv.jit objects.
	It is written in C++ and thus cannot be compiled as C code. Under OSX,
	it makes use of Core Image functionality. Under Windows, the older, slower, 
	code is still used instead.
*/

#include "c74_jitter.h"

using namespace c74::max;
#include "cv.erode.h"

typedef struct _cv_jit_erode 
{
	t_object				ob;
	long					mode;
	long					grey;
	Erode					*eroder;
} t_cv_jit_erode;

void *_cv_jit_erode_class;

t_jit_err 		cv_jit_erode_init(void);
t_cv_jit_erode 		*cv_jit_erode_new(void);
void 			cv_jit_erode_free(t_cv_jit_erode *x);
t_jit_err 		cv_jit_erode_matrix_calc(t_cv_jit_erode *x, void *inputs, void *outputs);

t_jit_err cv_jit_erode_init(void) 
{
	long attrflags=0;
	t_jit_object *attr,*mop;
	
	_cv_jit_erode_class = jit_class_new("cv_jit_erode",(method)cv_jit_erode_new,(method)cv_jit_erode_free,sizeof(t_cv_jit_erode),A_CANT,0L); //A_CANT = untyped

	//add mop
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop,1,1);
	jit_class_addadornment(_cv_jit_erode_class,mop);
	
	//add attributes
	
	// mode (square or cross)
	attrflags = ATTR_GET_DEFER_LOW | ATTR_SET_USURP_LOW;
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"mode",_jit_sym_long,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_erode,mode));
	jit_attr_addfilterset_clip(attr,0,1,true,true);	//clip to 0-1
	jit_class_addattr(_cv_jit_erode_class,attr);
	
	//We don't use these anymore, but leave them here for backwards-compatibility
	// binary/greyscale
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"greyscale",_jit_sym_long,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_erode,grey));
	jit_attr_addfilterset_clip(attr,0,1,true,true);	//clip to 0-1
	jit_class_addattr(_cv_jit_erode_class,attr);
	
	// binary/greyscale
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"grayscale",_jit_sym_long,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_erode,grey));
	jit_attr_addfilterset_clip(attr,0,1,true,true);	//clip to 0-1
	jit_class_addattr(_cv_jit_erode_class,attr);
	
	//add methods
	jit_class_addmethod(_cv_jit_erode_class, (method)cv_jit_erode_matrix_calc, "matrix_calc", A_CANT, 0L);
	
	jit_class_register(_cv_jit_erode_class);

	return JIT_ERR_NONE;
}


t_jit_err cv_jit_erode_matrix_calc(t_cv_jit_erode *x, void *inputs, void *outputs)
{
	t_jit_err err=JIT_ERR_NONE;
	void * in_savelock = 0;
	void * out_savelock = 0;
	t_jit_matrix_info in_minfo,out_minfo;
	char *in_bp,*out_bp;
	void *in_matrix,*out_matrix;
	
	in_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);
	out_matrix 	= jit_object_method(outputs,_jit_sym_getindex,0);

	if (x&&in_matrix&&out_matrix) {
		
		in_savelock = jit_object_method(in_matrix,_jit_sym_lock,1);
		out_savelock = jit_object_method(out_matrix,_jit_sym_lock,1);
		
		jit_object_method(in_matrix,_jit_sym_getinfo,&in_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);
		
		jit_object_method(in_matrix,_jit_sym_getdata,&in_bp);
		jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);
		
		if (!in_bp) { err=JIT_ERR_INVALID_INPUT; goto out;}
		if (!out_bp) { err=JIT_ERR_INVALID_OUTPUT; goto out;}
		
		//All other error handling is taken care of by erode object
		if (in_minfo.dimcount!=2) 
		{ 
			err=JIT_ERR_MISMATCH_DIM; 
			goto out;
		}	
				
		//calculate
		x->eroder->setInput(in_bp,in_minfo.dim[0],in_minfo.dim[1],in_minfo.planecount,in_minfo.dimstride[1],jit_gettype(&in_minfo));
		x->eroder->setOutput(out_bp,out_minfo.dim[0],out_minfo.dim[1],out_minfo.planecount,out_minfo.dimstride[1],jit_gettype(&out_minfo));
		x->eroder->setMode(x->mode);
		x->eroder->erode();
		
	} else {
		return JIT_ERR_INVALID_PTR;
	}
	
out:
	jit_object_method(out_matrix,gensym("lock"),out_savelock);
	jit_object_method(in_matrix,gensym("lock"),in_savelock);
	return err;
}

t_cv_jit_erode *cv_jit_erode_new(void)
{
	t_cv_jit_erode *x;
		
	if ((x=(t_cv_jit_erode *)jit_object_alloc(_cv_jit_erode_class))) 
	{
		x->mode = 0;
		x->grey = 0; 
		x->eroder = new Erode;
	} 
	else 
	{
		x = NULL;
	}	
	return x;
}

void cv_jit_erode_free(t_cv_jit_erode *x)
{
	delete x->eroder;
}

