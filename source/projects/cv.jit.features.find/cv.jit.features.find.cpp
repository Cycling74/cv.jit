/*
cv.jit.faces
	

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
#include "cvjit.h"

#include <opencv2/objdetect.hpp>
#include <opencv2/face.hpp>

#include <unordered_map>
#include <future>

using namespace c74::max;

struct t_cv_jit_features_find
{
	t_object ob;

	t_atom method;
};

void *_cv_jit_features_find_class;

t_jit_err cv_jit_features_find_init(void); 
t_cv_jit_features_find *cv_jit_features_find_new(void);
void cv_jit_features_find_free(t_cv_jit_features_find *x);
t_jit_err cv_jit_features_find_matrix_calc(t_cv_jit_features_find *x, void *inputs, void *outputs);

t_jit_err cv_jit_features_find_init(void) 
{
	constexpr int INPUT_COUNT = 1;
	constexpr int OUTPUT_COUNT = 1; // Locations and descriptions

	t_jit_object *attr, *mop, *input, *output;

	t_symbol * atsym  = gensym("jit_attr_offset");
	
	_cv_jit_features_find_class = jit_class_new("cv_jit_features_find",(method)cv_jit_features_find_new, (method)cv_jit_features_find_free,
		sizeof(t_cv_jit_features_find), 0L); 

	//add mop
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop, INPUT_COUNT, OUTPUT_COUNT);
	input = (t_jit_object *)jit_object_method(mop, _jit_sym_getinput, 1);
	output = (t_jit_object *)jit_object_method(mop, _jit_sym_getoutput, 1);
 
   	jit_mop_output_nolink(mop, 1); //Turn off output linking so that output matrix does not adapt to input

	jit_class_addadornment(_cv_jit_features_find_class, mop);

	jit_attr_setlong(input, _jit_sym_minplanecount, 1);
	jit_attr_setlong(input, _jit_sym_maxplanecount, 1);
	jit_attr_setlong(input, _jit_sym_mindim, 2);
	jit_attr_setlong(input, _jit_sym_maxdim, 2);
	jit_attr_setsym(input, _jit_sym_types, _jit_sym_char);

	jit_attr_setlong(output, _jit_sym_minplanecount, 1);
	jit_attr_setlong(output, _jit_sym_maxplanecount, 1);
	jit_attr_setlong(output, _jit_sym_mindim, 2);
	jit_attr_setlong(output, _jit_sym_maxdim, 2);
	jit_attr_setsym(output, _jit_sym_types, _jit_sym_float32);
   	

	//add methods
	jit_class_addmethod(_cv_jit_features_find_class, (method)cv_jit_features_find_matrix_calc, "matrix_calc", A_CANT, 0L);

	//add attributes
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset, "method", _jit_sym_long, cvjit::Flags::get_set,
		(method)0L, (method)0L, calcoffset(t_cv_jit_features_find, method));
	jit_class_addattr(_cv_jit_features_find_class, attr);
			
	jit_class_register(_cv_jit_features_find_class);

	return JIT_ERR_NONE;
}

t_jit_err cv_jit_features_find_matrix_calc(t_cv_jit_features_find *x, void *inputs, void *outputs)
{
	cv::Mat source;
	std::vector<cv::Rect> faces;

	//Get pointers to matrices
	t_object * input_image_matrix 	= (t_object *)jit_object_method(inputs, _jit_sym_getindex, 0);
	t_object * location_matrix  = (t_object *)jit_object_method(outputs, _jit_sym_getindex, 0);
	t_object * description_matrix = (t_object *)jit_object_method(outputs, _jit_sym_getindex, 1);

	if (x && input_image_matrix && location_matrix && description_matrix)
	{
		//Lock the matrices
		cvjit::Savelock savelocks[] = { input_image_matrix, location_matrix, description_matrix };

		cvjit::JitterMatrix source(input_image_matrix);
		cvjit::JitterMatrix locations(location_matrix);
		cvjit::JitterMatrix descriptions(description_matrix);

		
		
		//Make sure input is of proper format
		t_jit_err err = cvjit::Validate(x, source.get_info())
			.type(_jit_sym_char)
			.planecount(1)
			.dimcount(2);

		if (JIT_ERR_NONE == err) {

			try {

				long feature_count = 1; // Debug!
				locations.set_size(1, 1);
				descriptions.set_size(50, 1);

			}
			catch (cv::Exception & exception) {
				object_error((t_object *)x, "OpenCV error: %s", exception.what());
			}
		}
		else {
			return err;
		}
	}
	return JIT_ERR_NONE;
}

t_cv_jit_features_find *cv_jit_features_find_new(void)
{
	t_cv_jit_features_find *x = (t_cv_jit_features_find *)jit_object_alloc(_cv_jit_features_find_class);
	if (x) {
		atom_setsym(&x->method, gensym("ORB"));
	}

	return x;
}

void cv_jit_features_find_free(t_cv_jit_features_find *x)
{
	// Nothing
}
