/*
cv.jit.blur
	

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

#include "c74_jitter.h"

#include "cvjit.h"
#include "jitOpenCV.h"

using namespace c74::max;

typedef struct _cv_jit_blur {
	t_object ob;
	
	long radius;
	float sigma;
} t_cv_jit_blur;

void *_cv_jit_blur_class;

t_jit_err cv_jit_blur_init(void);
t_cv_jit_blur *cv_jit_blur_new(void);
void cv_jit_blur_free(t_cv_jit_blur *x);
t_jit_err cv_jit_blur_matrix_calc(t_cv_jit_blur *x, void *inputs, void *outputs);
	
t_jit_err cv_jit_blur_init(void) 
{
	t_jit_object *mop;
	
	_cv_jit_blur_class = jit_class_new("cv_jit_blur",(method)cv_jit_blur_new,(method)cv_jit_blur_free,sizeof(t_cv_jit_blur),0L);

	// add mop
	mop = (t_jit_object*)jit_object_new(_jit_sym_jit_mop,1,1);
	jit_class_addadornment(_cv_jit_blur_class,mop);
	
	// add methods
	jit_class_addmethod(_cv_jit_blur_class, (method)cv_jit_blur_matrix_calc, "matrix_calc", A_CANT, 0L);

	// add attributes
	cvjit::AttributeManager attributes(_cv_jit_blur_class);

	attributes.add<long>("radius", 1, CVJIT_CALCOFFSET(&t_cv_jit_blur::radius));
	attributes.add<float>("sigma", 0.f, CVJIT_CALCOFFSET(&t_cv_jit_blur::sigma));
	
	jit_class_register(_cv_jit_blur_class);

	return JIT_ERR_NONE;
}


t_jit_err cv_jit_blur_matrix_calc(t_cv_jit_blur *x, void *inputs, void *outputs)
{
	t_object * in_matrix = (t_object *)jit_object_method(inputs, _jit_sym_getindex, 0);
	t_object * out_matrix = (t_object *)jit_object_method(outputs, _jit_sym_getindex, 0);

	if (x && in_matrix && out_matrix) {

		cvjit::Savelock savelocks[] = {in_matrix, out_matrix};
		
		cvjit::JitterMatrix src(in_matrix);
		cvjit::JitterMatrix dst(out_matrix);

		// long matrices are not supported, and input must have 2 dimensions.
		t_jit_err err = cvjit::Validate(x, src)
			.dimcount(2)
			.type(_jit_sym_char, _jit_sym_float32, _jit_sym_float64);
		
		if (JIT_ERR_NONE == err) {
			
			cv::Mat src_mat = src;
			cv::Mat dst_mat = dst;

			const long kernel_size = x->radius * 2 + 1;

			// Calculate
			try {
				cv::GaussianBlur(src_mat, dst_mat, cv::Size(kernel_size, kernel_size), x->sigma, x->sigma);
			}
			catch (cv::Exception &exception) {
				object_error((t_object *)x, "OpenCV error: %s", exception.what());
			}
		}
		
		return err;

	} else {
		return JIT_ERR_INVALID_PTR;
	}
}

t_cv_jit_blur *cv_jit_blur_new(void)
{
	t_cv_jit_blur *x;
		
	if ((x=(t_cv_jit_blur *)jit_object_alloc(_cv_jit_blur_class))) 
	{
		x->radius = 1;
		x->sigma = 0.f;
	} 
	else 
	{
		x = NULL;
	}	
	return x;
}

void cv_jit_blur_free(t_cv_jit_blur *x)
{
	// Nothing
}
