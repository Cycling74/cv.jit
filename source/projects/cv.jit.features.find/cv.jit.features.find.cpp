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

using namespace c74::max;

enum FeaturesMethod {
	AKAZE = 0,
	BRISK,
	KAZE,
	MSER,
	ORB,
	FEATURE_METHOD_COUNT
};

t_symbol * feature_methods[FEATURE_METHOD_COUNT] = {
	gensym("AKAZE"),
	gensym("BRISK"),
	gensym("KAZE"),
	gensym("MSER"),
	gensym("ORB")
};

enum KeypointField {
	KEYPOINT_X = 0,
	KEYPOINT_Y,
	KEYPOINT_SIZE,
	KEYPOINT_ANGLE,
	KEYPOINT_RESPONSE,
	KEYPOINT_OCTAVE,
	KEYPOINT_FIELD_COUNT
};

struct t_cv_jit_features_find
{
	t_object ob;

	t_atom method;
	long normalize;

	// Detector parameters
	long extended;
	long upright;
	long delta;
	long levels;
	long minarea;
	long maxarea;
	long maxcount;
	long octaveLayers;
	long octaves;
	long patchsize;
	float scalefactor;
	float threshold;
	
	FeaturesMethod _method;
	cv::Ptr<cv::Feature2D> detector;
};

void *_cv_jit_features_find_class;

t_jit_err cv_jit_features_find_init(void); 
t_cv_jit_features_find *cv_jit_features_find_new(void);
void cv_jit_features_find_free(t_cv_jit_features_find *x);
t_jit_err cv_jit_features_find_matrix_calc(t_cv_jit_features_find *x, void *inputs, void *outputs);

// Attributes
t_jit_err cv_jit_features_find_set_method(t_cv_jit_features_find *x, void *attr, long ac, t_atom *av);

t_jit_err cv_jit_features_find_init(void) 
{
#if defined(_DEBUG) || defined(DEBUG) 
	object_post(nullptr, "cv.jit.features.find\nBuilt on %s at %s", __DATE__, __TIME__);
#endif

	constexpr int INPUT_COUNT = 1;
	constexpr int OUTPUT_COUNT = 2; // Keypoints and descriptions
	constexpr int KEYPOINT_PLANECOUNT = KEYPOINT_FIELD_COUNT;

	t_symbol * atsym  = gensym("jit_attr_offset");
	
	_cv_jit_features_find_class = jit_class_new("cv_jit_features_find",(method)cv_jit_features_find_new, (method)cv_jit_features_find_free,
		sizeof(t_cv_jit_features_find), 0L); 

	//add mop
	t_jit_object * mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop, INPUT_COUNT, OUTPUT_COUNT);
	t_jit_object * input = (t_jit_object *)jit_object_method(mop, _jit_sym_getinput, 1);
	t_jit_object * keypoint_output = (t_jit_object *)jit_object_method(mop, _jit_sym_getoutput, 1);
	t_jit_object * descriptor_output = (t_jit_object *)jit_object_method(mop, _jit_sym_getoutput, 2);
 
   	jit_mop_output_nolink(mop, 1); //Turn off output linking so that output matrix does not adapt to input
	jit_mop_output_nolink(mop, 2);

	jit_class_addadornment(_cv_jit_features_find_class, mop);

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
	jit_class_addmethod(_cv_jit_features_find_class, (method)cv_jit_features_find_matrix_calc, "matrix_calc", A_CANT, 0L);

	//add attributes
	t_jit_object * attr;

	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset, "method", _jit_sym_atom, cvjit::Flags::get_set,
		(method)0L, (method)cv_jit_features_find_set_method, calcoffset(t_cv_jit_features_find, method));
	jit_class_addattr(_cv_jit_features_find_class, attr);

	// The normalize attribute
	jit_class_addattr(_cv_jit_features_find_class, cvjit::normalize_attr<t_cv_jit_features_find>());

	// Detector attributes
	cvjit::AttributeManager attributes(_cv_jit_features_find_class);

	attributes.add_bool("extended", CVJIT_CALCOFFSET(&t_cv_jit_features_find::extended));
	attributes.add_bool("upright", CVJIT_CALCOFFSET(&t_cv_jit_features_find::upright));

	attributes.add("delta", 1L, 255L, CVJIT_CALCOFFSET(&t_cv_jit_features_find::delta));
	attributes.add("levels", 1L, CVJIT_CALCOFFSET(&t_cv_jit_features_find::levels));
	attributes.add("minarea", 0L, CVJIT_CALCOFFSET(&t_cv_jit_features_find::minarea));
	attributes.add("maxarea", 0L, CVJIT_CALCOFFSET(&t_cv_jit_features_find::maxarea));
	attributes.add("maxcount", 1L, CVJIT_CALCOFFSET(&t_cv_jit_features_find::maxcount));
	attributes.add("octaveLayers", 1L, CVJIT_CALCOFFSET(&t_cv_jit_features_find::octaveLayers));
	attributes.add("octaves", 1L, CVJIT_CALCOFFSET(&t_cv_jit_features_find::octaves));
	attributes.add("patchsize", 1L, CVJIT_CALCOFFSET(&t_cv_jit_features_find::patchsize));
	attributes.add("scalefactor", 1.f, CVJIT_CALCOFFSET(&t_cv_jit_features_find::scalefactor));
	attributes.add("threshold", 0.001f, CVJIT_CALCOFFSET(&t_cv_jit_features_find::threshold));
			
	jit_class_register(_cv_jit_features_find_class);

	return JIT_ERR_NONE;
}

