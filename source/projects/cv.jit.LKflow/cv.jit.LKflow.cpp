/*
cv.jit.LKflow
	

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
using namespace c74::max;

typedef struct _cv_jit_LKflow 
{
	t_object				ob;
	int						radius;  //Size of the averaging window
	void 					*imgA;	//Matrix to hold previous frame data
	CvMat					*previous; //Holds previous frame
} t_cv_jit_LKflow;

void *_cv_jit_LKflow_class;

t_jit_err 		cv_jit_LKflow_init(void);
t_cv_jit_LKflow 	*cv_jit_LKflow_new(void);
void 			cv_jit_LKflow_free(t_cv_jit_LKflow *x);
t_jit_err 		cv_jit_LKflow_matrix_calc(t_cv_jit_LKflow *x, void *inputs, void *outputs);

t_jit_err cv_jit_LKflow_init(void) 
{
	long 			attrflags=0;
	t_jit_object 	*attr,*mop;
	
	_cv_jit_LKflow_class = jit_class_new("cv_jit_LKflow",(method)cv_jit_LKflow_new,(method)cv_jit_LKflow_free,sizeof(t_cv_jit_LKflow),A_CANT,0L); //A_CANT = untyped

	//add mop
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop,1,1);
	jit_mop_single_type(mop,_jit_sym_float32);	
	jit_mop_single_planecount(mop,2);	
	jit_class_addadornment(_cv_jit_LKflow_class,mop);
	
	//add methods
	jit_class_addmethod(_cv_jit_LKflow_class, (method)cv_jit_LKflow_matrix_calc, 		"matrix_calc", 		A_CANT, 0L);
	
	//add attributes	
	attrflags = ATTR_GET_DEFER_LOW | ATTR_SET_USURP_LOW;
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"radius",_jit_sym_long,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_LKflow,radius));
	jit_attr_addfilterset_clip(attr,1,7,true,true);	//clip to 1-7
	jit_class_addattr(_cv_jit_LKflow_class,attr);
	
	jit_class_register(_cv_jit_LKflow_class);

	return JIT_ERR_NONE;
}

t_jit_err cv_jit_LKflow_matrix_calc(t_cv_jit_LKflow *x, void *inputs, void *outputs)
{
	t_jit_err err=JIT_ERR_NONE;
	long in_savelock,out_savelock;
	t_jit_matrix_info in_minfo,out_minfo;
	char *in_bp,*out_bp;
	long i,j;
	void *in_matrix,*out_matrix;
	float *out, *outX, *outY;
	int stepX, stepY;
	int radius = x->radius * 2 + 1;
	CvMat current;
	CvMat *flowX=0, *flowY=0;
	
	//First, get pointers to matrices
	in_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);
	out_matrix 	= jit_object_method(outputs,_jit_sym_getindex,0);
	
	if (x&&in_matrix&&out_matrix)
	{ 
		in_savelock   = (long) jit_object_method(in_matrix,_jit_sym_lock,1);
		out_savelock  = (long) jit_object_method(out_matrix,_jit_sym_lock,1);
		
		//Get the matrix info
		jit_object_method(in_matrix,_jit_sym_getinfo,&in_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);		
		
		//Get pointers to the actual matrix data
		jit_object_method(in_matrix,_jit_sym_getdata,&in_bp);
		jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);
		
		//If something is wrong with the pointer...
		if (!in_bp) { err=JIT_ERR_INVALID_INPUT; goto out;}
		if (!out_bp) { err=JIT_ERR_INVALID_OUTPUT; goto out;}
		
		//compatible types?
		if ((in_minfo.type!=_jit_sym_char)||(out_minfo.type!=_jit_sym_float32)) { 
			err=JIT_ERR_MISMATCH_TYPE; 
			goto out;
		}		

		//compatible planes?
		if ((in_minfo.planecount!=1)||(out_minfo.planecount!=2)) { //Accepts only 1-plane matrices
			err=JIT_ERR_MISMATCH_PLANE; 
			goto out;
		}	
		
		//compatible dims?
		if ((in_minfo.dimcount!=2)){
			err=JIT_ERR_MISMATCH_DIM;
			goto out;
		}		
		
		//Check to see if image isn't too small
		if((in_minfo.dim[0] < radius)||(in_minfo.dim[1] < radius)){
			object_error((t_object*)x, "Matrix height and width must be at least %d", radius);
			err = JIT_ERR_GENERIC;
			goto out;
		}
		
		//Convert Jitter matrix to OpenCV matrix
		cvJitter2CvMat(in_matrix, &current);
		flowX = cvCreateMat(current.rows, current.cols,CV_32FC1);
		flowY = cvCreateMat(current.rows, current.cols,CV_32FC1);
		
		if(!flowX || !flowY){
			object_error((t_object*)x, "Failed to create internal data.");
			goto out;
		}
		
		if(!x->previous){
			x->previous = cvCreateMat(current.rows, current.cols, current.type);
			if(!x->previous){
				object_error((t_object*)x, "Failed to create internal matrix.");
				goto out;
			}
		}
		else if((current.cols != x->previous->cols)||(current.rows != x->previous->rows)||(current.step != x->previous->step)||(x->previous->data.ptr == NULL)){
			cvReleaseMat(&x->previous);
			//Because we cast a Jitter matrix into a CvMat, we cannot assume that the step is going to be the same as that 
			//returned by cvCreateMat, hence we need to fudge things by hand.
			x->previous = cvCreateMatHeader(current.rows, current.cols, current.type);
			if(!x->previous){
				object_error((t_object*)x, "Failed to create internal matrix (2).");
				err = JIT_ERR_GENERIC;
				goto out;
			}
			cvInitMatHeader(x->previous, current.rows, current.cols, current.type, 0, current.step);
			cvCreateData(x->previous);
			if(!x->previous->data.ptr){
				object_error((t_object*)x, "Failed to allocate internal memory.");
				err = JIT_ERR_GENERIC;
				cvReleaseMat(&x->previous);
				goto out;
			}
			
			
			//jit_object_method(out_matrix, _jit_sym_clear);
			
		}else {
			
		//Calculate optical flow
		cvCalcOpticalFlowLK(x->previous, &current, cvSize(radius, radius),flowX, flowY);
				
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
			
		}
		cvCopy(&current, x->previous, 0);
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
	
	return err;
}

t_cv_jit_LKflow *cv_jit_LKflow_new(void)
{
	t_cv_jit_LKflow *x;		//jitter object
		
	if ((x=(t_cv_jit_LKflow *)jit_object_alloc(_cv_jit_LKflow_class))) {
	
		x->radius = 2;	//Default values for averaging window
		x->previous = 0;
	
	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_LKflow_free(t_cv_jit_LKflow *x)
{	
	cvReleaseMat(&x->previous);
}