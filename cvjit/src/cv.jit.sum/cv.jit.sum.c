/*
cv.jit.sum
	

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

typedef struct _cv_jit_sum_vecdata_char
{
	long 				sum[JIT_MATRIX_MAX_PLANECOUNT];
} t_cv_jit_sum_vecdata_char;

typedef struct _cv_jit_sum_vecdata_long
{
	double 				sum[JIT_MATRIX_MAX_PLANECOUNT];
} t_cv_jit_sum_vecdata_long;

typedef struct _cv_jit_sum_vecdata_float32
{
	float 				sum[JIT_MATRIX_MAX_PLANECOUNT];
} t_cv_jit_sum_vecdata_float32;

typedef struct _cv_jit_sum_vecdata_float64
{
	double 				sum[JIT_MATRIX_MAX_PLANECOUNT];
} t_cv_jit_sum_vecdata_float64;

typedef struct _cv_jit_sum_vecdata
{
	t_cv_jit_sum_vecdata_char 		v_char;
	t_cv_jit_sum_vecdata_long 		v_long;
	t_cv_jit_sum_vecdata_float32 	v_float32;
	t_cv_jit_sum_vecdata_float64 	v_float64;
} t_cv_jit_sum_vecdata;

typedef struct _cv_jit_sum 
{
	t_object	ob;
	long		planecount;
	t_atom		sum[JIT_MATRIX_MAX_PLANECOUNT];
	
} t_cv_jit_sum;

t_jit_err cv_jit_sum_init(void); 
t_jit_err cv_jit_sum_matrix_calc(t_cv_jit_sum *x, void *inputs, void *outputs);

void *_cv_jit_sum_class;

t_cv_jit_sum *cv_jit_sum_new(void);
void cv_jit_sum_free(t_cv_jit_sum *x);
void cv_jit_sum_precalc(t_cv_jit_sum_vecdata *vecdata, t_jit_matrix_info *in1_minfo, uchar *bip1); 
void cv_jit_sum_postcalc(t_cv_jit_sum *x, t_cv_jit_sum_vecdata *vecdata, t_jit_matrix_info *in1_minfo); 
void cv_jit_sum_sum(t_cv_jit_sum_vecdata *vecdata, t_jit_matrix_info *in1_minfo); 
void cv_jit_sum_calculate_ndim(t_cv_jit_sum *x, long dimcount, long *dim, t_cv_jit_sum_vecdata *vecdata, t_jit_matrix_info *in_minfo, uchar *bip);
void cv_jit_sum_vector_char(long n, t_jit_op_info *in1,  long *sum); 
void cv_jit_sum_vector_long(long n, t_jit_op_info *in1, double *sum);
void cv_jit_sum_vector_float32(long n, t_jit_op_info *in1, float *sum);
void cv_jit_sum_vector_float64(long n, t_jit_op_info *in1,  double *sum);

t_jit_err cv_jit_sum_init(void) 
{
	long attrflags=0;
	t_jit_object *attr,*mop;
	
	_cv_jit_sum_class = jit_class_new("cv_jit_sum",(method)cv_jit_sum_new,(method)cv_jit_sum_free, sizeof(t_cv_jit_sum),0L);

	//add mop
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop,1,0);
	jit_class_addadornment(_cv_jit_sum_class,mop);
	//add methods
	jit_class_addmethod(_cv_jit_sum_class, (method)cv_jit_sum_matrix_calc, 		"matrix_calc", 		A_CANT, 0L);
	//add attributes	
	attrflags = JIT_ATTR_SET_OPAQUE_USER | JIT_ATTR_GET_OPAQUE_USER;
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset_array,"sum",_jit_sym_atom,JIT_MATRIX_MAX_PLANECOUNT,attrflags,
		(method)0L,(method)0L,calcoffset(t_cv_jit_sum,planecount),calcoffset(t_cv_jit_sum,sum));
	jit_class_addattr(_cv_jit_sum_class,attr);
	
	jit_class_register(_cv_jit_sum_class);

	return JIT_ERR_NONE;
}

t_jit_err cv_jit_sum_matrix_calc(t_cv_jit_sum *x, void *inputs, void *outputs)
{
	t_jit_err err=JIT_ERR_NONE;
	long in_savelock;
	t_jit_matrix_info in_minfo;
	uchar *in_bp;
	long i,dimcount,dim[JIT_MATRIX_MAX_DIMCOUNT];
	t_cv_jit_sum_vecdata vd;
	void *in_matrix;
	
	in_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);

	if (x&&in_matrix) {
		
		in_savelock = (long) jit_object_method(in_matrix,_jit_sym_lock,1);
		jit_object_method(in_matrix,_jit_sym_getinfo,&in_minfo);
		jit_object_method(in_matrix,_jit_sym_getdata,&in_bp);
		
		if (!in_bp) { err=JIT_ERR_INVALID_INPUT; 	x->planecount = 0; goto out;}
		
		//get dimensions/planecount 
		//3m does this a bit different than how it happens for most other objects
		dimcount    = in_minfo.dimcount;
		for (i=0;i<dimcount;i++) {
			dim[i] = in_minfo.dim[i];
		}		
		
		//calculate
		cv_jit_sum_precalc(&vd, &in_minfo, in_bp);
		cv_jit_sum_calculate_ndim(x, dimcount, dim, &vd, &in_minfo, in_bp);
		cv_jit_sum_postcalc(x, &vd, &in_minfo);
		
	} else {
		return JIT_ERR_INVALID_PTR;
	}
	
out:
	jit_object_method(in_matrix,gensym("lock"),in_savelock);
	return err;
}

void cv_jit_sum_precalc(t_cv_jit_sum_vecdata *vecdata, t_jit_matrix_info *in1_minfo, uchar *bip1) 
{
	long i;
	
	if (in1_minfo->type==_jit_sym_char) {
		for (i=0;i<in1_minfo->planecount;i++) {
			vecdata->v_char.sum[i] = 0;
		}
	} else if (in1_minfo->type==_jit_sym_long) {
		for (i=0;i<in1_minfo->planecount;i++) {
			vecdata->v_long.sum[i] = 0;
		}
	} else if (in1_minfo->type==_jit_sym_float32) {
		for (i=0;i<in1_minfo->planecount;i++) {
			vecdata->v_float32.sum[i] = 0;
		}
	} else if (in1_minfo->type==_jit_sym_float64) {
		for (i=0;i<in1_minfo->planecount;i++) {
			vecdata->v_float64.sum[i] = 0;
		}
	} 
}

void cv_jit_sum_postcalc(t_cv_jit_sum *x, t_cv_jit_sum_vecdata *vecdata, t_jit_matrix_info *in1_minfo) 
{
	long i;
	
	x->planecount = in1_minfo->planecount;

	if (in1_minfo->type==_jit_sym_char) { 
		for (i=0;i<x->planecount;i++) {
			jit_atom_setfloat(&(x->sum[i]),vecdata->v_char.sum[i]); //(hack) use v_long's float sum
		}
	} else if (in1_minfo->type==_jit_sym_long) { 
		for (i=0;i<x->planecount;i++) {
			jit_atom_setfloat(&(x->sum[i]),vecdata->v_long.sum[i]);
		}
	} else if (in1_minfo->type==_jit_sym_float32) { 
		for (i=0;i<x->planecount;i++) {
			jit_atom_setfloat(&(x->sum[i]),vecdata->v_float32.sum[i]);
		}
	} else if (in1_minfo->type==_jit_sym_float64) { 
		for (i=0;i<x->planecount;i++) {
			jit_atom_setfloat(&(x->sum[i]),vecdata->v_float64.sum[i]);
		}
	}
}

void cv_jit_sum_sum(t_cv_jit_sum_vecdata *vecdata, t_jit_matrix_info *in1_minfo) 
{
	long count=1;
	long i;
	
	for (i=0;i<in1_minfo->dimcount;i++) {
		count *= in1_minfo->dim[i];
	}
			
	if (in1_minfo->type==_jit_sym_char) {
		for (i=0;i<in1_minfo->planecount;i++) {
			vecdata->v_long.sum[i] = ((double)(vecdata->v_char.sum[i]))/(double)count; //(hack) use v_long's float sum
		}
	} else if (in1_minfo->type==_jit_sym_long) {
		for (i=0;i<in1_minfo->planecount;i++) {
			vecdata->v_long.sum[i] = ((double)(vecdata->v_long.sum[i]))/(double)count;
		}
	} else if (in1_minfo->type==_jit_sym_float32) {
		for (i=0;i<in1_minfo->planecount;i++) {
			vecdata->v_float32.sum[i] = ((double)(vecdata->v_float32.sum[i]))/(double)count;
		}
	} else if (in1_minfo->type==_jit_sym_float64) {
		for (i=0;i<in1_minfo->planecount;i++) {
			vecdata->v_float64.sum[i] = ((double)(vecdata->v_float64.sum[i]))/(double)count;
		}
	} 
}


//recursive function to handle higher dimension matrices, by processing 2D sections at a time 
void cv_jit_sum_calculate_ndim(t_cv_jit_sum *x, long dimcount, long *dim, t_cv_jit_sum_vecdata *vecdata, 
	t_jit_matrix_info *in1_minfo, uchar *bip1)
{
	long i,j,n;
	uchar *ip1;
	t_jit_op_info in1_opinfo;
	
	if (dimcount<1) return; //safety
	
	switch(dimcount) {
	case 1:
		dim[1] = 1;
	case 2:
		n = dim[0];
		in1_opinfo.stride = in1_minfo->dim[0]>1?in1_minfo->planecount:0;
		if (in1_minfo->type==_jit_sym_char) 
		{
			for (i=0;i<dim[1];i++)
			{
				for (j=0;j<in1_minfo->planecount;j++) 
				{
					in1_opinfo.p = bip1 + i*in1_minfo->dimstride[1] + j;
					cv_jit_sum_vector_char(n,&in1_opinfo,&(vecdata->v_char.sum[j]));
				}
			}
		} 
		else if (in1_minfo->type==_jit_sym_long) 
		{
			for (i=0;i<dim[1];i++)
			{
				for (j=0;j<in1_minfo->planecount;j++) 
				{
					in1_opinfo.p = bip1 + i*in1_minfo->dimstride[1] + j*4;
					cv_jit_sum_vector_long(n,&in1_opinfo,&(vecdata->v_long.sum[j]));
				}
			}
		} 
		else if (in1_minfo->type==_jit_sym_float32) 
		{
			for (i=0;i<dim[1];i++)
			{
				for (j=0;j<in1_minfo->planecount;j++) 
				{
					in1_opinfo.p = bip1 + i*in1_minfo->dimstride[1] + j*4;
					cv_jit_sum_vector_float32(n,&in1_opinfo,&(vecdata->v_float32.sum[j]));
				}
			}
		} 
		else if (in1_minfo->type==_jit_sym_float64) 
		{
			for (i=0;i<dim[1];i++)
			{
				for (j=0;j<in1_minfo->planecount;j++) 
				{
					in1_opinfo.p = bip1 + i*in1_minfo->dimstride[1] + j*8;
					cv_jit_sum_vector_float64(n,&in1_opinfo,&(vecdata->v_float64.sum[j]));
				}
			}
		} 
		break;
	default:
		for	(i=0;i<dim[dimcount-1];i++) {
			ip1 = bip1 + i*in1_minfo->dimstride[dimcount-1];
			cv_jit_sum_calculate_ndim(x,dimcount-1,dim,vecdata,in1_minfo,ip1);
		}
	}
}

//outmatrix is guaranteed to be no smaller than 256 elements so no need to test ip1 for 0-maxsize
void cv_jit_sum_vector_char(long n, t_jit_op_info *in1, long *sum)
{
	uchar *ip1;
	long tmp;
	long is1;
		
	ip1 = ((uchar *)in1->p);
	is1 = in1->stride; 
	
	++n;
	while (--n) 
	{
		tmp = *ip1;
		*sum += tmp;
		ip1 += is1;
	}
}

void cv_jit_sum_vector_long(long n, t_jit_op_info *in1, double *sum) 
{
	long *ip1,tmp;
	long is1;
		
	ip1 = ((long *)in1->p);
	is1 = in1->stride; 
	
	++n;
	while (--n) 
	{
		tmp = *ip1;
		*sum += tmp;
		ip1 += is1;
	}
}

void cv_jit_sum_vector_float32(long n, t_jit_op_info *in1, float *sum) 
{
	float *ip1,tmp;
	long is1;
		
	ip1 = ((float *)in1->p);
	is1 = in1->stride; 
	
	++n;
	while (--n) 
	{
		tmp = *ip1;
		*sum += tmp;
		ip1 += is1;
	}
}

void cv_jit_sum_vector_float64(long n, t_jit_op_info *in1, double *sum) 
{
	double *ip1,tmp;
	long is1;
		
	ip1 = ((double *)in1->p);
	is1 = in1->stride; 
	
	++n;
	while (--n) 
	{
		tmp = *ip1;
		*sum += tmp;
		ip1 += is1;
	}
}

t_cv_jit_sum *cv_jit_sum_new(void)
{
	t_cv_jit_sum *x;
		
	if (x=(t_cv_jit_sum *)jit_object_alloc(_cv_jit_sum_class)) {
		x->planecount = 0;
	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_sum_free(t_cv_jit_sum *x)
{
	//nothing to free
}
