/*
cv.jit.opticalflow
	

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
#include "OpticalFlow.h"
#include "jitOpenCV.h"


typedef struct _cv_jit_opticalflow 
{
	t_object				ob;
	
	//attribute variables
	long fb_poly_n;
	long fb_iterations;
	long fb_window_size;
	long fb_levels;
	long use_previous;
	long bm_max_range;
	long bm_block_size;
	long bm_shift_size;
	long lk_window_size;
	long hs_max_iterations;
	double fb_poly_sigma;
	double fb_pyramid_scale;
	double hs_epsilon;
	double hs_lambda;
	t_atom method;
	
	//In C++, the calcoffset macro used when defining attributes requires this structure to be POD-type.
	//This means that the object below cannot be a member. The solution is to store only a pointer.
	OpticalFlow				*of; 
	
} t_cv_jit_opticalflow;

void *_cv_jit_opticalflow_class;

t_jit_err 				cv_jit_opticalflow_init(void); 
t_cv_jit_opticalflow			*cv_jit_opticalflow_new(void);
void 					cv_jit_opticalflow_free(t_cv_jit_opticalflow *x);
t_jit_err 				cv_jit_opticalflow_matrix_calc(t_cv_jit_opticalflow *x, void *inputs, void *outputs);

//setter/getter declarations
t_jit_err cv_jit_opticalflow_set_method(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av);
t_jit_err cv_jit_opticalflow_get_method(t_cv_jit_opticalflow *x, void *attr, long *ac, t_atom **av);
t_jit_err cv_jit_opticalflow_set_fb_poly_n(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av);
t_jit_err cv_jit_opticalflow_set_fb_iterations(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av);
t_jit_err cv_jit_opticalflow_set_fb_window_size(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av);
t_jit_err cv_jit_opticalflow_set_fb_levels(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av);
t_jit_err cv_jit_opticalflow_set_use_previous(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av);
t_jit_err cv_jit_opticalflow_set_bm_max_range(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av);
t_jit_err cv_jit_opticalflow_set_bm_block_size(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av);
t_jit_err cv_jit_opticalflow_set_bm_shift_size(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av);
t_jit_err cv_jit_opticalflow_set_lk_window_size(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av);
t_jit_err cv_jit_opticalflow_set_hs_max_iterations(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av);
t_jit_err cv_jit_opticalflow_set_fb_poly_sigma(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av);
t_jit_err cv_jit_opticalflow_set_fb_pyramid_scale(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av);
t_jit_err cv_jit_opticalflow_set_hs_epsilon(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av);
t_jit_err cv_jit_opticalflow_set_hs_lambda(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av);

//setters/getters
t_jit_err cv_jit_opticalflow_set_method(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	if(!av){
		return JIT_ERR_INVALID_PTR;
	}
	
	if(av->a_type == A_SYM){
		t_symbol *s = jit_atom_getsym(av);
		if(s)
			x->of->setMethod(s->s_name);
		else {
			error("Invalid symbol pointer.");
			return JIT_ERR_INVALID_PTR;
		}

	}else{
		long m = CLAMP(jit_atom_getlong(av),0,3);
		switch(m){
		case 0:
			x->of->setMethod(OpticalFlow::Block_matching);
			break;
		case 1:
			x->of->setMethod(OpticalFlow::Lucas_Kanade);
			break;
		case 2:
			x->of->setMethod(OpticalFlow::Horn_Schunk);
			break;
		case 3:
			x->of->setMethod(OpticalFlow::Farneback);
			break;
		}
		 
	}
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_get_method(t_cv_jit_opticalflow *x, void *attr, long *ac, t_atom **av){
	
	if ((*ac)&&(*av)) {
		//memory passed in, use it
	} else {
		//otherwise allocate memory
		*ac = 1;
		if (!(*av = (t_atom*)jit_getbytes(sizeof(t_atom)*(*ac)))) {
			*ac = 0;
			return JIT_ERR_OUT_OF_MEM;
		}
	}
	
	char *str = new char[x->of->getMethodName().length()+1];
	strcpy(str, x->of->getMethodName().c_str());
	
	jit_atom_setsym(*av, gensym(str));
	delete[] str;
	
	return JIT_ERR_NONE;
}


t_jit_err cv_jit_opticalflow_set_fb_poly_n(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setFBpoly_n(jit_atom_getlong(av));
	x->fb_poly_n = x->of->getFBpoly_n();
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_fb_iterations(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setFBiterations(jit_atom_getlong(av));
	x->fb_iterations = x->of->getFBiterations();
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_fb_window_size(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setFBwindowSize(jit_atom_getlong(av));
	x->fb_window_size = x->of->getFBwindowSize();
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_fb_levels(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setFBlevels(jit_atom_getlong(av));
	x->fb_levels = x->of->getFBlevels();
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_use_previous(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setUsePrevious(jit_atom_getlong(av) > 0);
	x->use_previous = x->of->getUsePrevious();
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_bm_max_range(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setBMmaxRange(jit_atom_getlong(av),jit_atom_getlong(av));
	x->bm_max_range = x->of->getBMmaxRange().width;
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_bm_block_size(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setBMblockSize(jit_atom_getlong(av),jit_atom_getlong(av));
	x->bm_block_size = x->of->getBMblockSize().width;
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_bm_shift_size(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setBMshiftSize(jit_atom_getlong(av),jit_atom_getlong(av));
	x->bm_shift_size = x->of->getBMshiftSize().width;
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_lk_window_size(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setLKwindowSize(jit_atom_getlong(av),jit_atom_getlong(av));
	x->lk_window_size = x->of->getLKwindowSize().width;
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_hs_max_iterations(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setHSmaxIterations(jit_atom_getlong(av));
	x->hs_max_iterations = x->of->getHSmaxIterations();
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_fb_poly_sigma(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setFBpoly_sigma(jit_atom_getfloat(av));
	x->fb_poly_sigma = x->of->getFBpoly_sigma();
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_fb_pyramid_scale(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setFBpyramidScale(jit_atom_getfloat(av));
	x->fb_pyramid_scale = x->of->getFBpyramidScale();
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_hs_epsilon(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setHSepsilon(jit_atom_getfloat(av));
	x->hs_epsilon = x->of->getHSepsilon();
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_hs_lambda(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setHSlambda(jit_atom_getfloat(av));
	x->hs_lambda = x->of->getHSlambda();
	
	return JIT_ERR_NONE;
}


t_jit_err cv_jit_opticalflow_init(void) 
{
	long attrflags=0;
	t_jit_object *attr,*mop;
	//t_symbol *atsym;
	
	//atsym = gensym("jit_attr_offset");
	
	_cv_jit_opticalflow_class = jit_class_new("cv_jit_opticalflow",(method)cv_jit_opticalflow_new,(method)cv_jit_opticalflow_free, sizeof(t_cv_jit_opticalflow),0L);
   	
	//add mop
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop,1,2);
	jit_mop_single_type(mop,_jit_sym_float32);	
	jit_mop_single_planecount(mop,2);
   	   	
	jit_class_addadornment(_cv_jit_opticalflow_class,mop);
	
	//add methods
	jit_class_addmethod(_cv_jit_opticalflow_class, (method)cv_jit_opticalflow_matrix_calc, 		"matrix_calc", 		A_CANT, 0L);

	//add attributes	
	attrflags = JIT_ATTR_GET_DEFER_LOW | JIT_ATTR_SET_USURP_LOW;
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"method",_jit_sym_atom,attrflags,(method)cv_jit_opticalflow_get_method,(method)cv_jit_opticalflow_set_method,calcoffset(t_cv_jit_opticalflow,method));
	jit_class_addattr(_cv_jit_opticalflow_class,attr);
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"use_previous",_jit_sym_long,attrflags,(method)0L,(method)cv_jit_opticalflow_set_use_previous,calcoffset(t_cv_jit_opticalflow,use_previous));
	jit_class_addattr(_cv_jit_opticalflow_class,attr);
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"bm_max_range",_jit_sym_long,attrflags,(method)0L,(method)cv_jit_opticalflow_set_bm_max_range,calcoffset(t_cv_jit_opticalflow,bm_max_range));
	jit_class_addattr(_cv_jit_opticalflow_class,attr);
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"bm_block_size",_jit_sym_long,attrflags,(method)0L,(method)cv_jit_opticalflow_set_bm_block_size,calcoffset(t_cv_jit_opticalflow,bm_block_size));
	jit_class_addattr(_cv_jit_opticalflow_class,attr);
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"bm_shift_size",_jit_sym_long,attrflags,(method)0L,(method)cv_jit_opticalflow_set_bm_shift_size,calcoffset(t_cv_jit_opticalflow,bm_shift_size));
	jit_class_addattr(_cv_jit_opticalflow_class,attr);
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"lk_window_size",_jit_sym_long,attrflags,(method)0L,(method)cv_jit_opticalflow_set_lk_window_size,calcoffset(t_cv_jit_opticalflow,lk_window_size));
	jit_class_addattr(_cv_jit_opticalflow_class,attr);
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"hs_lambda",_jit_sym_float64,attrflags,(method)0L,(method)cv_jit_opticalflow_set_hs_lambda,calcoffset(t_cv_jit_opticalflow,hs_lambda));
	jit_class_addattr(_cv_jit_opticalflow_class,attr);
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"fb_window_size",_jit_sym_long,attrflags,(method)0L,(method)cv_jit_opticalflow_set_fb_window_size,calcoffset(t_cv_jit_opticalflow,fb_window_size));
	jit_class_addattr(_cv_jit_opticalflow_class,attr);
	
	
	attrflags = JIT_ATTR_GET_DEFER_LOW | JIT_ATTR_SET_OPAQUE; //Those parameters are better left to their default values
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"fb_poly_n",_jit_sym_long,attrflags,(method)0L,(method)cv_jit_opticalflow_set_fb_poly_n,calcoffset(t_cv_jit_opticalflow,fb_poly_n));
	jit_class_addattr(_cv_jit_opticalflow_class,attr);
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"fb_iterations",_jit_sym_long,attrflags,(method)0L,(method)cv_jit_opticalflow_set_fb_iterations,calcoffset(t_cv_jit_opticalflow,fb_iterations));
	jit_class_addattr(_cv_jit_opticalflow_class,attr);
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"fb_poly_sigma",_jit_sym_float64,attrflags,(method)0L,(method)cv_jit_opticalflow_set_fb_poly_sigma,calcoffset(t_cv_jit_opticalflow,fb_poly_sigma));
	jit_class_addattr(_cv_jit_opticalflow_class,attr);
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"fb_pyramid_scale",_jit_sym_float64,attrflags,(method)0L,(method)cv_jit_opticalflow_set_fb_pyramid_scale,calcoffset(t_cv_jit_opticalflow,fb_pyramid_scale));
	jit_class_addattr(_cv_jit_opticalflow_class,attr);
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"fb_levels",_jit_sym_long,attrflags,(method)0L,(method)cv_jit_opticalflow_set_fb_levels,calcoffset(t_cv_jit_opticalflow,fb_levels));
	jit_class_addattr(_cv_jit_opticalflow_class,attr);
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"hs_epsilon",_jit_sym_float64,attrflags,(method)0L,(method)cv_jit_opticalflow_set_hs_epsilon,calcoffset(t_cv_jit_opticalflow,hs_epsilon));
	jit_class_addattr(_cv_jit_opticalflow_class,attr);
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"hs_max_iterations",_jit_sym_long,attrflags,(method)0L,(method)cv_jit_opticalflow_set_hs_max_iterations,calcoffset(t_cv_jit_opticalflow,hs_max_iterations));
	jit_class_addattr(_cv_jit_opticalflow_class,attr);
			
	jit_class_register(_cv_jit_opticalflow_class);

	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_matrix_calc(t_cv_jit_opticalflow *x, void *inputs, void *outputs)
{
	t_jit_err err=JIT_ERR_NONE;
	long in_savelock=0,out_savelockX=0,out_savelockY=0;
	t_jit_matrix_info in_minfo,out_minfoX,out_minfoY;
	void *in_matrix,*out_matrixX,*out_matrixY;
	CvMat inmat;
	CvMat xmat, ymat;
	
	in_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);
	out_matrixX = jit_object_method(outputs,_jit_sym_getindex,0);
	out_matrixY = jit_object_method(outputs,_jit_sym_getindex,1);

	if (x&&in_matrix&&out_matrixX&&out_matrixY) {
		
		in_savelock = (long) jit_object_method(in_matrix,_jit_sym_lock,1);
		out_savelockX = (long) jit_object_method(out_matrixX,_jit_sym_lock,1);
		out_savelockY = (long) jit_object_method(out_matrixY,_jit_sym_lock,1);
		
		jit_object_method(in_matrix,_jit_sym_getinfo,&in_minfo);
		jit_object_method(out_matrixX,_jit_sym_getinfo,&out_minfoX);
		jit_object_method(out_matrixY,_jit_sym_getinfo,&out_minfoY);
		
		if (in_minfo.type != _jit_sym_char) 
		{ 
			err=JIT_ERR_MISMATCH_TYPE; 
			goto out;
		}

		//compatible planes?
		if (in_minfo.planecount!=1) { 
			err=JIT_ERR_MISMATCH_PLANE; 
			goto out;
		}	
		
		if (in_minfo.dimcount!=2) { 
			err=JIT_ERR_MISMATCH_DIM; 
			goto out;
		}		
		
		//Convert matrix header
		cvJitter2CvMat(in_matrix, &inmat);
		
		//calculate
		x->of->compute(&inmat);
		xmat = (CvMat)x->of->getXflow();
		ymat = (CvMat)x->of->getYflow();
		
		//Copy to output
		cvMat2Jitter(&xmat, out_matrixX);
		cvMat2Jitter(&ymat, out_matrixY);
		
	} else {
		return JIT_ERR_INVALID_PTR;
	}
	
out:
	jit_object_method(out_matrixX,gensym("lock"),out_savelockX);
	jit_object_method(out_matrixY,gensym("lock"),out_savelockY);
	jit_object_method(in_matrix,gensym("lock"),in_savelock);
	return err;
}


t_cv_jit_opticalflow *cv_jit_opticalflow_new(void)
{
	t_cv_jit_opticalflow *x;

	if (x=(t_cv_jit_opticalflow *)jit_object_alloc(_cv_jit_opticalflow_class)) 
	{
		x->of = new OpticalFlow;
		
		//attribute initialization
		x->fb_poly_n = x->of->getFBpoly_n();
		x->fb_iterations = x->of->getFBiterations();
		x->fb_window_size = x->of->getFBwindowSize();
		x->fb_levels = x->of->getFBlevels();
		x->use_previous = x->of->getUsePrevious();
		x->bm_max_range = x->of->getBMmaxRange().width;
		x->bm_block_size = x->of->getBMblockSize().width;
		x->bm_shift_size = x->of->getBMshiftSize().width;
		x->lk_window_size = x->of->getLKwindowSize().width;
		x->hs_max_iterations = x->of->getHSmaxIterations();
		x->fb_poly_sigma = x->of->getFBpoly_sigma();
		x->fb_pyramid_scale = x->of->getFBpyramidScale();
		x->hs_epsilon = x->of->getHSepsilon();
		x->hs_lambda = x->of->getHSlambda();

	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_opticalflow_free(t_cv_jit_opticalflow *x)
{
	delete x->of;
}