/*
cv.jit.blobs.recon
	

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
This file links to the OpenCV library <http://sourceforge.net/projects/opencvlibrary/>

Please refer to the  Intel License Agreement For Open Source Computer Vision Library.

Please also read the notes concerning technical issues with using the OpenCV library
in Jitter externals.
*/

#include "c74_jitter.h"
#include "cv.h"
#include "jitOpenCV.h"


typedef struct _cv_jit_blobs_recon 
{
	t_object     ob;
	long           mode;
	long           size;
	double       *mean; //The mean vector
	double       *covariance; //Covariance matrix
	double       *inverse; //Pseudo-inverse of covariance matrix
	CvMat       mat1;
	CvMat       mat2;
	CvMat       mat3;
	char		init;
} t_cv_jit_blobs_recon;

void *_cv_jit_blobs_recon_class;

t_jit_err 				cv_jit_blobs_recon_init(void); 
t_cv_jit_blobs_recon *	cv_jit_blobs_recon_new(void);
void 					cv_jit_blobs_recon_free(t_cv_jit_blobs_recon *x);
t_jit_err 				cv_jit_blobs_recon_matrix_calc(t_cv_jit_blobs_recon *x, void *inputs, void *outputs);
void 					cv_jit_blobs_recon_calculate(t_cv_jit_blobs_recon *x, float *in, float *out, int w);
void                    cv_jit_blobs_recon_read(t_cv_jit_blobs_recon *x, t_symbol *s, short argc, t_atom *argv);
void                    ByteSwap(unsigned char * b, int n);

t_jit_err cv_jit_blobs_recon_init(void) 
{
	long attrflags=0;
	void *attr,*mop,*output;
	t_symbol *atsym;
	
	atsym = gensym("jit_attr_offset");
	
	_cv_jit_blobs_recon_class = jit_class_new("cv_jit_blobs_recon",(method)cv_jit_blobs_recon_new,(method)cv_jit_blobs_recon_free,
		sizeof(t_cv_jit_blobs_recon),0L); 

	//add mop
	mop = (t_jit_object*)jit_object_new(_jit_sym_jit_mop,1,1);  //Object has one input and one output

   	jit_mop_single_type(mop,_jit_sym_float32);   //Set input type and planecount
   	jit_mop_single_planecount(mop,17);  
   	jit_mop_output_nolink(mop,1); //Turn off output linking so that output matrix does not adapt to input
   	
   	output = jit_object_method(mop,_jit_sym_getoutput,1); //Get a pointer to the output matrix
   	jit_attr_setlong(output,_jit_sym_minplanecount,1);
  	jit_attr_setlong(output,_jit_sym_maxplanecount,1);
  	jit_attr_setlong(output,_jit_sym_mindim,1);
  	jit_attr_setlong(output,_jit_sym_maxdim,1);
  	jit_attr_setsym(output,_jit_sym_types,_jit_sym_float32);
   	   	
	jit_class_addadornment(_cv_jit_blobs_recon_class,(t_jit_object *)mop);
	
	
	//add methods
	jit_class_addmethod(_cv_jit_blobs_recon_class, (method)cv_jit_blobs_recon_matrix_calc, 		"matrix_calc", 		A_CANT, 0L);	
	jit_class_addmethod(_cv_jit_blobs_recon_class, (method)cv_jit_blobs_recon_read, 		"read", 		A_GIMME, 0L);	

	//add attributes	
	attrflags = ATTR_GET_DEFER_LOW | ATTR_SET_USURP_LOW;
	attr = (t_jit_object*)jit_object_new(_jit_sym_jit_attr_offset,"mode",_jit_sym_long,attrflags,
		(method)0L,(method)0L,calcoffset(t_cv_jit_blobs_recon,mode));
	jit_attr_addfilterset_clip(attr,0,1,true,true);	//clip to 0-1
	jit_class_addattr(_cv_jit_blobs_recon_class,(t_jit_object *)attr);
		
	jit_class_register(_cv_jit_blobs_recon_class);

	return JIT_ERR_NONE;
}

