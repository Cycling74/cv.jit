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

#include "jitOpenCV.h"
#include "c74_jitter.h"

#include <vector>

using namespace c74::max;


typedef struct _cv_jit_track 
{
	t_object			ob;
	long				radius;
	long				npoints;
	long				maxIter;
	
	int					pyr_flags;
	int					dims[2];
	cv::Mat             previous_image;
	std::vector<cv::Point2f> points;
	std::vector<cv::Point2f> previous_points;
	std::vector<unsigned char> status;
	std::vector<float> error;
} t_cv_jit_track;

void *_cv_jit_track_class;

t_jit_err 			cv_jit_track_init(void); 
t_cv_jit_track*		cv_jit_track_new(void);
void 				cv_jit_track_free(t_cv_jit_track *x);
t_jit_err 			cv_jit_track_matrix_calc(t_cv_jit_track *x, void *inputs, void *outputs);
t_jit_err 			cv_jit_track_set_npoints(t_cv_jit_track *x, void *attr, long ac, t_atom *av);
void				cv_jit_track_setpoint(t_cv_jit_track *x, t_symbol *s,short argc, t_atom *argv);

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
	attrflags = ATTR_GET_DEFER_LOW | ATTR_SET_USURP_LOW;

	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"radius",_jit_sym_long,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_track,radius));
	jit_attr_addfilterset_clip(attr,1,0,true,false);	//Greater than 0
	jit_class_addattr(_cv_jit_track_class,attr);
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"maxiter",_jit_sym_long,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_track,maxIter));
	jit_attr_addfilterset_clip(attr,1,0,true,false);	//Greater than 0
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
   		object_error((t_object*)x, "Invalid argument for npoints attribute.");
   		return JIT_ERR_GENERIC;
	}
	
	val = MAX(1,(long)atom_getlong(av));
	
	if(val == x->npoints)return JIT_ERR_NONE;
	
	x->npoints = val;

	//Change buffer sizes
	x->points.resize(x->npoints);
	x->previous_points.resize(x->npoints);
	x->status.resize(x->npoints);
	x->error.resize(x->npoints);
   
   return JIT_ERR_NONE;
}

void cv_jit_track_setpoint(t_cv_jit_track *x, t_symbol *s, short argc, t_atom *argv)
{
	long i=0;
	if(argc != 3)
	{
		object_error((t_object*)x, "Wrong arguments for 'set'.");
		return;
	}
	
	i = (long)atom_getlong(&argv[0]);
	
	if (i >= x->npoints)
	{
		object_error((t_object*)x, "Point index out of range!");
		return;
	}
	
	x->previous_points[i].x = (float)atom_getfloat(&argv[1]);
	x->previous_points[i].y = (float)atom_getfloat(&argv[2]);
	
}

t_jit_err cv_jit_track_matrix_calc(t_cv_jit_track *x, void *inputs, void *outputs)
{
	t_jit_err err=JIT_ERR_NONE;
	void * in_savelock = 0;
	void * out_savelock = 0;
	t_jit_matrix_info in_minfo,out_minfo;
	char *out_bp, *in_bp;
	t_object *in_matrix,*out_matrix;
	int i;
	float *out_data;
	
	//Get pointers to matrices
	in_matrix 	= (t_object *)jit_object_method(inputs,_jit_sym_getindex,0);
	out_matrix  = (t_object *)jit_object_method(outputs,_jit_sym_getindex,0);

	if (x&&in_matrix&&out_matrix) 
	{
		//Lock the matrices
		in_savelock = jit_object_method(in_matrix,_jit_sym_lock,1);
		out_savelock = jit_object_method(out_matrix,_jit_sym_lock,1);
		
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

		// Calculate 
		bool skip = false;

		cv::Mat sourceMat = cvjit::wrapJitterMatrix(in_matrix);

		if (x->previous_image.size == sourceMat.size) {
			cv::calcOpticalFlowPyrLK(x->previous_image, sourceMat, x->previous_points, x->points, x->status, x->error, cv::Size(x->radius * 2 + 1, x->radius * 2 + 1));
		}

		sourceMat.copyTo(x->previous_image);
			
		//Prepare output
		
		if(x->npoints != out_minfo.dim[0])
		{
			out_minfo.dim[0] = x->npoints;
			jit_object_method(out_matrix,_jit_sym_setinfo,&out_minfo);
			jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);
			jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);
			if (!out_bp) { err=JIT_ERR_INVALID_OUTPUT; goto out;}
		}
				
		//Store in matrix
		out_data = (float *)out_bp;
		for(i=0;i<x->npoints;i++)
		{
			out_data[0] = x->points[i].x;
			out_data[1] = x->points[i].y;
			out_data[2] = (float)x->status[i];
			
			out_data += 3;
		}

		// Swap the points for next run
		std::swap(x->previous_points, x->points);
	}

	
out:
	jit_object_method(out_matrix,gensym("lock"),out_savelock);
	jit_object_method(in_matrix,gensym("lock"),in_savelock);
	return err;
}

t_cv_jit_track *cv_jit_track_new(void)
{
	t_cv_jit_track *x;
			
	if ((x=(t_cv_jit_track *)jit_object_alloc(_cv_jit_track_class))) {
	
		x->radius = 7;
		x->npoints = 1;
		x->maxIter = 20;
		
		x->pyr_flags = 0;
		x->dims[0] = x->dims[1] = 0;

	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_track_free(t_cv_jit_track *x)
{
	// Nothing
}
