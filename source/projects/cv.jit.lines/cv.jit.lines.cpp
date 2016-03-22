/*
cv.jit.lines
	

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

#include "ext_jitter.h"
#include "cv.h"
#include "jitOpenCV.h"

#define THRESHOLD_RANGE 10

typedef struct _cv_jit_lines 
{
	t_object			ob;
	
	double				threshold;
	long				sensitivity;
	double				gap;
	double				length;
	long				resolution;
	
	CvMat				*edges;
	CvMemStorage		* storage;
	CvSeq*				lines;
} t_cv_jit_lines;

void *_cv_jit_lines_class;

t_jit_err			cv_jit_lines_init(void);
t_cv_jit_lines		*cv_jit_lines_new(void);
void				cv_jit_lines_free(t_cv_jit_lines *x);
t_jit_err			cv_jit_lines_matrix_calc(t_cv_jit_lines *x, void *inputs, void *outputs);

t_jit_err cv_jit_lines_init(void) 
{
	long attrflags=0;
	t_jit_object *attr,*mop,*output;
	
	_cv_jit_lines_class = jit_class_new("cv_jit_lines",(method)cv_jit_lines_new,(method)cv_jit_lines_free,
		sizeof(t_cv_jit_lines),0L);

	//add mop
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop,1,1);  //Object has one input and one output

   	jit_mop_single_type(mop,_jit_sym_char);   //Set input type and planecount
   	jit_mop_single_planecount(mop,1);  
   	jit_mop_output_nolink(mop,1); //Turn off output linking so that output matrix does not adapt to input
   	
   	output = (t_jit_object *)jit_object_method(mop,_jit_sym_getoutput,1); //Get a pointer to the output matrix
   	jit_attr_setlong(output,_jit_sym_minplanecount,4);  //Set output plane count
  	jit_attr_setlong(output,_jit_sym_maxplanecount,4); //4 -> Coordinates of start and end points for each line
  	jit_attr_setlong(output,_jit_sym_mindim,1);  //Only one dimension
  	jit_attr_setlong(output,_jit_sym_maxdim,1);
  	jit_attr_setsym(output,_jit_sym_types,_jit_sym_long);
  	
  	jit_class_addadornment(_cv_jit_lines_class,mop);
  	
	//add methods
	jit_class_addmethod(_cv_jit_lines_class, (method)cv_jit_lines_matrix_calc, 		"matrix_calc", 		A_CANT, 0L);
	
	//add attributes	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"threshold",_jit_sym_float64,attrflags,
		(method)0L,(method)0L,calcoffset(t_cv_jit_lines,threshold));
	jit_attr_addfilterset_clip(attr,1,255,TRUE,TRUE);	//clip to 1-255
	jit_class_addattr(_cv_jit_lines_class,attr);
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"resolution",_jit_sym_long,attrflags,
		(method)0L,(method)0L,calcoffset(t_cv_jit_lines,resolution));
	jit_attr_addfilterset_clip(attr,1,10,TRUE,TRUE);	//clip to 1-10
	jit_class_addattr(_cv_jit_lines_class,attr);
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"gap",_jit_sym_float64,attrflags,
		(method)0L,(method)0L,calcoffset(t_cv_jit_lines,gap));
	jit_class_addattr(_cv_jit_lines_class,attr);
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"length",_jit_sym_float64,attrflags,
		(method)0L,(method)0L,calcoffset(t_cv_jit_lines,length));
	jit_class_addattr(_cv_jit_lines_class,attr);
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"sensitivity",_jit_sym_long,attrflags,
		(method)0L,(method)0L,calcoffset(t_cv_jit_lines,sensitivity));
	jit_attr_addfilterset_clip(attr,1,255,TRUE,TRUE);	//clip to 1-255
	jit_class_addattr(_cv_jit_lines_class,attr);
	
	jit_class_register(_cv_jit_lines_class);

	return JIT_ERR_NONE;
}

t_jit_err cv_jit_lines_matrix_calc(t_cv_jit_lines *x, void *inputs, void *outputs)
{
	t_jit_err err = JIT_ERR_NONE;
	long in_savelock,out_savelock;
	t_jit_matrix_info in_minfo,out_minfo;
	char *in_bp,*out_bp;
	long i,dimcount,dim[JIT_MATRIX_MAX_DIMCOUNT];
	void *in_matrix,*out_matrix;
	t_int32 *out;
	
	double thresh1, thresh2, theta, rho;
	int houghThresh;
	
	CvMat source;
	CvPoint *ln;
	
	in_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);
	out_matrix 	= jit_object_method(outputs,_jit_sym_getindex,0);

	if (x&&in_matrix&&out_matrix) {
		
		in_savelock = (long) jit_object_method(in_matrix,_jit_sym_lock,1);
		out_savelock = (long) jit_object_method(out_matrix,_jit_sym_lock,1);
		
		jit_object_method(in_matrix,_jit_sym_getinfo,&in_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);
		
		jit_object_method(in_matrix,_jit_sym_getdata,&in_bp);
		
		if (!in_bp) { err=JIT_ERR_INVALID_INPUT; goto out;}
		
		//compatible types?
		if (in_minfo.type!=_jit_sym_char) { 
			err=JIT_ERR_MISMATCH_TYPE; 
			goto out;
		}		

		//compatible planes?
		if ((in_minfo.planecount!=1)||(out_minfo.planecount!=4)) { 
			err=JIT_ERR_MISMATCH_PLANE; 
			goto out;
		}		

		//get dimensions/planecount
		dimcount   = in_minfo.dimcount;
		for (i=0;i<dimcount;i++) {
			dim[i] = MIN(in_minfo.dim[i],out_minfo.dim[i]);
		}		
		
		//Convert input matrix to OpenCV matrices
		cvJitter2CvMat(in_matrix, &source);
		
		//Adjust size of edge matrix if need be
		if((x->edges->rows != source.rows)||(x->edges->cols != source.cols))
		{
			cvReleaseMat(&(x->edges));
			x->edges = cvCreateMat( source.rows, source.cols, CV_8UC1 );
		}
		
		//Calculate parameter values for Hough and Canny algorithms
		thresh1 = x->threshold - THRESHOLD_RANGE;
		thresh2 = x->threshold + THRESHOLD_RANGE;
		CLIP_ASSIGN(thresh1,0,255);
		CLIP_ASSIGN(thresh2,0,255);
		
		theta = CV_PI /  (180 / (double)x->resolution);
		rho = (double)x->resolution;
		
		houghThresh = x->sensitivity;
		
		x->gap = MAX(0,x->gap);
		x->length = MAX(0,x->length);
				
		//calculate edges using Canny algorithm
		cvCanny( &source, x->edges, thresh1, thresh2, 3 );
		
		//Find lines using the probabilistic Hough transform method
		x->lines = cvHoughLines2( x->edges, x->storage, CV_HOUGH_PROBABILISTIC, rho, theta, houghThresh, x->length, x->gap );
		
		//Transfer line information to output matrix
		
		//First adjust matrix size
		out_minfo.dim[0] = x->lines->total;
		jit_object_method(out_matrix,_jit_sym_setinfo,&out_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);
		
		jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);
		if (!out_bp) { err=JIT_ERR_INVALID_OUTPUT; goto out;}
		
		//Copy...
		out = (t_int32 *)out_bp;
		
		for( i = 0; i < x->lines->total; i++ )
       	 	{
            		ln = (CvPoint*)cvGetSeqElem(x->lines,i);
            		out[0] = ln[0].x;
            		out[1] = ln[0].y;
            		out[2] = ln[1].x;
            		out[3] = ln[1].y;
            		
            		out+=4;
        	}
		
	} else {
		return JIT_ERR_INVALID_PTR;
	}
	
out:
	jit_object_method(out_matrix,gensym("lock"),out_savelock);
	jit_object_method(in_matrix,gensym("lock"),in_savelock);
	return err;
}

t_cv_jit_lines *cv_jit_lines_new(void)
{
	t_cv_jit_lines *x;
		
	if ((x=(t_cv_jit_lines *)jit_object_alloc(_cv_jit_lines_class))) {
		
		x->threshold = 150;
		x->sensitivity = 50;
		x->resolution = 1;
		x->length = 10;
		x->gap = 2;
		
		x->storage = cvCreateMemStorage(0);
		x->lines = 0;
		x->edges = cvCreateMat( 1, 1, CV_8UC1 );
	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_lines_free(t_cv_jit_lines *x)
{
	if(x->storage)
		cvReleaseMemStorage(&(x->storage));
	if(x->edges)
		cvReleaseMat(&(x->edges));
}
