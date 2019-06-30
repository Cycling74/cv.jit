/*
cv.jit.faces
	

Copyright 2019, Jean-Marc Pelletier
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

This file links to the OpenPose library <https://github.com/CMU-Perceptual-Computing-Lab/openpose>

*/


#include "c74_jitter.h"
#include "cvjit.h"

using namespace c74::max;

typedef struct _cv_jit_pose 
{
	t_object ob;
	t_atom poses;
} t_cv_jit_pose;

void *_cv_jit_pose_class;

t_jit_err cv_jit_pose_init(void); 
t_cv_jit_pose *cv_jit_pose_new(void);
void cv_jit_pose_free(t_cv_jit_pose *x);
t_jit_err cv_jit_pose_matrix_calc(t_cv_jit_pose *x, void *inputs, void *outputs);

t_jit_err cv_jit_pose_init(void) 
{
	t_jit_object * attr, * mop;
	t_symbol * atsym;
	
	atsym = gensym("jit_attr_offset");
	
	_cv_jit_pose_class = jit_class_new("cv_jit_pose", (method)cv_jit_pose_new, (method)cv_jit_pose_free, sizeof(t_cv_jit_pose),0L); 

	//add mop
	int const input_count = 1;
	int const output_count = 0;

	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop, input_count, output_count);

	// We only accept char matrices
   	jit_mop_single_type(mop, _jit_sym_char);
   	   	
	jit_class_addadornment(_cv_jit_pose_class,mop);
	
	
	//add methods
	jit_class_addmethod(_cv_jit_pose_class, (method)cv_jit_pose_matrix_calc, "matrix_calc", A_CANT, 0L);

	//add attributes	
	attr = (t_jit_object *)jit_object_new(	_jit_sym_jit_attr_offset, 
		"poses",  // Attribute name
		_jit_sym_atom,  // Type
		ATTR_GET_DEFER_LOW | ATTR_SET_OPAQUE_USER, // Flags (Readonly)
		nullptr, // Setter
		nullptr, // Getter
		calcoffset(t_cv_jit_pose, poses)); // Data

	jit_class_addattr(_cv_jit_pose_class, attr);
	
			
	jit_class_register(_cv_jit_pose_class);

	return JIT_ERR_NONE;
}


t_jit_err cv_jit_pose_matrix_calc(t_cv_jit_pose *x, void *inputs, void *outputs)
{
	t_jit_err err = JIT_ERR_NONE;
	t_jit_matrix_info in_minfo;


	c74::max::t_object * in_matrix 	= (t_object *)jit_object_method(inputs,_jit_sym_getindex,0);

	if (x && in_matrix) 
	{
		//Lock the matrices
		cvjit::Savelock in_lock(in_matrix);
		
		//Make sure input is of proper format
		jit_object_method(in_matrix, _jit_sym_getinfo, &in_minfo);

		err = cvjit::check_matrix(
			cvjit::check_matrix_dimcount(in_minfo, 2, 2),
			cvjit::check_matrix_planecount(in_minfo, 4, 4),
			cvjit::check_matrix_type(in_minfo, _jit_sym_char),
			cvjit::check_matrix_size(in_minfo, 0, 4),
			cvjit::check_matrix_size(in_minfo, 1, 4)
		);

		if (err == JIT_ERR_NONE) {

		}
	}

	return err;
}



t_cv_jit_pose *cv_jit_pose_new(void)
{
	t_cv_jit_pose *x;

	if ((x=(t_cv_jit_pose *)jit_object_alloc(_cv_jit_pose_class))) {
		
		
	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_pose_free(t_cv_jit_pose *x)
{
	// Nothing
}
