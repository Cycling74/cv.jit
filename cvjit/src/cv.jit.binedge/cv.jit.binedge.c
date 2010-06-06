/*
cv.jit.binedge
	

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

typedef struct _cv_jit_binedge 
{
	t_object				ob;
} t_cv_jit_binedge;

void *_cv_jit_binedge_class;

t_jit_err 		cv_jit_binedge_init(void);
t_cv_jit_binedge 		*cv_jit_binedge_new(void);
void 			cv_jit_binedge_free(t_cv_jit_binedge *x);
t_jit_err 		cv_jit_binedge_matrix_calc(t_cv_jit_binedge *x, void *inputs, void *outputs);
void 			cv_jit_binedge_calculate(t_cv_jit_binedge *x, long *dim,  t_jit_matrix_info *in_minfo, char *bip, t_jit_matrix_info *out_minfo, char *bop);

t_jit_err cv_jit_binedge_init(void) 
{
	t_jit_object *mop;
	
	_cv_jit_binedge_class = jit_class_new("cv_jit_binedge",(method)cv_jit_binedge_new,(method)cv_jit_binedge_free,sizeof(t_cv_jit_binedge),0L); 

	//add mop
	mop = jit_object_new(_jit_sym_jit_mop,1,1);
	jit_class_addadornment(_cv_jit_binedge_class,mop);
	
	//add methods
	jit_class_addmethod(_cv_jit_binedge_class, (method)cv_jit_binedge_matrix_calc, "matrix_calc", A_CANT, 0L);
	
	jit_class_register(_cv_jit_binedge_class);

	return JIT_ERR_NONE;
}


t_jit_err cv_jit_binedge_matrix_calc(t_cv_jit_binedge *x, void *inputs, void *outputs)
{
	t_jit_err err=JIT_ERR_NONE;
	long in_savelock,out_savelock;
	t_jit_matrix_info in_minfo,out_minfo;
	char *in_bp,*out_bp;
	long i,dimcount,planecount,dim[JIT_MATRIX_MAX_DIMCOUNT];
	void *in_matrix,*out_matrix;
	
	in_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);
	out_matrix 	= jit_object_method(outputs,_jit_sym_getindex,0);

	if (x&&in_matrix&&out_matrix) {
		
		in_savelock = (long) jit_object_method(in_matrix,_jit_sym_lock,1);
		out_savelock = (long) jit_object_method(out_matrix,_jit_sym_lock,1);
		
		jit_object_method(in_matrix,_jit_sym_getinfo,&in_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);
		
		jit_object_method(in_matrix,_jit_sym_getdata,&in_bp);
		jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);
		
		if (!in_bp) { err=JIT_ERR_INVALID_INPUT; goto out;}
		if (!out_bp) { err=JIT_ERR_INVALID_OUTPUT; goto out;}
		
		//compatible types?
		if (in_minfo.type != out_minfo.type) 
		{ 
			err=JIT_ERR_MISMATCH_TYPE; 
			goto out;
		}

		//compatible planes?
		if (in_minfo.planecount!=1) 
		{ 
			err=JIT_ERR_MISMATCH_PLANE; 
			goto out;
		}		
		
		if (in_minfo.dimcount!=2) 
		{ 
			err=JIT_ERR_MISMATCH_DIM; 
			goto out;
		}	

		//get dimensions/planecount
		dimcount   = out_minfo.dimcount;
		planecount = out_minfo.planecount;			
		for (i=0;i<dimcount;i++) 
		{
			dim[i] = MIN(in_minfo.dim[i],out_minfo.dim[i]);
		}		
				
		//calculate
		cv_jit_binedge_calculate(x, dim, &in_minfo, in_bp, &out_minfo, out_bp);

	} else {
		return JIT_ERR_INVALID_PTR;
	}
	
out:
	jit_object_method(out_matrix,gensym("lock"),out_savelock);
	jit_object_method(in_matrix,gensym("lock"),in_savelock);
	return err;
}

void cv_jit_binedge_calculate(t_cv_jit_binedge *x, long *dim, t_jit_matrix_info *in_minfo, 
	char *bip, t_jit_matrix_info *out_minfo, char *bop)
{
	long i,j,width,height;
	char *ip,*op,*line1,*line3;
	long stride,step;
			
	stride = in_minfo->dimstride[1];
	step = in_minfo->dimstride[0];
	
	width  = dim[0] - 1;
	height = dim[1] - 1;
	
	if (in_minfo->type==_jit_sym_char) 
	{
		//Process first pixel
		ip = bip;
		op = bop;
		line3 = ip + in_minfo->dimstride[1];;
		
		
		if (*ip && (!*(ip+1) || !*line3 || !*(line3 + 1)))
			*op = 255;
		else
			*op = 0;
		
		ip ++;
		op ++;
		line3 ++;
		
		//Process first line
		for (j=1;j<dim[0]-1;j++)
		{
			if (*ip && 
				(!*(ip - 1) || 
				!*(ip + 1) ||
				!*(line3 - 1) || 
				!*line3 || 
				!*(line3 + 1)))
				*op = 255;
			else
				*op = 0;
			
			ip ++;
			op ++;
			line3 ++;
		}
		
		//Process last pixel of first line
		if (*ip && (!*(ip-1) || !*line3 || !*(line3 - 1)))
			*op = 255;
		else
			*op = 0;
		
		//Process rest of image
		for(i=1;i<dim[1]-1;i++)
		{
			ip = bip + i * in_minfo->dimstride[1];;
			op = bop + i * out_minfo->dimstride[1];;
			line1 = ip - in_minfo->dimstride[1];;
			line3 = ip + in_minfo->dimstride[1];;
			
			//first pixel
			if (*ip && (!*(ip+1) || !*line1 || !*(line1 + 1) || !*line3 || !*(line3 + 1) ))
				*op = 255;
			else
				*op = 0;
				
			ip ++;
			op ++;
			line1 ++;
			line3 ++;
			
			//rest of line
			
			for (j=1;j<dim[0]-1;j++)
			{
				if (*ip && (!*(ip+1) || !*(ip-1) || !*(line1 - 1) || !*line1 || !*(line1 + 1) || !*(line3 - 1) || !*line3 || !*(line3 + 1)))
					*op = 255;
				else
					*op = 0;
			
				ip ++;
				op ++;
				line1 ++;
				line3 ++;
			}
			
			//last pixel
			if (*ip && (!*(ip-1) || !*line1 || !*(line1 - 1) || !*line3 || !*(line3 - 1) ))
				*op = 255;
			else
				*op = 0;
		
		}
		
		ip = bip + height * in_minfo->dimstride[1];;
		op = bop + height * out_minfo->dimstride[1];;
		line1 = ip - in_minfo->dimstride[1];;
		
		//Process last line
		//first pixel
		if (*ip && (!*(ip+1) || !*line1 || !*(line1 + 1)))
			*op = 255;
		else
			*op = 0;
		
		ip ++;
		op ++;
		line1 ++;
		
		//Process rest of last line
		for (j=1;j<dim[0]-1;j++)
		{
			if (*ip && 
				(!*(ip - 1) || 
				!*(ip + 1) ||
				!*(line1 - 1) || 
				!*line1 || 
				!*(line1 + 1)))
				*op = 255;
			else
				*op = 0;
			
			ip ++;
			op ++;
			line1 ++;
		}
		
		//Process last pixel
		if (*ip && (!*(ip-1) || !*line1 || !*(line1 - 1)))
			*op = 255;
		else
			*op = 0;
		
		
		
	} else if (in_minfo->type==_jit_sym_long) 
	{
		//Process first pixel
		ip = bip;
		op = bop;
		line3 = ip + in_minfo->dimstride[1];
		
		if (*(long *)ip && (!*(long *)(ip+step) || !*(long *)line3 || !*(long *)(line3 + step)))
			*(long *)op = 1;
		else
			*(long *)op = 0;
		
		ip += step;
		op += step;
		line3 += step;
		
		//Process first line
		for (j=1;j<dim[0]-1;j++)
		{
			if (*(long *)ip && (!*(long *)(ip+step) || !*(long *)(ip-step) || !*(long *)(line3 - step) || !*(long *)line3 || !*(long *)(line3 + step)))
				*(long *)op = 1;
			else
				*(long *)op = 0;
			
			ip += step;
			op += step;
			line3 += step;
		}
		
		//Process last pixel of first line
		if (*(long *)ip && (!*(long *)(ip-step) || !*(long *)line3 || !*(long *)(line3 - step)))
			*(long *)op = 1;
		else
			*(long *)op = 0;
		
		//Process rest of image
		for(i=1;i<dim[1]-1;i++)
		{
			ip = bip + i * in_minfo->dimstride[1];;
			op = bop + i * out_minfo->dimstride[1];;
			line1 = ip - in_minfo->dimstride[1];;
			line3 = ip + in_minfo->dimstride[1];;
			
			//first pixel
			if (*(long *)ip && (!*(long *)(ip+step) || !*(long *)line3 || !*(long *)(line3 + step)|| !*(long *)line1 || !*(long *)(line1 + step)))
				*(long *)op = 1;
			else
				*(long *)op = 0;
				
			ip += step;
			op += step;
			line1 += step;
			line3 += step;
			
			//rest of line
			for (j=1;j<dim[0]-1;j++)
			{
				if (*(long *)ip && (!*(long *)(ip+step) || !*(long *)(ip-step) || !*(long *)(line3 - step) || !*(long *)line3 || !*(long *)(line3 + step)
					|| !*(long *)(line1 - step) || !*(long *)line1 || !*(long *)(line1 + step)))
					*(long *)op = 1;
				else
					*(long *)op = 0;
			
				ip += step;
				op += step;
				line1 += step;
				line3 += step;
			}
			
			//last pixel
			if (*(long *)ip && (!*(long *)(ip-step) || !*(long *)line3 || !*(long *)(line3 - step)|| !*(long *)line1 || !*(long *)(line1 - step)))
				*(long *)op = 1;
			else
				*(long *)op = 0;
		
		}
		
		ip = bip + height * in_minfo->dimstride[1];;
		op = bop + height * out_minfo->dimstride[1];;
		line1 = ip - in_minfo->dimstride[1];;
		
		//Process last line
		//first pixel
		if (*(long *)ip && (!*(long *)(ip+step) || !*(long *)line1 || !*(long *)(line1 + step)))
			*(long *)op = 1;
		else
			*(long *)op = 0;
		
		ip += step;
		op += step;
		line1 += step;
		
		//Process rest of last line
		for (j=1;j<dim[0]-1;j++)
		{
			if (*(long *)ip && (!*(long *)(ip+step) || !*(long *)(ip-step) || !*(long *)(line1 - step) || !*(long *)line1 || !*(long *)(line1 + step)))
				*(long *)op = 1;
			else
				*(long *)op = 0;
			
			ip += step;
			op += step;
			line1 += step;
		}
		
		//Process last pixel
		if (*(long *)ip && (!*(long *)(ip-step) || !*(long *)line1 || !*(long *)(line1 - step)))
			*(long *)op = 1;
		else
			*(long *)op = 0;
			
	} else if (in_minfo->type==_jit_sym_float32) 
	{
		//Process first pixel
		ip = bip;
		op = bop;
		line3 = ip + in_minfo->dimstride[1];
		
		if (*(float *)ip && (!*(float *)(ip+step) || !*(float *)line3 || !*(float *)(line3 + step)))
			*(float *)op = 1;
		else
			*(float *)op = 0;
		
		ip += step;
		op += step;
		line3 += step;
		
		//Process first line
		for (j=1;j<dim[0]-1;j++)
		{
			if (*(float *)ip && (!*(float *)(ip+step) || !*(float *)(ip-step) || !*(float *)(line3 - step) || !*(float *)line3 || !*(float *)(line3 + step)))
				*(float *)op = 1;
			else
				*(float *)op = 0;
			
			ip += step;
			op += step;
			line3 += step;
		}
		
		//Process last pixel of first line
		if (*(float *)ip && (!*(float *)(ip-step) || !*(float *)line3 || !*(float *)(line3 - step)))
			*(float *)op = 1;
		else
			*(float *)op = 0;
		
		//Process rest of image
		for(i=1;i<dim[1]-1;i++)
		{
			ip = bip + i * in_minfo->dimstride[1];;
			op = bop + i * out_minfo->dimstride[1];;
			line1 = ip - in_minfo->dimstride[1];;
			line3 = ip + in_minfo->dimstride[1];;
			
			//first pixel
			if (*(float *)ip && (!*(float *)(ip+step) || !*(float *)line3 || !*(float *)(line3 + step)|| !*(float *)line1 || !*(float *)(line1 + step)))
				*(float *)op = 1;
			else
				*(float *)op = 0;
				
			ip += step;
			op += step;
			line1 += step;
			line3 += step;
			
			//rest of line
			for (j=1;j<dim[0]-1;j++)
			{
				if (*(float *)ip && (!*(float *)(ip+step) || !*(float *)(ip-step) || !*(float *)(line3 - step) || !*(float *)line3 || !*(float *)(line3 + step)
					|| !*(float *)(line1 - step) || !*(float *)line1 || !*(float *)(line1 + step)))
					*(float *)op = 1;
				else
					*(float *)op = 0;
			
				ip += step;
				op += step;
				line1 += step;
				line3 += step;
			}
			
			//last pixel
			if (*(float *)ip && (!*(float *)(ip-step) || !*(float *)line3 || !*(float *)(line3 - step)|| !*(float *)line1 || !*(float *)(line1 - step)))
				*(float *)op = 1;
			else
				*(float *)op = 0;
		
		}
		
		ip = bip + height * in_minfo->dimstride[1];;
		op = bop + height * out_minfo->dimstride[1];;
		line1 = ip - in_minfo->dimstride[1];;
		
		//Process last line
		//first pixel
		if (*(float *)ip && (!*(float *)(ip+step) || !*(float *)line1 || !*(float *)(line1 + step)))
			*(float *)op = 1;
		else
			*(float *)op = 0;
		
		ip += step;
		op += step;
		line1 += step;
		
		//Process rest of last line
		for (j=1;j<dim[0]-1;j++)
		{
			if (*(float *)ip && (!*(float *)(ip+step) || !*(float *)(ip-step) || !*(float *)(line1 - step) || !*(float *)line1 || !*(float *)(line1 + step)))
				*(float *)op = 1;
			else
				*(float *)op = 0;
			
			ip += step;
			op += step;
			line1 += step;
		}
		
		//Process last pixel
		if (*(float *)ip && (!*(float *)(ip-step) || !*(float *)line1 || !*(float *)(line1 - step)))
			*(float *)op = 1;
		else
			*(float *)op = 0;
		
	} else if (in_minfo->type==_jit_sym_float64) 
	{
		//Process first pixel
		ip = bip;
		op = bop;
		line3 = ip + in_minfo->dimstride[1];
		
		if (*(double *)ip && (!*(double *)(ip+step) || !*(double *)line3 || !*(double *)(line3 + step)))
			*(double *)op = 1;
		else
			*(double *)op = 0;
		
		ip += step;
		op += step;
		line3 += step;
		
		//Process first line
		for (j=1;j<dim[0]-1;j++)
		{
			if (*(double *)ip && (!*(double *)(ip+step) || !*(double *)(ip-step) || !*(double *)(line3 - step) || !*(double *)line3 || !*(double *)(line3 + step)))
				*(double *)op = 1;
			else
				*(double *)op = 0;
			
			ip += step;
			op += step;
			line3 += step;
		}
		
		//Process last pixel of first line
		if (*(double *)ip && (!*(double *)(ip-step) || !*(double *)line3 || !*(double *)(line3 - step)))
			*(double *)op = 1;
		else
			*(double *)op = 0;
		
		//Process rest of image
		for(i=1;i<dim[1]-1;i++)
		{
			ip = bip + i * in_minfo->dimstride[1];;
			op = bop + i * out_minfo->dimstride[1];;
			line1 = ip - in_minfo->dimstride[1];;
			line3 = ip + in_minfo->dimstride[1];;
			
			//first pixel
			if (*(double *)ip && (!*(double *)(ip+step) || !*(double *)line3 || !*(double *)(line3 + step)|| !*(double *)line1 || !*(double *)(line1 + step)))
				*(double *)op = 1;
			else
				*(double *)op = 0;
				
			ip += step;
			op += step;
			line1 += step;
			line3 += step;
			
			//rest of line
			for (j=1;j<dim[0]-1;j++)
			{
				if (*(double *)ip && (!*(double *)(ip+step) || !*(double *)(ip-step) || !*(double *)(line3 - step) || !*(double *)line3 || !*(double *)(line3 + step)
					|| !*(double *)(line1 - step) || !*(double *)line1 || !*(double *)(line1 + step)))
					*(double *)op = 1;
				else
					*(double *)op = 0;
			
				ip += step;
				op += step;
				line1 += step;
				line3 += step;
			}
			
			//last pixel
			if (*(double *)ip && (!*(double *)(ip-step) || !*(double *)line3 || !*(double *)(line3 - step)|| !*(double *)line1 || !*(double *)(line1 - step)))
				*(double *)op = 1;
			else
				*(double *)op = 0;
		
		}
		
		ip = bip + height * in_minfo->dimstride[1];;
		op = bop + height * out_minfo->dimstride[1];;
		line1 = ip - in_minfo->dimstride[1];;
		
		//Process last line
		//first pixel
		if (*(double *)ip && (!*(double *)(ip+step) || !*(double *)line1 || !*(double *)(line1 + step)))
			*(double *)op = 1;
		else
			*(double *)op = 0;
		
		ip += step;
		op += step;
		line1 += step;
		
		//Process rest of last line
		for (j=1;j<dim[0]-1;j++)
		{
			if (*(double *)ip && (!*(double *)(ip+step) || !*(double *)(ip-step) || !*(double *)(line1 - step) || !*(double *)line1 || !*(double *)(line1 + step)))
				*(double *)op = 1;
			else
				*(double *)op = 0;
			
			ip += step;
			op += step;
			line1 += step;
		}
		
		//Process last pixel
		if (*(double *)ip && (!*(double *)(ip-step) || !*(double *)line1 || !*(double *)(line1 - step)))
			*(double *)op = 1;
		else
			*(double *)op = 0;
		
	}
}

t_cv_jit_binedge *cv_jit_binedge_new(void)
{
	t_cv_jit_binedge *x;
		
	if (x=(t_cv_jit_binedge *)jit_object_alloc(_cv_jit_binedge_class)) 
	{
		//Nothing to initialize
	} 
	else 
	{
		x = NULL;
	}	
	return x;
}

void cv_jit_binedge_free(t_cv_jit_binedge *x)
{
	//Nothing to release
}

