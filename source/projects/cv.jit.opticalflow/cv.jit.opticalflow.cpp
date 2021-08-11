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


#include "OpticalFlow.h"
#include "cvjit.h"

#include <opencv/cv.h>

using namespace c74::max;


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
		t_symbol *s = atom_getsym(av);
		if(s)
			x->of->setMethod(s->s_name);
		else {
			object_error((t_object*)x, "Invalid symbol pointer.");
			return JIT_ERR_INVALID_PTR;
		}

	}else{
		long m = std::clamp((long)atom_getlong(av),0L,3L);
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
		if (!(*av = (t_atom*)sysmem_newptr(sizeof(t_atom)*(*ac)))) {
			*ac = 0;
			return JIT_ERR_OUT_OF_MEM;
		}
	}
	
	const size_t str_len = x->of->getMethodName().length() + 1;
	char *str = new char[str_len];
	strncpy(str, x->of->getMethodName().c_str(), str_len);
	
	atom_setsym(*av, gensym(str));
	delete[] str;
	
	return JIT_ERR_NONE;
}


t_jit_err cv_jit_opticalflow_set_fb_poly_n(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setFBpoly_n((int)atom_getlong(av));
	x->fb_poly_n = x->of->getFBpoly_n();
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_fb_iterations(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setFBiterations((int)atom_getlong(av));
	x->fb_iterations = x->of->getFBiterations();
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_fb_window_size(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setFBwindowSize((int)atom_getlong(av));
	x->fb_window_size = x->of->getFBwindowSize();
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_fb_levels(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setFBlevels((int)atom_getlong(av));
	x->fb_levels = x->of->getFBlevels();
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_use_previous(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setUsePrevious(atom_getlong(av) > 0);
	x->use_previous = x->of->getUsePrevious();
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_bm_max_range(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setBMmaxRange((unsigned int)atom_getlong(av), (unsigned int)atom_getlong(av));
	x->bm_max_range = x->of->getBMmaxRange().width;
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_bm_block_size(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setBMblockSize((unsigned int)atom_getlong(av), (unsigned int)atom_getlong(av));
	x->bm_block_size = x->of->getBMblockSize().width;
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_bm_shift_size(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setBMshiftSize((unsigned int)atom_getlong(av), (unsigned int)atom_getlong(av));
	x->bm_shift_size = x->of->getBMshiftSize().width;
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_lk_window_size(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setLKwindowSize((unsigned int)atom_getlong(av), (unsigned int)atom_getlong(av));
	x->lk_window_size = x->of->getLKwindowSize().width;
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_hs_max_iterations(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setHSmaxIterations((unsigned int)atom_getlong(av));
	x->hs_max_iterations = x->of->getHSmaxIterations();
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_fb_poly_sigma(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setFBpoly_sigma(atom_getfloat(av));
	x->fb_poly_sigma = x->of->getFBpoly_sigma();
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_fb_pyramid_scale(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setFBpyramidScale(atom_getfloat(av));
	x->fb_pyramid_scale = x->of->getFBpyramidScale();
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_hs_epsilon(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setHSepsilon(atom_getfloat(av));
	x->hs_epsilon = x->of->getHSepsilon();
	
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_opticalflow_set_hs_lambda(t_cv_jit_opticalflow *x, void *attr, long ac, t_atom *av){
	if(ac < 1){
		//Not enough parameters?
		return JIT_ERR_NONE;
	}
	
	x->of->setHSlambda(atom_getfloat(av));
	x->hs_lambda = x->of->getHSlambda();
	
	return JIT_ERR_NONE;
}


t_jit_err cv_jit_opticalflow_init(void) 
{

#if defined(_DEBUG) || defined(DEBUG) 
	object_post(nullptr, "cv.jit.opticalflow\nBuilt on %s at %s", __DATE__, __TIME__);
#endif

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
	attrflags = ATTR_GET_DEFER_LOW | ATTR_SET_USURP_LOW;
	
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
	
	
	attrflags = ATTR_GET_DEFER_LOW | ATTR_SET_OPAQUE; //Those parameters are better left to their default values
	
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
	t_jit_object *in_matrix,*out_matrixX,*out_matrixY;
	
	in_matrix 	= (t_jit_object *)jit_object_method(inputs,_jit_sym_getindex,0);
	out_matrixX = (t_jit_object *)jit_object_method(outputs,_jit_sym_getindex,0);
	out_matrixY = (t_jit_object *)jit_object_method(outputs,_jit_sym_getindex,1);

	if (x&&in_matrix&&out_matrixX&&out_matrixY) {

		cvjit::Savelock locks[] = { in_matrix, out_matrixX, out_matrixY };
		
		cvjit::JitterMatrix source(in_matrix);
		cvjit::JitterMatrix out_x(out_matrixX);
		cvjit::JitterMatrix out_y(out_matrixY);

		cvjit::Validate(x, source)
			.type(_jit_sym_char)
			.planecount(1)
			.dimcount(2);

		try {
			CvMat inmat = source;

			//calculate
			x->of->compute(&inmat);
			CvMat xmat = (CvMat)x->of->getXflow();
			CvMat ymat = (CvMat)x->of->getYflow();

			//Copy to output
			out_x.wrap(xmat);
			out_y.wrap(ymat);
		}
		catch (cv::Exception & exception) {
			object_error((t_object *)x, "OpenCV error: %s", exception.what());
			return JIT_ERR_GENERIC;
		}
		
		
	} else {
		return JIT_ERR_INVALID_PTR;
	}
	
	return err;
}


t_cv_jit_opticalflow *cv_jit_opticalflow_new(void)
{
	t_cv_jit_opticalflow *x;

	if ((x=(t_cv_jit_opticalflow *)jit_object_alloc(_cv_jit_opticalflow_class))) 
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