/*
cv.jit.blobs.orientation
	

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

typedef struct _cv_jit_blobs_orientation 
{
	t_object				ob;
	long					mode;
} t_cv_jit_blobs_orientation;

void *_cv_jit_blobs_orientation_class;

t_jit_err 				cv_jit_blobs_orientation_init(void); 
t_cv_jit_blobs_orientation *	cv_jit_blobs_orientation_new(void);
void 					cv_jit_blobs_orientation_free(t_cv_jit_blobs_orientation *x);
t_jit_err 				cv_jit_blobs_orientation_matrix_calc(t_cv_jit_blobs_orientation *x, void *inputs, void *outputs);
void 					cv_jit_blobs_orientation_calculate(t_cv_jit_blobs_orientation *x, float *in, float *out, int w);

t_jit_err cv_jit_blobs_orientation_init(void) 
{
	long attrflags=0;
	t_jit_object *attr,*mop,*output;
	t_symbol *atsym;
	
	atsym = gensym("jit_attr_offset");
	
	_cv_jit_blobs_orientation_class = jit_class_new("cv_jit_blobs_orientation",(method)cv_jit_blobs_orientation_new,(method)cv_jit_blobs_orientation_free,
		sizeof(t_cv_jit_blobs_orientation),0L); 

	//add mop
	mop = jit_object_new(_jit_sym_jit_mop,1,1);  //Object has one input and one output

   	jit_mop_single_type(mop,_jit_sym_float32);   //Set input type and planecount
   	jit_mop_single_planecount(mop,17);  
   	jit_mop_output_nolink(mop,1); //Turn off output linking so that output matrix does not adapt to input
   	
   	output = jit_object_method(mop,_jit_sym_getoutput,1); //Get a pointer to the output matrix
   	jit_attr_setlong(output,_jit_sym_minplanecount,1);
  	jit_attr_setlong(output,_jit_sym_maxplanecount,1);
  	jit_attr_setlong(output,_jit_sym_mindim,1);
  	jit_attr_setlong(output,_jit_sym_maxdim,1);
  	jit_attr_setsym(output,_jit_sym_types,_jit_sym_float32);
   	   	
	jit_class_addadornment(_cv_jit_blobs_orientation_class,mop);
	
	
	//add methods
	jit_class_addmethod(_cv_jit_blobs_orientation_class, (method)cv_jit_blobs_orientation_matrix_calc, 		"matrix_calc", 		A_CANT, 0L);	

	//add attributes	
	attrflags = JIT_ATTR_GET_DEFER_LOW | JIT_ATTR_SET_USURP_LOW;
	attr = jit_object_new(_jit_sym_jit_attr_offset,"mode",_jit_sym_long,attrflags,
		(method)0L,(method)0L,calcoffset(t_cv_jit_blobs_orientation,mode));
	jit_attr_addfilterset_clip(attr,0,1,TRUE,TRUE);	//clip to 0-1
	jit_class_addattr(_cv_jit_blobs_orientation_class,attr);
		
	jit_class_register(_cv_jit_blobs_orientation_class);

	return JIT_ERR_NONE;
}

t_jit_err cv_jit_blobs_orientation_matrix_calc(t_cv_jit_blobs_orientation *x, void *inputs, void *outputs)
{
	t_jit_err err=JIT_ERR_NONE;
	long in_savelock=0,out_savelock=0;
	t_jit_matrix_info in_minfo,out_minfo;
	char *out_bp,*in_bp;
	void *in_matrix,*out_matrix;
	float *out_data,*in_data;
	
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

		if(in_minfo.dimcount != 1)
		{
			err = JIT_ERR_MISMATCH_DIM;
			error("Make sure object is connected to leftmost outlet of cv.jit.blobs.moments!");
			goto out;
		}
		if(in_minfo.planecount != 17)
		{
			err = JIT_ERR_MISMATCH_PLANE;
			error("Make sure object is connected to leftmost outlet of cv.jit.blobs.moments!");
			goto out;
		}
		if(in_minfo.type != _jit_sym_float32)
		{
			err = JIT_ERR_MISMATCH_TYPE;
			error("Make sure object is connected to leftmost outlet of cv.jit.blobs.moments!");
			goto out;
		}

		//Get the data pointers
		jit_object_method(in_matrix,_jit_sym_getdata,&in_bp);
		if (!in_bp) { err=JIT_ERR_INVALID_INPUT; goto out;}
		
		out_minfo.dim[0] = in_minfo.dim[0];
		jit_object_method(out_matrix,_jit_sym_setinfo,&out_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);
		jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);
		if (!out_bp) { err=JIT_ERR_INVALID_OUTPUT; goto out;}
		
		in_data = (float *)in_bp;
		out_data = (float *)out_bp;
		
		//Calculate
		cv_jit_blobs_orientation_calculate(x, in_data, out_data, in_minfo.dim[0]);
	}
		
out:
	jit_object_method(out_matrix,gensym("lock"),out_savelock);
	jit_object_method(in_matrix,gensym("lock"),in_savelock);
	return err;
}

void cv_jit_blobs_orientation_calculate(t_cv_jit_blobs_orientation *x, float *in, float *out, int w)
{
	float nu20,nu02,nu11;
	int i;
	float *input, *output;
	float a,b,c,theta;
	
	input = in;
	output = out;
	
	for(i=0;i<w;i++)
	{
		theta = 0;
		nu20 = input[0];
		nu02 = input[1];
		nu11 = input[2];
		
		a = nu20 - nu02;
		if(a != 0)
		{
			b = nu11 * 2;
			a = b / a;
			c = jit_math_atan(a) * 0.5;
			
			if(nu20 > nu02)
			{
				if(c < 0)
				{
					theta = c + 3.14159265358979;
				}
				else
				{
					theta = c;
				}
			}
			else
			{
				theta = c + 1.57079632679;
			}
		}
		
		if(x->mode == 0)
			*output = theta;
		else
			*output = theta * 57.29577951308;
		
		input += 17;
		output++;
	}
}

t_cv_jit_blobs_orientation *cv_jit_blobs_orientation_new(void)
{
	t_cv_jit_blobs_orientation *x;
		
	if (x=(t_cv_jit_blobs_orientation *)jit_object_alloc(_cv_jit_blobs_orientation_class)) {
	
		x->mode = 0;

	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_blobs_orientation_free(t_cv_jit_blobs_orientation *x)
{
	/*Nothing to free*/
}