void cv_jit_blobs_recon_read(t_cv_jit_blobs_recon *x, t_symbol *s, short argc, t_atom *argv)
{
	char fname[MAX_FILENAME_CHARS];
	short id;
	t_filehandle handle;
	t_ptr_size count;
	long cvjt;
	t_fourcc type;
	t_fourcc code;
	double index;
	int i;
	
	code =  ( 'maxb' );
	
	if(argc > 0)
	{
		if(argv[0].a_type != A_SYM)
		{
			object_error((t_object*)x, "Invalid argument to read command. Make sure argument is a symbol.");
			return;
		}
		strcpy(fname,argv[0].a_w.w_sym->s_name);
		if(!locatefile_extended(fname,&id,&type,&type,-1))
		{
			path_opensysfile(argv[0].a_w.w_sym->s_name, id, &handle, READ_PERM);
		}
		else
		{
			object_error((t_object*)x, "Could not find file %s",argv[0].a_w.w_sym->s_name);
			return;
		}
	}
	
	else if(!open_dialog(fname, &id, &type,&code,1))
	{
		//Open file
		if(path_opensysfile(fname, id, &handle, READ_PERM))
		{
			object_error((t_object*)x, "Could not open file %s",fname);
			return;
		}
	}
	
	else return;
	
	//Load file
	
	//Check ID code
	count = sizeof(t_int32);
	sysfile_read(handle, &count, &cvjt);
	if(cvjt ==  ( 'cvjt' ))
	{
		
		//Read list length
		count = sizeof(t_int32);
		sysfile_read(handle, &count, &x->size);
		if(x->size != 7)
		{
			object_error((t_object*)x, "Invalid data: make sure %s was trained with moments or Hu invariants from cv.jit.moments.", fname);
			sysfile_close(handle);
			x->size = 7;
			return;
		}
		//Read index
		count = sizeof(double);
		sysfile_read(handle, &count, &index);
		//Read mean vector
		count = sizeof(double) * x->size;
		sysfile_read(handle, &count, x->mean);
		//Read covariance matrix
		count = sizeof(double) * x->size * x->size;
		sysfile_read(handle, &count, x->covariance);
		//Read inverse matrix
		count = sizeof(double) * x->size * x->size;
		sysfile_read(handle, &count, x->inverse);
		
		//Close file
		sysfile_close(handle);
	}
	else if (cvjt ==  ( 'tjvc' )) //File was created on another platform, with different endian, switch
	{
		//Read list length
		count = sizeof(t_int32);
		sysfile_read(handle, &count, &x->size);
		ByteSwap((unsigned char *)&x->size,sizeof(t_int32));
		if(x->size != 7)
		{
			object_error((t_object*)x, "Invalid data: make sure %s was trained with moments or Hu invariants from cv.jit.moments.", fname);
			sysfile_close(handle);
			x->size = 7;
			return;
		}
		//Read index
		count = sizeof(double);
		sysfile_read(handle, &count, &index);
		ByteSwap((unsigned char *)&index,sizeof(double));
		//Read mean vector
		count = sizeof(double) * x->size;
		sysfile_read(handle, &count, x->mean);
		for(i=0;i<x->size;i++)
			ByteSwap((unsigned char *)&(x->mean[i]),sizeof(double));
		//Read covariance matrix
		count = sizeof(double) * x->size * x->size;
		sysfile_read(handle, &count, x->covariance);
		for(i=0;i<(x->size * x->size);i++)
			ByteSwap((unsigned char *)&(x->covariance[i]),sizeof(double));
		//Read inverse matrix
		count = sizeof(double) * x->size * x->size;
		sysfile_read(handle, &count, x->inverse);
		for(i=0;i<(x->size * x->size);i++)
			ByteSwap((unsigned char *)&(x->inverse[i]),sizeof(double));
		
		//Close file
		sysfile_close(handle);
	}
	else
	{
		object_error((t_object*)x, "File %s was not created by cv.jit.learn.", fname);
		sysfile_close(handle);
		return;
	}
	
	
	
	//Init CV matrices
	cvInitMatHeader( &x->mat2, x->size, 1, CV_64FC1,x->mean, CV_AUTOSTEP );
	cvInitMatHeader( &x->mat3, x->size, x->size, CV_64FC1,x->inverse, CV_AUTOSTEP );

	x->init = 1;
}

