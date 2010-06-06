/*
cv.jit.blobs.moments
	

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

typedef struct _cv_jit_blobs_moments 
{
	t_object				ob;
	long					mass[256];
	long	long				m10[256];
	long	long				m01[256];
	long long				m20[256];
	long long				m02[256];
	long long				m11[256];
	long	long				m12[256];
	long	long				m21[256];
	long	long				m30[256];
	long	long				m03[256];
	char					maxval;
	
} t_cv_jit_blobs_moments;

void *_cv_jit_blobs_moments_class;

t_jit_err 				cv_jit_blobs_moments_init(void); 
t_cv_jit_blobs_moments *	cv_jit_blobs_moments_new(void);
void 					cv_jit_blobs_moments_free(t_cv_jit_blobs_moments *x);
t_jit_err 				cv_jit_blobs_moments_matrix_calc(t_cv_jit_blobs_moments *x, void *inputs, void *outputs);
void					cv_jit_blobs_moments_calculate(t_cv_jit_blobs_moments *x, char *data, int w, int h, int step);

t_jit_err cv_jit_blobs_moments_init(void) 
{
	t_jit_object *mop,*output;
	t_symbol *atsym;
	
	atsym = gensym("jit_attr_offset");
	
	_cv_jit_blobs_moments_class = jit_class_new("cv_jit_blobs_moments",(method)cv_jit_blobs_moments_new,(method)cv_jit_blobs_moments_free,
		sizeof(t_cv_jit_blobs_moments),0L); 

	//add mop
	mop = jit_object_new(_jit_sym_jit_mop,1,1);  //Object has one input and one output

   	jit_mop_single_type(mop,_jit_sym_char);   //Set input type and planecount
   	jit_mop_single_planecount(mop,1);  
   	jit_mop_output_nolink(mop,1); //Turn off output linking so that output matrix does not adapt to input
   	
   	output = jit_object_method(mop,_jit_sym_getoutput,1); //Get a pointer to the output matrices
   	jit_attr_setlong(output,_jit_sym_minplanecount,17); //Yes, 17 planes!
  	jit_attr_setlong(output,_jit_sym_maxplanecount,17);
  	jit_attr_setlong(output,_jit_sym_mindim,1);
  	jit_attr_setlong(output,_jit_sym_maxdim,1);
  	jit_attr_setsym(output,_jit_sym_types,_jit_sym_float32);
   	   	
	jit_class_addadornment(_cv_jit_blobs_moments_class,mop);
	
	
	//add methods
	jit_class_addmethod(_cv_jit_blobs_moments_class, (method)cv_jit_blobs_moments_matrix_calc, 		"matrix_calc", 		A_CANT, 0L);	

	//add attributes	
	
	/*No attributes for this object*/
		
	jit_class_register(_cv_jit_blobs_moments_class);

	return JIT_ERR_NONE;
}

