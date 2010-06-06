/*
cv.jit.moments
	

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

typedef struct _cv_jit_moments 
{
	t_object	ob;
	long	momcount;
	float	moments[7];
	float	hu[7];
	long	centcount;
	float	centroids[2];
	float	mass;
	double	m00, m01, m10, m11, m20, m02, m21, m12, m30, m03;
	double	nu11, nu20, nu02, nu21, nu12, nu30, nu03;
	double	hu1, hu2, hu3, hu4, hu5, hu6, hu7;
	double	coords[2];
	
} t_cv_jit_moments;

t_jit_err cv_jit_moments_init(void); 
t_jit_err cv_jit_moments_matrix_calc(t_cv_jit_moments *x, void *inputs, void *outputs);
t_cv_jit_moments *cv_jit_moments_new(void);
void cv_jit_moments_free(t_cv_jit_moments *x);
void clear_val(t_cv_jit_moments *x);
void cv_jit_moments_calculate(t_cv_jit_moments *x, long *dim, t_jit_matrix_info *in_minfo, uchar *bip);

void *_cv_jit_moments_class;

t_jit_err cv_jit_moments_init(void) 
{
	long attrflags=0;
	t_jit_object *attr,*mop;
	
	_cv_jit_moments_class = jit_class_new("cv_jit_moments",(method)cv_jit_moments_new,(method)cv_jit_moments_free, sizeof(t_cv_jit_moments),0L);
		
	//add mop
	mop = jit_object_new(_jit_sym_jit_mop,1,0);
	jit_class_addadornment(_cv_jit_moments_class,mop);
	//add methods
	jit_class_addmethod(_cv_jit_moments_class, (method)cv_jit_moments_matrix_calc, 		"matrix_calc", 		A_CANT, 0L);
	//add attributes	
	attrflags = JIT_ATTR_GET_DEFER_LOW | JIT_ATTR_SET_OPAQUE_USER;
	
	attr = jit_object_new(_jit_sym_jit_attr_offset_array,"moments",_jit_sym_float32,7,attrflags,
		(method)0L,(method)0L,calcoffset(t_cv_jit_moments,momcount),calcoffset(t_cv_jit_moments,moments));
	jit_class_addattr(_cv_jit_moments_class,attr);
	
	attr = jit_object_new(_jit_sym_jit_attr_offset_array,"hu",_jit_sym_float32,7,attrflags,
		(method)0L,(method)0L,calcoffset(t_cv_jit_moments,momcount),calcoffset(t_cv_jit_moments,hu));
	jit_class_addattr(_cv_jit_moments_class,attr);
	
	attr = jit_object_new(_jit_sym_jit_attr_offset_array,"centroids",_jit_sym_float32,2,attrflags,
		(method)0L,(method)0L,calcoffset(t_cv_jit_moments,centcount),calcoffset(t_cv_jit_moments,centroids));
	jit_class_addattr(_cv_jit_moments_class,attr);
	
	attr = jit_object_new(	_jit_sym_jit_attr_offset,"mass",_jit_sym_float32,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_moments,mass));			
	jit_class_addattr(_cv_jit_moments_class,attr);
	
	//Register class
	jit_class_register(_cv_jit_moments_class);

	return JIT_ERR_NONE;
}

t_jit_err cv_jit_moments_matrix_calc(t_cv_jit_moments *x, void *inputs, void *outputs)
{
	t_jit_err err = JIT_ERR_NONE;
	long in_savelock;
	t_jit_matrix_info in_minfo;
	uchar *in_bp;
	long i,dimcount,dim[JIT_MATRIX_MAX_DIMCOUNT];
	void *matrix;
	
	matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);

	if (x&&matrix) 
	{
		in_savelock = (long) jit_object_method(matrix,_jit_sym_lock,1);
		jit_object_method(matrix,_jit_sym_getinfo,&in_minfo);
		jit_object_method(matrix,_jit_sym_getdata,&in_bp);
		
		if (!in_bp) 
		{ 
			err=JIT_ERR_INVALID_INPUT; 
			goto out;
		}
			
		//compatible planes?
		if (in_minfo.planecount!=1)
		{ 
			err = JIT_ERR_MISMATCH_PLANE;
			goto out;
		}	
		
		//compatible dims?
		if (in_minfo.dimcount!=2)
		{
			err = JIT_ERR_MISMATCH_DIM;
			goto out;
		}	
			
		//get dimensions/planecount 
		dimcount = in_minfo.dimcount;
		for (i=0;i<dimcount;i++) 
		{
			dim[i] = in_minfo.dim[i];
		}		
			
		//calculate
		clear_val(x);
		cv_jit_moments_calculate(x, dim, &in_minfo, in_bp);
					
	} else 
	{
		return JIT_ERR_INVALID_PTR;
	}
	
out:
	jit_object_method(matrix,gensym("lock"),in_savelock);
	return err;
}

void cv_jit_moments_calculate(t_cv_jit_moments *x, long *dim, t_jit_matrix_info *in_minfo, uchar *bip)
{
	//long i,j,k,n,maxsize, dy, dx;
	double i,j, dy, dx;
	uchar *ip;
	double scale2, scale3;
	double s, d, n4, q0, q1, t0, t1;
	double mass;
	double d_val;
	

	if (in_minfo->type == _jit_sym_char)
	{
		for (j=0;j<dim[1];j++) 
		{
			ip = bip + (long)j * in_minfo->dimstride[1];	
			dy = j*j;
			
			for (i=0;i<dim[0];i++)
			{
				dx = i*i;
						
				if(*ip != 0)
				{
					d_val = (double)*ip;
					x->m00 += d_val;
					x->m10 += i * d_val;
					x->m01 += j * d_val;
					x->m20 += dx * d_val;
					x->m02 += dy * d_val;
					x->m11 += i * j * d_val;
					x->m30 += dx * i * d_val;
					x->m03 += dy * j * d_val;
					x->m21 += dx * j * d_val;
					x->m12 += dy * i * d_val;

				}
				ip++;
			}
		}
	}
	else if (in_minfo->type == _jit_sym_long)
	{
		for (j=0;j<dim[1];j++) 
		{
			ip = bip + (long)j * in_minfo->dimstride[1];	
			dy = j*j;
			
			for (i=0;i<dim[0];i++)
			{
				dx = i*i;
						
				if(*(long *)ip != 0)
				{
					d_val = (double)*(long *)ip;
					x->m00 += d_val;
					x->m10 += i * d_val;
					x->m01 += j * d_val;
					x->m20 += dx * d_val;
					x->m02 += dy * d_val;
					x->m11 += i * j * d_val;
					x->m30 += dx * i * d_val;
					x->m03 += dy * j * d_val;
					x->m21 += dx * j * d_val;
					x->m12 += dy * i * d_val;

				}
				ip+=in_minfo->dimstride[0];
			}
		}
	} 
	else if (in_minfo->type == _jit_sym_float32)
	{
		for (j=0;j<dim[1];j++) 
		{
			ip = bip + (long)j * in_minfo->dimstride[1];	
			dy = j*j;
			
			for (i=0;i<dim[0];i++)
			{
				dx = i*i;
						
				if(*(float *)ip != 0)
				{
					d_val = (double)*(float *)ip;
					x->m00 += d_val;
					x->m10 += i * d_val;
					x->m01 += j * d_val;
					x->m20 += dx * d_val;
					x->m02 += dy * d_val;
					x->m11 += i * j * d_val;
					x->m30 += dx * i * d_val;
					x->m03 += dy * j * d_val;
					x->m21 += dx * j * d_val;
					x->m12 += dy * i * d_val;

				}
				ip+=in_minfo->dimstride[0];
			}
		}
	} 
	else if (in_minfo->type == _jit_sym_float64)
	{
		for (j=0;j<dim[1];j++) 
		{
			ip = bip + (long)j * in_minfo->dimstride[1];	
			dy = j*j;
			
			for (i=0;i<dim[0];i++)
			{
				dx = i*i;
						
				if(*(double *)ip != 0)
				{	
					d_val = *(double *)ip;
					x->m00 += d_val;
					x->m10 += i * d_val;
					x->m01 += j * d_val;
					x->m20 += dx * d_val;
					x->m02 += dy * d_val;
					x->m11 += i * j * d_val;
					x->m30 += dx * i * d_val;
					x->m03 += dy * j * d_val;
					x->m21 += dx * j * d_val;
					x->m12 += dy * i * d_val;

				}
				ip+=in_minfo->dimstride[0];
			}
		}
	} 

	if(x->m00 == 0)
		return;
		 
	x->coords[0] = x->m10 / x->m00;
	x->coords[1] = x->m01 / x->m00;
	
	mass = x->m00 * 0.00392156863;
	x->m10 = x->m10 * 0.00392156863;
	x->m01 = x->m01 * 0.00392156863;
	x->m20 = x->m20 * 0.00392156863;
	x->m02 = x->m02 * 0.00392156863;
	x->m11 = x->m11 * 0.00392156863;
	x->m21 = x->m21 * 0.00392156863;
	x->m12 = x->m12 * 0.00392156863;
	x->m30 = x->m30 * 0.00392156863;
	x->m03 = x->m03 * 0.00392156863;

	//scale2 = x->m00*x->m00;
	//scale3 = jit_math_pow(x->m00, 2.5);
	
	scale2 = mass*mass;
	scale3 = jit_math_pow(mass, 2.5);
	
	/*	
	x->nu20 = x->m20 - 2 * x->m10 * x->coords[0] + x->coords[0] * x->coords[0] * x->m00;
	
	x->nu02 = x->m02 - 2 * x->m01 * x->coords[1] + x->coords[1] * x->coords[1] * x->m00;
		
	x->nu11 = x->m11 - x->m01 * x->coords[0] - x->m10 * x->coords[1] + x->coords[0] * x->coords[1] * x->m00;
	
	x->nu30 = x->m30 - 3 * x->coords[0] * x->m20 + 3 * x->coords[0] * x->coords[0] * x->m10 - x->coords[0] * x->coords[0] * x->coords[0] * x->m00;
				
	x->nu03 = x->m03 - 3 * x->coords[1] * x->m02 + 3 * x->coords[1] * x->coords[1] * x->m01 - x->coords[1] * x->coords[1] * x->coords[1] * x->m00;
		
	x->nu21 = x->m21 - x->coords[1] * x->m20 - 2 * x->coords[0] * x->m11 + 2 * x->coords[0] * x->coords[1] * x->m10 + x->coords[0] * x->coords[0] * x->m01 - x->coords[0] * x->coords[0] * x->coords[1] * x->m00;
	
	x->nu12 = x->m12 - x->coords[0] * x->m02 - 2 * x->coords[1] * x->m11 + 2 * x->coords[0] * x->coords[1] * x->m01 + x->coords[1] * x->coords[1] * x->m10 - x->coords[1] * x->coords[1] * x->coords[0] * x->m00;
	*/		
	
	x->nu20 = x->m20 - 2 * x->m10 * x->coords[0] + x->coords[0] * x->coords[0] * mass;
	
	x->nu02 = x->m02 - 2 * x->m01 * x->coords[1] + x->coords[1] * x->coords[1] * mass;
		
	x->nu11 = x->m11 - x->m01 * x->coords[0] - x->m10 * x->coords[1] + x->coords[0] * x->coords[1] * mass;
	
	x->nu30 = x->m30 - 3 * x->coords[0] * x->m20 + 3 * x->coords[0] * x->coords[0] * x->m10 - x->coords[0] * x->coords[0] * x->coords[0] * mass;
				
	x->nu03 = x->m03 - 3 * x->coords[1] * x->m02 + 3 * x->coords[1] * x->coords[1] * x->m01 - x->coords[1] * x->coords[1] * x->coords[1] * mass;
		
	x->nu21 = x->m21 - x->coords[1] * x->m20 - 2 * x->coords[0] * x->m11 + 2 * x->coords[0] * x->coords[1] * x->m10 + x->coords[0] * x->coords[0] * x->m01 - x->coords[0] * x->coords[0] * x->coords[1] * mass;
	
	x->nu12 = x->m12 - x->coords[0] * x->m02 - 2 * x->coords[1] * x->m11 + 2 * x->coords[0] * x->coords[1] * x->m01 + x->coords[1] * x->coords[1] * x->m10 - x->coords[1] * x->coords[1] * x->coords[0] * mass;
	
		
	x->nu11 = x->nu11 / scale2;
	x->nu20 = x->nu20 / scale2;
	x->nu02 = x->nu02 / scale2;
	x->nu21 = x->nu21 / scale3;
	x->nu12 = x->nu12 / scale3;
	x->nu30 = x->nu30 / scale3;
	x->nu03 = x->nu03 / scale3;
	
	d = x->nu20 - x->nu02;
	s = x->nu02 + x->nu20;
	n4 = 4 * x->nu11;
	
	t0 = x->nu30 + x->nu12;
	t1 = x->nu21 + x->nu03;
	q0 = t0 * t0;
	q1 = t1 * t1;
	
	x->hu[0] = (float)s;
	x->hu[1] = (float)(d * d + n4 * x->nu11);
	x->hu[3] = (float)(q0 + q1);
	x->hu[5] = (float)(d * (q0 - q1) + n4 * t0 * t1);
	
	t0 *= q0 - 3 * q1;
	t1 *= 3 * q0 - q1;
	
	q0 = x->nu30 - 3 * x->nu12;
    	q1 = 3 * x->nu21 - x->nu03;
        	
    	x->hu[2] = (float)(q0 * q0 + q1 * q1);
    	x->hu[4] = (float)(q0 * t0 + q1 * t1);
    	x->hu[6] = (float)(q1 * t0 - q0 * t1);
    
    	x->moments[0] = (float)x->nu20;
    	x->moments[1] = (float)x->nu02;
    	x->moments[2] = (float)x->nu11;
    	x->moments[3] = (float)x->nu21;
    	x->moments[4] = (float)x->nu12;
    	x->moments[5] = (float)x->nu30;
    	x->moments[6] = (float)x->nu03;
       
    	x->centroids[0] = (float)x->coords[0];
    	x->centroids[1] = (float)x->coords[1];
    
    	x->mass = (float)x->m00;

}

t_cv_jit_moments *cv_jit_moments_new(void)
{
	t_cv_jit_moments *x;
		
	if (x=(t_cv_jit_moments *)jit_object_alloc(_cv_jit_moments_class)) {
		x->momcount = 7;
		x->centcount = 2;

	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_moments_free(t_cv_jit_moments *x)
{
	
}

void clear_val(t_cv_jit_moments *x)
{
	x->m00 = 0;
	x->m01 = 0;
	x->m10 = 0;
	x->m11 = 0;
	x->m20 = 0;
	x->m02 = 0;
	x->m21 = 0;
	x->m12 = 0;
	x->m30 = 0;
	x->m03 = 0;
	
	x->hu1 = 0;
	x->hu2 = 0;
	x->hu3 = 0;
	x->hu4 = 0;
	x->hu5 = 0;
	x->hu6 = 0;
	x->hu7 = 0;
	
	x->coords[0] = 0;
	x->coords[1] = 0;
}
