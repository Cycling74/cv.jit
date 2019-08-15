/*
cv.jit.keypoints
	

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
This file links to the OpenCV library <http://sourceforge.net/projects/opencvlibrary/>

Please refer to the  Intel License Agreement For Open Source Computer Vision Library.

Please also read the notes concerning technical issues with using the OpenCV library
in Jitter externals.
*/


#include "jitOpenCV.h"
#include "cvjit.h"
#include "cvjit_keypoints.h"

#include <opencv2/objdetect.hpp>

using namespace c74::max;


struct t_cv_jit_keypoints
{
	t_object ob;

	t_atom method;
	long normalize;
	long gl_mode;

	// Detector parameters
	long octaves;
	float threshold;
	
	cvjit::KeypointMethod _method;
	cv::Ptr<cv::Feature2D> detector;
};

void *_cv_jit_keypoints_class;

t_jit_err cv_jit_keypoints_init(void); 
t_cv_jit_keypoints *cv_jit_keypoints_new(void);
void cv_jit_keypoints_free(t_cv_jit_keypoints *x);
t_jit_err cv_jit_keypoints_matrix_calc(t_cv_jit_keypoints *x, void *inputs, void *outputs);

t_jit_err cv_jit_keypoints_init(void) 
{
#if defined(_DEBUG) || defined(DEBUG) 
	object_post(nullptr, "cv.jit.keypoints\nBuilt on %s at %s", __DATE__, __TIME__);
#endif

	constexpr int INPUT_COUNT = 1;
	constexpr int OUTPUT_COUNT = 2; // Keypoints and descriptions
	constexpr int KEYPOINT_PLANECOUNT = cvjit::KEYPOINT_FIELD_COUNT;

	t_symbol * atsym  = gensym("jit_attr_offset");
	
	_cv_jit_keypoints_class = jit_class_new("cv_jit_keypoints",(method)cv_jit_keypoints_new, (method)cv_jit_keypoints_free,
		sizeof(t_cv_jit_keypoints), 0L); 

	//add mop
	t_jit_object * mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop, INPUT_COUNT, OUTPUT_COUNT);
	t_jit_object * input = (t_jit_object *)jit_object_method(mop, _jit_sym_getinput, 1);
	t_jit_object * keypoint_output = (t_jit_object *)jit_object_method(mop, _jit_sym_getoutput, 1);
	t_jit_object * descriptor_output = (t_jit_object *)jit_object_method(mop, _jit_sym_getoutput, 2);
 
   	jit_mop_output_nolink(mop, 1); //Turn off output linking so that output matrix does not adapt to input
	jit_mop_output_nolink(mop, 2);

	jit_class_addadornment(_cv_jit_keypoints_class, mop);

	jit_attr_setlong(input, _jit_sym_minplanecount, 1);
	jit_attr_setlong(input, _jit_sym_maxplanecount, 1);
	jit_attr_setlong(input, _jit_sym_mindim, 2);
	jit_attr_setlong(input, _jit_sym_maxdim, 2);
	jit_attr_setsym(input, _jit_sym_types, _jit_sym_char);

	jit_attr_setlong(keypoint_output, _jit_sym_minplanecount, KEYPOINT_PLANECOUNT);
	jit_attr_setlong(keypoint_output, _jit_sym_maxplanecount, KEYPOINT_PLANECOUNT);
	jit_attr_setlong(keypoint_output, _jit_sym_mindim, 2);
	jit_attr_setlong(keypoint_output, _jit_sym_maxdim, 2);
	jit_attr_setsym(keypoint_output, _jit_sym_types, _jit_sym_float32);

	jit_attr_setlong(descriptor_output, _jit_sym_minplanecount, 1);
	jit_attr_setlong(descriptor_output, _jit_sym_maxplanecount, 1);
	jit_attr_setlong(descriptor_output, _jit_sym_mindim, 2);
	jit_attr_setlong(descriptor_output, _jit_sym_maxdim, 2);
	jit_attr_setsym(descriptor_output, _jit_sym_types, _jit_sym_char);
   	

	//add methods
	jit_class_addmethod(_cv_jit_keypoints_class, (method)cv_jit_keypoints_matrix_calc, "matrix_calc", A_CANT, 0L);

	//add attributes
	t_jit_object * attr;

	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset, "method", _jit_sym_atom, cvjit::Flags::private_set,
		(method)0L, (method)0L, calcoffset(t_cv_jit_keypoints, method));
	jit_class_addattr(_cv_jit_keypoints_class, attr);

	// The normalize attribute
	jit_class_addattr(_cv_jit_keypoints_class, cvjit::normalize_attr<t_cv_jit_keypoints>());

	// Detector attributes
	cvjit::AttributeManager attributes(_cv_jit_keypoints_class);

	attributes.add("octaves", 1L, CVJIT_CALCOFFSET(&t_cv_jit_keypoints::octaves));
	attributes.add("threshold", 0.001f, CVJIT_CALCOFFSET(&t_cv_jit_keypoints::threshold));

	// Coordinate mode attributes
	attributes.add<long>("glcoords", 0L, 1L, CVJIT_CALCOFFSET(&t_cv_jit_keypoints::gl_mode));
			
	jit_class_register(_cv_jit_keypoints_class);

	return JIT_ERR_NONE;
}

