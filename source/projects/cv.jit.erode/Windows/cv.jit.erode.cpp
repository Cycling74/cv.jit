/*
cv.jit.erode
	

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

/*Note: This is the Windows implementation of the cv.jit.erode external.*/

#ifdef __cplusplus
extern "C" {
#endif

#include "jit.common.h"

#ifdef __cplusplus 
} //extern "C"
#endif

#include "jit.common.h"

typedef struct _cv_jit_erode 
{
	t_object				ob;
	long					mode;
	long					grey;
} t_cv_jit_erode;

void *_cv_jit_erode_class;

t_jit_err 		cv_jit_erode_init(void);
t_cv_jit_erode 		*cv_jit_erode_new(void);
void 			cv_jit_erode_free(t_cv_jit_erode *x);
t_jit_err 		cv_jit_erode_matrix_calc(t_cv_jit_erode *x, void *inputs, void *outputs);
void 			cv_jit_erode_calculate_ndim(t_cv_jit_erode *x, long dimcount, long *dim, long planecount, t_jit_matrix_info *in_minfo, uchar *bip, t_jit_matrix_info *out_minfo, uchar *bop);

t_jit_err cv_jit_erode_init(void) 
{
	long attrflags=0;
	t_jit_object *attr,*mop;
	
	_cv_jit_erode_class = jit_class_new("cv_jit_erode",(method)cv_jit_erode_new,(method)cv_jit_erode_free,sizeof(t_cv_jit_erode),A_CANT,0L); //A_CANT = untyped

	//add mop
	mop = (t_object *)jit_object_new(_jit_sym_jit_mop,1,1);
	jit_class_addadornment(_cv_jit_erode_class,mop);
	
	//add attributes
	// mode
	attrflags = JIT_ATTR_GET_DEFER_LOW | JIT_ATTR_SET_USURP_LOW;
	attr = (t_object *)jit_object_new(_jit_sym_jit_attr_offset,"mode",_jit_sym_long,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_erode,mode));
	jit_attr_addfilterset_clip(attr,0,1,TRUE,TRUE);	//clip to 0-1
	jit_class_addattr(_cv_jit_erode_class,attr);
	// binary/greyscale
	attr = (t_object *)jit_object_new(_jit_sym_jit_attr_offset,"greyscale",_jit_sym_long,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_erode,grey));
	jit_attr_addfilterset_clip(attr,0,1,TRUE,TRUE);	//clip to 0-1
	jit_class_addattr(_cv_jit_erode_class,attr);
	
	// binary/greyscale
	attr = (t_object *)jit_object_new(_jit_sym_jit_attr_offset,"grayscale",_jit_sym_long,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_erode,grey));
	jit_attr_addfilterset_clip(attr,0,1,TRUE,TRUE);	//clip to 0-1
	jit_class_addattr(_cv_jit_erode_class,attr);
	
	//add methods
	jit_class_addmethod(_cv_jit_erode_class, (method)cv_jit_erode_matrix_calc, "matrix_calc", A_CANT, 0L);
	
	jit_class_register(_cv_jit_erode_class);

	return JIT_ERR_NONE;
}


t_jit_err cv_jit_erode_matrix_calc(t_cv_jit_erode *x, void *inputs, void *outputs)
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
		cv_jit_erode_calculate_ndim(x, dimcount, dim, planecount, &in_minfo, in_bp, &out_minfo, out_bp);

	} else {
		return JIT_ERR_INVALID_PTR;
	}
	
out:
	jit_object_method(out_matrix,gensym("lock"),out_savelock);
	jit_object_method(in_matrix,gensym("lock"),in_savelock);
	return err;
}

