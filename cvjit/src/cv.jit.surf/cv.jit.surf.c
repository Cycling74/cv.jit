/*
cv.jit.surf
	

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
} //extern "C"
#endif
#include "cv.h"
#include "jitOpenCV.h"

typedef struct _cv_jit_surf 
{
	t_object			ob;
	double				threshold; //Set threshold for corner detection
	char				mode;
	long				octaves;
	long				layers;
	long				roi[4];
	long				roicount;
	char				useroi;
	
} t_cv_jit_surf;

void *_cv_jit_surf_class;

t_jit_err 				cv_jit_surf_init(void); 
t_cv_jit_surf *	cv_jit_surf_new(void);
void 					cv_jit_surf_free(t_cv_jit_surf *x);
t_jit_err 				cv_jit_surf_matrix_calc(t_cv_jit_surf *x, void *inputs, void *outputs);

t_jit_err cv_jit_surf_init(void) 
{
	long attrflags=0;
	t_jit_object *attr,*mop,*output/**output1, *output2*/;
	t_symbol *atsym;
	
	atsym = gensym("jit_attr_offset");
	
	_cv_jit_surf_class = jit_class_new("cv_jit_surf",(method)cv_jit_surf_new,(method)cv_jit_surf_free,
		sizeof(t_cv_jit_surf),A_CANT,0L); //A_CANT = untyped

	//add mop
	//mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop,1,2);  //Object has one input and two outputs
	//output1 = (t_jit_object *)jit_object_method(mop,_jit_sym_getoutput,1); //Get a pointer to the output matrix
	//output2 = (t_jit_object *)jit_object_method(mop,_jit_sym_getoutput,2); //Get a pointer to the output matrix
	//
	//Changed to a single output matrix containing all necessary info:
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop,1,1); //One input and one output
	output = (t_jit_object *)jit_object_method(mop,_jit_sym_getoutput,1); //Get a pointer to the output matrix

   	jit_mop_single_type(mop,_jit_sym_char);   //Set input type and planecount
   	jit_mop_single_planecount(mop,1);  
   	
   	jit_mop_output_nolink(mop,1); //Turn off output linking so that output matrix does not adapt to input
   	
	/*
   	jit_attr_setlong(output1,_jit_sym_minplanecount,6);  //Six planes, x,y coordinates, size, direction, hessian, laplacian
  	jit_attr_setlong(output1,_jit_sym_maxplanecount,6);
  	jit_attr_setlong(output1,_jit_sym_mindim,1); //Only one dimension
  	jit_attr_setlong(output1,_jit_sym_maxdim,1);
  	jit_attr_setsym(output1,_jit_sym_types,_jit_sym_float32); //Coordinates are returned with sub-pixel accuracy
	
	//Descriptor matrix
	jit_attr_setlong(output2,_jit_sym_minplanecount,1);  //One plane
  	jit_attr_setlong(output2,_jit_sym_maxplanecount,1);
  	jit_attr_setlong(output2,_jit_sym_mindim,2); //Two dimensions
  	jit_attr_setlong(output2,_jit_sym_maxdim,2);
  	jit_attr_setsym(output2,_jit_sym_types,_jit_sym_float32);
	 */
	
	//Output matrix:
	jit_attr_setlong(output,_jit_sym_minplanecount,1);  //One plane
  	jit_attr_setlong(output,_jit_sym_maxplanecount,1);
  	jit_attr_setlong(output,_jit_sym_mindim,2); //Two dimensions
  	jit_attr_setlong(output,_jit_sym_maxdim,2);
  	jit_attr_setsym(output,_jit_sym_types,_jit_sym_float32);
   	   	
	jit_class_addadornment(_cv_jit_surf_class,mop);
	
	
	//add methods
	jit_class_addmethod(_cv_jit_surf_class, (method)cv_jit_surf_matrix_calc, 		"matrix_calc", 		A_CANT, 0L);	

	//add attributes	
	attrflags = JIT_ATTR_GET_DEFER_LOW | JIT_ATTR_SET_USURP_LOW;
	
	//threshold
	attr = (t_jit_object *)jit_object_new(	_jit_sym_jit_attr_offset,"threshold",_jit_sym_float64,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_surf,threshold));			
	jit_attr_addfilterset_clip(attr,0,1,TRUE,FALSE);	//Must be at least 0
	jit_class_addattr(_cv_jit_surf_class, attr);
	
	//mode 0:basic 1:extended
	attr = (t_jit_object *)jit_object_new(	_jit_sym_jit_attr_offset,"mode",_jit_sym_char,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_surf,mode));			
	jit_attr_addfilterset_clip(attr,0,1,TRUE,TRUE);	//0 or 1
	jit_class_addattr(_cv_jit_surf_class, attr);
	
	//Number of octaves
	attr = (t_jit_object *)jit_object_new(	_jit_sym_jit_attr_offset,"octaves",_jit_sym_long,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_surf,octaves));			
	jit_attr_addfilterset_clip(attr,1,1,TRUE,FALSE);	//At least 1
	jit_class_addattr(_cv_jit_surf_class, attr);
	
	//Number of layers per octave
	attr = (t_jit_object *)jit_object_new(	_jit_sym_jit_attr_offset,"layers",_jit_sym_long,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_surf,layers));			
	jit_attr_addfilterset_clip(attr,1,1,TRUE,FALSE);	//At least 1
	jit_class_addattr(_cv_jit_surf_class, attr);
	
	//roi
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset_array, "roi", _jit_sym_long, 4, attrflags, (method)0L, (method)0L, calcoffset(t_cv_jit_surf, roicount),calcoffset(t_cv_jit_surf,roi));
	jit_class_addattr(_cv_jit_surf_class, attr);
	
	attr = (t_jit_object *)jit_object_new(	_jit_sym_jit_attr_offset,"useroi",_jit_sym_char,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_surf,useroi));			
	jit_attr_addfilterset_clip(attr,0,1,TRUE,TRUE);	//clip to 0-1
	jit_class_addattr(_cv_jit_surf_class, attr);
	
	
			
	jit_class_register(_cv_jit_surf_class);

	return JIT_ERR_NONE;
}

