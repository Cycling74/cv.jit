/*
cv.jit.blobs.bounds
	

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

#ifdef __cplusplus
extern "C" {
#endif
#include "jit.common.h"
#ifdef __cplusplus 
} //extern "C"
#endif

typedef struct _cv_jit_blobs_bounds 
{
	t_object				ob;
	long					left[256];
	long					top[256];
	long					right[256];
	long					bottom[256];
	char					maxval;
	
} t_cv_jit_blobs_bounds;

void *_cv_jit_blobs_bounds_class;

t_jit_err 				cv_jit_blobs_bounds_init(void); 
t_cv_jit_blobs_bounds *	cv_jit_blobs_bounds_new(void);
void 					cv_jit_blobs_bounds_free(t_cv_jit_blobs_bounds *x);
t_jit_err 				cv_jit_blobs_bounds_matrix_calc(t_cv_jit_blobs_bounds *x, void *inputs, void *outputs);
void					cv_jit_blobs_bounds_calculate(t_cv_jit_blobs_bounds *x, char *data, int w, int h, int step);

t_jit_err cv_jit_blobs_bounds_init(void) 
{
	t_jit_object *mop,*output;
	t_symbol *atsym;
	
	atsym = gensym("jit_attr_offset");
	
	_cv_jit_blobs_bounds_class = jit_class_new("cv_jit_blobs_bounds",(method)cv_jit_blobs_bounds_new,(method)cv_jit_blobs_bounds_free,
		sizeof(t_cv_jit_blobs_bounds),0L); 

	//add mop
	mop = jit_object_new(_jit_sym_jit_mop,1,1);  //Object has one input and one output
	output = jit_object_method(mop,_jit_sym_getoutput,1); //Get a pointer to the output matrix

   	jit_mop_single_type(mop,_jit_sym_char);   //Set input type and planecount
   	jit_mop_single_planecount(mop,1);  
   	
   	jit_mop_output_nolink(mop,1); //Turn off output linking so that output matrix does not adapt to input
   	
   	jit_attr_setlong(output,_jit_sym_minplanecount,4); //Output has 4 planes: bounding box coordinates
  	jit_attr_setlong(output,_jit_sym_maxplanecount,4);
  	jit_attr_setlong(output,_jit_sym_mindim,1);
  	jit_attr_setlong(output,_jit_sym_maxdim,1);
  	jit_attr_setsym(output,_jit_sym_types,_jit_sym_long);
   	   	
	jit_class_addadornment(_cv_jit_blobs_bounds_class,mop);
	
	
	//add methods
	jit_class_addmethod(_cv_jit_blobs_bounds_class, (method)cv_jit_blobs_bounds_matrix_calc, 		"matrix_calc", 		A_CANT, 0L);	

	//add attributes	
	
	/*No attributes for this object*/
		
	jit_class_register(_cv_jit_blobs_bounds_class);

	return JIT_ERR_NONE;
}

t_jit_err cv_jit_blobs_bounds_matrix_calc(t_cv_jit_blobs_bounds *x, void *inputs, void *outputs)
{
	t_jit_err err=JIT_ERR_NONE;
	long in_savelock=0,out_savelock=0;
	t_jit_matrix_info in_minfo,out_minfo;
	char *out_bp, *in_bp;
	void *in_matrix,*out_matrix;
	int i;
	long *out_data;
	
	//Get pointers to matrices
	in_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);
	out_matrix  = jit_object_method(outputs,_jit_sym_getindex,0);

	if (x&&in_matrix&&out_matrix) 
	{
		//Lock the matrices
		in_savelock = (long) jit_object_method(in_matrix,_jit_sym_lock,1);
		out_savelock = (long) jit_object_method(out_matrix,_jit_sym_lock,1);
		
		//Make sure input is of proper format
		jit_object_method(in_matrix,_jit_sym_getinfo,&in_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);

		if(in_minfo.dimcount != 2)
		{
			err = JIT_ERR_MISMATCH_DIM;
			goto out;
		}
		if(in_minfo.planecount != 1)
		{
			err = JIT_ERR_MISMATCH_PLANE;
			goto out;
		}
		if(in_minfo.type != _jit_sym_char)
		{
			err = JIT_ERR_MISMATCH_TYPE;
			goto out;
		}

		//Get the data pointers
		jit_object_method(in_matrix,_jit_sym_getdata,&in_bp);
		
		if (!in_bp) { err=JIT_ERR_INVALID_INPUT; goto out;}
		
		//Calculate
		cv_jit_blobs_bounds_calculate(x, in_bp, in_minfo.dim[0], in_minfo.dim[1], in_minfo.dimstride[1]);
		
		//Prepare output
		out_minfo.dim[0] = x->maxval;
		jit_object_method(out_matrix,_jit_sym_setinfo,&out_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);
		jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);
		if (!out_bp) { err=JIT_ERR_INVALID_OUTPUT; goto out;}
		
		out_data = (long *)out_bp;
		
		for(i=1; i <= x->maxval; i++)
		{
			out_data[0] = x->left[i];
			out_data[1] = x->top[i];
			out_data[2] = x->right[i];
			out_data[3] = x->bottom[i];
			
			out_data += 4;
		}
	}

	
out:
	jit_object_method(out_matrix,gensym("lock"),out_savelock);
	jit_object_method(in_matrix,gensym("lock"),in_savelock);
	return err;
}

void cv_jit_blobs_bounds_calculate(t_cv_jit_blobs_bounds *x, char *data, int w, int h, int step)
{
	long i,j;
	char *in;
	unsigned char value;
	
	x->maxval = 0;
	for(i=0;i<256;i++)
	{
		x->left[i] = 0x7FFFFFFF;
		x->top[i] = 0x7FFFFFFF;
		x->right[i] = 0;
		x->bottom[i] = 0;
	}
	
	for(j=0;j<h;j++)
	{
		in = data + j * step;
		for(i=0;i<w;i++)
		{
			value = in[i];
			if(value > 0)
			{
				if(i < x->left[value])
					x->left[value] = i;
				if(i > x->right[value])
					x->right[value] = i;
				if(j < x->top[value])
					x->top[value] = j;
				if(j > x->bottom[value])
					x->bottom[value] = j;
			}
			if(value > x->maxval)
				x->maxval = value;
		}
	}
	
	return;
}

t_cv_jit_blobs_bounds *cv_jit_blobs_bounds_new(void)
{
	t_cv_jit_blobs_bounds *x;
		
	if (x=(t_cv_jit_blobs_bounds *)jit_object_alloc(_cv_jit_blobs_bounds_class)) {
	
		x->maxval = 0;

	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_blobs_bounds_free(t_cv_jit_blobs_bounds *x)
{
	/*Nothing to free*/
}
