/*
cv.jit.ravg
	

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

#include "cvjitVectorOps.h"

typedef struct _cv_jit_ravg 
{
	t_object				ob;
	t_jit_matrix_info	previousInfo;
	float				*buffer;
	long					buf_size;
	double				alpha;
	void				*bufMat;
} t_cv_jit_ravg;

void *_cv_jit_ravg_class;

t_jit_err 		cv_jit_ravg_init(void);
t_cv_jit_ravg 		*cv_jit_ravg_new(void);
void 			cv_jit_ravg_free(t_cv_jit_ravg *x);
t_jit_err 		cv_jit_ravg_matrix_calc(t_cv_jit_ravg *x, void *inputs, void *outputs);
void cv_jit_ravg_calculate_ndim(t_cv_jit_ravg *x, long dimcount, long *dim, long planecount, 
	t_jit_matrix_info *in_minfo, uchar *bip, t_jit_matrix_info *out_minfo, uchar *bop, t_jit_matrix_info *buf_minfo, uchar *bbp);
	


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

t_jit_err cv_jit_ravg_matrix_calc(t_cv_jit_ravg *x, void *inputs, void *outputs)
{
	t_jit_err err=JIT_ERR_NONE;
	long in_savelock,out_savelock, buf_savelock;
	t_jit_matrix_info in_minfo,out_minfo, buf_minfo;
	char *in_bp,*out_bp, *buf_bp;
	long i,dimcount,planecount,dim[JIT_MATRIX_MAX_DIMCOUNT];
	void *in_matrix,*out_matrix;
	
	in_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);
	out_matrix 	= jit_object_method(outputs,_jit_sym_getindex,0);

	if (x&&in_matrix&&out_matrix) {
		
		in_savelock = (long) jit_object_method(in_matrix,_jit_sym_lock,1);
		out_savelock = (long) jit_object_method(out_matrix,_jit_sym_lock,1);
		buf_savelock = (long) jit_object_method(x->bufMat,_jit_sym_lock,1);
		
		jit_object_method(in_matrix,_jit_sym_getinfo,&in_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);
		
		jit_object_method(x->bufMat,_jit_sym_getinfo,&buf_minfo);
		
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
		
		if(in_minfo.size != out_minfo.size){
			err=JIT_ERR_GENERIC;
			error("Mismatched sizes");
			goto out;
		}
		
		//Check to see if internal buffer dimensions are still valid
		if((in_minfo.type == _jit_sym_char)||(in_minfo.type == _jit_sym_long)){
			if ((buf_minfo.planecount != planecount)||(buf_minfo.dimcount != dimcount)) {
				buf_minfo.dimcount = dimcount;
				buf_minfo.planecount = planecount;
				for(i=0;i<dimcount;i++)buf_minfo.dim[i] = dim[i];
				jit_object_method(x->bufMat,_jit_sym_setinfo,&buf_minfo);
				jit_object_method(x->bufMat,_jit_sym_getinfo,&buf_minfo);
				jit_object_method(x->bufMat,_jit_sym_clear);
			}else{
				for(i=0;i<dimcount;i++){
					if (dim[i] != buf_minfo.dim[i]) {
						buf_minfo.dimcount = dimcount;
						buf_minfo.planecount = planecount;
						for(i=0;i<dimcount;i++)buf_minfo.dim[i] = dim[i];
						jit_object_method(x->bufMat,_jit_sym_setinfo,&buf_minfo);
						jit_object_method(x->bufMat,_jit_sym_getinfo,&buf_minfo);
						jit_object_method(x->bufMat,_jit_sym_clear);
						break;
					}
				}
			}
		}
		
		jit_object_method(in_matrix,_jit_sym_getdata,&in_bp);
		jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);
		jit_object_method(x->bufMat,_jit_sym_getdata,&buf_bp);
		
		if (!in_bp) { err=JIT_ERR_INVALID_INPUT; goto out;}
		if (!out_bp) { err=JIT_ERR_INVALID_OUTPUT; goto out;}
		if (!buf_bp) { err=JIT_ERR_INVALID_PTR; goto out;}
		
		//calculate
		jit_parallel_ndim_simplecalc3((method)cv_jit_ravg_calculate_ndim, x, dimcount, dim, planecount, &in_minfo, in_bp, &out_minfo, out_bp, &buf_minfo, buf_bp, 0, 0, 0);
	} else {
		return JIT_ERR_INVALID_PTR;
	}
	
out:
	jit_object_method(out_matrix,gensym("lock"),out_savelock);
	jit_object_method(in_matrix,gensym("lock"),in_savelock);
	jit_object_method(x->bufMat,gensym("lock"),buf_savelock);
	return err;
}

void cv_jit_ravg_calculate_ndim(t_cv_jit_ravg *x, long dimcount, long *dim, long planecount, 
	t_jit_matrix_info *in_minfo, uchar *bip, t_jit_matrix_info *out_minfo, uchar *bop, t_jit_matrix_info *buf_minfo, uchar *bbp)
{
	long i,j;
	uchar *ip,*op,*bp;
	double a, b;
	float *buf;
	int steps=0;
	
	if (dimcount<1) return; //safety

	a = x->alpha;
	b = 1 - a;
	
	switch(dimcount) {
	case 1:
		dim[1]=1;
	
	case 2:	
		if (in_minfo->type==_jit_sym_char) 
		{			
			float4 bufferVec;
			float4 inVec;
			
			float4 aVec = {a,a,a,a};
			float4 bVec = {b,b,b,b};
			
			ip = bip;
			op = bop;
			buf = (float *)bbp;
			
			steps = MIN(in_minfo->dimstride[1] / 4, buf_minfo->dimstride[1] / (4 * sizeof(float)));
			
			for(i=0;i<dim[1];i++){
				ip = bip + i * in_minfo->dimstride[1];
				op = bop + i * out_minfo->dimstride[1];
				bp = bbp + i * buf_minfo->dimstride[1];
				buf = (float *)bp;
				for(j=0;j<steps;j++){
					copy_float4(ip,inVec);
					copy_float4(buf,bufferVec);
					mult_float4(inVec,aVec,inVec);
					mult_float4(bufferVec,bVec,bufferVec);
					add_float4(inVec,bufferVec,bufferVec);
					copy_float4(bufferVec,op);
					copy_float4(bufferVec,buf);
					
					ip += 4;
					op += 4;
					buf += 4;
				}
			}
			
		} else if (in_minfo->type==_jit_sym_long) 
		{
			long *lip, *lop;
			
			float4 bufferVec;
			float4 inVec;
			
			float4 aVec = {a,a,a,a};
			float4 bVec = {b,b,b,b};
			
			buf = (float *)bbp;
			
			steps = MIN(in_minfo->dimstride[1] / (4 * sizeof(long)), buf_minfo->dimstride[1] / (4 * sizeof(float)));
			
			for(i=0;i<dim[1];i++){
				ip = bip + i * in_minfo->dimstride[1];
				op = bop + i * out_minfo->dimstride[1];
				bp = bbp + i * buf_minfo->dimstride[1];
				buf = (float *)bp;
				lip = (long *)ip;
				lop = (long *)op;
				for(j=0;j<steps;j++){
					copy_float4(lip,inVec);
					copy_float4(buf,bufferVec);
					mult_float4(inVec,aVec,inVec);
					mult_float4(bufferVec,bVec,bufferVec);
					add_float4(inVec,bufferVec,bufferVec);
					copy_float4(bufferVec,lop);
					copy_float4(bufferVec,buf);
					
					lip += 4;
					lop += 4;
					buf += 4;
				}
			}
		} else if (in_minfo->type==_jit_sym_float32) 
		{
			float *fip, *fop;
			
			float4 inVec;
			float4 outVec;
			
			float4 aVec = {a,a,a,a};
			float4 bVec = {b,b,b,b};
			
			steps = in_minfo->dimstride[1] / (4 * sizeof(float));
			
			for(i=0;i<dim[1];i++){
				ip = bip + i * in_minfo->dimstride[1];
				op = bop + i * out_minfo->dimstride[1];
				fip = (float *)ip;
				fop = (float *)op;
				for(j=0;j<steps;j++){
					copy_float4(fip,inVec);
					copy_float4(fop,outVec);
					mult_float4(inVec,aVec,inVec);
					mult_float4(outVec,bVec,outVec);
					add_float4(inVec,outVec,outVec);
					copy_float4(outVec,fop);
					
					fip += 4;
					fop += 4;
				}
			}
		} else if (in_minfo->type==_jit_sym_float64) 
		{
			double *dip, *dop;
			
			double2 inVec;
			double2 outVec;
			
			double2 aVec = {a,a};
			double2 bVec = {b,b};
			
			steps = in_minfo->dimstride[1] / (2 * sizeof(double));
			
			for(i=0;i<dim[1];i++){
				ip = bip + i * in_minfo->dimstride[1];
				op = bop + i * out_minfo->dimstride[1];
				dip = (double *)ip;
				dop = (double *)op;
				for(j=0;j<steps;j++){
					copy_double2(dip,inVec);
					copy_double2(dop,outVec);
					mult_double2(inVec,aVec,inVec);
					mult_double2(outVec,bVec,outVec);
					add_double2(inVec,outVec,outVec);
					copy_double2(outVec,dop);
					
					dip += 2;
					dop += 2;
				}
			}
		}
		break;
	default:
		for	(i=0;i<dim[dimcount-1];i++) {
			ip = bip + i*in_minfo->dimstride[dimcount-1];
			op = bop + i*out_minfo->dimstride[dimcount-1];
			bp = bbp + i*buf_minfo->dimstride[dimcount-1];
			cv_jit_ravg_calculate_ndim(x,dimcount-1,dim,planecount,in_minfo,ip,out_minfo,op,buf_minfo,bp);
		}
	}
}

t_cv_jit_ravg *cv_jit_ravg_new(void)
{
	t_cv_jit_ravg *x;
	void *m;
	t_jit_matrix_info info;
		
	if (x=(t_cv_jit_ravg *)jit_object_alloc(_cv_jit_ravg_class)) 
	{
		x->buffer = (float *)0;
		x->buf_size = 0;
		x->alpha = 0.05;
		
		jit_matrix_info_default(&info);								//Fill info structure with default values
		info.type = _jit_sym_float32;
		info.dimcount = 2;
		info.planecount = 1;
		m = jit_object_new(_jit_sym_jit_matrix, &info);				//Create a new matrix
		if(!m) error("could not allocate internal matrix!");
		jit_object_method(m,_jit_sym_clear);						//Clear data
		x->bufMat = m;
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
	if(x->bufMat)
		jit_object_free(x->bufMat);
}

