/*
cv.jit.mean
	

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

typedef struct _cv_jit_mean 
{
	t_object			ob;
	double				index;
	
	t_jit_matrix_info	previousInfo;
	double				*buffer;
	long				buf_size;
	long				buf_stride;
} t_cv_jit_mean;

void *_cv_jit_mean_class;

static char compareInfo(t_jit_matrix_info *info1, t_jit_matrix_info *info2);
t_jit_err 		cv_jit_mean_init(void);
t_cv_jit_mean 		*cv_jit_mean_new(void);
void 			cv_jit_mean_free(t_cv_jit_mean *x);
t_jit_err 		cv_jit_mean_matrix_calc(t_cv_jit_mean *x, void *inputs, void *outputs);
void			cv_jit_mean_clear(t_cv_jit_mean *x);
void cv_jit_mean_calculate(t_cv_jit_mean *x, long dimcount, long *dim, long planecount, 
	t_jit_matrix_info *in_minfo, uchar *bip, t_jit_matrix_info *out_minfo, uchar *bop, double ndx);
//void cv_jit_mean_calculate_vec(t_cv_jit_mean *x, long dimcount, long *dim, long planecount, 
//	t_jit_matrix_info *in_minfo, uchar *bip, t_jit_matrix_info *out_minfo, uchar *bop, double ndx);
	


t_jit_err cv_jit_mean_init(void) 
{
	t_jit_object *mop;
	
	_cv_jit_mean_class = jit_class_new("cv_jit_mean",(method)cv_jit_mean_new,(method)cv_jit_mean_free,sizeof(t_cv_jit_mean),0L);

	//add mop
	mop = jit_object_new(_jit_sym_jit_mop,1,1);
	jit_class_addadornment(_cv_jit_mean_class,mop);
	
	//add methods
	jit_class_addmethod(_cv_jit_mean_class, (method)cv_jit_mean_matrix_calc, "matrix_calc", A_CANT, 0L);
	jit_class_addmethod(_cv_jit_mean_class, (method)cv_jit_mean_clear, "reset", 0L);
	
	jit_class_register(_cv_jit_mean_class);

	return JIT_ERR_NONE;
}

static char compareInfo(t_jit_matrix_info *info1, t_jit_matrix_info *info2)
{
	int i;
	
	if(info1->planecount != info2->planecount)
		return 0;
	else if(info1->dimcount != info2->dimcount)
		return 0;
	else
	{
		for(i=0;i<info1->dimcount;i++)
		{
			if(info1->dim[i]!=info2->dim[i])
				return 0;
		}
	}
	
	return 1;
}


t_jit_err cv_jit_mean_matrix_calc(t_cv_jit_mean *x, void *inputs, void *outputs)
{
	t_jit_err err=JIT_ERR_NONE;
	long in_savelock=0,out_savelock=0;
	t_jit_matrix_info in_minfo,out_minfo;
	uchar *in_bp,*out_bp;
	long i,dimcount,planecount,dim[JIT_MATRIX_MAX_DIMCOUNT];
	void *in_matrix,*out_matrix;
	
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

		//get dimensions/planecount
		dimcount   = out_minfo.dimcount;
		planecount = out_minfo.planecount;			
		for (i=0;i<dimcount;i++) {
			dim[i] = MIN(in_minfo.dim[i],out_minfo.dim[i]);
		}		
		
		//Do we need to resize buffer?
		if((!compareInfo(&in_minfo, &(x->previousInfo)))||!x->buffer)
		{
			x->index = 0;
			if(x->buffer)
				jit_freebytes(x->buffer,x->buf_size);
			
			//dim[0] is 16-bit aligned
			x->buf_size = (((dim[0] * planecount * sizeof(double)) >> 4)+1)<<4;
			x->buf_stride = x->buf_size;
				
			for (i=1;i<dimcount;i++) 
			{
				x->buf_size *= dim[i];
			}
			
			x->buffer = (double *)jit_getbytes(x->buf_size);
			
			//x->previousInfo = in_minfo;
		}
		else if(in_minfo.type != x->previousInfo.type)
		{
			x->index = 0;
		}
		
		jit_object_method(in_matrix,_jit_sym_getdata,&in_bp);
		jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);
		
		if (!in_bp) { err=JIT_ERR_INVALID_INPUT; goto out;}
		if (!out_bp) { err=JIT_ERR_INVALID_OUTPUT; goto out;}
		
		//calculate
		x->index++;
		cv_jit_mean_calculate(x, dimcount, dim, planecount, &in_minfo, in_bp, &out_minfo, out_bp, x->index);
		
		x->previousInfo = in_minfo;

	} else {
		return JIT_ERR_INVALID_PTR;
	}
	
out:
	jit_object_method(out_matrix,gensym("lock"),out_savelock);
	jit_object_method(in_matrix,gensym("lock"),in_savelock);
	return err;
}

void cv_jit_mean_calculate(t_cv_jit_mean *x, long dimcount, long *dim, long planecount, 
	t_jit_matrix_info *in_minfo, uchar *bip, t_jit_matrix_info *out_minfo, uchar *bop, double ndx)
{
	long i,j,k,width,height,l;
	uchar *ip,*op;
	double a, b;
	double temp_in;
	double *buf;
		
	if (dimcount<1) return; //safety

	a = 1/ndx;
	b = 1-a;
	
	switch(dimcount) {
	case 1:
		dim[1]=1;
	
	case 2:	
		width  = dim[0];
		height = dim[1];
		
		if (in_minfo->type==_jit_sym_char) 
		{
			buf = x->buffer;
			for (i=0;i<dim[1];i++)
			{
				ip = bip + i*in_minfo->dimstride[1];					
				op = bop + i*out_minfo->dimstride[1];	
				for (j=0;j<dim[0];j++) 
				{						
					for (k=0;k<in_minfo->planecount;k++) 
					{
						temp_in = *ip; 
						*buf = (temp_in * a) + (*buf * b);
						*op = (char)*buf;
						op++;ip++;
						buf++;
					}
					
				}
			}
		} else if (in_minfo->type==_jit_sym_long) 
		{
			buf = x->buffer;
			for (i=0;i<dim[1];i++)
			{
				ip = bip + i*in_minfo->dimstride[1];					
				op = bop + i*out_minfo->dimstride[1];	
				for (j=0;j<dim[0];j++) 
				{	
					
					l = j*out_minfo->planecount;
					
					for (k=0;k<in_minfo->planecount;k++) 
					{
						*buf = (double) (( (long *) ip )[l+k] * a) + (*buf * b);
						((long *)op)[l+k] = (long) *buf;
						buf++;
					}
					
				}
			}
		} else if (in_minfo->type==_jit_sym_float32) 
		{
			for (i=0;i<dim[1];i++)
			{
				ip = bip + i*in_minfo->dimstride[1];					
				op = bop + i*out_minfo->dimstride[1];	
				for (j=0;j<dim[0];j++) 
				{	
					
					l = j*out_minfo->planecount;
					
					for (k=0;k<in_minfo->planecount;k++) 
					{
						((float *)op)[l+k] = (((float *)ip)[l+k] * a) + (((float *)op)[l+k] * b);
					}
					
				}
			}
		} else if (in_minfo->type==_jit_sym_float64) 
		{
			for (i=0;i<dim[1];i++)
			{
				ip = bip + i*in_minfo->dimstride[1];					
				op = bop + i*out_minfo->dimstride[1];	
				for (j=0;j<dim[0];j++) 
				{	
					
					l = j*out_minfo->planecount;
					
					for (k=0;k<in_minfo->planecount;k++) 
					{
						((double *)op)[l+k] = (((double *)ip)[l+k] * a) + (((double *)op)[l+k] * b);
						
					}
					
				}
			}
		}
		break;
	default:
		for	(i=0;i<dim[dimcount-1];i++) {
			ip = bip + i*in_minfo->dimstride[dimcount-1];
			op = bop + i*out_minfo->dimstride[dimcount-1];
			cv_jit_mean_calculate(x,dimcount-1,dim,planecount,in_minfo,ip,out_minfo,op, ndx);
		}
	}
}

t_cv_jit_mean *cv_jit_mean_new(void)
{
	t_cv_jit_mean *x;
		
	if (x=(t_cv_jit_mean *)jit_object_alloc(_cv_jit_mean_class)) 
	{
		x->index = 0;
		x->buffer = (double *)0;
		x->buf_size = 0;
		x->buf_stride = 0;
			} 
	else 
	{
		x = NULL;
	}	
	return x;
}

void cv_jit_mean_free(t_cv_jit_mean *x)
{
	if(x->buffer)
		jit_freebytes(x->buffer,x->buf_size);
}

void cv_jit_mean_clear(t_cv_jit_mean *x)
{
	x->index = 0;
}