//recursive function to handle higher dimension matrices, by processing 2D sections at a time 
void cv_jit_erode_calculate_ndim(t_cv_jit_erode *x, long dimcount, long *dim, long planecount, 
	t_jit_matrix_info *in_minfo, uchar *bip, t_jit_matrix_info *out_minfo, uchar *bop)
{
	long i,j,k,width,height,l;
	uchar *ip,*op,*line1,*line3;
	long stride,step;
		
	if (dimcount<1) return; //safety
	
	stride = in_minfo->dimstride[1];
	step = in_minfo->dimstride[0];
	
	if(x->grey == 0){
	
	switch(x->mode){
	case 0:	
		width  = dim[0] - 1;
		height = dim[1] - 1;
		
		if (in_minfo->type==_jit_sym_char) 
		{
			//Process first pixel
			ip = bip;
			op = bop;
			line3 = ip + in_minfo->dimstride[1];;
			
			
			if (*ip && *(ip+1) && *line3 && *(line3 + 1))
				*op = 255;
			else
				*op = 0;
			
			ip ++;
			op ++;
			line3 ++;
			
			//Process first line
			for (j=1;j<dim[0]-1;j++)
			{
				if (*(ip - 1) && *ip && *(ip + 1) &&
					*(line3 - 1) && *line3 && *(line3 + 1))
					*op = 255;
				else
					*op = 0;
				
				ip ++;
				op ++;
				line3 ++;
			}
			
			//Process last pixel of first line
			if (*ip && *(ip-1) && *line3 && *(line3 - 1))
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
				if (*line1 && *(line1+1) &&
					*ip && *(ip+1) &&
				 	*line3 && *(line3 + 1))
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
					if (*(line1 - 1) && *line1 && *(line1 + 1) &&
						*(ip - 1) && *ip && *(ip + 1) &&
						*(line3 - 1) && *line3 && *(line3 + 1))
						*op = 255;
					else
						*op = 0;
				
					ip ++;
					op ++;
					line1 ++;
					line3 ++;
				}
				
				//last pixel
				if (*line1 && *(line1-1) &&
					*ip && *(ip+1) &&
				 	*line3 && *(line3 - 1))
					*op = 255;
				else
					*op = 0;
			
			}
			
			ip = bip + height * in_minfo->dimstride[1];;
			op = bop + height * out_minfo->dimstride[1];;
			line1 = ip - in_minfo->dimstride[1];;
			
			//Process last line
			//first pixel
			if (*ip && *(ip+1) && *line1 && *(line1 + 1))
				*op = 255;
			else
				*op = 0;
			
			ip ++;
			op ++;
			line1 ++;
			
			//Process rest of last line
			for (j=1;j<dim[0]-1;j++)
			{
				if (*(ip - 1) && *ip && *(ip + 1) &&
					*(line1 - 1) && *line1 && *(line1 + 1))
					*op = 255;
				else
					*op = 0;
				
				ip ++;
				op ++;
				line1 ++;
			}
			
			//Process last pixel
			if (*ip && *(ip-1) && *line1 && *(line1 - 1))
				*op = 255;
			else
				*op = 0;
			
			
			
		} else if (in_minfo->type==_jit_sym_long) 
		{
			//Process first pixel
			ip = bip;
			op = bop;
			line3 = ip + in_minfo->dimstride[1];
			
			
			if (*(long *)ip && *(long *)(ip+step) && *(long *)line3 && *(long *)(line3 + step))
				*(long *)op = 1;
			else
				*(long *)op = 0;
			
			ip += step;
			op += step;
			line3 += step;
			
			//Process first line
			for (j=1;j<dim[0]-1;j++)
			{
				if (*(long *)(ip - step) && *(long *)ip && *(long *)(ip + step) &&
					*(long *)(line3 - step) && *(long *)line3 && *(long *)(line3 + step))
					*(long *)op = 1;
				else
					*(long *)op = 0;
				
				ip += step;
				op += step;
				line3 += step;
			}
			
			//Process last pixel of first line
			if (*(long *)ip && *(long *)(ip-step) && *(long *)line3 && *(long *)(line3 - step))
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
				if (*(long *)line1 && *(long *)(line1+step) &&
					*(long *)ip && *(long *)(ip+step) &&
				 	*(long *)line3 && *(long *)(line3 + step))
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
					if (*(long *)(line1 - step) && *(long *)line1 && *(long *)(line1 + step) &&
						*(long *)(ip - step) && *(long *)ip && *(long *)(ip + step) &&
						*(long *)(line3 - step) && *(long *)line3 && *(long *)(line3 + step))
						*(long *)op = 1;
					else
						*(long *)op = 0;
				
					ip += step;
					op += step;
					line1 += step;
					line3 += step;
				}
				
				//last pixel
				if (*(long *)line1 && *(long *)(line1-step) &&
					*(long *)ip && *(long *)(ip+step) &&
				 	*(long *)line3 && *(long *)(line3 - step))
					*(long *)op = 1;
				else
					*(long *)op = 0;
			
			}
			
			ip = bip + height * in_minfo->dimstride[1];;
			op = bop + height * out_minfo->dimstride[1];;
			line1 = ip - in_minfo->dimstride[1];;
			
			//Process last line
			//first pixel
			if (*(long *)ip && *(long *)(ip+step) && *(long *)line1 && *(long *)(line1 + step))
				*(long *)op = 1;
			else
				*(long *)op = 0;
			
			ip += step;
			op += step;
			line1 += step;
			
			//Process rest of last line
			for (j=1;j<dim[0]-1;j++)
			{
				if (*(long *)(ip - step) && *(long *)ip && *(long *)(ip + step) &&
					*(long *)(line1 - step) && *(long *)line1 && *(long *)(line1 + step))
					*(long *)op = 1;
				else
					*(long *)op = 0;
				
				ip += step;
				op += step;
				line1 += step;
			}
			
			//Process last pixel
			if (*(long *)ip && *(long *)(ip-step) && *(long *)line1 && *(long *)(line1 - step))
				*(long *)op = 1;
			else
				*(long *)op = 0;
				
		} else if (in_minfo->type==_jit_sym_float32) 
		{
			//Process first pixel
			ip = bip;
			op = bop;
			line3 = ip + in_minfo->dimstride[1];
			
			
			if (*(float *)ip && *(float *)(ip+step) && *(float *)line3 && *(float *)(line3 + step))
				*(float *)op = 1;
			else
				*(float *)op = 0;
			
			ip += step;
			op += step;
			line3 += step;
			
			//Process first line
			for (j=1;j<dim[0]-1;j++)
			{
				if (*(float *)(ip - step) && *(float *)ip && *(float *)(ip + step) &&
					*(float *)(line3 - step) && *(float *)line3 && *(float *)(line3 + step))
					*(float *)op = 1;
				else
					*(float *)op = 0;
				
				ip += step;
				op += step;
				line3 += step;
			}
			
			//Process last pixel of first line
			if (*(float *)ip && *(float *)(ip-step) && *(float *)line3 && *(float *)(line3 - step))
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
				if (*(float *)line1 && *(float *)(line1+step) &&
					*(float *)ip && *(float *)(ip+step) &&
				 	*(float *)line3 && *(float *)(line3 + step))
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
					if (*(float *)(line1 - step) && *(float *)line1 && *(float *)(line1 + step) &&
						*(float *)(ip - step) && *(float *)ip && *(float *)(ip + step) &&
						*(float *)(line3 - step) && *(float *)line3 && *(float *)(line3 + step))
						*(float *)op = 1;
					else
						*(float *)op = 0;
				
					ip += step;
					op += step;
					line1 += step;
					line3 += step;
				}
				
				//last pixel
				if (*(float *)line1 && *(float *)(line1-step) &&
					*(float *)ip && *(float *)(ip+step) &&
				 	*(float *)line3 && *(float *)(line3 - step))
					*(float *)op = 1;
				else
					*(float *)op = 0;
			
			}
			
			ip = bip + height * in_minfo->dimstride[1];;
			op = bop + height * out_minfo->dimstride[1];;
			line1 = ip - in_minfo->dimstride[1];;
			
			//Process last line
			//first pixel
			if (*(float *)ip && *(float *)(ip+step) && *(float *)line1 && *(float *)(line1 + step))
				*(float *)op = 1;
			else
				*(float *)op = 0;
			
			ip += step;
			op += step;
			line1 += step;
			
			//Process rest of last line
			for (j=1;j<dim[0]-1;j++)
			{
				if (*(float *)(ip - step) && *(float *)ip && *(float *)(ip + step) &&
					*(float *)(line1 - step) && *(float *)line1 && *(float *)(line1 + step))
					*(float *)op = 1;
				else
					*(float *)op = 0;
				
				ip += step;
				op += step;
				line1 += step;
			}
			
			//Process last pixel
			if (*(float *)ip && *(float *)(ip-step) && *(float *)line1 && *(float *)(line1 - step))
				*(float *)op = 1;
			else
				*(float *)op = 0;
			
		} else if (in_minfo->type==_jit_sym_float64) 
		{
			//Process first pixel
			ip = bip;
			op = bop;
			line3 = ip + in_minfo->dimstride[1];
			
			
			if (*(double *)ip && *(double *)(ip+step) && *(double *)line3 && *(double *)(line3 + step))
				*(double *)op = 1;
			else
				*(double *)op = 0;
			
			ip += step;
			op += step;
			line3 += step;
			
			//Process first line
			for (j=1;j<dim[0]-1;j++)
			{
				if (*(double *)(ip - step) && *(double *)ip && *(double *)(ip + step) &&
					*(double *)(line3 - step) && *(double *)line3 && *(double *)(line3 + step))
					*(double *)op = 1;
				else
					*(double *)op = 0;
				
				ip += step;
				op += step;
				line3 += step;
			}
			
			//Process last pixel of first line
			if (*(double *)ip && *(double *)(ip-step) && *(double *)line3 && *(double *)(line3 - step))
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
				if (*(double *)line1 && *(double *)(line1+step) &&
					*(double *)ip && *(double *)(ip+step) &&
				 	*(double *)line3 && *(double *)(line3 + step))
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
					if (*(double *)(line1 - step) && *(double *)line1 && *(double *)(line1 + step) &&
						*(double *)(ip - step) && *(double *)ip && *(double *)(ip + step) &&
						*(double *)(line3 - step) && *(double *)line3 && *(double *)(line3 + step))
						*(double *)op = 1;
					else
						*(double *)op = 0;
				
					ip += step;
					op += step;
					line1 += step;
					line3 += step;
				}
				
				//last pixel
				if (*(double *)line1 && *(double *)(line1 - step) &&
					*(double *)ip && *(double *)(ip+step) &&
				 	*(double *)line3 && *(double *)(line3 - step))
					*(double *)op = 1;
				else
					*(double *)op = 0;
			
			}
			
			ip = bip + height * in_minfo->dimstride[1];;
			op = bop + height * out_minfo->dimstride[1];;
			line1 = ip - in_minfo->dimstride[1];;
			
			//Process last line
			//first pixel
			if (*(double *)ip && *(double *)(ip+step) && *(double *)line1 && *(double *)(line1 + step))
				*(double *)op = 1;
			else
				*(double *)op = 0;
			
			ip += step;
			op += step;
			line1 += step;
			
			//Process rest of last line
			for (j=1;j<dim[0]-1;j++)
			{
				if (*(double *)(ip - step) && *(double *)ip && *(double *)(ip + step) &&
					*(double *)(line1 - step) && *(double *)line1 && *(double *)(line1 + step))
					*(double *)op = 1;
				else
					*(double *)op = 0;
				
				ip += step;
				op += step;
				line1 += step;
			}
			
			//Process last pixel
			if (*(double *)ip && *(double *)(ip-step) && *(double *)line1 && *(double *)(line1 - step))
				*(double *)op = 1;
			else
				*(double *)op = 0;
			
		}
		break;	
		
		//******************Cross****************************
		case 1:
		width  = dim[0] - 1;
		height = dim[1] - 1;
		
		if (in_minfo->type==_jit_sym_char) 
		{
			//Process first pixel
			ip = bip;
			op = bop;
			line3 = ip + in_minfo->dimstride[1];;
			
			
			if (*ip && *(ip+1) && *line3)
				*op = 255;
			else
				*op = 0;
			
			ip ++;
			op ++;
			line3 ++;
			
			//Process first line
			for (j=1;j<dim[0]-1;j++)
			{
				if (*(ip - 1) && *ip && *(ip + 1) &&
					*line3)
					*op = 255;
				else
					*op = 0;
				
				ip ++;
				op ++;
				line3 ++;
			}
			
			//Process last pixel of first line
			if (*ip && *(ip-1) && *line3)
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
				if (*line1 &&
					*ip && *(ip+1) &&
				 	*line3)
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
					if (*line1 &&
						*(ip - 1) && *ip && *(ip + 1) &&
						*line3)
						*op = 255;
					else
						*op = 0;
				
					ip ++;
					op ++;
					line1 ++;
					line3 ++;
				}
				
				//last pixel
				if (*line1 &&
					*ip && *(ip+1) &&
				 	*line3)
					*op = 255;
				else
					*op = 0;
			
			}
			
			ip = bip + height * in_minfo->dimstride[1];;
			op = bop + height * out_minfo->dimstride[1];;
			line1 = ip - in_minfo->dimstride[1];;
			
			//Process last line
			//first pixel
			if (*ip && *(ip+1) && *line1)
				*op = 255;
			else
				*op = 0;
			
			ip ++;
			op ++;
			line1 ++;
			
			//Process rest of last line
			for (j=1;j<dim[0]-1;j++)
			{
				if (*(ip - 1) && *ip && *(ip + 1) &&
					*line1)
					*op = 255;
				else
					*op = 0;
				
				ip ++;
				op ++;
				line1 ++;
			}
			
			//Process last pixel
			if (*ip && *(ip-1) && *line1)
				*op = 255;
			else
				*op = 0;
			
			
			
		} else if (in_minfo->type==_jit_sym_long) 
		{
			//Process first pixel
			ip = bip;
			op = bop;
			line3 = ip + in_minfo->dimstride[1];
			
			
			if (*(long *)ip && *(long *)(ip+step) && *(long *)line3)
				*(long *)op = 1;
			else
				*(long *)op = 0;
			
			ip += step;
			op += step;
			line3 += step;
			
			//Process first line
			for (j=1;j<dim[0]-1;j++)
			{
				if (*(long *)(ip - step) && *(long *)ip && *(long *)(ip + step) &&
					*(long *)line3)
					*(long *)op = 1;
				else
					*(long *)op = 0;
				
				ip += step;
				op += step;
				line3 += step;
			}
			
			//Process last pixel of first line
			if (*(long *)ip && *(long *)(ip-step) && *(long *)line3)
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
				if (*(long *)line1 &&
					*(long *)ip && *(long *)(ip+step) &&
				 	*(long *)line3)
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
					if (*(long *)line1 &&
						*(long *)(ip - step) && *(long *)ip && *(long *)(ip + step) &&
						*(long *)line3)
						*(long *)op = 1;
					else
						*(long *)op = 0;
				
					ip += step;
					op += step;
					line1 += step;
					line3 += step;
				}
				
				//last pixel
				if (*(long *)line1 &&
					*(long *)ip && *(long *)(ip+step) &&
				 	*(long *)line3)
					*(long *)op = 1;
				else
					*(long *)op = 0;
			
			}
			
			ip = bip + height * in_minfo->dimstride[1];;
			op = bop + height * out_minfo->dimstride[1];;
			line1 = ip - in_minfo->dimstride[1];;
			
			//Process last line
			//first pixel
			if (*(long *)ip && *(long *)(ip+step) && *(long *)line1)
				*(long *)op = 1;
			else
				*(long *)op = 0;
			
			ip += step;
			op += step;
			line1 += step;
			
			//Process rest of last line
			for (j=1;j<dim[0]-1;j++)
			{
				if (*(long *)ip && *(long *)(ip + step) &&
					*(long *)line1)
					*(long *)op = 1;
				else
					*(long *)op = 0;
				
				ip += step;
				op += step;
				line1 += step;
			}
			
			//Process last pixel
			if (*(long *)ip && *(long *)(ip-step) && *(long *)line1)
				*(long *)op = 1;
			else
				*(long *)op = 0;
				
		} else if (in_minfo->type==_jit_sym_float32) 
		{
			//Process first pixel
			ip = bip;
			op = bop;
			line3 = ip + in_minfo->dimstride[1];
			
			
			if (*(float *)ip && *(float *)(ip + step) && *(float *)line3)
				*(float *)op = 1;
			else
				*(float *)op = 0;
			
			ip += step;
			op += step;
			line3 += step;
			
			//Process first line
			for (j=1;j<dim[0]-1;j++)
			{
				if (*(float *)(ip - step) && *(float *)ip && *(float *)(ip + step) &&
					*(float *)line3)
					*(float *)op = 1;
				else
					*(float *)op = 0;
				
				ip += step;
				op += step;
				line3 += step;
			}
			
			//Process last pixel of first line
			if (*(float *)ip && *(float *)(ip - step) && *(float *)line3)
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
				if (*(float *)line1 &&
					*(float *)ip && *(float *)(ip + step) &&
				 	*(float *)line3)
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
					if (*(float *)line1 &&
						*(float *)(ip - step) && *(float *)ip && *(float *)(ip + step) &&
						*(float *)line3)
						*(float *)op = 1;
					else
						*(float *)op = 0;
				
					ip += step;
					op += step;
					line1 += step;
					line3 += step;
				}
				
				//last pixel
				if (*(float *)line1 &&
					*(float *)ip && *(float *)(ip - step) &&
				 	*(float *)line3)
					*(float *)op = 1;
				else
					*(float *)op = 0;
			
			}
			
			ip = bip + height * in_minfo->dimstride[1];;
			op = bop + height * out_minfo->dimstride[1];;
			line1 = ip - in_minfo->dimstride[1];;
			
			//Process last line
			//first pixel
			if (*(float *)ip && *(float *)(ip + step) && *(float *)line1)
				*(float *)op = 1;
			else
				*(float *)op = 0;
			
			ip += step;
			op += step;
			line1 += step;
			
			//Process rest of last line
			for (j=1;j<dim[0]-1;j++)
			{
				if (*(float *)(ip - step) && *(float *)ip && *(float *)(ip + step) &&
					*(float *)line1)
					*(float *)op = 1;
				else
					*(float *)op = 0;
				
				ip += step;
				op += step;
				line1 += step;
			}
			
			//Process last pixel
			if (*(float *)ip && *(float *)(ip - step) && *(float *)line1)
				*(float *)op = 1;
			else
				*(float *)op = 0;
			
		} else if (in_minfo->type==_jit_sym_float64) 
		{
			//Process first pixel
			ip = bip;
			op = bop;
			line3 = ip + in_minfo->dimstride[1];
			
			
			if (*(double *)ip && *(double *)(ip + step) && *(double *)line3)
				*(double *)op = 1;
			else
				*(double *)op = 0;
			
			ip += step;
			op += step;
			line3 += step;
			
			//Process first line
			for (j=1;j<dim[0]-1;j++)
			{
				if (*(double *)(ip - step) && *(double *)ip && *(double *)(ip + step) &&
					*(double *)line3)
					*(double *)op = 1;
				else
					*(double *)op = 0;
				
				ip += step;
				op += step;
				line3 += step;
			}
			
			//Process last pixel of first line
			if (*(double *)ip && *(double *)(ip - step) && *(double *)line3)
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
				if (*(double *)line1 &&
					*(double *)ip && *(double *)(ip + step) &&
				 	*(double *)line3)
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
					if (*(double *)line1 &&
						*(double *)(ip - step) && *(double *)ip && *(double *)(ip + step) &&
						*(double *)line3)
						*(double *)op = 1;
					else
						*(double *)op = 0;
				
					ip += step;
					op += step;
					line1 += step;
					line3 += step;
				}
				
				//last pixel
				if (*(double *)line1 &&
					*(double *)ip && *(double *)(ip - step) &&
				 	*(double *)line3)
					*(double *)op = 1;
				else
					*(double *)op = 0;
			
			}
			
			ip = bip + height * in_minfo->dimstride[1];;
			op = bop + height * out_minfo->dimstride[1];;
			line1 = ip - in_minfo->dimstride[1];;
			
			//Process last line
			//first pixel
			if (*(double *)ip && *(double *)(ip + step) && *(double *)line1)
				*(double *)op = 1;
			else
				*(double *)op = 0;
			
			ip += step;
			op += step;
			line1 += step;
			
			//Process rest of last line
			for (j=1;j<dim[0]-1;j++)
			{
				if (*(double *)(ip - step) && *(double *)ip && *(double *)(ip + step) &&
					*(double *)line1)
					*(double *)op = 1;
				else
					*(double *)op = 0;
				
				ip += step;
				op += step;
				line1 += step;
			}
			
			//Process last pixel
			if (*(double *)ip && *(double *)(ip - step) && *(double *)line1)
				*(double *)op = 1;
			else
				*(double *)op = 0;
			
		}
		break;	
	}
	}
	
	/******************        GREYSCALE         ***************************/
	
	else if (x->grey == 1){
	
		switch(x->mode){
		
		case 0:
		width  = dim[0] - 1;
		height = dim[1] - 1;

		if (in_minfo->type==_jit_sym_char) {
			//Process first pixel
			ip = bip;
			op = bop;
			line3 = ip + in_minfo->dimstride[1];;
			
			*op = 	MIN(*ip,
					MIN(*(ip + step),
					MIN(*line3,*(line3 + step))));
			
			ip += step;
			op += step;
			line3 += step;
			
			//Process first line
			for (j=1;j<dim[0]-1;j++)
			{
				*op = 	MIN(*(ip - step), 
						MIN(*ip,	
						MIN(*(ip + step),
						MIN(*(line3 - step),
						MIN(*line3,*(line3 + step))))));
		
				ip += step;
				op += step;
				line3 += step;
			}
			
			//Process last pixel of first line
			*op = MIN(*ip,MIN(*(ip - step),MIN(*line3,*(line3 - step))));
			
			//Process rest of image
			for(i=1;i<dim[1]-1;i++)
			{
				ip = bip + i * in_minfo->dimstride[1];;
				op = bop + i * out_minfo->dimstride[1];;
				line1 = ip - in_minfo->dimstride[1];;
				line3 = ip + in_minfo->dimstride[1];;
				
				//first pixel
				*op = MIN(*line1,MIN(*(line1 + step),MIN(*ip,MIN(*(ip + step),MIN(*line3,*(line3 + step))))));
					
				ip += step;
				op += step;
				line1 += step;
				line3 += step;
				
				//rest of line
				for (j=1;j<dim[0]-1;j++)
				{
					*op = 	MIN(*(line1 - step),
							MIN(*line1,
							MIN( *(line1 + step),
							MIN(*(ip - step),
							MIN(*ip,
							MIN(*(ip + step),
							MIN(*(line3 - step),
							MIN(*line3, *(line3 + step)))))))));
					
					ip += step;
					op += step;
					line1 += step;
					line3 += step;
				}
				
				//last pixel
				*op = 	MIN(*(line1 - step),
						MIN(*line1,
						MIN(*(ip - step),
						MIN(*ip,
						MIN(*(line3 - step),*line3)))));
			
			}
			
			ip = bip + height * in_minfo->dimstride[1];;
			op = bop + height * out_minfo->dimstride[1];;
			line1 = ip - in_minfo->dimstride[1];;
			
			//Process last line
			//first pixel
			*op = 	MIN(*(line1 + step),
					MIN(*line1,
					MIN(*(ip + step),*ip)));
			
			ip += step;
			op += step;
			line1 += step;
			
			//Process rest of last line
			for (j=1;j<dim[0]-1;j++)
			{
				*op = 	MIN(*(line1 - step),
						MIN(*line1,
						MIN(*(ip - step),
						MIN(*ip,
						MIN(*(line1 + step),*(ip + step))))));
				
				ip += step;
				op += step;
				line1 += step;
			}
			
			//Process last pixel
			*op = 	MIN(*(line1 - step),
					MIN(*line1,
					MIN(*(ip - step),*ip)));
		}
		
		else if (in_minfo->type==_jit_sym_long) {
			//Process first pixel
			ip = bip;
			op = bop;
			line3 = ip + in_minfo->dimstride[1];;
			
			*(long *)op = 	MIN(*(long *)ip,
							MIN(*(long *)(ip + step),
							MIN(*(long *)line3,*(long *)(line3 + step))));
			
			ip += step;
			op += step;
			line3 += step;
			
			//Process first line
			for (j=1;j<dim[0]-1;j++)
			{
				*(long *)op = 	MIN(*(long *)(ip - step), 
						MIN(*(long *)ip,	
						MIN(*(long *)(ip + step),
						MIN(*(long *)(line3 - step),
						MIN(*(long *)line3,*(long *)(line3 + step))))));
		
				ip += step;
				op += step;
				line3 += step;
			}
			
			//Process last pixel of first line
			*(long *)op = 	MIN(*(long *)ip,
					MIN(*(long *)(ip - step),
					MIN(*(long *)line3,*(long *)(line3 - step))));
			
			//Process rest of image
			for(i=1;i<dim[1]-1;i++)
			{
				ip = bip + i * in_minfo->dimstride[1];;
				op = bop + i * out_minfo->dimstride[1];;
				line1 = ip - in_minfo->dimstride[1];;
				line3 = ip + in_minfo->dimstride[1];;
				
				//first pixel
				*(long *)op = 	MIN(*(long *)line1,
						MIN(*(long *)(line1 + step),
						MIN(*(long *)ip,
						MIN(*(long *)(ip + step),
						MIN(*(long *)line3,*(long *)(line3 + step))))));
					
				ip += step;
				op += step;
				line1 += step;
				line3 += step;
				
				//rest of line
				for (j=1;j<dim[0]-1;j++)
				{
					*(long *)op = 	MIN(*(long *)(line1 - step),
							MIN(*(long *)line1,
							MIN(*(long *)(line1 + step),
							MIN(*(long *)(ip - step),
							MIN(*(long *)ip,
							MIN(*(long *)(ip + step),
							MIN(*(long *)(line3 - step),
							MIN(*(long *)line3, *(long *)(line3 + step)))))))));
					
					ip += step;
					op += step;
					line1 += step;
					line3 += step;
				}
				
				//last pixel
				*(long *)op = 	MIN(*(long *)(line1 - step),
						MIN(*(long *)line1,
						MIN(*(long *)(ip - step),
						MIN(*(long *)ip,
						MIN(*(long *)(line3 - step),*(long *)line3)))));
			
			}
			
			ip = bip + height * in_minfo->dimstride[1];;
			op = bop + height * out_minfo->dimstride[1];;
			line1 = ip - in_minfo->dimstride[1];;
			
			//Process last line
			//first pixel
			*(long *)op = 	MIN(*(long *)(line1 + step),
					MIN(*(long *)line1,
					MIN(*(long *)(ip + step),*(long *)ip)));
			
			ip += step;
			op += step;
			line1 += step;
			
			//Process rest of last line
			for (j=1;j<dim[0]-1;j++)
			{
				*(long *)op = 	MIN(*(long *)(line1 - step),
						MIN(*(long *)line1,
						MIN(*(long *)(ip - step),
						MIN(*(long *)ip,
						MIN(*(long *)(line1 + step),*(long *)(ip + step))))));
				
				ip += step;
				op += step;
				line1 += step;
			}
			
			//Process last pixel
			*(long *)op = 	MIN(*(long *)(line1 - step),
					MIN(*(long *)line1,
					MIN(*(long *)(ip - step),*(long *)ip)));
		}
		
		
		else if (in_minfo->type==_jit_sym_float32) {
			//Process first pixel
			ip = bip;
			op = bop;
			line3 = ip + in_minfo->dimstride[1];;
			
			*(float *)op = 	MIN(*(float *)ip,
					MIN(*(float *)(ip + step),
					MIN(*(float *)line3,*(float *)(line3 + step))));
			
			ip += step;
			op += step;
			line3 += step;
			
			//Process first line
			for (j=1;j<dim[0]-1;j++)
			{
				*(float *)op = 	MIN(*(float *)(ip - step), 
						MIN(*(float *)ip,	
						MIN(*(float *)(ip + step),
						MIN(*(float *)(line3 - step),
						MIN(*(float *)line3,*(float *)(line3 + step))))));
		
				ip += step;
				op += step;
				line3 += step;
			}
			
			//Process last pixel of first line
			*(float *)op = 	MIN(*(float *)ip,
					MIN(*(float *)(ip - step),
					MIN(*(float *)line3,*(float *)(line3 - step))));
			
			//Process rest of image
			for(i=1;i<dim[1]-1;i++)
			{
				ip = bip + i * in_minfo->dimstride[1];;
				op = bop + i * out_minfo->dimstride[1];;
				line1 = ip - in_minfo->dimstride[1];;
				line3 = ip + in_minfo->dimstride[1];;
				
				//first pixel
				*(float *)op = 	MIN(*(float *)line1,
						MIN(*(float *)(line1 + step),
						MIN(*(float *)ip,
						MIN(*(float *)(ip + step),
						MIN(*(float *)line3,*(float *)(line3 + step))))));
					
				ip += step;
				op += step;
				line1 += step;
				line3 += step;
				
				//rest of line
				for (j=1;j<dim[0]-1;j++)
				{
					*(float *)op = 	MIN(*(float *)(line1 - step),
							MIN(*(float *)line1,
							MIN(*(float *)(line1 + step),
							MIN(*(float *)(ip - step),
							MIN(*(float *)ip,
							MIN(*(float *)(ip + step),
							MIN(*(float *)(line3 - step),
							MIN(*(float *)line3, *(float *)(line3 + step)))))))));
					
					ip += step;
					op += step;
					line1 += step;
					line3 += step;
				}
				
				//last pixel
				*(float *)op = 	MIN(*(float *)(line1 - step),
						MIN(*(float *)line1,
						MIN(*(float *)(ip - step),
						MIN(*(float *)ip,
						MIN(*(float *)(line3 - step),*(float *)line3)))));
			
			}
			
			ip = bip + height * in_minfo->dimstride[1];;
			op = bop + height * out_minfo->dimstride[1];;
			line1 = ip - in_minfo->dimstride[1];;
			
			//Process last line
			//first pixel
			*(float *)op = 	MIN(*(float *)(line1 + step),
					MIN(*(float *)line1,
					MIN(*(float *)(ip + step),*(float *)ip)));
			
			ip += step;
			op += step;
			line1 += step;
			
			//Process rest of last line
			for (j=1;j<dim[0]-1;j++)
			{
				*(float *)op = 	MIN(*(float *)(line1 - step),
						MIN(*(float *)line1,
						MIN(*(float *)(ip - step),
						MIN(*(float *)ip,
						MIN(*(float *)(line1 + step),*(float *)(ip + step))))));
				
				ip += step;
				op += step;
				line1 += step;
			}
			
			//Process last pixel
			*(float *)op = 	MIN(*(float *)(line1 - step),
					MIN(*(float *)line1,
					MIN(*(float *)(ip - step),*(float *)ip)));
		}
		
		else if (in_minfo->type==_jit_sym_float64) {
			//Process first pixel
			ip = bip;
			op = bop;
			line3 = ip + in_minfo->dimstride[1];;
			
			*(double *)op = 	MIN(*(double *)ip,
					MIN(*(double *)(ip + step),
					MIN(*(double *)line3,*(double *)(line3 + step))));
			
			ip += step;
			op += step;
			line3 += step;
			
			//Process first line
			for (j=1;j<dim[0]-1;j++)
			{
				*(double *)op = 	MIN(*(double *)(ip - step), 
						MIN(*(double *)ip,	
						MIN(*(double *)(ip + step),
						MIN(*(double *)(line3 - step),
						MIN(*(double *)line3,*(double *)(line3 + step))))));
		
				ip += step;
				op += step;
				line3 += step;
			}
			
			//Process last pixel of first line
			*(double *)op = 	MIN(*(double *)ip,
					MIN(*(double *)(ip - step),
					MIN(*(double *)line3,*(double *)(line3 - step))));
			
			//Process rest of image
			for(i=1;i<dim[1]-1;i++)
			{
				ip = bip + i * in_minfo->dimstride[1];;
				op = bop + i * out_minfo->dimstride[1];;
				line1 = ip - in_minfo->dimstride[1];;
				line3 = ip + in_minfo->dimstride[1];;
				
				//first pixel
				*(double *)op = 	MIN(*(double *)line1,
						MIN(*(double *)(line1 + step),
						MIN(*(double *)ip,
						MIN(*(double *)(ip + step),
						MIN(*(double *)line3,*(double *)(line3 + step))))));
					
				ip += step;
				op += step;
				line1 += step;
				line3 += step;
				
				//rest of line
				for (j=1;j<dim[0]-1;j++)
				{
					*(double *)op = 	MIN(*(double *)(line1 - step),
							MIN(*(double *)line1,
							MIN(*(double *)(line1 + step),
							MIN(*(double *)(ip - step),
							MIN(*(double *)ip,
							MIN(*(double *)(ip + step),
							MIN(*(double *)(line3 - step),
							MIN(*(double *)line3, *(double *)(line3 + step)))))))));
					
					ip += step;
					op += step;
					line1 += step;
					line3 += step;
				}
				
				//last pixel
				*(double *)op = 	MIN(*(double *)(line1 - step),
						MIN(*(double *)line1,
						MIN(*(double *)(ip - step),
						MIN(*(double *)ip,
						MIN(*(double *)(line3 - step),*(double *)line3)))));
			
			}
			
			ip = bip + height * in_minfo->dimstride[1];;
			op = bop + height * out_minfo->dimstride[1];;
			line1 = ip - in_minfo->dimstride[1];;
			
			//Process last line
			//first pixel
			*(double *)op = 	MIN(*(double *)(line1 + step),
					MIN(*(double *)line1,
					MIN(*(double *)(ip + step),*(double *)ip)));
			
			ip += step;
			op += step;
			line1 += step;
			
			//Process rest of last line
			for (j=1;j<dim[0]-1;j++)
			{
				*(double *)op = 	MIN(*(double *)(line1 - step),
						MIN(*(double *)line1,
						MIN(*(double *)(ip - step),
						MIN(*(double *)ip,
						MIN(*(double *)(line1 + step),*(double *)(ip + step))))));
				
				ip += step;
				op += step;
				line1 += step;
			}
			
			//Process last pixel
			*(double *)op = 	MIN(*(double *)(line1 - step),
					MIN(*(double *)line1,
					MIN(*(double *)(ip - step),*(double *)ip)));
		}
		break;
		
		case 1:
		width  = dim[0] - 1;
		height = dim[1] - 1;

		if (in_minfo->type==_jit_sym_char) {
			//Process first pixel
			ip = bip;
			op = bop;
			line3 = ip + in_minfo->dimstride[1];;
			
			*op = 	MIN(*ip,
					MIN(*(ip + step),*line3));
			
			ip += step;
			op += step;
			line3 += step;
			
			//Process first line
			for (j=1;j<dim[0]-1;j++)
			{
				*op = 	MIN(*(ip - step), 
						MIN(*ip,	
						MIN(*(ip + step),*line3)));
		
				ip += step;
				op += step;
				line3 += step;
			}
			
			//Process last pixel of first line
			*op = 	MIN(*ip,
					MIN(*(ip - step),*line3));
			
			//Process rest of image
			for(i=1;i<dim[1]-1;i++)
			{
				ip = bip + i * in_minfo->dimstride[1];;
				op = bop + i * out_minfo->dimstride[1];;
				line1 = ip - in_minfo->dimstride[1];;
				line3 = ip + in_minfo->dimstride[1];;
				
				//first pixel
				*op = 	MIN(*line1,
						MIN(*ip,
						MIN(*(ip + step),*line3)));
					
				ip += step;
				op += step;
				line1 += step;
				line3 += step;
				
				//rest of line
				for (j=1;j<dim[0]-1;j++)
				{
					*op = 	MIN(*line1,
							MIN(*(ip - step),
							MIN(*ip,
							MIN(*(ip + step),*line3))));
					
					ip += step;
					op += step;
					line1 += step;
					line3 += step;
				}
				
				//last pixel
				*op = 	MIN(*line1,
						MIN(*(ip - step),
						MIN(*ip,*line3)));
			
			}
			
			ip = bip + height * in_minfo->dimstride[1];;
			op = bop + height * out_minfo->dimstride[1];;
			line1 = ip - in_minfo->dimstride[1];;
			
			//Process last line
			//first pixel
			*op = 	MIN(*line1,
					MIN(*(ip + step),*ip));
			
			ip += step;
			op += step;
			line1 += step;
			
			//Process rest of last line
			for (j=1;j<dim[0]-1;j++)
			{
				*op = 	MIN(*line1,
						MIN(*(ip - step),
						MIN(*ip,*(ip + step))));
				
				ip += step;
				op += step;
				line1 += step;
			}
			
			//Process last pixel
			*op = 	MIN(*line1,
					MIN(*(ip - step),*ip));
		}
		
		else if (in_minfo->type==_jit_sym_long) {
			//Process first pixel
			ip = bip;
			op = bop;
			line3 = ip + in_minfo->dimstride[1];;
			
			*(long *)op = 	MIN(*(long *)ip,
					MIN(*(long *)(ip + step),*(long *)line3));
			
			ip += step;
			op += step;
			line3 += step;
			
			//Process first line
			for (j=1;j<dim[0]-1;j++)
			{
				*(long *)op = 	MIN(*(long *)(ip - step), 
						MIN(*(long *)ip,	
						MIN(*(long *)(ip + step),*(long *)line3)));
		
				ip += step;
				op += step;
				line3 += step;
			}
			
			//Process last pixel of first line
			*(long *)op = 	MIN(*(long *)ip,
					MIN(*(long *)(ip - step),*(long *)line3));
			
			//Process rest of image
			for(i=1;i<dim[1]-1;i++)
			{
				ip = bip + i * in_minfo->dimstride[1];;
				op = bop + i * out_minfo->dimstride[1];;
				line1 = ip - in_minfo->dimstride[1];;
				line3 = ip + in_minfo->dimstride[1];;
				
				//first pixel
				*(long *)op = 	MIN(*(long *)line1,
						MIN(*(long *)ip,
						MIN(*(long *)(ip + step),*(long *)line3)));
					
				ip += step;
				op += step;
				line1 += step;
				line3 += step;
				
				//rest of line
				for (j=1;j<dim[0]-1;j++)
				{
					*(long *)op = 	MIN(*(long *)line1,
							MIN(*(long *)(ip - step),
							MIN(*(long *)ip,
							MIN(*(long *)(ip + step),*(long *)line3))));
					
					ip += step;
					op += step;
					line1 += step;
					line3 += step;
				}
				
				//last pixel
				*(long *)op = 	MIN(*(long *)line1,
						MIN(*(long *)(ip - step),
						MIN(*(long *)ip,*(long *)line3)));
			
			}
			
			ip = bip + height * in_minfo->dimstride[1];;
			op = bop + height * out_minfo->dimstride[1];;
			line1 = ip - in_minfo->dimstride[1];;
			
			//Process last line
			//first pixel
			*(long *)op = 	MIN(*(long *)line1,
					MIN(*(long *)(ip + step),*(long *)ip));
			
			ip += step;
			op += step;
			line1 += step;
			
			//Process rest of last line
			for (j=1;j<dim[0]-1;j++)
			{
				*(long *)op = 	MIN(*(long *)line1,
						MIN(*(long *)(ip - step),
						MIN(*(long *)ip,*(long *)(ip + step))));
				
				ip += step;
				op += step;
				line1 += step;
			}
			
			//Process last pixel
			*(long *)op = 	MIN(*(long *)line1,
					MIN(*(long *)(ip - step),*(long *)ip));
		}
		
		
		else if (in_minfo->type==_jit_sym_float32) {
			//Process first pixel
			ip = bip;
			op = bop;
			line3 = ip + in_minfo->dimstride[1];;
			
			*(float *)op = 	MIN(*(float *)ip,
					MIN(*(float *)(ip + step),*(float *)line3));
			
			ip += step;
			op += step;
			line3 += step;
			
			//Process first line
			for (j=1;j<dim[0]-1;j++)
			{
				*(float *)op = 	MIN(*(float *)(ip - step), 
						MIN(*(float *)ip,	
						MIN(*(float *)(ip + step),*(float *)line3)));
		
				ip += step;
				op += step;
				line3 += step;
			}
			
			//Process last pixel of first line
			*(float *)op = 	MIN(*(float *)ip,
					MIN(*(float *)(ip - step),*(float *)line3));
			
			//Process rest of image
			for(i=1;i<dim[1]-1;i++)
			{
				ip = bip + i * in_minfo->dimstride[1];;
				op = bop + i * out_minfo->dimstride[1];;
				line1 = ip - in_minfo->dimstride[1];;
				line3 = ip + in_minfo->dimstride[1];;
				
				//first pixel
				*(float *)op = 	MIN(*(float *)line1,
						MIN(*(float *)ip,
						MIN(*(float *)(ip + step),*(float *)line3)));
					
				ip += step;
				op += step;
				line1 += step;
				line3 += step;
				
				//rest of line
				for (j=1;j<dim[0]-1;j++)
				{
					*(float *)op = 	MIN(*(float *)line1,
							MIN(*(float *)(ip - step),
							MIN(*(float *)ip,
							MIN(*(float *)(ip + step),*(float *)line3))));
					
					ip += step;
					op += step;
					line1 += step;
					line3 += step;
				}
				
				//last pixel
				*(float *)op = 	MIN(*(float *)line1,
						MIN(*(float *)(ip - step),
						MIN(*(float *)ip,*(float *)line3)));
			
			}
			
			ip = bip + height * in_minfo->dimstride[1];;
			op = bop + height * out_minfo->dimstride[1];;
			line1 = ip - in_minfo->dimstride[1];;
			
			//Process last line
			//first pixel
			*(float *)op = 	MIN(*(float *)line1,
					MIN(*(float *)(ip + step),*(float *)ip));
			
			ip += step;
			op += step;
			line1 += step;
			
			//Process rest of last line
			for (j=1;j<dim[0]-1;j++)
			{
				*(float *)op = 	MIN(*(float *)line1,
						MIN(*(float *)(ip - step),
						MIN(*(float *)ip,*(float *)(ip + step))));
				
				ip += step;
				op += step;
				line1 += step;
			}
			
			//Process last pixel
			*(float *)op = 	MIN(*(float *)line1,
					MIN(*(float *)(ip - step),*(float *)ip));
		}
		
		else if (in_minfo->type==_jit_sym_float64) {
			//Process first pixel
			ip = bip;
			op = bop;
			line3 = ip + in_minfo->dimstride[1];;
			
			*(double *)op = 	MIN(*(double *)ip,
					MIN(*(double *)(ip + step),*(double *)line3));
			
			ip += step;
			op += step;
			line3 += step;
			
			//Process first line
			for (j=1;j<dim[0]-1;j++)
			{
				*(double *)op = 	MIN(*(double *)(ip - step), 
						MIN(*(double *)ip,	
						MIN(*(double *)(ip + step),*(double *)line3)));
		
				ip += step;
				op += step;
				line3 += step;
			}
			
			//Process last pixel of first line
			*(double *)op = 	MIN(*(double *)ip,
					MIN(*(double *)(ip - step),*(double *)line3));
			
			//Process rest of image
			for(i=1;i<dim[1]-1;i++)
			{
				ip = bip + i * in_minfo->dimstride[1];;
				op = bop + i * out_minfo->dimstride[1];;
				line1 = ip - in_minfo->dimstride[1];;
				line3 = ip + in_minfo->dimstride[1];;
				
				//first pixel
				*(double *)op = 	MIN(*(double *)line1,
						MIN(*(double *)ip,
						MIN(*(double *)(ip + step),*(double *)line3)));
					
				ip += step;
				op += step;
				line1 += step;
				line3 += step;
				
				//rest of line
				for (j=1;j<dim[0]-1;j++)
				{
					*(double *)op = 	MIN(*(double *)line1,
							MIN(*(double *)(ip - step),
							MIN(*(double *)ip,
							MIN(*(double *)(ip + step),*(double *)line3))));
					
					ip += step;
					op += step;
					line1 += step;
					line3 += step;
				}
				
				//last pixel
				*(double *)op = 	MIN(*(double *)line1,
						MIN(*(double *)(ip - step),
						MIN(*(double *)ip,*(double *)line3)));
			
			}
			
			ip = bip + height * in_minfo->dimstride[1];;
			op = bop + height * out_minfo->dimstride[1];;
			line1 = ip - in_minfo->dimstride[1];;
			
			//Process last line
			//first pixel
			*(double *)op = 	MIN(*(double *)line1,
					MIN(*(double *)(ip + step),*(double *)ip));
			
			ip += step;
			op += step;
			line1 += step;
			
			//Process rest of last line
			for (j=1;j<dim[0]-1;j++)
			{
				*(double *)op = 	MIN(*(double *)line1,
						MIN(*(double *)(ip - step),
						MIN(*(double *)ip,*(double *)(ip + step))));
				
				ip += step;
				op += step;
				line1 += step;
			}
			
			//Process last pixel
			*(double *)op = 	MIN(*(double *)line1,
					MIN(*(double *)(ip - step),*(double *)ip));
		}
		break;
		
	}
	}
}

t_cv_jit_erode *cv_jit_erode_new(void)
{
	t_cv_jit_erode *x;
		
	if (x=(t_cv_jit_erode *)jit_object_alloc(_cv_jit_erode_class)) 
	{
		x->mode = 0;
		x->grey = 0;
		
	} 
	else 
	{
		x = NULL;
	}	
	return x;
}

void cv_jit_erode_free(t_cv_jit_erode *x)
{
	//nothing to free
}