inline void set_detector(t_cv_jit_features_find *x, FeaturesMethod method)
{
	x->_method = method;
	switch (method) {
	case AKAZE:
		x->detector = cv::AKAZE::create();
		break;
	case BRISK:
		x->detector = cv::BRISK::create();
		break;
	case KAZE:
		x->detector = cv::KAZE::create();
		break;
	case MSER:
		x->detector = cv::MSER::create();
		break;
	case ORB:
		x->detector = cv::ORB::create();
		break;
	}
}

t_jit_err cv_jit_features_find_set_method(t_cv_jit_features_find *x, void *attr, long ac, t_atom *av)
{
	if (ac > 0) {
		if (av[0].a_type == A_LONG || av[0].a_type == A_FLOAT) {
			t_atom_long val = atom_getlong(av);
			if (val < 0 || val >= FEATURE_METHOD_COUNT) {
				object_error((t_object *)x, "Invalid method, make sure value is between 0 and %d.", FEATURE_METHOD_COUNT - 1);
			}
			else {
				atom_setsym(&x->method, feature_methods[val]);
				set_detector(x, static_cast<FeaturesMethod>(val));
			}
		}
		else if (av[0].a_type == A_SYM) {
			t_symbol * sym = atom_getsym(av);
			for (int i = 0; i < FEATURE_METHOD_COUNT; i++) {
				if (sym == feature_methods[i]) {
					x->method = av[0];
					set_detector(x, static_cast<FeaturesMethod>(i));
					return JIT_ERR_NONE;
				}
			}
			object_error((t_object *)x, "Invalid method: %s", sym->s_name);
		}
		else {
			object_error((t_object *)x, "Invalid method, please provide a method name or number.");
		}
	}
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_features_find_matrix_calc(t_cv_jit_features_find *x, void *inputs, void *outputs)
{
	cv::Mat source;
	std::vector<cv::Rect> faces;

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
		t_jit_err err = cvjit::Validate(x, source.get_info())
			.type(_jit_sym_char)
			.planecount(1)
			.dimcount(2);

		if (JIT_ERR_NONE == err) {

			try {

				// Setup the parameters
				switch (x->_method) {
					case AKAZE:
					{
						cv::Ptr<cv::AKAZE> AKAZE = x->detector.dynamicCast<cv::AKAZE>();
						AKAZE->setThreshold(x->threshold);
						AKAZE->setNOctaves(x->octaves);
						AKAZE->setNOctaveLayers(x->octaveLayers);
						break;
					}
					case BRISK:
					{
						cv::Ptr<cv::BRISK> BRISK = x->detector.dynamicCast<cv::BRISK>();
						BRISK->setThreshold(static_cast<int>(x->threshold * 255.f));
						BRISK->setOctaves(x->octaves);
						break;
					}
					case KAZE:
					{
						cv::Ptr<cv::KAZE> KAZE = x->detector.dynamicCast<cv::KAZE>();
						KAZE->setExtended(x->extended != 0);
						KAZE->setNOctaveLayers(x->octaveLayers);
						KAZE->setNOctaves(x->octaves);
						KAZE->setThreshold(x->threshold);
						KAZE->setUpright(x->upright != 0);
						break;
					}
					case MSER:
					{
						cv::Ptr<cv::MSER> MSER = x->detector.dynamicCast<cv::MSER>();
						MSER->setDelta(x->delta);
						MSER->setMaxArea(x->maxarea);
						MSER->setMinArea(x->minarea);
						break;
					}
					case ORB:
					{
						cv::Ptr<cv::ORB> ORB = x->detector.dynamicCast<cv::ORB>();
						ORB->setFastThreshold(static_cast<int>(x->threshold * 255.f));
						ORB->setMaxFeatures(x->maxcount);
						ORB->setScaleFactor(x->scalefactor);
						ORB->setPatchSize(x->patchsize);
						ORB->setEdgeThreshold(x->patchsize);
						break;
					}
				}

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

				const float x_scale = x->normalize ? 1.f / (float)source.get_info().dim[0] : 1.f;
				const float y_scale = x->normalize ? 1.f / (float)source.get_info().dim[1] : 1.f;
				const float size_scale = std::min(x_scale, y_scale);

				for (long int i = 0; i < feature_count; i++) {
					float * kp = keypoints.get_data<float>(i);
					char * desc = descriptors.get_data<char>(i);
					cv::KeyPoint const & p = keypointsVec.at(i);
					kp[KEYPOINT_X] = p.pt.x * x_scale;
					kp[KEYPOINT_Y] = p.pt.y * y_scale;
					kp[KEYPOINT_SIZE] = p.size * size_scale;
					kp[KEYPOINT_ANGLE] = p.angle;
					kp[KEYPOINT_RESPONSE] = p.response;
					kp[KEYPOINT_OCTAVE] = static_cast<float>(p.octave);

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

t_cv_jit_features_find *cv_jit_features_find_new(void)
{
	t_cv_jit_features_find *x = (t_cv_jit_features_find *)jit_object_alloc(_cv_jit_features_find_class);
	if (x) {
		atom_setsym(&x->method, gensym("ORB"));
		set_detector(x, ORB);
		x->normalize = 0;

		x->extended = 0;
		x->upright = 0;
		x->delta = 5;
		x->levels = 8;
		x->minarea = 60;
		x->maxarea = 14400;
		x->maxcount = 500;
		x->octaveLayers = 4;
		x->octaves = 4;
		x->patchsize = 31;
		x->scalefactor = 1.2f;
		x->threshold = 0.01f;
	}

	return x;
}

void cv_jit_features_find_free(t_cv_jit_features_find *x)
{
	// Nothing
}
