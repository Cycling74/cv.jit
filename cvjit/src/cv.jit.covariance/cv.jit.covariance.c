/*
cv.jit.covariance
	

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
	The internal matrix allocation code is unecessarilly cumbersome. Could be re-written 
	to simply use malloc() instead.
*/

#ifdef __cplusplus
extern "C" {
#endif
#include "jit.common.h"
#ifdef __cplusplus 
} //extern "C"
#endif

typedef struct _cv_jit_covariance 
{
	t_object				ob;
	t_symbol				*matnameA,*matnameB;//,*matnameC,*matnameD,*matnameE;	//Name of previous frame matrix
	void					*var;
	void					*mean;
	long					n;
	int						size;
	
} t_cv_jit_covariance;

void *_cv_jit_covariance_class;

t_jit_err 		cv_jit_covariance_init(void);
t_cv_jit_covariance *cv_jit_covariance_new(void);
void 			cv_jit_covariance_free(t_cv_jit_covariance *x);
t_jit_err 		cv_jit_covariance_matrix_calc(t_cv_jit_covariance *x, void *inputs, void *outputs);
void 			cv_jit_covariance_calculate_ndim(t_cv_jit_covariance *x, long *dim, t_jit_matrix_info *in_minfo, char *bip, t_jit_matrix_info *out_minfo,char *bop, char *meanp, char *varp);
void			cv_jit_covariance_reset(t_cv_jit_covariance *x);

t_jit_err cv_jit_covariance_init(void) 
{
	t_jit_object 	*mop;
	
	_cv_jit_covariance_class = jit_class_new("cv_jit_covariance",(method)cv_jit_covariance_new,(method)cv_jit_covariance_free,sizeof(t_cv_jit_covariance),0L); 

	//add mop
	mop = jit_object_new(_jit_sym_jit_mop,1,1);
	jit_mop_single_type(mop,_jit_sym_float64);	
	jit_mop_single_planecount(mop,1);
	jit_class_addadornment(_cv_jit_covariance_class,mop);
	
	//add methods
	jit_class_addmethod(_cv_jit_covariance_class, (method)cv_jit_covariance_matrix_calc, "matrix_calc", A_CANT, 0L);
	jit_class_addmethod(_cv_jit_covariance_class, (method)cv_jit_covariance_reset, "reset", 0L);
	
	jit_class_register(_cv_jit_covariance_class);

	return JIT_ERR_NONE;
}

void cv_jit_covariance_reset(t_cv_jit_covariance *x)
{
	x->n = 0;
	jit_object_method(x->var,_jit_sym_clear);
	jit_object_method(x->mean,_jit_sym_clear);
}