t_jit_err cv_jit_blobs_recon_matrix_calc(t_cv_jit_blobs_recon *x, void *inputs, void *outputs)
{
	t_jit_err err=JIT_ERR_NONE;
	long in_savelock=0,out_savelock=0;
	t_jit_matrix_info in_minfo,out_minfo;
	char *out_bp,*in_bp;
	void *in_matrix,*out_matrix;
	float *out_data,*in_data;
	
	//Get pointers to matrices
	in_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);
	out_matrix  = jit_object_method(outputs,_jit_sym_getindex,0);

	if (x&&in_matrix&&out_matrix) 
	{
		//Lock the matrices
		in_savelock = (long) jit_object_method(in_matrix,_jit_sym_lock,1);
		out_savelock = (long) jit_object_method(out_matrix,_jit_sym_lock,1);
		
		if(!x->init) goto out;
		
		//Make sure input is of proper format
		jit_object_method(in_matrix,_jit_sym_getinfo,&in_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);

		if(in_minfo.dimcount != 1)
		{
			err = JIT_ERR_MISMATCH_DIM;
			object_error((t_object*)x, "Make sure object is connected to leftmost outlet of cv.jit.blobs.moments!");
			goto out;
		}
		if(in_minfo.planecount != 17)
		{
			err = JIT_ERR_MISMATCH_PLANE;
			object_error((t_object*)x, "Make sure object is connected to leftmost outlet of cv.jit.blobs.moments!");
			goto out;
		}
		if(in_minfo.type != _jit_sym_float32)
		{
			err = JIT_ERR_MISMATCH_TYPE;
			object_error((t_object*)x, "Make sure object is connected to leftmost outlet of cv.jit.blobs.moments!");
			goto out;
		}

		//Get the data pointers
		jit_object_method(in_matrix,_jit_sym_getdata,&in_bp);
		if (!in_bp) { err=JIT_ERR_INVALID_INPUT; goto out;}
		
		//Set output dims to be the same as input
		out_minfo.dim[0] = in_minfo.dim[0];
		jit_object_method(out_matrix,_jit_sym_setinfo,&out_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);
		jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);
		if (!out_bp) { err=JIT_ERR_INVALID_OUTPUT; goto out;}
		
		in_data = (float *)in_bp;
		out_data = (float *)out_bp;
		
		//Calculate
		cv_jit_blobs_recon_calculate(x, in_data, out_data, in_minfo.dim[0]);
	}
		
out:
	jit_object_method(out_matrix,gensym("lock"),out_savelock);
	jit_object_method(in_matrix,gensym("lock"),in_savelock);
	return err;
}

void cv_jit_blobs_recon_calculate(t_cv_jit_blobs_recon *x, float *in, float *out, int w)
{
	int i,j;
	float *input, *output;
	double data[7];
	
	input = in;
	output = out;
	
	//Init CvMat
	cvInitMatHeader( &x->mat1, x->size, 1, CV_64FC1,data, CV_AUTOSTEP );
	
	for(i=0;i<w;i++)  //For every cell
	{
		//Extract data
		if(x->mode == 0) //Use moments
		{
			for(j=0;j<7;j++)
			{
				data[j] = (double)input[j];
			}
		}
		else //Use Hu invariants
		{
			for(j=0;j<7;j++)
			{
				data[j] = (double)input[j+7];
			}
		}
			
		//Measure
		*output = (float)cvMahalanobis(&x->mat1,&x->mat2,&x->mat3);
		
		input += 17;
		output++;
	}
}

t_cv_jit_blobs_recon *cv_jit_blobs_recon_new(void)
{
	t_cv_jit_blobs_recon *x;
		
	if ((x=(t_cv_jit_blobs_recon *)jit_object_alloc(_cv_jit_blobs_recon_class))) {
	
		x->mode = 0;
		x->size = 7;
		
		x->mean = (double *)sysmem_newptr(x->size * sizeof(double)); //Allocate memory for mean vector
		x->covariance = (double *)sysmem_newptr(x->size * x->size * sizeof(double)); //Allocate memory for covariance matrix
		x->inverse = (double *)sysmem_newptr(x->size * x->size * sizeof(double)); //Allocate memory for inverse matrix
		
		x->init = 0;
		
		//Error checking
		if (!x->mean || !x->covariance || !x->inverse)
		{
			object_error((t_object*)x, "Could not allocate memory.");
			return NULL;
		}

	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_blobs_recon_free(t_cv_jit_blobs_recon *x)
{
	//Free data
	sysmem_freeptr(x->mean);
	sysmem_freeptr(x->covariance);
	sysmem_freeptr(x->inverse);
}

void ByteSwap(unsigned char * b, int n)
{
   int i = 0;
   int j = n-1;
   char tmp;
   while (i<j)
   {
		CV_SWAP(b[i],b[j],tmp);
		i++, j--;
   }
}

