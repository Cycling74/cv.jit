/*
cv.jit.track
	

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


typedef struct _cv_jit_track 
{
	t_object			ob;
	long				radius;
	long				npoints;
	long				maxIter;
	
	int					pyr_flags;
	int					dims[2];
	char				*status;
	CvPoint2D32f		*point_list;
	CvPoint2D32f		*new_point_list;
	CvMat				*prev_image;
	CvMat				*pyramid;
	CvMat				*prev_pyramid; 
	
} t_cv_jit_track;

void *_cv_jit_track_class;

t_jit_err 			cv_jit_track_init(void); 
t_cv_jit_track*		cv_jit_track_new(void);
void 				cv_jit_track_free(t_cv_jit_track *x);
t_jit_err 			cv_jit_track_matrix_calc(t_cv_jit_track *x, void *inputs, void *outputs);
t_jit_err			cv_jit_track_calculate(t_cv_jit_track *x, long *dim, t_jit_matrix_info *in_minfo, char *bip);
t_jit_err 			cv_jit_track_set_npoints(t_cv_jit_track *x, void *attr, long ac, t_atom *av);
void				cv_jit_track_setpoint(t_cv_jit_track *x,Symbol *s,short argc,Atom *argv);

t_jit_err cv_jit_track_init(void) 
{
	long attrflags=0;
	t_jit_object *attr,*mop,*output;
	t_symbol *atsym;
	t_jit_err err=JIT_ERR_NONE;
		
	atsym = gensym("jit_attr_offset");
	
	_cv_jit_track_class = jit_class_new("cv_jit_track",(method)cv_jit_track_new,(method)cv_jit_track_free, sizeof(t_cv_jit_track),0L); 

	//add mop
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop,1,1);  //Object has one input and one output
	output = (t_jit_object *)jit_object_method(mop,_jit_sym_getoutput,1); //Get a pointer to the output matrix

   	jit_mop_single_type(mop,_jit_sym_char);   //Set input type and planecount
   	jit_mop_single_planecount(mop,1);  
   	
   	jit_mop_output_nolink(mop,1); //Turn off output linking so that output matrix does not adapt to input
   	
   	jit_attr_setlong(output,_jit_sym_minplanecount,3);  //Three planes, x, y, and status
  	jit_attr_setlong(output,_jit_sym_maxplanecount,3);
  	jit_attr_setlong(output,_jit_sym_mindim,1); //Only one dimension
  	jit_attr_setlong(output,_jit_sym_maxdim,1);
  	jit_attr_setsym(output,_jit_sym_types,_jit_sym_float32); //Coordinates are returned with sub-pixel accuracy
   	   	
	jit_class_addadornment(_cv_jit_track_class,mop);
	
	
	//add methods
	jit_class_addmethod(_cv_jit_track_class, (method)cv_jit_track_matrix_calc,"matrix_calc",A_CANT, 0L);
	jit_class_addmethod(_cv_jit_track_class, (method)cv_jit_track_setpoint, "set", A_DEFER_LOW,0L);	

	//add attributes	
	attrflags = JIT_ATTR_GET_DEFER_LOW | JIT_ATTR_SET_USURP_LOW;

	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"radius",_jit_sym_long,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_track,radius));
	jit_attr_addfilterset_clip(attr,1,0,TRUE,FALSE);	//Greater than 0
	jit_class_addattr(_cv_jit_track_class,attr);
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"maxiter",_jit_sym_long,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_track,maxIter));
	jit_attr_addfilterset_clip(attr,1,0,TRUE,FALSE);	//Greater than 0
	jit_class_addattr(_cv_jit_track_class,attr);
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"npoints",_jit_sym_long,attrflags,(method)0L,(method)cv_jit_track_set_npoints,calcoffset(t_cv_jit_track,npoints));
	jit_class_addattr(_cv_jit_track_class,attr);

			
	err=jit_class_register(_cv_jit_track_class);

	return err;
}

t_jit_err cv_jit_track_set_npoints(t_cv_jit_track *x, void *attr, long ac, t_atom *av) 
{
	long val;
	if((ac < 1)||(!av))
	{
   		error("Invalid argument for npoints attribute.");
   		return JIT_ERR_GENERIC;
	}
	
	val = MAX(1,jit_atom_getlong(av));
	
	if(val == x->npoints)return JIT_ERR_NONE;
	
	//Change buffer sizes
	if(x->status)free(x->status);
	if(x->point_list)free(x->point_list);
	if(x->new_point_list)free(x->new_point_list);
	
	x->status = (char *)malloc(val * sizeof(char));
	x->point_list = (CvPoint2D32f *)malloc(val * sizeof(CvPoint2D32f));
	x->new_point_list = (CvPoint2D32f *)malloc(val * sizeof(CvPoint2D32f));
	
	if((!x->status)||(!x->point_list)||(!x->new_point_list))
	{
		x->status = (char *)realloc(x->status, sizeof(char));
		x->point_list = (CvPoint2D32f *)realloc(x->point_list, sizeof(CvPoint2D32f));
		x->new_point_list = (CvPoint2D32f *)realloc(x->point_list, sizeof(CvPoint2D32f));
		x->npoints = 1;
		return JIT_ERR_OUT_OF_MEM;
	}
	
	x->npoints = val;
   
   return JIT_ERR_NONE;
}

void cv_jit_track_setpoint(t_cv_jit_track *x,Symbol *s,short argc,Atom *argv)
{
	long i=0;
	if(argc != 3)
	{
		error("Wrong arguments for 'set'.");
		return;
	}
	
	i = jit_atom_getlong(&argv[0]);
	
	if (i >= x->npoints)
	{
		error("Point index out of range!");
		return;
	}
	
	x->point_list[i].x = jit_atom_getfloat(&argv[1]);
	x->point_list[i].y = jit_atom_getfloat(&argv[2]);
	
}

t_jit_err cv_jit_track_matrix_calc(t_cv_jit_track *x, void *inputs, void *outputs)
{
	t_jit_err err=JIT_ERR_NONE;
	long in_savelock=0,out_savelock=0;
	t_jit_matrix_info in_minfo,out_minfo;
	char *out_bp, *in_bp;
	void *in_matrix,*out_matrix;
	int i;
	float *out_data;
	
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
			
		//get matrix data pointers
		jit_object_method(in_matrix,_jit_sym_getdata,&in_bp);
		jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);
		
		if (!in_bp) { err=JIT_ERR_INVALID_INPUT; goto out;}
		if (!out_bp) { err=JIT_ERR_INVALID_OUTPUT; goto out;}
			
		err = cv_jit_track_calculate(x, in_minfo.dim, &in_minfo, in_bp);
		
		if(err != JIT_ERR_NONE)goto out;
			
		//Prepare output
		
		if(x->npoints != out_minfo.dim[0])
		{
			out_minfo.dim[0] = x->npoints;
			jit_object_method(out_matrix,_jit_sym_setinfo,&out_minfo);
			jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);
			jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);
			if (!out_bp) { err=JIT_ERR_INVALID_OUTPUT; goto out;}
		}
		
		if((!x->point_list)||(!x->status)){err = JIT_ERR_INVALID_PTR; goto out;};
		
		//Store in matrix
		out_data = (float *)out_bp;
		for(i=0;i<x->npoints;i++)
		{
			out_data[0] = x->point_list[i].x;
			out_data[1] = x->point_list[i].y;
			out_data[2] = (float)x->status[i];
			
			out_data += 3;
		}
	}

	
out:
	jit_object_method(out_matrix,gensym("lock"),out_savelock);
	jit_object_method(in_matrix,gensym("lock"),in_savelock);
	return err;
}

t_jit_err cv_jit_track_calculate(t_cv_jit_track *x, long *dim, t_jit_matrix_info *in_minfo, char *bip)
{
	CvMat image;
	CvMat *swap_temp;
	CvPoint2D32f *swap_points;
	char skip = 0;
	
	//Check to see if matrices need to be re-initialized
	if((x->dims[0] != dim[0])||(x->dims[1] != dim[1])||(!x->pyramid))
	{
		if(x->prev_image)cvReleaseMat(&(x->prev_image));
		if(x->pyramid)cvReleaseMat(&(x->pyramid));
		if(x->prev_pyramid)cvReleaseMat(&(x->prev_pyramid)); 
		
		x->prev_image = cvCreateMat( dim[1],dim[0], CV_8UC1 );
		x->pyramid = cvCreateMat( dim[1],dim[0], CV_8UC1 );
		x->prev_pyramid = cvCreateMat( dim[1],dim[0], CV_8UC1 );
		
		x->pyr_flags = 0;
		
		if((!x->prev_image)||(!x->pyramid)||(!x->prev_pyramid))
			return JIT_ERR_OUT_OF_MEM;
		
		x->dims[0] = dim[0];
		x->dims[1] = dim[1];
		
		skip = 1;
		
	}
	
	//Make OpenCV mat wrapper
	cvInitMatHeader(&image, dim[1], dim[0], CV_8UC1, bip, in_minfo->dimstride[1]);
		
	//Calculate optical flow for feature points
	if(!skip)
	{
		cvCalcOpticalFlowPyrLK( x->prev_image, &image, x->prev_pyramid, x->pyramid,
			x->point_list, x->new_point_list, x->npoints, cvSize((x->radius*2)+1,(x->radius*2)+1), 3, x->status, NULL,
			cvTermCriteria(CV_TERMCRIT_ITER|CV_TERMCRIT_EPS,x->maxIter,0.03), x->pyr_flags);
		x->pyr_flags |= CV_LKFLOW_PYR_A_READY;
	}
			
	//Swap the pyramids for the next turn
	CV_SWAP(x->prev_pyramid, x->pyramid, swap_temp);
	//Swap points
	CV_SWAP(x->point_list, x->new_point_list, swap_points);
	//Store the image for the next pass
	cvCopy(&image, x->prev_image, 0);
	
	return JIT_ERR_NONE;
	
}

t_cv_jit_track *cv_jit_track_new(void)
{
	t_cv_jit_track *x;
			
	if (x=(t_cv_jit_track *)jit_object_alloc(_cv_jit_track_class)) {
	
		x->radius = 7;
		x->npoints = 1;
		x->maxIter = 20;
		
		x->pyr_flags = 0;
		x->dims[0] = x->dims[1] = 0;
		
		x->status = (char *)malloc(sizeof(char));
		x->point_list = (CvPoint2D32f *)malloc(sizeof(CvPoint2D32f));
		x->new_point_list = (CvPoint2D32f *)malloc(sizeof(CvPoint2D32f));
		
		x->prev_image = 0;
		x->pyramid = 0;
		x->prev_pyramid = 0;

	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_track_free(t_cv_jit_track *x)
{
	if(x->prev_image)cvReleaseMat(&(x->prev_image));
	if(x->pyramid)cvReleaseMat(&(x->pyramid));
	if(x->prev_pyramid)cvReleaseMat(&(x->prev_pyramid)); 
	if(x->status)free(x->status);
	if(x->point_list)free(x->point_list);
	if(x->new_point_list)free(x->new_point_list);
}
