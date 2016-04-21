/*
cv.jit.features
	

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

using namespace c74::max;
#include "cv.h"
#include "jitOpenCV.h"

#define CLAMP(a, lo, hi) ( (a)>(lo)?( (a)<(hi)?(a):(hi) ):(lo) )
#define CLIP_ASSIGN(a, lo, hi) ((a) = ( (a)>(lo)?( (a)<(hi)?(a):(hi) ):(lo) ))

typedef struct _cv_jit_features 
{
	t_object				ob;
	CvMat*				eigImage; //Matrix to hold eigen image
	CvMat*				tempImage; //Temporary image for algorithm
	CvPoint2D32f 			features[2048]; //Array to hold feature positions
	double				threshold; //Set threshold for corner detection
	double				distance; //Set minimum distance between two features
	long					roi[4];
	long					roicount;
	char					useroi;
	char				precision;
	long				aperture;
	
} t_cv_jit_features;

void *_cv_jit_features_class;

t_jit_err 				cv_jit_features_init(void); 
t_cv_jit_features *	cv_jit_features_new(void);
void 					cv_jit_features_free(t_cv_jit_features *x);
t_jit_err 				cv_jit_features_matrix_calc(t_cv_jit_features *x, void *inputs, void *outputs);

t_jit_err cv_jit_features_init(void) 
{
	long attrflags=0;
	t_jit_object *attr,*mop,*output;
	t_symbol *atsym;
	
	atsym = gensym("jit_attr_offset");
	
	_cv_jit_features_class = jit_class_new("cv_jit_features",(method)cv_jit_features_new,(method)cv_jit_features_free,
		sizeof(t_cv_jit_features),A_CANT,0L); //A_CANT = untyped

	//add mop
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop,1,1);  //Object has one input and one output
	output = (t_jit_object *)jit_object_method(mop,_jit_sym_getoutput,1); //Get a pointer to the output matrix

   	jit_mop_single_type(mop,_jit_sym_char);   //Set input type and planecount
   	jit_mop_single_planecount(mop,1);  
   	
   	jit_mop_output_nolink(mop,1); //Turn off output linking so that output matrix does not adapt to input
   	
   	jit_attr_setlong(output,_jit_sym_minplanecount,2);  //Two planes, holding the feature's coordinates 
  	jit_attr_setlong(output,_jit_sym_maxplanecount,2);
  	jit_attr_setlong(output,_jit_sym_mindim,1); //Only one dimension
  	jit_attr_setlong(output,_jit_sym_maxdim,1);
  	jit_attr_setsym(output,_jit_sym_types,_jit_sym_float32); //Coordinates are returned with sub-pixel accuracy
   	   	
	jit_class_addadornment(_cv_jit_features_class,mop);
	
	
	//add methods
	jit_class_addmethod(_cv_jit_features_class, (method)cv_jit_features_matrix_calc, 		"matrix_calc", 		A_CANT, 0L);	

	//add attributes	
	attrflags = ATTR_GET_DEFER_LOW | ATTR_SET_USURP_LOW;
	
	//threshold
	attr = (t_jit_object *)jit_object_new(	_jit_sym_jit_attr_offset,"threshold",_jit_sym_float64,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_features,threshold));			
	jit_attr_addfilterset_clip(attr,0.001,1,true,true);	//clip to 0.001-1
	jit_class_addattr(_cv_jit_features_class, attr);
	
	//minimum distance
	attr = (t_jit_object *)jit_object_new(	_jit_sym_jit_attr_offset,"distance",_jit_sym_float64,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_features,distance));			
	jit_attr_addfilterset_clip(attr,0,0,true,false);	//clip to 0
	jit_class_addattr(_cv_jit_features_class, attr);
	
	//roi
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset_array, "roi", _jit_sym_long, 4, attrflags, (method)0L, (method)0L, calcoffset(t_cv_jit_features, roicount),calcoffset(t_cv_jit_features,roi));
	jit_class_addattr(_cv_jit_features_class, attr);
	
	attr = (t_jit_object *)jit_object_new(	_jit_sym_jit_attr_offset,"useroi",_jit_sym_char,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_features,useroi));			
	jit_attr_addfilterset_clip(attr,0,1,true,true);	//clip to 0-1
	jit_class_addattr(_cv_jit_features_class, attr);
	
	//Precision
	attr = (t_jit_object *)jit_object_new(	_jit_sym_jit_attr_offset,"precision",_jit_sym_char,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_features,precision));			
	jit_attr_addfilterset_clip(attr,0,1,true,true);	//clip to 0-1
	jit_class_addattr(_cv_jit_features_class, attr);
			
	jit_class_register(_cv_jit_features_class);

	return JIT_ERR_NONE;
}

t_jit_err cv_jit_features_matrix_calc(t_cv_jit_features *x, void *inputs, void *outputs)
{
	t_jit_err err=JIT_ERR_NONE;
	long in_savelock=0,out_savelock=0;
	t_jit_matrix_info in_minfo,out_minfo;
	char *out_bp, *in_bp;
	void *in_matrix,*out_matrix;
	int i;
	int roi_w,roi_h,roi_offset;
	float *out_data;
	CvMat source;
	int featureCount = 2048;
	
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
		
		//Don't process if one dimension is < 2
		if((in_minfo.dim[0] < 2)||(in_minfo.dim[1] < 2))
			goto out;
		
		if(x->useroi)
		{
			CLIP_ASSIGN(x->roi[0],0,in_minfo.dim[0]);
			CLIP_ASSIGN(x->roi[1],0,in_minfo.dim[1]);
			CLIP_ASSIGN(x->roi[2],0,in_minfo.dim[0]);
			CLIP_ASSIGN(x->roi[3],0,in_minfo.dim[1]);
			
			x->roi[0] = MIN(x->roi[0], x->roi[2]);
			x->roi[1] = MIN(x->roi[1], x->roi[3]);
			x->roi[2] = MAX(x->roi[0], x->roi[2]);
			x->roi[3] = MAX(x->roi[1], x->roi[3]);
			
			roi_w = x->roi[2] - x->roi[0];
			roi_h = x->roi[3] - x->roi[1];
			
			if(roi_w == 0)
				roi_w = in_minfo.dim[0] - x->roi[0];
			if(roi_h == 0)
				roi_h = in_minfo.dim[1] - x->roi[1];
				
			roi_offset = x->roi[1] * in_minfo.dimstride[1] + x->roi[0];
			
			jit_object_method(in_matrix,_jit_sym_getdata,&in_bp);
			
			//Convert Jitter matrix to OpenCV matrix
			cvInitMatHeader( &source, roi_h, roi_w, CV_8UC1, in_bp + roi_offset, in_minfo.dimstride[1] );
		}
		else
		{
			//Convert Jitter matrix to OpenCV matrix
			cvJitter2CvMat(in_matrix, &source);
		}
		
		//Adjust the size of eigImage and tempImage if need be
		if((source.cols != x->eigImage->cols)||(source.rows != x->eigImage->rows))
		{
			cvReleaseMat(&(x->eigImage));
			x->eigImage = cvCreateMat( source.rows, source.cols, CV_32FC1 );
			cvReleaseMat(&(x->tempImage));
			x->tempImage = cvCreateMat( source.rows, source.cols, CV_32FC1 );
		}
		
		//Adjust parameters
		x->threshold = MAX(0.001,x->threshold);
		x->distance = MAX(1,x->distance);
		
		//Calculate
		cvGoodFeaturesToTrack( &source, x->eigImage, x->tempImage,x->features, &featureCount,x->threshold, x->distance,NULL, x->aperture,0, 0.04 );
		
		if(x->precision == 1){
			int minsize = (x->aperture*2)+5;
			
			//Error check for cvFindCornerSubPix
			if((featureCount>0)&&(source.cols > minsize)&&(source.rows > minsize))
				cvFindCornerSubPix( &source, x->features, featureCount, cvSize(x->aperture,x->aperture),cvSize(-1,-1),cvTermCriteria(CV_TERMCRIT_ITER, 10, 0.1f));
		}
		
		
		//Prepare output
		out_minfo.dim[0] = featureCount;
		jit_object_method(out_matrix,_jit_sym_setinfo,&out_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);
		jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);
		if (!out_bp) { err=JIT_ERR_INVALID_OUTPUT; goto out;}
		
		out_data = (float *)out_bp;
		
		if(x->useroi)
		{
			for(i=0; i < featureCount; i++)
			{
				out_data[0] = x->features[i].x + x->roi[0];
				out_data[1] = x->features[i].y + x->roi[1];
				
				out_data += 2;
			}
		}
		else
		{
			for(i=0; i < featureCount; i++)
			{
				out_data[0] = x->features[i].x;
				out_data[1] = x->features[i].y;
				
				out_data += 2;
			}
		}
	}

	
out:
	jit_object_method(out_matrix,gensym("lock"),out_savelock);
	jit_object_method(in_matrix,gensym("lock"),in_savelock);
	return err;
}



t_cv_jit_features *cv_jit_features_new(void)
{
	t_cv_jit_features *x;
		
	if ((x=(t_cv_jit_features *)jit_object_alloc(_cv_jit_features_class))) {
	
		x->threshold = 0.1;
		x->distance = 5;
		x->roi[0] = x->roi[1] = x->roi[2] = x->roi[3] = 0;
		x->useroi = 0;
		x->precision = 0;
		x->aperture = 3;
		
		//Initialize matrices
		x->eigImage = cvCreateMat( 1, 1, CV_32FC1 );
		x->tempImage = cvCreateMat( 1, 1, CV_32FC1 );

	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_features_free(t_cv_jit_features *x)
{
	if(x->eigImage)
		cvReleaseMat(&(x->eigImage));
		
	if(x->tempImage)
		cvReleaseMat(&(x->tempImage));
}
