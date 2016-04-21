/*
cv.jit.shift
	

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

typedef struct _cv_jit_shift 
{
	
	t_object				ob;
	
	long					rectcount;
	long					boxcount;
	long					framecount;
	
	char					mode;
	
	t_atom					box[4];
	t_atom					frame[8];
	long					rect[4];
	float					mass;
	
	long					maxiters;
	double					epsilon;
	
	
	
} t_cv_jit_shift;

void *_cv_jit_shift_class;

t_jit_err 				cv_jit_shift_init(void); 
t_cv_jit_shift		*cv_jit_shift_new(void);
void 					cv_jit_shift_free(t_cv_jit_shift *x);
t_jit_err 				cv_jit_shift_matrix_calc(t_cv_jit_shift *x, void *inputs, void *outputs);

t_jit_err cv_jit_shift_init(void) 
{
	long attrflags=0;
	t_jit_object *attr,*mop;
	t_symbol *atsym;
	
	atsym = gensym("jit_attr_offset");
	
	_cv_jit_shift_class = jit_class_new("cv_jit_shift",(method)cv_jit_shift_new,(method)cv_jit_shift_free,
		sizeof(t_cv_jit_shift),0L); 

	//add mop
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop,1,0);  //Object has one input and no Jitter output
	jit_mop_single_type(mop,_jit_sym_char);   //Set input type and planecount
   	jit_mop_single_planecount(mop,1);  
	jit_class_addadornment(_cv_jit_shift_class,mop);
	
	//add methods
	jit_class_addmethod(_cv_jit_shift_class, (method)cv_jit_shift_matrix_calc, 		"matrix_calc", 		A_CANT, 0L);

	//add attributes	
	attrflags = ATTR_SET_OPAQUE_USER | ATTR_GET_OPAQUE_USER;
	//box: the resulting bounding rectangle, passed to the Max wrapper
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset_array,"box",_jit_sym_atom,4,attrflags,
		(method)0L,(method)0L,calcoffset(t_cv_jit_shift,boxcount),calcoffset(t_cv_jit_shift,box));
	jit_class_addattr(_cv_jit_shift_class,attr);
	
	//vertices: the rotated frame that bounds the object
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset_array,"vertices",_jit_sym_atom,4,attrflags,
		(method)0L,(method)0L,calcoffset(t_cv_jit_shift,framecount),calcoffset(t_cv_jit_shift,frame));
	jit_class_addattr(_cv_jit_shift_class,attr);
	
	//Mass: the area's mass
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"mass",_jit_sym_float32,attrflags,
		(method)0L,(method)0L,calcoffset(t_cv_jit_shift,mass));
	jit_class_addattr(_cv_jit_shift_class,attr);
	
	attrflags = ATTR_GET_DEFER_LOW | ATTR_SET_USURP_LOW;
	//rect: the start bounding rectangle
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset_array,"rect",_jit_sym_long,4,attrflags,
		(method)0L,(method)0L,calcoffset(t_cv_jit_shift,rectcount),calcoffset(t_cv_jit_shift,rect));
	jit_class_addattr(_cv_jit_shift_class,attr);
	
	//Maximum number of iterations
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"maxiters",_jit_sym_long,attrflags,
		(method)0L,(method)0L,calcoffset(t_cv_jit_shift,maxiters));
	jit_class_addattr(_cv_jit_shift_class,attr);
	
	//The minimum displacement
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"distance",_jit_sym_float64,attrflags,
		(method)0L,(method)0L,calcoffset(t_cv_jit_shift,epsilon));
	jit_class_addattr(_cv_jit_shift_class,attr);
	
	//The mode, 0: meanshift -- 1: camshift
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"mode",_jit_sym_char,attrflags,
		(method)0L,(method)0L,calcoffset(t_cv_jit_shift,mode));
	jit_attr_addfilterset_clip(attr,0,1,true,true);
	jit_class_addattr(_cv_jit_shift_class,attr);
			
	jit_class_register(_cv_jit_shift_class);

	return JIT_ERR_NONE;
}


t_jit_err cv_jit_shift_matrix_calc(t_cv_jit_shift *x, void *inputs, void *outputs)
{
	t_jit_err			err=JIT_ERR_NONE;
	long				in_savelock = 0;
	t_jit_matrix_info	in_minfo;
	void				*in_matrix;
	CvMat				source;
	CvRect				rectangle;
	CvBox2D				box;
	CvConnectedComp		component;
	CvPoint2D32f		vertices[4];
	float				w,h,c,s;
	
	//Get pointer to matrix
	in_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);

	if (x&&in_matrix) 
	{
		//Lock the matrix
		in_savelock = (long) jit_object_method(in_matrix,_jit_sym_lock,1);
		
		//Make sure input is of proper format
		jit_object_method(in_matrix,_jit_sym_getinfo,&in_minfo);

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

		//Don't process if image is too small
		if((in_minfo.dim[0] < 2)||(in_minfo.dim[1] < 2))
			goto out;
			
		//Calculate start rectangle:
		rectangle = cvRect(x->rect[0],x->rect[1],x->rect[2]-x->rect[0],x->rect[3]-x->rect[1]);
		CLIP_ASSIGN(rectangle.x,0,in_minfo.dim[0]-1);
		CLIP_ASSIGN(rectangle.y,0,in_minfo.dim[1]-1);
		CLIP_ASSIGN(rectangle.width,1,in_minfo.dim[0]-rectangle.x);
		CLIP_ASSIGN(rectangle.height,1,in_minfo.dim[1]-rectangle.y);

		//Convert Jitter matrix to OpenCV matrix
		cvJitter2CvMat(in_matrix, &source);
		
		//Calculate camshift
		if(x->mode == 1) //Use camshift
			cvCamShift(&source, rectangle, cvTermCriteria(CV_TERMCRIT_ITER|CV_TERMCRIT_EPS,(int)x->maxiters,x->epsilon), &component, &box );
		else {
			cvMeanShift(&source, rectangle, cvTermCriteria(CV_TERMCRIT_ITER|CV_TERMCRIT_EPS,(int)x->maxiters,x->epsilon), &component);
			box.angle = 90.f;
			box.size = cvSize2D32f(component.rect.width, component.rect.height);
			box.center = cvPoint2D32f((float)component.rect.x + (float)component.rect.width * 0.5f,(float)component.rect.y + (float)component.rect.height * 0.5f);
		}
		
		//Prepare output
		//
		atom_setlong(&x->box[0],component.rect.x);
		atom_setlong(&x->box[1],component.rect.y);
		atom_setlong(&x->box[2],component.rect.x + component.rect.width);
		atom_setlong(&x->box[3],component.rect.y + component.rect.height);
		
		x->rect[0]=component.rect.x;
		x->rect[1]=component.rect.y;
		x->rect[2]=component.rect.x + component.rect.width;
		x->rect[3]=component.rect.y + component.rect.height;
		
		//cvBoxPoints(box,vertices);
		w = box.size.width * 0.5;
		h = box.size.height * 0.5;
		c = cos((box.angle - 90.f) * -0.01745329252);
		s = sin((box.angle - 90.f) * -0.01745329252);
		
		vertices[0].x = box.center.x - s*h - c*w;
		vertices[0].y = box.center.y - c*h + s*w;
		vertices[1].x = box.center.x - s*h + c*w;
		vertices[1].y = box.center.y - c*h - s*w;
		vertices[2].x = box.center.x + s*h + c*w;
		vertices[2].y = box.center.y + c*h - s*w;
		vertices[3].x = box.center.x + s*h - c*w;
		vertices[3].y = box.center.y + c*h + s*w;
		
		atom_setlong(&x->frame[0],(long)vertices[0].x);
		atom_setlong(&x->frame[1],(long)vertices[0].y);
		atom_setlong(&x->frame[2],(long)vertices[1].x);
		atom_setlong(&x->frame[3],(long)vertices[1].y);
		atom_setlong(&x->frame[4],(long)vertices[2].x);
		atom_setlong(&x->frame[5],(long)vertices[2].y);
		atom_setlong(&x->frame[6],(long)vertices[3].x);
		atom_setlong(&x->frame[7],(long)vertices[3].y);
		
		x->mass = (float)(component.area / 256.);
		}
	
out:
	jit_object_method(in_matrix,gensym("lock"),in_savelock);
	return err;
}


t_cv_jit_shift *cv_jit_shift_new(void)
{
	t_cv_jit_shift *x;

	if ((x=(t_cv_jit_shift *)jit_object_alloc(_cv_jit_shift_class))) 
	{
		x->epsilon = 2;
		x->maxiters = 10;
		x->rect[0] = x->rect[1] = x->rect[2] = x->rect[3] = 0;
		x->boxcount = 4;
		x->rectcount = 4;
		x->mode = 0;
		atom_setlong(&x->box[0],0);
		atom_setlong(&x->box[1],0);
		atom_setlong(&x->box[2],0);
		atom_setlong(&x->box[3],0);
		x->framecount = 8;
		atom_setlong(&x->frame[0],0);
		atom_setlong(&x->frame[1],0);
		atom_setlong(&x->frame[2],0);
		atom_setlong(&x->frame[3],0);
		atom_setlong(&x->frame[4],0);
		atom_setlong(&x->frame[5],0);
		atom_setlong(&x->frame[6],0);
		atom_setlong(&x->frame[7],0);
		x->mass = 0;
		
	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_shift_free(t_cv_jit_shift *x)
{

}