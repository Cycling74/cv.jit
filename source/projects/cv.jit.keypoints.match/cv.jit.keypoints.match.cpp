/*
cv.jit.keypoints.match
	

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

using namespace c74::max;


struct t_cv_jit_keypoints_match
{
	t_object ob;

	cv::Ptr<cv::DescriptorMatcher> matcher;
	std::vector<cv::KeyPoint> keypoints1, keypoints2;
};

void *_cv_jit_keypoints_match_class;

t_jit_err cv_jit_keypoints_match_init(void); 
t_cv_jit_keypoints_match *cv_jit_keypoints_match_new(void);
void cv_jit_keypoints_match_free(t_cv_jit_keypoints_match *x);
t_jit_err cv_jit_keypoints_match_matrix_calc(t_cv_jit_keypoints_match *x, void *inputs, void *outputs);

// Attributes

// Constants
constexpr int INPUT_COUNT = 4;
constexpr int OUTPUT_COUNT = 2;
constexpr int KEYPOINT_PLANECOUNT = cvjit::KEYPOINT_FIELD_COUNT;

t_jit_err cv_jit_keypoints_match_init(void) 
{
#if defined(_DEBUG) || defined(DEBUG) 
	object_post(nullptr, "cv.jit.keypoints.match\nBuilt on %s at %s", __DATE__, __TIME__);
#endif

	t_symbol * atsym  = gensym("jit_attr_offset");
	
	_cv_jit_keypoints_match_class = jit_class_new("cv_jit_keypoints_match",(method)cv_jit_keypoints_match_new, (method)cv_jit_keypoints_match_free,
		sizeof(t_cv_jit_keypoints_match), 0L); 

	//add mop
	t_jit_object * mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop, INPUT_COUNT, OUTPUT_COUNT);

	// This object has more inputs and outputs than others
	t_jit_object * inputs[INPUT_COUNT] = {
		(t_jit_object *)jit_object_method(mop, _jit_sym_getinput, 1),
		(t_jit_object *)jit_object_method(mop, _jit_sym_getinput, 2),
		(t_jit_object *)jit_object_method(mop, _jit_sym_getinput, 3),
		(t_jit_object *)jit_object_method(mop, _jit_sym_getinput, 4)
	};

	t_jit_object * outputs[OUTPUT_COUNT] = {
		(t_jit_object *)jit_object_method(mop, _jit_sym_getoutput, 1),
		(t_jit_object *)jit_object_method(mop, _jit_sym_getoutput, 2)
	};

	// Turn off input linking
	for (int i = 0; i < INPUT_COUNT; i++) {
		jit_mop_input_nolink(mop, i + 1);
		jit_object_method(inputs[i], _jit_sym_ioproc, jit_mop_ioproc_copy_adapt);

		const long planecount = i % 2 == 0 ? cvjit::KEYPOINT_FIELD_COUNT : 1;

		jit_attr_setlong(inputs[i], _jit_sym_minplanecount, planecount);
		jit_attr_setlong(inputs[i], _jit_sym_maxplanecount, planecount);
		jit_attr_setlong(inputs[i], _jit_sym_maxdimcount, 2);
		jit_attr_setsym(inputs[i], _jit_sym_types, _jit_sym_float32);
	}

	for (int i = 0; i < OUTPUT_COUNT; i++) {
		// Turn off output linking
		jit_mop_output_nolink(mop, i + 1);

		jit_attr_setlong(outputs[i], _jit_sym_minplanecount, cvjit::KEYPOINT_FIELD_COUNT);
		jit_attr_setlong(outputs[i], _jit_sym_maxplanecount, cvjit::KEYPOINT_FIELD_COUNT);
		jit_attr_setlong(outputs[i], _jit_sym_mindimcount, 2);
		jit_attr_setlong(outputs[i], _jit_sym_maxdimcount, 2);
		jit_attr_setsym(outputs[i], _jit_sym_types, _jit_sym_float32);
	}

	jit_class_addadornment(_cv_jit_keypoints_match_class, mop);

   	
	//add methods
	jit_class_addmethod(_cv_jit_keypoints_match_class, (method)cv_jit_keypoints_match_matrix_calc, "matrix_calc", A_CANT, 0L);

	//add attributes
	
	// Register class			
	jit_class_register(_cv_jit_keypoints_match_class);

	return JIT_ERR_NONE;
}

inline void copy_keypoints(cvjit::JitterMatrix & source, std::vector<cv::KeyPoint> & dest) {
	const long count = source.get_info().dim[1];
	dest.resize(count);
	for (long i = 0; i < count; i++) {
		float * kp = source.get_data<float>(i);
		dest[i] = cv::KeyPoint(
			kp[cvjit::KEYPOINT_X],
			kp[cvjit::KEYPOINT_Y],
			kp[cvjit::KEYPOINT_SIZE],
			kp[cvjit::KEYPOINT_ANGLE],
			kp[cvjit::KEYPOINT_RESPONSE],
			static_cast<int>(kp[cvjit::KEYPOINT_OCTAVE]));
	}
}


t_jit_err cv_jit_keypoints_match_matrix_calc(t_cv_jit_keypoints_match *x, void *inputs, void *outputs)
{
	//Get pointers to matrices
	t_jit_object * input_matrices[INPUT_COUNT] = {
		(t_jit_object *)jit_object_method(inputs, _jit_sym_getindex, 0),
		(t_jit_object *)jit_object_method(inputs, _jit_sym_getindex, 1),
		(t_jit_object *)jit_object_method(inputs, _jit_sym_getindex, 2),
		(t_jit_object *)jit_object_method(inputs, _jit_sym_getindex, 3)
	};

	t_jit_object * output_matrices[OUTPUT_COUNT] = {
		(t_jit_object *)jit_object_method(outputs, _jit_sym_getindex, 0),
		(t_jit_object *)jit_object_method(outputs, _jit_sym_getindex, 1)
	};

	// Check the pointers
	for (int i = 0; i < INPUT_COUNT; i++) {
		if (!input_matrices[i]) {
			return JIT_ERR_INVALID_PTR;
		}
	}

	for (int i = 0; i < OUTPUT_COUNT; i++) {
		if (!output_matrices[i]) {
			return JIT_ERR_INVALID_PTR;
		}
	}

	if (x && !x->matcher.empty())
	{
		//Lock the matrices
		cvjit::Savelock in_savelocks[INPUT_COUNT] = { 
			input_matrices[0],
			input_matrices[1],
			input_matrices[2],
			input_matrices[3]
		};

		cvjit::Savelock out_savelocks[OUTPUT_COUNT] = {
			output_matrices[0],
			output_matrices[1]
		};

		// Wrap
		cvjit::JitterMatrix keypoints1(input_matrices[0]);
		cvjit::JitterMatrix descriptors1(input_matrices[1]);
		cvjit::JitterMatrix keypoints2(input_matrices[2]);
		cvjit::JitterMatrix descriptors2(input_matrices[3]);

		cvjit::JitterMatrix output1(output_matrices[0]);
		cvjit::JitterMatrix output2(output_matrices[1]);

		//Make sure inputs are of proper format
		t_jit_err err = cvjit::Validate(x, keypoints1)
			.type(_jit_sym_float32)
			.planecount(cvjit::KEYPOINT_FIELD_COUNT)
			.dimcount(1, 2);

		err = cvjit::Validate(x, keypoints2)
			.type(_jit_sym_float32)
			.planecount(cvjit::KEYPOINT_FIELD_COUNT)
			.dimcount(1, 2);

		err = cvjit::Validate(x, descriptors1)
			.type(_jit_sym_float32)
			.planecount(1)
			.dimcount(2);

		err = cvjit::Validate(x, descriptors2)
			.type(_jit_sym_float32)
			.planecount(1)
			.dimcount(2);

		// We also need to make sure that the numbers of features match
		if (keypoints1.get_info().dim[1] != descriptors1.get_info().dim[1] || keypoints2.get_info().dim[1] != descriptors2.get_info().dim[1]) {
			// Return silently. This state occurs frequently enough during patching that it's best to
			// not emit any error.
			output1.set_size(1L, 1L);
			output2.set_size(1L, 1L);
			output1.clear();
			output2.clear();
			return JIT_ERR_NONE;
		}

		// Also return silently if either set of keypoints is empty
		if (keypoints1.empty() || descriptors1.empty() || keypoints2.empty() || descriptors2.empty()) {
			output1.set_size(1L, 1L);
			output2.set_size(1L, 1L);
			output1.clear();
			output2.clear();
			return JIT_ERR_NONE;
		}

		if (JIT_ERR_NONE == err) {

			try {
				// Copy the inputs
				copy_keypoints(keypoints1, x->keypoints1);
				copy_keypoints(keypoints2, x->keypoints2);

				// Just wrap the descriptors into a cv::Mat
				cv::Mat desc_mat1 = descriptors1;
				cv::Mat desc_mat2 = descriptors2;

				// This will contain our results
				std::vector < std::vector<cv::DMatch> > matches;

				// Match...
				x->matcher->knnMatch(desc_mat1, desc_mat2, matches, 2);

				// Here, we clean up the matches using the method described
				// in this paper:
				// https://doi.org/10.1023/B:VISI.0000029664.99615.94

				constexpr float LOWES_RATIO = 0.7f;
				std::vector<cv::DMatch> final_matches;
				final_matches.reserve(matches.size());
				for (std::vector<cv::DMatch> & match : matches) {
					if (match[0].distance < match[1].distance * LOWES_RATIO) {
						final_matches.push_back(match[0]);
					}
				}

				// Adjust the output matrices
				const long output_count = static_cast<long>(final_matches.size());
				output1.set_size(1L, output_count);
				output2.set_size(1L, output_count);

				// Copy to output
				constexpr long KEYPOINT_BYTES = sizeof(float) * cvjit::KEYPOINT_FIELD_COUNT;

				for (long i = 0; i < output_count; i++) {
					cv::DMatch const & match = final_matches[i];

					char * in1 = keypoints1.get_data<char>(match.queryIdx);
					char * in2 = keypoints2.get_data<char>(match.trainIdx);
					char * out1 = output1.get_data<char>(i);
					char * out2 = output2.get_data<char>(i);

					sysmem_copyptr(in1, out1, KEYPOINT_BYTES);
					sysmem_copyptr(in2, out2, KEYPOINT_BYTES);
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

t_cv_jit_keypoints_match *cv_jit_keypoints_match_new(void)
{
	t_cv_jit_keypoints_match *x = (t_cv_jit_keypoints_match *)jit_object_alloc(_cv_jit_keypoints_match_class);
	if (x) {
		// Create the matcher (we only use the FLANN matcher)
		x->matcher = cv::DescriptorMatcher::create(cv::DescriptorMatcher::FLANNBASED);
	}

	return x;
}

void cv_jit_keypoints_match_free(t_cv_jit_keypoints_match *x)
{
	// Nothing
}