t_jit_err cv_jit_keypoints_matrix_calc(t_cv_jit_keypoints *x, void *inputs, void *outputs)
{
	cv::Mat source;

	// Check to see that detector has been set
	if (x->detector.empty()) {
		object_error((t_object *)x, "Detector is not set!");
		return JIT_ERR_INVALID_PTR;
	}

	//Get pointers to matrices
	t_object * input_image_matrix 	= (t_object *)jit_object_method(inputs, _jit_sym_getindex, 0);
	t_object * keypoint_matrix  = (t_object *)jit_object_method(outputs, _jit_sym_getindex, 0);
	t_object * descriptor_matrix = (t_object *)jit_object_method(outputs, _jit_sym_getindex, 1);

	if (x && input_image_matrix && keypoint_matrix && descriptor_matrix)
	{
		//Lock the matrices
		cvjit::Savelock savelocks[] = { input_image_matrix, keypoint_matrix, descriptor_matrix };

		cvjit::JitterMatrix source(input_image_matrix);
		cvjit::JitterMatrix keypoints(keypoint_matrix);
		cvjit::JitterMatrix descriptors(descriptor_matrix);
		
		//Make sure input is of proper format
		t_jit_err err = cvjit::Validate(x, source)
			.type(_jit_sym_char)
			.planecount(1)
			.dimcount(2);

		if (JIT_ERR_NONE == err) {

			try {

				// Setup the parameters
				cv::Ptr<cv::BRISK> BRISK = x->detector.dynamicCast<cv::BRISK>();
				BRISK->setThreshold(static_cast<int>(x->threshold * 255.f));
				BRISK->setOctaves(x->octaves);

				// Wrap the source image in an OpenCV Mat
				cv::Mat source_image = source;

				// These will contain computation results
				std::vector<cv::KeyPoint> keypointsVec;
				cv::Mat descriptorsMat;
				cv::InputOutputArray mask = cv::noArray();

				// Compute
				x->detector->detectAndCompute(source_image, mask, keypointsVec, descriptorsMat);

				// Just in case
				if (keypointsVec.size() != descriptorsMat.rows) {
					object_error((t_object *)x, "Size mismatch between keypoints (%d) and descriptors (%d, %d)", keypointsVec.size(), descriptorsMat.rows, descriptorsMat.cols);
					return JIT_ERR_GENERIC;
				}

				// Copy to output
				const long feature_count = static_cast<long>(keypointsVec.size());

				keypoints.set_size(1, feature_count);

				// We store descriptors as raw bytes
				const long descriptor_size = x->detector->descriptorSize();
				descriptors.set_size(descriptor_size, feature_count);

				const float scale_x = x->normalize ? (float)source.normalization_scale_x() : x->gl_mode ? (float)(source.normalization_scale_x() * 2.0) : 1.f;
				const float scale_y = x->normalize ? (float)source.normalization_scale_y() : x->gl_mode ? (float)(source.normalization_scale_y() * 2.0) : 1.f;
				const float w = (float)source.get_info().dim[0];
				const float h = (float)source.get_info().dim[1];
				const float cx = w * 0.5f;
				const float cy = h * 0.5f;

				for (long i = 0; i < feature_count; i++) {
					float * kp = keypoints.get_data<float>(i);
					char * desc = descriptors.get_data<char>(i);
					cv::KeyPoint const & p = keypointsVec.at(i);
					if (x->gl_mode) {
						kp[cvjit::KEYPOINT_X] = (p.pt.x - cx) * scale_x;
						kp[cvjit::KEYPOINT_Y] = (cy - p.pt.y) * scale_y;
					}
					else {
						kp[cvjit::KEYPOINT_X] = p.pt.x * scale_x;
						kp[cvjit::KEYPOINT_Y] = p.pt.y * scale_y;
					}
					kp[cvjit::KEYPOINT_SIZE] = p.size * std::max(scale_x, scale_y);
					kp[cvjit::KEYPOINT_ANGLE] = p.angle;
					kp[cvjit::KEYPOINT_RESPONSE] = p.response;
					kp[cvjit::KEYPOINT_OCTAVE] = static_cast<float>(p.octave);

					sysmem_copyptr(descriptorsMat.ptr(i), desc, descriptor_size);
				}

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

t_cv_jit_keypoints *cv_jit_keypoints_new(void)
{
	t_cv_jit_keypoints *x = (t_cv_jit_keypoints *)jit_object_alloc(_cv_jit_keypoints_class);
	if (x) {
		atom_setsym(&x->method, cvjit::keypoint_methods[cvjit::BRISK]);
		x->detector = cv::BRISK::create();
		x->normalize = 0;
		x->gl_mode = 0;

		x->octaves = 4;
		x->threshold = 0.1f;
	}

	return x;
}

void cv_jit_keypoints_free(t_cv_jit_keypoints *x)
{
	// Nothing
}
