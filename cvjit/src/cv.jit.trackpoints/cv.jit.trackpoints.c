/*
cv.jit.trackpoints
	

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
	This external has been deprecated. It is provided only for backward compatibility.
*/

#include "jit.common.h"

typedef struct _cv_jit_trackpoints 
{
	t_object				ob;
	long					dim[2];
	long					dimcount;
} t_cv_jit_trackpoints;

void *_cv_jit_trackpoints_class;

t_cv_jit_trackpoints *cv_jit_trackpoints_new(void);
void cv_jit_trackpoints_free(t_cv_jit_trackpoints *x);
t_jit_err cv_jit_trackpoints_matrix_calc(t_cv_jit_trackpoints *x, void *inputs, void *outputs);
void cv_jit_trackpoints_calculate_ndim(t_cv_jit_trackpoints *x, long dimcount, long *dim, long planecount, 
	t_jit_matrix_info *in_minfo, char *bip, t_jit_matrix_info *out_minfo, char *bop);
t_jit_err cv_jit_trackpoints_init(void);


t_jit_err cv_jit_trackpoints_init(void) 
{
	long attrflags=0;
	t_jit_object *attr, *mop, *o;
	
	_cv_jit_trackpoints_class = jit_class_new("cv_jit_trackpoints",(method)cv_jit_trackpoints_new,(method)cv_jit_trackpoints_free,
		sizeof(t_cv_jit_trackpoints),A_CANT,0L); //A_CANT = untyped

	//add mop
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop,1,1); //#inputs,#outputs
	o = (t_jit_object *)jit_object_method(mop,_jit_sym_getoutput,1);
	jit_attr_setlong(o,_jit_sym_planelink,0);
	jit_class_addadornment(_cv_jit_trackpoints_class,mop);

	//add methods
	jit_class_addmethod(_cv_jit_trackpoints_class, (method)cv_jit_trackpoints_matrix_calc, 		"matrix_calc", 		A_CANT, 0L);

	//add attributes	
	attrflags = JIT_ATTR_GET_DEFER_LOW | JIT_ATTR_SET_USURP_LOW;
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset_array, "size", _jit_sym_long, 2, attrflags, (method)0L, (method)0L, calcoffset(t_cv_jit_trackpoints, dimcount),calcoffset(t_cv_jit_trackpoints,dim));
	jit_class_addattr(_cv_jit_trackpoints_class,attr);

	jit_class_register(_cv_jit_trackpoints_class);

	return JIT_ERR_NONE;
}


t_jit_err cv_jit_trackpoints_matrix_calc(t_cv_jit_trackpoints *x, void *inputs, void *outputs)
{
	t_jit_err err=JIT_ERR_NONE;
	long in_savelock,out_savelock;
	t_jit_matrix_info in_minfo,out_minfo;
	char *in_bp,*out_bp;
	long i,dimcount,planecount,dim[JIT_MATRIX_MAX_DIMCOUNT];
	void *in_matrix, *out_matrix;
	float *ip;

	in_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);
	out_matrix 	= jit_object_method(outputs,_jit_sym_getindex,0);

	if (x&&in_matrix&&out_matrix) {
		
		in_savelock = (long) jit_object_method(in_matrix,_jit_sym_lock,1);
		out_savelock = (long) jit_object_method(out_matrix,_jit_sym_lock,1);
		
		jit_object_method(in_matrix,_jit_sym_getinfo,&in_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);
		
		jit_object_method(in_matrix,_jit_sym_getdata,&in_bp);
		
		if (!in_bp) { err=JIT_ERR_GENERIC; goto out;}
		
		//compatible types?
		if (in_minfo.type!=_jit_sym_float32) 
		{ 
			err=JIT_ERR_MISMATCH_TYPE; 
			goto out;
		}		

		//compatible planes?
		if (in_minfo.planecount!=3) 
		{ 
			err=JIT_ERR_MISMATCH_PLANE; 
			goto out;
		}		
		
		ip = (float *)in_bp;
		
		out_minfo.type = _jit_sym_char;
		out_minfo.dimcount = 2;
		out_minfo.dim[0] = x->dim[0];
		out_minfo.dim[1] = x->dim[1];
		
		jit_object_method(out_matrix,_jit_sym_setinfo,&out_minfo);
		
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);
		
		jit_object_method(out_matrix,_jit_sym_clear);
		
		jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);
		if (!out_bp) { err=JIT_ERR_GENERIC; goto out;}

		//get dimensions/planecount
		dimcount   = out_minfo.dimcount;
		planecount = out_minfo.planecount;			
		for (i=0;i<dimcount;i++) {
			dim[i] = out_minfo.dim[i];
		}		
				
		//calculate
		cv_jit_trackpoints_calculate_ndim(x, dimcount, dim, planecount, &in_minfo, in_bp, &out_minfo, out_bp);

	} else {
		return JIT_ERR_INVALID_PTR;
	}
	
out:
	jit_object_method(out_matrix,gensym("lock"),out_savelock);
	jit_object_method(in_matrix,gensym("lock"),in_savelock);
	return err;
}

//
//recursive functions to handle higher dimension matrices, by processing 2D sections at a time
//

// cv_jit_trackpoints_calculate_ndim() -- when x->dimmode==-1, sorts both dimensions together
void cv_jit_trackpoints_calculate_ndim(t_cv_jit_trackpoints *x, long dimcount, long *dim, long planecount, 
	t_jit_matrix_info *in_minfo, char *bip, t_jit_matrix_info *out_minfo, char *bop)
{
	long i,width,height,items,step;
	char *op;
	float *ip;
	int X,Y;
	
	items = in_minfo->dim[0];
	
	width = dim[0];
	height = dim[1];
	
	op = bop;
	ip = (float *)bip;
	step = in_minfo->dimstride[0]/sizeof(float);

	if (dimcount<1) return; //safety
	
	switch(dimcount) 
	{
	case 1:
		dim[1]=1;
	case 2:
	
		for (i = 1; i<=items; i++)
		{
			if (ip[2] != 0.)
			{
				X = ip[0];	
				Y = ip[1];
				if ((X > 0)&&(Y > 0)&&(X<width)&&(Y<height))
				{
					op = bop + (Y * out_minfo->dimstride[1]);
					op[X] = i;
				}
			}
			ip += step;	
		}
		break;
	}
	
}


t_cv_jit_trackpoints *cv_jit_trackpoints_new(void)
{
	t_cv_jit_trackpoints *x;
			
	if (x=(t_cv_jit_trackpoints *)jit_object_alloc(_cv_jit_trackpoints_class)) {
		x->dim[0] = 320;
		x->dim[1] = 240;
	
	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_trackpoints_free(t_cv_jit_trackpoints *x)
{
	//nada
}