t_jit_err cv_jit_covariance_matrix_calc(t_cv_jit_covariance *x, void *inputs, void *outputs)
{
	t_jit_err err=JIT_ERR_NONE;
	long in_savelock,out_savelock,var_savelock,mean_savelock;
	t_jit_matrix_info in_minfo,out_minfo,var_minfo,mean_minfo;
	char *in_bp,*out_bp,*var_bp,*mean_bp;
	long i,dimcount,planecount,dim[JIT_MATRIX_MAX_DIMCOUNT];
	void *in_matrix,*out_matrix,*var_matrix,*mean_matrix;
	
	//First, get pointers to matrices
	in_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);
	out_matrix 	= jit_object_method(outputs,_jit_sym_getindex,0);
	var_matrix = x->var;
	mean_matrix = x->mean;
	
	if (x&&in_matrix&&out_matrix&&var_matrix&&mean_matrix) //If all pointers are valid...
	{ 
		//Get the "savelock" value for each matrix
		in_savelock   = (long) jit_object_method(in_matrix,_jit_sym_lock,1);
		out_savelock  = (long) jit_object_method(out_matrix,_jit_sym_lock,1);

		var_savelock = (long) jit_object_method(var_matrix,_jit_sym_lock,1);
		mean_savelock = (long) jit_object_method(mean_matrix,_jit_sym_lock,1);
		
		//Get the matrix info
		jit_object_method(in_matrix,_jit_sym_getinfo,&in_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);

		jit_object_method(var_matrix,_jit_sym_getinfo,&var_minfo);
		jit_object_method(mean_matrix,_jit_sym_getinfo,&mean_minfo);

		//compatible types?
		if ((in_minfo.type!=_jit_sym_float32)&&(in_minfo.type!=_jit_sym_float64)) 
		{ 
			err=JIT_ERR_MISMATCH_TYPE; 
			goto out;
		}		

		//compatible planes?
		if ((in_minfo.planecount!=1)||(out_minfo.planecount!=1)) 
		{ 
			err=JIT_ERR_MISMATCH_PLANE; 
			goto out;
		}	
		
		//compatible dims?
		if (in_minfo.dimcount!=1)
		{
			err=JIT_ERR_MISMATCH_DIM;
			goto out;
		}	
		
		out_minfo.dimcount = 2;
		out_minfo.type = in_minfo.type;
		out_minfo.dim[0] = in_minfo.dim[0];
		out_minfo.dim[1] = in_minfo.dim[0];
		
		jit_object_method(out_matrix,_jit_sym_setinfo,&out_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);
		
		if((in_minfo.dim[0]!=x->size)||(in_minfo.type != mean_minfo.type))
		{
			mean_minfo.dimcount = 2;
			mean_minfo.type = in_minfo.type;
			mean_minfo.dim[0] = in_minfo.dim[0];
			mean_minfo.dim[1] = 1;
			
			var_minfo.dimcount = 2;
			var_minfo.type = in_minfo.type;
			var_minfo.dim[0] = in_minfo.dim[0];
			var_minfo.dim[1] = 1;
			
			jit_object_method(var_matrix,_jit_sym_setinfo,&var_minfo);
			jit_object_method(var_matrix,_jit_sym_getinfo,&var_minfo);
			
			jit_object_method(mean_matrix,_jit_sym_setinfo,&mean_minfo);
			jit_object_method(mean_matrix,_jit_sym_getinfo,&mean_minfo);
			
			jit_object_method(x->var,_jit_sym_clear);
			jit_object_method(x->mean,_jit_sym_clear);
			
			x->size = in_minfo.dim[0];
			x->n = 0;
		}
		
		
		//Get pointers to the actual matrix data
		jit_object_method(in_matrix,_jit_sym_getdata,&in_bp);
		jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);
		
		jit_object_method(var_matrix,_jit_sym_getdata,&var_bp);
		jit_object_method(mean_matrix,_jit_sym_getdata,&mean_bp);
		
		//If something is wrong with the pointer...
		if (!in_bp)   { err=JIT_ERR_INVALID_INPUT; goto out;}
		if (!out_bp)  { err=JIT_ERR_INVALID_OUTPUT; goto out;}
		
		if (!var_bp) { err=JIT_ERR_GENERIC; goto out;}
		if (!mean_bp) { err=JIT_ERR_GENERIC; goto out;}
		
		
		//get dimensions/planecount
		dimcount   = out_minfo.dimcount;
		planecount = out_minfo.planecount;			
		for (i=0;i<dimcount;i++) 
		{
			dim[i] = out_minfo.dim[i];
		}	
			
		x->n++;
			
		//calculate
		cv_jit_covariance_calculate_ndim(x, dim, &in_minfo, in_bp, &out_minfo, out_bp, mean_bp, var_bp);
		
	} 
	else 
	{
		return JIT_ERR_INVALID_PTR;
	}
	
out:
	jit_object_method(out_matrix, gensym("lock"),out_savelock);
	jit_object_method(in_matrix,  gensym("lock"),in_savelock);
	
	jit_object_method(var_matrix,gensym("lock"),var_savelock);
	jit_object_method(mean_matrix,gensym("lock"),mean_savelock);
	
	return err;
}