t_jit_err cv_jit_blobs_moments_matrix_calc(t_cv_jit_blobs_moments *x, void *inputs, void *outputs)
{
	t_jit_err err=JIT_ERR_NONE;
	long in_savelock=0,out_savelock=0;
	t_jit_matrix_info in_minfo,out_minfo;
	char *out_bp, *in_bp;
	void *in_matrix,*out_matrix;
	int i,j;
	float *out_data;
	double scale1,scale2;
	double s, d, n4, q0, q1, t0, t1;
	
	double cx,cy,m00,m10,m01,mu20,mu02,mu11,mu21,mu12,mu30,mu03;
	
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

		if(in_minfo.dimcount != 2)
		{
			err = JIT_ERR_MISMATCH_DIM;
			goto out;
		}
		if(in_minfo.planecount != 1)
		{
			err = JIT_ERR_MISMATCH_PLANE;
			goto out;
		}
		if(in_minfo.type != _jit_sym_char)
		{
			err = JIT_ERR_MISMATCH_TYPE;
			goto out;
		}

		//Get the data pointers
		jit_object_method(in_matrix,_jit_sym_getdata,&in_bp);
		
		if (!in_bp) { err=JIT_ERR_INVALID_INPUT; goto out;}
		
		//Calculate
		cv_jit_blobs_moments_calculate(x, in_bp, in_minfo.dim[0], in_minfo.dim[1], in_minfo.dimstride[1]);
		
		//Prepare output
		out_minfo.dim[0] = x->maxval;
		jit_object_method(out_matrix,_jit_sym_setinfo,&out_minfo);
		jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);
		if (!out_bp) { err=JIT_ERR_INVALID_OUTPUT; goto out;}
		
		out_data = (float *)out_bp;

		for(i=1; i <= x->maxval; i++)
		{
			if(x->mass[i] > 0)
			{
				m00 = (double)x->mass[i];
				m10 = (double)x->m10[i];
				m01 = (double)x->m01[i];
				cx = m10 / m00;
				cy = m01 / m00;
				
				out_data[14] = (float)cx;
				out_data[15] = (float)cy;
				out_data[16] = (float)m00;
			
				mu20 = (double)x->m20[i] - m10 * cx;
				mu02 = (double)x->m02[i] - m01 * cy;
				mu11 = (double)x->m11[i] - m10 * cy;
				mu30 = (double)x->m30[i] - cx * (3 * mu20 + cx * m10);
				mu03 = (double)x->m03[i] - cy * (3 * mu02 + cy * m01);
				mu21 = (double)x->m21[i] - cx * (2 * mu11 + cx * m01) - cy * mu20;
				mu12 = (double)x->m12[i] - cy * (2 * mu11 + cy * m10) - cx * mu02;
							
				scale1 = m00 * m00;
				scale2 = jit_math_pow(m00, 2.5);
				
				mu20 /= scale1;
				mu02 /= scale1;
				mu11 /= scale1;
				mu21 /= scale2;
				mu12 /= scale2;
				mu30 /= scale2;
				mu03 /= scale2;
								
				out_data[0] = (float)mu20;
				out_data[1] = (float)mu02;
				out_data[2] = (float)mu11;
				out_data[3] = (float)mu21;
				out_data[4] = (float)mu12;
				out_data[5] = (float)mu30;
				out_data[6] = (float)mu03;
				
				d = mu20 - mu02;
				s = mu20 + mu02;
				n4 = 4 * mu11;
	
				t0 = mu30 + mu12;
				t1 = mu21 + mu03;
				q0 = t0 * t0;
				q1 = t1 * t1;
	
				out_data[7] = (float)s;
				out_data[8] = (float)(d * d + n4 * mu11);
				out_data[10] = (float)(q0 + q1);
				out_data[12] = (float)(d * (q0 - q1) + n4 * t0 * t1);
	
				t0 *= q0 - 3 * q1;
				t1 *= 3 * q0 - q1;
	
				q0 = mu30 - 3 * mu12;
    				q1 = 3 * mu21 - mu03;
        	
    				out_data[9] = (float)(q0 * q0 + q1 * q1);
    				out_data[11] = (float)(q0 * t0 + q1 * t1);
    				out_data[13] = (float)(q1 * t0 - q0 * t1);	
			}
			
			else{
				for(j=0;j<17;j++)out_data[j] = 0.f;
			}
			
			out_data += 17;
		}
		
		
	}

	
out:
	jit_object_method(out_matrix,gensym("lock"),out_savelock);
	jit_object_method(in_matrix,gensym("lock"),in_savelock);
	return err;
}

void cv_jit_blobs_moments_calculate(t_cv_jit_blobs_moments *x, char *data, int w, int h, int step)
{
	long i,j,ii,jj;
	char *in;
	unsigned char value;
	
	x->maxval = 0;
	for(i=0;i<256;i++)
	{
		x->mass[i] = 0;
		x->m10[i] = 0;
		x->m01[i] = 0;
		x->m20[i] = 0;
		x->m02[i] = 0;
		x->m11[i] = 0;
		x->m21[i] = 0;
		x->m12[i] = 0;
		x->m30[i] = 0;
		x->m03[i] = 0;
	}
	
	for(j=0;j<h;j++)
	{
		in = data + j * step;
		jj = j*j;
		for(i=0;i<w;i++)
		{
			value = in[i];
			ii = i*i;
			if(value > 0)
			{
				x->mass[value]++;
				x->m10[value]+=i;
				x->m01[value]+=j;
				
				x->m20[value] += ii;
				x->m02[value] += jj;
				x->m11[value] += i*j;
				x->m21[value] += ii * j;
				x->m12[value] += jj * i;
				x->m30[value] += ii * i;
				x->m03[value] += jj * j;
			}
			if(value > x->maxval)
				x->maxval = value;
		}
	}
	
	return;
}

t_cv_jit_blobs_moments *cv_jit_blobs_moments_new(void)
{
	t_cv_jit_blobs_moments *x;
		
	if (x=(t_cv_jit_blobs_moments *)jit_object_alloc(_cv_jit_blobs_moments_class)) {
	
		x->maxval = 0;

	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_blobs_moments_free(t_cv_jit_blobs_moments *x)
{
	/*Nothing to free*/
}
