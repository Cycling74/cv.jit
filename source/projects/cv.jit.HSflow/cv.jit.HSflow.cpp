/*
cv.jit.HSflow
	

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


#include "cv.h"
#include "jitOpenCV.h"
#include "c74_jitter.h"
#include <opencv2/legacy/legacy.hpp>

using namespace c74::max;

typedef struct _cv_jit_HSflow 
{
	t_object				ob;
	float					lambda;  //Size of the averaging window
	float					threshold;
	int						maxIter;
	int						usePrevious;
	void 					*imgA;	//Matrix to hold previous frame data
} t_cv_jit_HSflow;

void *_cv_jit_HSflow_class;

t_jit_err 		cv_jit_HSflow_init(void);
t_cv_jit_HSflow *cv_jit_HSflow_new(void);
void 			cv_jit_HSflow_free(t_cv_jit_HSflow *x);
t_jit_err 		cv_jit_HSflow_matrix_calc(t_cv_jit_HSflow *x, void *inputs, void *outputs);

t_jit_err cv_jit_HSflow_init(void) 
{
	long 			attrflags=0;
	t_jit_object 	*attr,*mop;
	
	_cv_jit_HSflow_class = jit_class_new("cv_jit_HSflow",(method)cv_jit_HSflow_new,(method)cv_jit_HSflow_free,sizeof(t_cv_jit_HSflow),A_CANT,0L); //A_CANT = untyped

	//add mop
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop,1,1);
	jit_mop_single_type(mop,_jit_sym_float32);	
	jit_mop_single_planecount(mop,2);	
	jit_class_addadornment(_cv_jit_HSflow_class,mop);
	
	//add methods
	jit_class_addmethod(_cv_jit_HSflow_class, (method)cv_jit_HSflow_matrix_calc, 		"matrix_calc", 		A_CANT, 0L);
	
	//add attributes	
	attrflags = ATTR_GET_DEFER_LOW | ATTR_SET_USURP_LOW;
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"maxiter",_jit_sym_long,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_HSflow,maxIter));
	jit_class_addattr(_cv_jit_HSflow_class,attr);
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"lambda",_jit_sym_float32,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_HSflow,lambda));
	jit_class_addattr(_cv_jit_HSflow_class,attr);
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"threshold",_jit_sym_float32,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_HSflow,threshold));
	jit_class_addattr(_cv_jit_HSflow_class,attr);
	
	jit_class_register(_cv_jit_HSflow_class);

	return JIT_ERR_NONE;
}

t_jit_err cv_jit_HSflow_matrix_calc(t_cv_jit_HSflow *x, void *inputs, void *outputs)
{
	t_jit_err err=JIT_ERR_NONE;
	void * in_savelock, * out_savelock, * prev_savelock;
	t_jit_matrix_info in_minfo,out_minfo,prev_minfo;
	char *in_bp,*out_bp,*prev_bp;
	long i,j/*,dimcount,planecount,dim[JIT_MATRIX_MAX_DIMCOUNT]*/;
	void *in_matrix,*out_matrix,*prev_matrix;
	float *out, *outX, *outY;
	int stepX, stepY;
	CvMat previous, current;
	CvMat *flowX=0, *flowY=0;
	
	//First, get pointers to matrices
	in_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);
	out_matrix 	= jit_object_method(outputs,_jit_sym_getindex,0);
	prev_matrix = x->imgA;

	if (x&&in_matrix&&out_matrix&&prev_matrix) //If all pointers are valid...
	{ 
		in_savelock   = jit_object_method(in_matrix,_jit_sym_lock,1);
		out_savelock  = jit_object_method(out_matrix,_jit_sym_lock,1);
		prev_savelock = jit_object_method(prev_matrix,_jit_sym_lock,1);
		
		//Get the matrix info
		jit_object_method(in_matrix,_jit_sym_getinfo,&in_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);
		jit_object_method(prev_matrix,_jit_sym_getinfo,&prev_minfo);
		
		//Copy the info structure of the input matrix to the internal matrix	
		jit_object_method(prev_matrix,_jit_sym_setinfo,&in_minfo);
			
		//Get pointers to the actual matrix data
		jit_object_method(in_matrix,_jit_sym_getdata,&in_bp);
		jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);
		jit_object_method(prev_matrix,_jit_sym_getdata,&prev_bp);
				
		//If something is wrong with the pointer...
		if (!in_bp)   { err=JIT_ERR_INVALID_INPUT; goto out;}
		if (!out_bp)  { err=JIT_ERR_INVALID_OUTPUT; goto out;}
		if (!prev_bp) { err=JIT_ERR_INVALID_PTR; goto out;}
		
		//compatible types?
		if ((in_minfo.type!=_jit_sym_char)||(out_minfo.type!=_jit_sym_float32)) 
		{ 
			err=JIT_ERR_MISMATCH_TYPE; 
			goto out;
		}		

		//compatible planes?
		if ((in_minfo.planecount!=1)||(out_minfo.planecount!=2)) 
		{ 
			err=JIT_ERR_MISMATCH_PLANE; 
			goto out;
		}	
		
		//compatible dims?
		if ((in_minfo.dimcount!=2))
		{
			err=JIT_ERR_MISMATCH_DIM;
			goto out;
		}		
		
		//Convert Jitter matrix to OpenCV matrix
        current = cvJitter2CvMat(in_minfo, in_bp);
        previous = cvJitter2CvMat(prev_minfo, prev_bp);
		flowX = cvCreateMat(current.rows, current.cols,CV_32FC1);
		flowY = cvCreateMat(current.rows, current.cols,CV_32FC1);
		
		if(!flowX || !flowY){
			object_error((t_object*)x, "Failed to created internal data.");
			goto out;
		}
		
		//Calculate optical flow
		cvCalcOpticalFlowHS(&previous,&current, 0,flowX, flowY,x->lambda,
			cvTermCriteria(CV_TERMCRIT_ITER+CV_TERMCRIT_EPS,x->maxIter,x->threshold));
			
		//Copy to output
		out = (float *)out_bp;
		outX = flowX->data.fl;
		outY = flowY->data.fl;
		stepX = flowX->step / sizeof(float);
		stepY = flowY->step / sizeof(float);
		for(i=0;i<out_minfo.dim[1];i++){
			out=(float *)(out_bp+i*out_minfo.dimstride[1]);
			outX=flowX->data.fl+i*stepX;
			outY=flowY->data.fl+i*stepY;
			for(j=0;j<out_minfo.dim[0];j++){
				out[0] = *outX;
				out[1] = *outY;
				out+=2;
				outX++;
				outY++;
			}
		}
		
		//Save matrix for next pass
		jit_object_method(prev_matrix,_jit_sym_frommatrix,in_matrix,NULL);
	} 
	else 
	{
		return JIT_ERR_INVALID_PTR;
	}
	
