/*
cv.jit.learn
	

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

#ifdef __cplusplus
extern "C" {
#endif
#include "jit.common.h"
#ifdef __cplusplus
}
#endif

#include "cv.h"


typedef struct {
	t_object b_ob;  //The object
	void *m_proxy; //Pointer to proxy object
	void *m_out;  //Pointer to outlet
	short m_argc; //Number of arguments
	t_atom m_argv[128]; //Arguments
	long b_id; //Inlet ID
	long inlet_number;
	
	long size; //The number of elements in the lists to be compared
	double *mean; //The mean vector
	double *covariance; //Covariance matrix
	double *inverse; //Pseudo-inverse of covariance matrix
	double index; //Number of samples
	CvMat mat1;
	CvMat mat2;
	CvMat mat3;
} t_cv_jit_learn;

#define cv_jit_learn_PROXY_GETINLET(x) (proxy_getinlet? proxy_getinlet((t_object *)x) : x->b_id)

void cv_jit_learn_list(t_cv_jit_learn *x, t_symbol *s, short argc, t_atom *argv);
void cv_jit_learn_assist(t_cv_jit_learn *x, void *b, long m, long a, char *s);
void cv_jit_learn_free(t_cv_jit_learn *x);
void *cv_jit_learn_new(long num);
void cv_jit_learn_clear(t_cv_jit_learn *x);
void cv_jit_learn_read(t_cv_jit_learn *x, t_symbol *s, short argc, t_atom *argv);
void cv_jit_learn_write(t_cv_jit_learn *x, t_symbol *s, short argc, t_atom *argv);

void ByteSwap(unsigned char * b, int n);

void *cv_jit_learn_class;

t_symbol *ps_list;

#ifdef __cplusplus
extern "C"
#endif
void ext_main(void* unused)
{
	//Setup object
	union { void **v_ptr; t_messlist **m_ptr; } alias_ptr;
	alias_ptr.v_ptr = &cv_jit_learn_class;
	setup(alias_ptr.m_ptr, (method)cv_jit_learn_new, (method)cv_jit_learn_free, (short)sizeof(t_cv_jit_learn), 0L, A_DEFLONG, 0);
	
	//Add messages
	addmess((method)cv_jit_learn_list, "list", A_GIMME, 0);  //Object only understands lists
	addmess((method)cv_jit_learn_clear, "clear", 0);
	addmess((method)cv_jit_learn_clear, "reset", 0);
	addmess((method)cv_jit_learn_read, "read", A_GIMME,0);
	addmess((method)cv_jit_learn_write, "write", A_GIMME,0);
	addmess((method)cv_jit_learn_assist,"assist",A_CANT,0);
	
	ps_list = gensym("list");
	
	return 0;			
}

void cv_jit_learn_clear(t_cv_jit_learn *x)
{	
	int i,j;
	//Clear index
	x->index = 0;
	
	//Clear data
	for(i=0;i<x->size;i++)
	{
		x->mean[i] = 0;
		for(j=0;j<x->size;j++)
		{
			x->covariance[i*x->size + j] = 0;
			x->inverse[i*x->size + j] = 0;
		}
	}
}

void cv_jit_learn_read(t_cv_jit_learn *x, t_symbol *s, short argc, t_atom *argv)
{
	char fname[MAX_FILENAME_CHARS];
	short id;
	t_filehandle handle;
	t_ptr_size count;
	long cvjt;
	t_fourcc type;
	t_fourcc code;
	int i;
	
	code = FOUR_CHAR_CODE( 'maxb' );
	
	if(argc > 0)
	{
		if(argv[0].a_type != A_SYM)
		{
			error("Invalid argument to read command. Make sure argument is a symbol.");
			return;
		}
		strcpy(fname,argv[0].a_w.w_sym->s_name);
		if(!locatefile_extended(fname,&id,&type,&type,-1))
		{
			path_opensysfile(argv[0].a_w.w_sym->s_name, id, &handle, READ_PERM); 
		}
		else
		{
			error("Could not find file %s",argv[0].a_w.w_sym->s_name);
			return;
		}
	}
	
	else if(!open_dialog(fname, &id, &type,&code,1))
	{
		//Open file
		if(path_opensysfile(fname, id, &handle, READ_PERM))
		{
			error("Could not open file %s",fname);
			return;
		}
	}
	
	else return;
	
	//Load file
	
	//Check ID code
	count = sizeof(t_int32);
	sysfile_read(handle, &count, &cvjt);
	
	if(cvjt == FOUR_CHAR_CODE( 'cvjt' ))
	{
		//Free storage
		sysmem_freeptr(x->mean, x->size * sizeof(double));
		sysmem_freeptr(x->covariance, x->size * x->size * sizeof(double));
		sysmem_freeptr(x->inverse, x->size * x->size * sizeof(double));
		//Read list length
		count = sizeof(t_int32);
		sysfile_read(handle, &count, &x->size);
		//Allocate new memory for storage	
		x->mean = (double *)sysmem_newptr(x->size * sizeof(double)); //Allocate memory for mean vector
		x->covariance = (double *)sysmem_newptr(x->size * x->size * sizeof(double)); //Allocate memory for covariance matrix
		x->inverse = (double *)sysmem_newptr(x->size * x->size * sizeof(double)); //Allocate memory for inverse matrix
		//Read index
		count = sizeof(double);
		sysfile_read(handle, &count, &x->index);
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
	else if (cvjt == FOUR_CHAR_CODE( 'tjvc' )) //File was created on another platform, with different endian, switch
	{
		//Free storage
		sysmem_freeptr(x->mean, x->size * sizeof(double));
		sysmem_freeptr(x->covariance, x->size * x->size * sizeof(double));
		sysmem_freeptr(x->inverse, x->size * x->size * sizeof(double));
		//Read list length
		count = sizeof(t_int32);
		sysfile_read(handle, &count, &x->size);
		ByteSwap((unsigned char *)&x->size,sizeof(t_int32));
		//Allocate new memory for storage	
		x->mean = (double *)sysmem_newptr(x->size * sizeof(double)); //Allocate memory for mean vector
		x->covariance = (double *)sysmem_newptr(x->size * x->size * sizeof(double)); //Allocate memory for covariance matrix
		x->inverse = (double *)sysmem_newptr(x->size * x->size * sizeof(double)); //Allocate memory for inverse matrix
		//Read index
		count = sizeof(double);
		sysfile_read(handle, &count, &x->index);
		ByteSwap((unsigned char *)&x->index,sizeof(double));
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
	else //No match, output error
	{
		error("File %s was not created by cv.jit.learn.", fname);
		sysfile_close(handle);
		return;
	}
}

void cv_jit_learn_write(t_cv_jit_learn *x, t_symbol *s, short argc, t_atom *argv)
{
	char fname[256];
	short id;
	t_filehandle handle;
	t_ptr_size count;
	long cvjt;
	
	strcpy(fname,".mxb");  //Display .mxb in the dialog box	
	if(!saveas_dialog(fname, &id, 0L))
	{
		path_createsysfile(fname, id, FOUR_CHAR_CODE( 'cvjt' ), &handle); 
		//Write ID code
		count = sizeof(t_int32);
		cvjt = FOUR_CHAR_CODE( 'cvjt' );
		sysfile_write(handle, &count, &cvjt);
		//Write list length
		count = sizeof(t_int32);
		sysfile_write(handle, &count, &x->size);
		//Write index
		count = sizeof(double);
		sysfile_write(handle, &count, &x->index);
		//Write mean vector
		count = sizeof(double) * x->size;
		sysfile_write(handle, &count, x->mean);
		//Write covariance matrix
		count = sizeof(double) * x->size * x->size;
		sysfile_write(handle, &count, x->covariance);
		//Write inverse matrix
		count = sizeof(double) * x->size * x->size;
		sysfile_write(handle, &count, x->inverse);
		
		//Close file
		sysfile_close(handle);
	}
}

void cv_jit_learn_list(t_cv_jit_learn *x, t_symbol *s, short argc, t_atom *argv)
{
	long inletNum;
	long i, j,ndx;
	double a, b;
	double data[256];
	double distance;
	
	//Make sure list is of proper size
	if(argc != x->size)
	{
		error("Input must be a list with %d elements", x->size);
		return;
	}
	
	//Extract and verify data
	for(i=0;i<argc;i++)
	{		
		if(argv[i].a_type == A_LONG)
			data[i] = (double) argv[i].a_w.w_long;
		else if(argv[i].a_type == A_FLOAT)
			data[i] = (double) argv[i].a_w.w_float;
		else
		{
			error("Invalid data in list, make sure it only contains numbers.");
			return;
		}
	}
	
	//Get inlet number
	inletNum = proxy_getinlet((t_object *)x);
	
	if(inletNum == 1) //List arrived in "learn" inlet
	{
		x->index++;
		a = 1/x->index;
		b = 1-a;
		
		//Calculate mean vector
		for(i=0;i<x->size;i++)
		{
			x->mean[i] = data[i] * a + x->mean[i] * b;
		}
		
		//Calculate covariance matrix
		for(i=0,ndx=0;i<x->size;i++)
		{
			for(j=0;j<x->size;j++,ndx++)
			{
				x->covariance[ndx] = ((data[i] - x->mean[i]) * (data[j] - x->mean[j])) * a + x->covariance[ndx] * b;
			}
		}
		
		//Calculate pseudo-inverse of covariance matrix
		//Init CvMat
		cvInitMatHeader( &x->mat1, x->size, x->size, CV_64FC1,x->covariance, CV_AUTOSTEP );
		cvInitMatHeader( &x->mat2, x->size, x->size, CV_64FC1,x->inverse, CV_AUTOSTEP );
		//Calculate
		cvInvert(&x->mat1,&x->mat2,CV_SVD);
		
	}
	else if(inletNum == 0) //List arrived in "compare" inlet
	{		
		//Init CvMat
		cvInitMatHeader( &x->mat1,x->size,1, CV_64FC1,data, CV_AUTOSTEP );
		cvInitMatHeader( &x->mat2,x->size,1, CV_64FC1,x->mean, CV_AUTOSTEP );
		cvInitMatHeader( &x->mat3, x->size, x->size, CV_64FC1,x->inverse, CV_AUTOSTEP );
		
		distance = cvMahalanobis(&x->mat1,&x->mat2,&x->mat3);
		
		//Output
		outlet_float(x->m_out, (float)distance);
	}
}

void cv_jit_learn_assist(t_cv_jit_learn *x, void *b, long m, long a, char *s)
{
	if (m==ASSIST_INLET) 
	{ 
		switch (a) 
		{ 
		case 0: 
			sprintf(s,"List to compare"); 
			break; 
		case 1: 
			sprintf(s,"List to learn"); 
			break; 
		} 
	} else if (m==ASSIST_OUTLET) 
	{ 
		sprintf(s,"Statistical distance"); 
	} 
}

void cv_jit_learn_free(t_cv_jit_learn *x)
{
	//Free proxy
	freeobject((t_object *)x->m_proxy);
	//Free data
	sysmem_freeptr(x->mean, x->size * sizeof(double));
	sysmem_freeptr(x->covariance, x->size * x->size * sizeof(double));
	sysmem_freeptr(x->inverse, x->size * x->size * sizeof(double));
}

void *cv_jit_learn_new(long arg)
{
	t_cv_jit_learn *x;
	long mat_size;
	
	//Create object
	x = (t_cv_jit_learn *)newobject(cv_jit_learn_class);
	
	//Create proxy
	x->m_proxy = proxy_new(x,1,&x->inlet_number); 
	
	//Create outlet
	x->m_out = outlet_new(x,0L);
	
	//Set size
	x->size = arg > 0 ? arg : 7;  //If argument is 0, or no argument is given defauly to 7 (number of moments and Hu invariants).
	mat_size = x->size * x->size;
	
	x->mean = (double *)sysmem_newptr(x->size * sizeof(double)); //Allocate memory for mean vector
	x->covariance = (double *)sysmem_newptr(mat_size * sizeof(double)); //Allocate memory for covariance matrix
	x->inverse = (double *)sysmem_newptr(mat_size * sizeof(double)); //Allocate memory for inverse matrix
	
	//Error checking
	if (!x->mean || !x->covariance || !x->inverse)
	{
		error("Could not allocate memory.");
		return NULL;
	}
	
	//Set index
	x->index = 0;
	
	return x;
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

