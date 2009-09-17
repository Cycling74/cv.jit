/*
cv.jit.ravg
	

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

#ifdef __cplusplus
extern "C" {
#endif
#include "jit.common.h"
#ifdef __cplusplus 
} //extern "C"
#endif

typedef struct _cv_jit_ravg 
{
	t_object				ob;
	t_jit_matrix_info			previousInfo;
	double				*buffer;
	long					buf_size;
	double				alpha;
} t_cv_jit_ravg;

void *_cv_jit_ravg_class;

static char compareInfo(t_jit_matrix_info *info1, t_jit_matrix_info *info2);
t_jit_err 		cv_jit_ravg_init(void);
t_cv_jit_ravg 		*cv_jit_ravg_new(void);
void 			cv_jit_ravg_free(t_cv_jit_ravg *x);
t_jit_err 		cv_jit_ravg_matrix_calc(t_cv_jit_ravg *x, void *inputs, void *outputs);
void cv_jit_ravg_calculate_ndim(t_cv_jit_ravg *x, long dimcount, long *dim, long planecount, 
	t_jit_matrix_info *in_minfo, uchar *bip, t_jit_matrix_info *out_minfo, uchar *bop);
	


t_jit_err cv_jit_ravg_init(void) 
{
	long attrflags=0;
	t_jit_object *attr,*mop;
	
	_cv_jit_ravg_class = jit_class_new("cv_jit_ravg",(method)cv_jit_ravg_new,(method)cv_jit_ravg_free,sizeof(t_cv_jit_ravg),0L);

	//add mop
	mop = jit_object_new(_jit_sym_jit_mop,1,1);
	jit_class_addadornment(_cv_jit_ravg_class,mop);
	
	//add methods
	jit_class_addmethod(_cv_jit_ravg_class, (method)cv_jit_ravg_matrix_calc, "matrix_calc", A_CANT, 0L);
	
	//add attributes	
	attrflags = JIT_ATTR_GET_DEFER_LOW | JIT_ATTR_SET_USURP_LOW;
	attr = jit_object_new(_jit_sym_jit_attr_offset,"alpha",_jit_sym_float64,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_ravg,alpha));
	jit_attr_addfilterset_clip(attr,0,1,TRUE,TRUE);	//clip to 0-1
	jit_class_addattr(_cv_jit_ravg_class,attr);
	
	jit_class_register(_cv_jit_ravg_class);

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


t_jit_err cv_jit_ravg_matrix_calc(t_cv_jit_ravg *x, void *inputs, void *outputs)
{
	t_jit_err err=JIT_ERR_NONE;
	long in_savelock,out_savelock;
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
		
		if((!compareInfo(&in_minfo, &(x->previousInfo)))||!x->buffer)
		{
			if(x->buffer)
				jit_freebytes(x->buffer,x->buf_size);
				
			x->buf_size = planecount * sizeof(double);
			
			for (i=0;i<dimcount;i++) 
			{
				x->buf_size *= dim[i];
			}
			
			x->buffer = (double *)jit_getbytes(x->buf_size);
			
			x->previousInfo = in_minfo;
		}
		
		jit_object_method(in_matrix,_jit_sym_getdata,&in_bp);
		jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);
		
		if (!in_bp) { err=JIT_ERR_INVALID_INPUT; goto out;}
		if (!out_bp) { err=JIT_ERR_INVALID_OUTPUT; goto out;}
		
		//calculate
		cv_jit_ravg_calculate_ndim(x, dimcount, dim, planecount, &in_minfo, in_bp, &out_minfo, out_bp);

	} else {
		return JIT_ERR_INVALID_PTR;
	}
	
out:
	jit_object_method(out_matrix,gensym("lock"),out_savelock);
	jit_object_method(in_matrix,gensym("lock"),in_savelock);
	return err;
}

void cv_jit_ravg_calculate_ndim(t_cv_jit_ravg *x, long dimcount, long *dim, long planecount, 
	t_jit_matrix_info *in_minfo, uchar *bip, t_jit_matrix_info *out_minfo, uchar *bop)
{
	long i,j,k,width,height,l;
	uchar *ip,*op;
	double a, b;
	double temp_in;
	double *buf;
		
	if (dimcount<1) return; //safety

	a = x->alpha;
	b = 1 - a;
	
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
			cv_jit_ravg_calculate_ndim(x,dimcount-1,dim,planecount,in_minfo,ip,out_minfo,op);
		}
	}
}

t_cv_jit_ravg *cv_jit_ravg_new(void)
{
	t_cv_jit_ravg *x;
		
	if (x=(t_cv_jit_ravg *)jit_object_alloc(_cv_jit_ravg_class)) 
	{
		x->buffer = (double *)0;
		x->buf_size = 0;
		x->alpha = 0.05;
	} 
	else 
	{
		x = NULL;
	}	
	return x;
}

void cv_jit_ravg_free(t_cv_jit_ravg *x)
{
	if(x->buffer)
		jit_freebytes(x->buffer,x->buf_size);
}

