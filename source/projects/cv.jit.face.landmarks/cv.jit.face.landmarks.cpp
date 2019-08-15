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

constexpr cvjit::cstring DEFAULT_MODEL_FN = "lbfmodel.yaml";

std::unordered_map<std::string, cv::Ptr<cv::face::Facemark> > model_pool;

struct t_cv_jit_face_landmarks
{
	t_object ob;

	long ready{ 0 };
	long normalize{ 0 };

	cv::Ptr<cv::face::Facemark> facemark;

	void load_model(std::string file_name) {
		ready = 0;

		// Loading the model is very slow. The models themselves also take up
		// a lot of memory. To speed things up when several instances are used
		// we use a common pool.
		auto it = model_pool.find(file_name);
		if (it != model_pool.end()) {
			// Already loaded
			facemark = it->second;
			ready = 1;
		}
		else {
			// Model has not been loaded yet. Load it asynchronously
			std::string abs_path = cvjit::get_absolute_path(file_name);
			if (!abs_path.empty()) {

				cv::Ptr<cv::face::Facemark> fm = cv::face::FacemarkLBF::create();
				model_pool[file_name] = fm;
				facemark = fm;

				// This takes a long time, run async
				object_post((t_object *)this, "Loading face landmark model. This may take some time...");
				std::thread worker = std::thread([fm, this, file_name, abs_path]() {
					
					fm->loadModel(abs_path);
					
					object_post((t_object *)this, "Finished loading %s.", file_name.c_str());
					ready = 1;
				});

				worker.detach();
			}
			else {
				object_error((t_object *)this, "Could not read model: %s", file_name);
			}
		}
	}
};

void *_cv_jit_face_landmarks_class;

t_jit_err cv_jit_face_landmarks_init(void); 
t_cv_jit_face_landmarks *cv_jit_face_landmarks_new(void);
void cv_jit_face_landmarks_free(t_cv_jit_face_landmarks *x);
t_jit_err cv_jit_face_landmarks_matrix_calc(t_cv_jit_face_landmarks *x, void *inputs, void *outputs);
void cv_jit_face_landmarks_read(t_cv_jit_face_landmarks *x, t_symbol *s, short argc, t_atom *argv);

t_jit_err cv_jit_face_landmarks_init(void) 
{
	t_jit_object *attr, *mop, *output;

	t_symbol * atsym  = gensym("jit_attr_offset");
	
	_cv_jit_face_landmarks_class = jit_class_new("cv_jit_face_landmarks",(method)cv_jit_face_landmarks_new, (method)cv_jit_face_landmarks_free,
		sizeof(t_cv_jit_face_landmarks), 0L); 

	//add mop
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop, 2, 1);  //Object has two inputs and one output
	output = (t_jit_object *)jit_object_method(mop,_jit_sym_getoutput, 1); //Get a pointer to the output matrix
   	
	jit_mop_input_nolink(mop, 2); // Turn off input linking
	t_object * in2 = (t_jit_object *)jit_object_method(mop, _jit_sym_getinput, 2); // Indices start at 1...
	jit_object_method(in2, _jit_sym_ioproc, jit_mop_ioproc_copy_adapt); // If we don't call this, nolink won't work for input
   	jit_mop_output_nolink(mop, 1); //Turn off output linking so that output matrix does not adapt to input
   	
   	jit_attr_setlong(output, _jit_sym_minplanecount, 2);  // 2D features
  	jit_attr_setlong(output, _jit_sym_maxplanecount, 2);
  	jit_attr_setlong(output, _jit_sym_mindim, 2); //Two dimensions: one row per face, one column per landmark
  	jit_attr_setlong(output, _jit_sym_maxdim, 2);
  	jit_attr_setsym(output, _jit_sym_types, _jit_sym_float32); //Coordinates are returned with sub-pixel accuracy
	jit_class_addadornment(_cv_jit_face_landmarks_class,mop);
	
	
	//add methods
	jit_class_addmethod(_cv_jit_face_landmarks_class, (method)cv_jit_face_landmarks_matrix_calc, "matrix_calc", A_CANT, 0L);
	jit_class_addmethod(_cv_jit_face_landmarks_class, (method)cv_jit_face_landmarks_read, "read", A_GIMME, 0L);

	//add attributes	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset, "ready", _jit_sym_long, cvjit::Flags::private_set,
		(method)0L, (method)0L, calcoffset(t_cv_jit_face_landmarks, ready));
	jit_class_addattr(_cv_jit_face_landmarks_class, attr);

	// Normalize attribute
	jit_class_addattr(_cv_jit_face_landmarks_class, cvjit::normalize_attr<t_cv_jit_face_landmarks>());
			
	jit_class_register(_cv_jit_face_landmarks_class);

	return JIT_ERR_NONE;
}

template <typename T>
inline cv::Rect read_rect_imp(char * p, double scale_x, double scale_y) {
	T * const data = (T *)p;
	return cv::Rect(
		(int)((double)data[0] * scale_x),
		(int)((double)data[1] * scale_y),
		(int)((double)(data[2] - data[0]) * scale_x),
		(int)((double)(data[3] - data[1]) * scale_y)
	);
}