void cv_jit_covariance_calculate_ndim(t_cv_jit_covariance *x, long *dim, t_jit_matrix_info *in_minfo, char *bip, t_jit_matrix_info *out_minfo, char *bop, char* meanp, char* varp)
{
	float *varf,*meanf,*ipf,*opf;
	double *vard,*meand,*ipd,*opd;
	int size,i,j;
	long stride;
	double n,nn;
	double temp;
	
	n = x->n;  //The size of data set, equals 1 for first pass
	nn = (n-1)/n;  
	
	size = dim[0];
	stride = out_minfo->dimstride[1];
	
	if(in_minfo->type == _jit_sym_float32)
	{
		ipf   = (float*)bip;
		opf   = (float*)bop;
		meanf = (float*)meanp;
		varf  = (float*)varp;
		
		if(n == 1)
		{
			for(i=0;i<size;i++)
				meanf[i] = ipf[i];
				
			for(i=0;i<size;i++)
				varf[i] = 0;
		}
		else
		{
			for(i=0;i<size;i++)
				meanf[i] = (meanf[i]*nn + (ipf[i]/n));
				
			n--;
			nn = (n-1)/n; 
				
			for(i=0;i<size;i++)
			{
				temp = ipf[i] - meanf[i];
				varf[i] = (varf[i]*nn + (temp/n));
			}	
		}
	
		for(j=0;j<size;j++)
		{
			opf = (float *)(bop + j*stride);
			for(i=0;i<size;i++)
			{
				opf[i] = varf[j]*varf[i];
			}
		}
	}
	else if(in_minfo->type == _jit_sym_float64)
	{
		ipd   = (double*)bip;
		opd   = (double*)bop;
		meand = (double*)meanp;
		vard  = (double*)varp;
		
		if(n == 1)
		{
			for(i=0;i<size;i++)
				meand[i] = ipd[i];
				
			for(i=0;i<size;i++)
				vard[i] = 0;
		}
		else
		{
			for(i=0;i<size;i++)
				meand[i] = (meand[i]*nn + (ipd[i]/n));
				
			n--;
			nn = (n-1)/n; 
				
			for(i=0;i<size;i++)
			{
				temp = ipd[i] - meand[i];
				vard[i] = (vard[i]*nn + (temp/n));
			}	
		}
	
		for(j=0;j<size;j++)
		{
			opd = (double *)(bop + j*stride);
			for(i=0;i<size;i++)
			{
				opd[i] = vard[j]*vard[i];
			}
		}
	
	}

}

t_cv_jit_covariance *cv_jit_covariance_new(void)
{
	t_cv_jit_covariance *x;		//jitter object
	void *m;				//matrix pointer for previous frame 
	t_jit_matrix_info info;	//info struct for prev. frame matrix
		
	if (x=(t_cv_jit_covariance *)jit_object_alloc(_cv_jit_covariance_class)) 
	{
		jit_matrix_info_default(&info);								//Fill info structure with default values
		info.type = _jit_sym_float32;
		info.dimcount = 2;
		info.planecount = 1;
		x->matnameA = jit_symbol_unique();							//Get a unique identifier for matrix creation
		m = jit_object_new(_jit_sym_jit_matrix, &info);				//Create a new matrix
		m = jit_object_method(m, _jit_sym_register, x->matnameA);	//Register matrix name
		if(!m) error("could not allocate internal matrix!");
		jit_object_attach(x->matnameA, x);							//Attach matrix to jitter object
		jit_object_method(m,_jit_sym_clear);						//Clear data
		x->var = m;													//Copy matrix pointer to jitter object
		
		jit_matrix_info_default(&info);								//Fill info structure with default values
		info.type = _jit_sym_float32;
		info.dimcount = 2;
		info.planecount = 1;
		x->matnameB = jit_symbol_unique();							//Get a unique identifier for matrix creation
		m = jit_object_new(_jit_sym_jit_matrix, &info);				//Create a new matrix
		m = jit_object_method(m, _jit_sym_register, x->matnameB);	//Register matrix name
		if(!m) error("could not allocate internal matrix!");
		jit_object_attach(x->matnameB, x);							//Attach matrix to jitter object
		jit_object_method(m,_jit_sym_clear);						//Clear data
		x->mean = m;												//Copy matrix pointer to jitter object
		
		x->n = 0;
		
		x->size = 0;
		
	} 
	else 
	{
		x = NULL;
	}	
	return x;
}

void cv_jit_covariance_free(t_cv_jit_covariance *x)
{
	//Detach matrix from object
	jit_object_detach(x->var, x);
	jit_object_detach(x->mean, x);
	
	//Free matrix memory
	jit_object_free(x->var);
	jit_object_free(x->mean);
}