out:
	if(flowX)cvReleaseMat(&flowX);
	if(flowY)cvReleaseMat(&flowY);
	
	jit_object_method(out_matrix, gensym("lock"),out_savelock);
	jit_object_method(in_matrix,  gensym("lock"),in_savelock);
	jit_object_method(prev_matrix,gensym("lock"),prev_savelock);
	
	return err;
}

t_cv_jit_HSflow *cv_jit_HSflow_new(void)
{
	t_cv_jit_HSflow *x;		//jitter object
	void *m;				//matrix pointer for previous frame 
	t_jit_matrix_info info;	//info struct for prev. frame matrix
		
	if ((x=(t_cv_jit_HSflow *)jit_object_alloc(_cv_jit_HSflow_class))) {
	
		x->lambda      = (float)0.001;		
		x->usePrevious = 0;
		x->maxIter    = 3;
		x->threshold = 0.f;
		
		jit_matrix_info_default(&info);								//Fill info structure with default values
		info.type = _jit_sym_char;
		info.dimcount = 2;
		info.planecount = 1;
		m = (t_jit_object*)jit_object_new(_jit_sym_jit_matrix, &info);				//Create a new matrix
		if(!m) object_error((t_object*)x, "could not allocate internal matrix!");
		jit_object_method(m,_jit_sym_clear);						//Clear data
		x->imgA = m;												//Copy matrix pointer to jitter object
		
	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_HSflow_free(t_cv_jit_HSflow *x)
{
	jit_object_free(x->imgA); //Free matrix memory
}