inline cv::Rect read_rect(char * p, t_symbol * type, double scale_x, double scale_y) {
	if (type == _jit_sym_long) {
		return read_rect_imp<int32_t>(p, scale_x, scale_y);
	}
	else if (type == _jit_sym_float32) {
		return read_rect_imp<float>(p, scale_x, scale_y);
	}
	else if (type == _jit_sym_float64) {
		return read_rect_imp<double>(p, scale_x, scale_y);
	}
	else {
		return read_rect_imp<int8_t>(p, scale_x, scale_y);
	}
}

t_jit_err cv_jit_face_landmarks_matrix_calc(t_cv_jit_face_landmarks *x, void *inputs, void *outputs)
{
	std::vector<cv::Rect> faces;

	//Get pointers to matrices
	t_object * input_coords_matrix = (t_object *)jit_object_method(inputs, _jit_sym_getindex, 0);
	t_object * input_image_matrix 	= (t_object *)jit_object_method(inputs, _jit_sym_getindex, 1);
	t_object *out_matrix  = (t_object *)jit_object_method(outputs, _jit_sym_getindex, 0);

	if (x && input_image_matrix && input_coords_matrix && out_matrix && !x->facemark.empty() && !x->facemark->empty())
	{
		//Lock the matrices
		cvjit::Savelock savelocks[] = { input_coords_matrix, input_image_matrix, out_matrix };

		// Wrap the matrices
		cvjit::JitterMatrix input_coords(input_coords_matrix);
		cvjit::JitterMatrix input_image(input_image_matrix);
		cvjit::JitterMatrix results(out_matrix);
		
		//Make sure input is of proper format
		t_jit_err err = cvjit::Validate(x, input_coords)
			.type(_jit_sym_long, _jit_sym_float32, _jit_sym_float64)
			.planecount(4) // Face rectangle
			.dimcount(1);

		if (JIT_ERR_NONE == err) {
			err = cvjit::Validate(x, input_image)
				.type(_jit_sym_char)
				.planecount(1)
				.dimcount(2)
				.min_dimsize(2);
		}
		

		if (JIT_ERR_NONE == err) {

			try {

				//Convert Jitter matrix to OpenCV matrix
				cv::Mat src = input_image;

				std::vector<cv::Rect> face_regions;

				const float scale_x = x->normalize ? (float)input_image.normalization_scale_x() : 1.f;
				const float scale_y = x->normalize ? (float)input_image.normalization_scale_y() : 1.f;
				const float inv_scale_x = scale_x == 0.f ? 0.f : 1.f / scale_x;
				const float inv_scale_y = scale_y == 0.f ? 0.f : 1.f / scale_y;
				const bool data_is_row = input_coords.get_info().dimcount == 1 || input_coords.get_info().dim[1] == 1;
				
				for (long i = 0; i < input_coords.get_info().dim[0]; i++) {
					char * p = data_is_row ? input_coords.get_data<char>(0, i) : input_coords.get_data<char>(i);
					cv::Rect rect = read_rect(p, input_coords.get_info().type, inv_scale_x, inv_scale_y);

					if (rect.x != 0 || rect.y != 0 || rect.width != 0 || rect.height != 0) {
						face_regions.push_back(rect);
					}
				}

				if (face_regions.size() > 0) {
					// This vector will be filled by the landmark detector.
					std::vector<std::vector<cv::Point2f> > landmarks;

					// Detect the landmarks
					x->facemark->fit(src, face_regions, landmarks);

					//Prepare output
					if (landmarks.size() > 0 && landmarks[0].size() > 0) {

						// Change the size of the output matrix
						results.set_size((long)landmarks[0].size(), (long)landmarks.size());

						// Copy the landmarks to the output matrix
						for (int i = 0; i < landmarks.size(); i++) {
							std::vector<cv::Point2f> & face = landmarks.at(i);
							float * out_data = results.get_data<float>(i);
							for (cv::Point2f & point : face) {
								out_data[0] = point.x * scale_x;
								out_data[1] = point.y * scale_y;
								out_data += 2;
							}
						}

						return JIT_ERR_NONE;
					}
				}

				// No landmarks found!
				results.set_size(1, 1);
				results.clear();
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

t_cv_jit_face_landmarks *cv_jit_face_landmarks_new(void)
{
	t_cv_jit_face_landmarks *x = (t_cv_jit_face_landmarks *)jit_object_alloc(_cv_jit_face_landmarks_class);
	if (x) {
		x->ready = 0;
		x->load_model(DEFAULT_MODEL_FN);
	}

	return x;
}

void cv_jit_face_landmarks_free(t_cv_jit_face_landmarks *x)
{
	// Nothing
}

void cv_jit_face_landmarks_read(t_cv_jit_face_landmarks *x, t_symbol *s, short argc, t_atom *argv)
{
	if (x) {
		if (argc > 0 && argv[0].a_type == A_SYM) {
			x->load_model(argv[0].a_w.w_sym->s_name);
		}
		else {
			// If no file is provided, load default model
			x->load_model(DEFAULT_MODEL_FN);

			//object_error((t_object *)x, "Missing filename for read message.");
		}
	}
}