t_jit_err cv_jit_surf_matrix_calc(t_cv_jit_surf *x, void *inputs, void *outputs)
{
	t_jit_err err=JIT_ERR_NONE;
	/*
	long in_savelock=0,out1_savelock=0,out2_savelock=0;
	t_jit_matrix_info in_minfo,out1_minfo,out2_minfo;
	char *out1_bp, *out2_bp,*in_bp;
	void *in_matrix,*out1_matrix, *out2_matrix;
	float *out1_data, *out2_data;
	 */
	long in_savelock=0,out_savelock=0;
	t_jit_matrix_info in_minfo,out_minfo;
	char *out_bp, *in_bp;
	void *in_matrix,*out_matrix;
	float *out_data;
	
	int i, step, descriptor_count;
	int roi_w, roi_h, roi_offset;
	CvMat source;
	CvSeq *keypoints=0, *descriptors=0;
	CvMemStorage *storage=0;
	CvSURFParams params;
	CvSURFPoint *surfpoint;
	
	//Get pointers to matrices
	in_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);
	out_matrix  = jit_object_method(outputs,_jit_sym_getindex,0);
	//out1_matrix  = jit_object_method(outputs,_jit_sym_getindex,0);
	//out2_matrix  = jit_object_method(outputs,_jit_sym_getindex,1);

	//if (x&&in_matrix&&out1_matrix&&out2_matrix) 
	if (x&&in_matrix&&out_matrix)
	{
		//Lock the matrices
		in_savelock = (long) jit_object_method(in_matrix,_jit_sym_lock,1);
		out_savelock = (long) jit_object_method(out_matrix,_jit_sym_lock,1);
		//out1_savelock = (long) jit_object_method(out1_matrix,_jit_sym_lock,1);
		//out2_savelock = (long) jit_object_method(out2_matrix,_jit_sym_lock,1);
		
		//Make sure input is of proper format
		jit_object_method(in_matrix,_jit_sym_getinfo,&in_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);
		//jit_object_method(out1_matrix,_jit_sym_getinfo,&out1_minfo);
		//jit_object_method(out2_matrix,_jit_sym_getinfo,&out2_minfo);

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
			CLIP(x->roi[0],0,in_minfo.dim[0]);
			CLIP(x->roi[1],0,in_minfo.dim[1]);
			CLIP(x->roi[2],0,in_minfo.dim[0]);
			CLIP(x->roi[3],0,in_minfo.dim[1]);
			
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
		
		
		storage = cvCreateMemStorage(0);
		params.extended = x->mode;
		params.hessianThreshold = x->threshold;
		params.nOctaveLayers = x->layers;
		params.nOctaves = x->octaves;
		
		
		//Calculate
		cvExtractSURF(&source, NULL,&keypoints, &descriptors, storage, params, 0);
		
		//Prepare output
		
		/*
		out1_minfo.dim[0] = keypoints->total;
		jit_object_method(out1_matrix,_jit_sym_setinfo,&out1_minfo);
		jit_object_method(out1_matrix,_jit_sym_getinfo,&out1_minfo);
		jit_object_method(out1_matrix,_jit_sym_getdata,&out1_bp);
		if (!out1_bp) { err=JIT_ERR_INVALID_OUTPUT; goto out;}
		
		out1_data = (float *)out1_bp;
		
		out2_minfo.dimcount = 2;
		out2_minfo.planecount = 1;
		out2_minfo.dim[1] = keypoints->total;
		out2_minfo.dim[0] = 64 + x->mode * 64;
		jit_object_method(out2_matrix,_jit_sym_setinfo,&out2_minfo);
		jit_object_method(out2_matrix,_jit_sym_getinfo,&out2_minfo);
		jit_object_method(out2_matrix,_jit_sym_getdata,&out2_bp);
		if (!out2_bp) { err=JIT_ERR_INVALID_OUTPUT; goto out;}
		
		out2_data = (float *)out2_bp;
		*/
		
		out_minfo.dimcount = 2;
		out_minfo.planecount = 1;
		out_minfo.dim[1] = keypoints->total;
		descriptor_count = 64 + x->mode * 64;
		out_minfo.dim[0] = 6 + descriptor_count;
		jit_object_method(out_matrix,_jit_sym_setinfo,&out_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);
		jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);
		if (!out_bp) { err=JIT_ERR_INVALID_OUTPUT; goto out;}
		
		out_data = (float *)out_bp;
		step = out_minfo.dimstride[1] / sizeof(float);
		
		if(x->useroi)
		{
			for(i=0; i <  keypoints->total; i++)
			{
				surfpoint = CV_GET_SEQ_ELEM(CvSURFPoint,keypoints,i);
				
				/*
				out1_data[0] = surfpoint->pt.x + x->roi[0];
				out1_data[1] = surfpoint->pt.y + x->roi[1];
				out1_data[2] = surfpoint->size;
				out1_data[3] = surfpoint->dir;
				out1_data[4] = surfpoint->hessian;
				out1_data[5] = surfpoint->laplacian;
				
				out1_data += 6;
				*/
				
				out_data[0] = surfpoint->pt.x + x->roi[0];
				out_data[1] = surfpoint->pt.y + x->roi[1];
				out_data[2] = surfpoint->size;
				out_data[3] = surfpoint->dir;
				out_data[4] = surfpoint->hessian;
				out_data[5] = surfpoint->laplacian;
				cvCvtSeqToArray(descriptors, out_data+6, cvSlice(i, i+1));
				out_data+=step;
			}
		}
		else
		{
			for(i=0; i <  keypoints->total; i++)
			{
				surfpoint = CV_GET_SEQ_ELEM(CvSURFPoint,keypoints,i);
				/*
				out1_data[0] = surfpoint->pt.x;
				out1_data[1] = surfpoint->pt.y;
				out1_data[2] = surfpoint->size;
				out1_data[3] = surfpoint->dir;
				out1_data[4] = surfpoint->hessian;
				out1_data[5] = surfpoint->laplacian;
				
				out1_data += 6;
				 */
				out_data[0] = surfpoint->pt.x;
				out_data[1] = surfpoint->pt.y;
				out_data[2] = surfpoint->size;
				out_data[3] = surfpoint->dir;
				out_data[4] = surfpoint->hessian;
				out_data[5] = surfpoint->laplacian;
				cvCvtSeqToArray(descriptors, out_data+6, cvSlice(i, i+1));
				out_data+=step;
			}
		}
		
		//Fill in the descriptor matrix
		//cvCvtSeqToArray(descriptors, out2_bp, CV_WHOLE_SEQ);
	}

	
out:
	//jit_object_method(out1_matrix,gensym("lock"),out1_savelock);
	//jit_object_method(out2_matrix,gensym("lock"),out2_savelock);
	jit_object_method(out_matrix,gensym("lock"),out_savelock);
	jit_object_method(in_matrix,gensym("lock"),in_savelock);
	cvReleaseMemStorage(&storage);
	return err;
}



t_cv_jit_surf *cv_jit_surf_new(void)
{
	t_cv_jit_surf *x;
		
	if (x=(t_cv_jit_surf *)jit_object_alloc(_cv_jit_surf_class)) {
	
		x->threshold = 500;
		x->roi[0] = x->roi[1] = x->roi[2] = x->roi[3] = 0;
		x->useroi = 0;
		x->mode = 0;
		x->octaves = 3;
		x->layers = 4;

	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_surf_free(t_cv_jit_surf *x)
{

}
