/*
cv.jit.centroids
	

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
Possible improvements:
	As written, the external makes no use of either vector processing or parallel 
	execution. It would be best to support Altivec/SSL and multiple cores, for better 
	performance.
*/

#include "ext_jitter.h"

typedef struct _cv_jit_centroids 
{
	t_object	ob;
	long		centcount;
	t_atom		centroids[2];
	t_atom		mass;
} t_cv_jit_centroids;

t_jit_err cv_jit_centroids_init(void); 
t_jit_err cv_jit_centroids_matrix_calc(t_cv_jit_centroids *x, void *inputs, void *outputs);
void cv_jit_centroids_calculate(t_cv_jit_centroids *x, t_jit_matrix_info *in_minfo, uchar *bip);
t_cv_jit_centroids *cv_jit_centroids_new(void);
void cv_jit_centroids_free(t_cv_jit_centroids *x);

void *_cv_jit_centroids_class;

t_jit_err cv_jit_centroids_init(void) 
{
	long attrflags=0;
	t_jit_object *attr,*mop;
	
	_cv_jit_centroids_class = jit_class_new("cv_jit_centroids",(method)cv_jit_centroids_new,(method)cv_jit_centroids_free, sizeof(t_cv_jit_centroids),0L);

	//add mop
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop,1,0);
	jit_class_addadornment(_cv_jit_centroids_class,mop);
	//add methods
	jit_class_addmethod(_cv_jit_centroids_class, (method)cv_jit_centroids_matrix_calc, "matrix_calc", A_CANT, 0L);
	//add attributes	
	attrflags = ATTR_SET_OPAQUE_USER | ATTR_GET_OPAQUE_USER;
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset_array,"centroids",_jit_sym_atom,2,attrflags,
		(method)0L,(method)0L,calcoffset(t_cv_jit_centroids,centcount),calcoffset(t_cv_jit_centroids,centroids));
	jit_class_addattr(_cv_jit_centroids_class,attr);
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"mass",_jit_sym_atom,attrflags,
		(method)0L,(method)0L,calcoffset(t_cv_jit_centroids,mass));
	jit_class_addattr(_cv_jit_centroids_class,attr);
	
	jit_class_register(_cv_jit_centroids_class);

	return JIT_ERR_NONE;
}

t_jit_err cv_jit_centroids_matrix_calc(t_cv_jit_centroids *x, void *inputs, void *outputs)
{
	t_jit_err err=JIT_ERR_NONE;
	long in_savelock;
	t_jit_matrix_info in_minfo;
	uchar *in_bp;
	long i,dim[JIT_MATRIX_MAX_DIMCOUNT];
	void *in_matrix;
	
	in_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);

	if (x&&in_matrix) {
		
		in_savelock = (long) jit_object_method(in_matrix,_jit_sym_lock,1);
		jit_object_method(in_matrix,_jit_sym_getinfo,&in_minfo);
		jit_object_method(in_matrix,_jit_sym_getdata,&in_bp);
		
		//Check input
		if(in_minfo.planecount != 1) { err=JIT_ERR_MISMATCH_PLANE; goto out;}
		if(in_minfo.dimcount != 2) { err=JIT_ERR_MISMATCH_DIM; goto out;}
		
		if (!in_bp) { err=JIT_ERR_INVALID_INPUT; goto out;}
		
		for (i=0;i<in_minfo.dimcount;i++) {
			dim[i] = in_minfo.dim[i];
		}		
		
		//calculate
		cv_jit_centroids_calculate(x, &in_minfo, in_bp);
		
	} else {
		return JIT_ERR_INVALID_PTR;
	}
	
out:
	jit_object_method(in_matrix,gensym("lock"),in_savelock);
	return err;
}

void cv_jit_centroids_calculate(t_cv_jit_centroids *x, t_jit_matrix_info *in_minfo, uchar *bip)
{
	long i,j;
	double area=0,m01=0,m10=0;
	
	if (in_minfo->type==_jit_sym_char) 
	{
		uchar *data = bip;
		long val;
		for (i=0;i<in_minfo->dim[1];i++)
		{
			for (j=0;j<in_minfo->dim[0];j++) 
			{
				val = (long)data[j];
				area += val;
				m01 += val * i;
				m10 += val * j;
			}
			
			data += in_minfo->dimstride[1];
		}
		
		area *= 0.00392156863;
		m01 *= 0.00392156863;
		m10 *= 0.00392156863;

	} 
	else if (in_minfo->type==_jit_sym_long) 
	{
		t_int32 *data;
		for (i=0;i<in_minfo->dim[1];i++)
		{
			data = (t_int32 *)(bip + in_minfo->dimstride[1] * i);
			for (j=0;j<in_minfo->dim[0];j++) 
			{
				area += data[j];
				m01 += data[j] * i;
				m10 += data[j] * j;
			}			
		}
	} 
	else if (in_minfo->type==_jit_sym_float32) 
	{
		float *data;
		
		for (i=0;i<in_minfo->dim[1];i++)
		{
			data = (float *)(bip + in_minfo->dimstride[1] * i);
			for (j=0;j<in_minfo->dim[0];j++) 
			{
				area += data[j];
				m01 += data[j] * (float)i;
				m10 += data[j] * (float)j;
			}
		}
	} 
	else if (in_minfo->type==_jit_sym_float64) 
	{
		double *data;
		for (i=0;i<in_minfo->dim[1];i++)
		{
			data = (double *)(bip + in_minfo->dimstride[1] * i);
			for (j=0;j<in_minfo->dim[0];j++) 
			{
				area += data[j];
				m01 += data[j] * (double)i;
				m10 += data[j] * (double)j;
			}			
		}
	} 
	
	atom_setfloat(&x->mass,area);
	if(area > 0.){
		atom_setfloat(&x->centroids[0],m10 / area);
		atom_setfloat(&x->centroids[1],m01 / area);
	}
	else{
		atom_setfloat(&x->centroids[0],-1);
		atom_setfloat(&x->centroids[1],-1);
	}
	
}

t_cv_jit_centroids *cv_jit_centroids_new(void)
{
	t_cv_jit_centroids *x;
		
	if ((x=(t_cv_jit_centroids *)jit_object_alloc(_cv_jit_centroids_class))) 
	{
		x->centcount = 2;
	} else 
	{
		x = NULL;
	}	
	return x;
}

void cv_jit_centroids_free(t_cv_jit_centroids *x)
{
	/*Nothing to free*/
}