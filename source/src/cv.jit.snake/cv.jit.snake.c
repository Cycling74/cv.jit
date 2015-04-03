/*
cv.jit.snake
	

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
#include "jitOpenCV.h"

typedef struct _cv_jit_snake 
{
	t_object				ob;
	long					iterations;
	long					window;
	float					ratio;
} t_cv_jit_snake;

void *_cv_jit_snake_class;

t_jit_err		cv_jit_snake_init(void);
t_cv_jit_snake	*cv_jit_snake_new(void);
void			cv_jit_snake_free(t_cv_jit_snake *x);
t_jit_err		cv_jit_snake_matrix_calc(t_cv_jit_snake *x, void *inputs, void *outputs);

t_jit_err cv_jit_snake_init(void) 
{
	long attrflags=0;
	t_jit_object *attr;
	t_jit_object *mop,*io;
		
	//Create class
	_cv_jit_snake_class = jit_class_new("cv_jit_snake",(method)cv_jit_snake_new,(method)cv_jit_snake_free,sizeof(t_cv_jit_snake),0L);

	//add mop
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop,2,1);	//We need 2 inputs
	jit_mop_output_nolink(mop,1);
	jit_mop_input_nolink(mop,2);
	
	//set output format
	io = (t_jit_object *)jit_object_method(mop,_jit_sym_getoutput,1); //Get a pointer to the output matrix
	jit_attr_setlong(io,_jit_sym_minplanecount,5);
  	jit_attr_setlong(io,_jit_sym_maxplanecount,5);
  	jit_attr_setlong(io,_jit_sym_mindim,1);
  	jit_attr_setlong(io,_jit_sym_maxdim,1);
  	jit_attr_setsym(io,_jit_sym_types,_jit_sym_float32);
	
	//set input format
	io = (t_jit_object *)jit_object_method(mop,_jit_sym_getinput,2); //Get a pointer to the input matrix
	jit_object_method(io,_jit_sym_ioproc,jit_mop_ioproc_copy_adapt); //We need to set this so that input2 adapts to incoming matrix
	
	io = (t_jit_object *)jit_object_method(mop,_jit_sym_getinput,1); //Get a pointer to the input matrix
	jit_attr_setlong(io,_jit_sym_minplanecount,1);
  	jit_attr_setlong(io,_jit_sym_maxplanecount,1);
  	jit_attr_setlong(io,_jit_sym_mindim,2);
  	jit_attr_setlong(io,_jit_sym_maxdim,2);
  	jit_attr_setsym(io,_jit_sym_types,_jit_sym_char);
	
	jit_class_addadornment(_cv_jit_snake_class,mop);
	
	//add methods
	jit_class_addmethod(_cv_jit_snake_class, (method)cv_jit_snake_matrix_calc, 		"matrix_calc", 		A_CANT, 0L);
	
	//add attributes
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"iterations",_jit_sym_long,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_snake,iterations));
	jit_attr_addfilterset_clip(attr,1,0,TRUE,FALSE);	//clip to 1~
	jit_class_addattr(_cv_jit_snake_class,attr);	
	
	//add attributes
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"radius",_jit_sym_long,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_snake,window));
	jit_attr_addfilterset_clip(attr,3,0,TRUE,FALSE);	//clip to 1~
	jit_class_addattr(_cv_jit_snake_class,attr);	
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"ratio",_jit_sym_float32,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_snake,ratio));
	jit_attr_addfilterset_clip(attr,0,1,TRUE,TRUE);	//clip to 0-1
	jit_class_addattr(_cv_jit_snake_class,attr);	

	
	jit_class_register(_cv_jit_snake_class);

	return JIT_ERR_NONE;
}

t_jit_err cv_jit_snake_matrix_calc(t_cv_jit_snake *x, void *inputs, void *outputs)
{
	t_jit_err			err=JIT_ERR_NONE;
	long				in1_savelock,in2_savelock,out_savelock;
	t_jit_matrix_info	in1_minfo,in2_minfo,out_minfo;
	char				*in1_bp,*in2_bp,*out_bp;
	void				*in1_matrix,*in2_matrix,*out_matrix;
	CvPoint				*snakePoints = 0;
	CvMat				image;
	IplImage			temp;
	float				*alpha = 0, *beta = 0, *gamma = 0;
	float				*data;
	int					i;
	int					epsilon;
	int					win_size;
	
	//Get input and output matrices
	in1_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);
	in2_matrix 	= jit_object_method(inputs,_jit_sym_getindex,1);
	out_matrix 	= jit_object_method(outputs,_jit_sym_getindex,0);

	if (x&&in1_matrix&&in2_matrix&&out_matrix) {
		//Lock the matrices
		in1_savelock = (long) jit_object_method(in1_matrix,_jit_sym_lock,1);
		in2_savelock = (long) jit_object_method(in2_matrix,_jit_sym_lock,1);
		out_savelock = (long) jit_object_method(out_matrix,_jit_sym_lock,1);
		
		//Get info
		jit_object_method(in1_matrix,_jit_sym_getinfo,&in1_minfo);
		jit_object_method(in2_matrix,_jit_sym_getinfo,&in2_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);
		
		//Get data
		jit_object_method(in1_matrix,_jit_sym_getdata,&in1_bp);
		jit_object_method(in2_matrix,_jit_sym_getdata,&in2_bp);
		jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);
		
		if (!in1_bp) { err=JIT_ERR_INVALID_INPUT; goto out;}
		if (!in2_bp) { err=JIT_ERR_INVALID_INPUT; goto out;}
		if (!out_bp) { err=JIT_ERR_INVALID_OUTPUT; goto out;}
		
		//Check snake validity
		if(in2_minfo.type != _jit_sym_float32)
		{
			error("Snake must be float32.");
			goto out;
		}
		if(in2_minfo.planecount != 5)
		{
			error("Snake must have 5 planes.");
			goto out;
		}
		if(in2_minfo.dimcount != 1)
		{
			error("Snake must have only 1 dimension.");
			goto out;
		}
		if(in2_minfo.dim[0] < 2)
		{
			error("Snake is too short: define at least two points.");
			goto out;
		}
		
		//Make point list:
		snakePoints = (CvPoint *)malloc(sizeof(CvPoint)*in2_minfo.dim[0]);
		alpha = (float *)malloc(sizeof(float)*in2_minfo.dim[0]);
		beta = (float *)malloc(sizeof(float)*in2_minfo.dim[0]);
		gamma = (float *)malloc(sizeof(float)*in2_minfo.dim[0]);
		
		//Store snake
		data = (float *)in2_bp;
		for(i=0;i<in2_minfo.dim[0];i++)
		{
			snakePoints[i].x = CLAMP((int)data[0],0,in1_minfo.dim[0]);
			snakePoints[i].y = CLAMP((int)data[1],0,in1_minfo.dim[1]);
			alpha[i] = data[2];
			beta[i] = data[3];
			gamma[i] = data[4];
			
			data+=5;
		}
		
		//Make OpenCV mat
		cvJitter2CvMat(in1_matrix, &image);
		
		
		//Calculate new snake position
		epsilon = (int)(x->ratio * (float)in2_minfo.dim[0]);
		win_size = x->window * 2 + 1;
		
		cvSnakeImage( cvGetImage(&image, &temp), snakePoints, in2_minfo.dim[0], alpha, beta, gamma, CV_ARRAY,
                   cvSize(win_size,win_size),cvTermCriteria(CV_TERMCRIT_ITER|CV_TERMCRIT_EPS, x->iterations, epsilon ), 1 );

		
		//Adjust output
		out_minfo.dim[0] = in2_minfo.dim[0];
		jit_object_method(out_matrix,_jit_sym_setinfo,&out_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);
		jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);
		if (!out_bp) { err=JIT_ERR_INVALID_OUTPUT; goto out;}
		
		
		
		//Output snake
		data = (float *)out_bp;
		for(i=0;i<out_minfo.dim[0];i++)
		{
			data[0] = (float)snakePoints[i].x;
			data[1] = (float)snakePoints[i].y;
			data[2] = alpha[i];
			data[3] = beta[i];
			data[4] = gamma[i];
			
			data+=5;
		}
		
		
			} else {
		return JIT_ERR_INVALID_PTR;
	}
	
out:
	jit_object_method(out_matrix,gensym("lock"),out_savelock);
	jit_object_method(in2_matrix,gensym("lock"),in2_savelock);
	jit_object_method(in1_matrix,gensym("lock"),in1_savelock);
	if(snakePoints)free(snakePoints);
	if(alpha)free(alpha);
	if(beta)free(beta);
	if(gamma)free(gamma);
	return err;
}


t_cv_jit_snake *cv_jit_snake_new(void)
{
	t_cv_jit_snake *x;
		
	if (x=(t_cv_jit_snake *)jit_object_alloc(_cv_jit_snake_class)) {
		x->iterations = 10;
		x->ratio = 0.5;
		x->window = 3;
	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_snake_free(t_cv_jit_snake *x)
{
	//nada
}
