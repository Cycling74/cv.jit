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

				// This takes a long time, run async
				object_post((t_object *)this, "Loading face landmark model. This may take some time...");
				std::thread worker = std::thread([abs_path, file_name, this]() {
					cv::Ptr<cv::face::Facemark> fm = cv::face::FacemarkLBF::create();
					fm->loadModel(abs_path);
					model_pool[file_name] = fm;
					facemark = fm;
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
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop, 1, 1);  //Object has one input and one output
	output = (t_jit_object *)jit_object_method(mop,_jit_sym_getoutput, 1); //Get a pointer to the output matrix

   	jit_mop_single_type(mop,_jit_sym_char);   //Set input type and planecount
   	jit_mop_single_planecount(mop, 1);  // Only greyscale images
   	
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
	long get_private_set_flags = ATTR_GET_DEFER_LOW | ATTR_SET_OPAQUE_USER;
	
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset, "ready", _jit_sym_long, get_private_set_flags,
		(method)0L, (method)0L, calcoffset(t_cv_jit_face_landmarks, ready));
	jit_class_addattr(_cv_jit_face_landmarks_class, attr);
			
	jit_class_register(_cv_jit_face_landmarks_class);

	return JIT_ERR_NONE;
}

t_jit_err cv_jit_face_landmarks_matrix_calc(t_cv_jit_face_landmarks *x, void *inputs, void *outputs)
{
	cv::Mat source;
	std::vector<cv::Rect> faces;

	//Get pointers to matrices
	t_object * in_matrix 	= (t_object *)jit_object_method(inputs,_jit_sym_getindex, 0);
	t_object *out_matrix  = (t_object *)jit_object_method(outputs,_jit_sym_getindex, 0);

	if (x && in_matrix && out_matrix && !x->facemark.empty() && !x->facemark->empty()) 
	{
		//Lock the matrices
		cvjit::Savelock savelocks[] = { in_matrix, out_matrix };

		t_jit_matrix_info in_minfo;
		jit_object_method(in_matrix, _jit_sym_getinfo, &in_minfo);

		
		//Make sure input is of proper format
		t_jit_err err = cvjit::Validate(x, in_minfo)
			.type(_jit_sym_char)
			.planecount(1)
			.dimcount(2)
			.min_dimsize(2);

		if (JIT_ERR_NONE == err) {

			try {

				//Convert Jitter matrix to OpenCV matrix
				char * in_bp;
				jit_object_method(in_matrix, _jit_sym_getdata, &in_bp);
				cv::Mat source = cvjit::wrapJitterMatrix(in_matrix, in_minfo, in_bp);

				// This objects assumes that a face has already been detected, for instance,
				// by cv.jit.faces, and that the input image is already cropped to contain only
				// a face. Hence, there is only one face region occupying the entire image.
				std::vector<cv::Rect> face_regions = { cv::Rect(0, 0, source.cols, source.rows) };

				// This vector will be filled by the landmark detector.
				std::vector<std::vector<cv::Point2f> > landmarks;

				// Detect the landmarks
				x->facemark->fit(source, face_regions, landmarks);

				//Prepare output

				if (landmarks.size() > 0 && landmarks[0].size() > 0) {

					// Change the size of the output matrix
					t_jit_matrix_info out_minfo = cvjit::resize_matrix(out_matrix, { (long)landmarks[0].size(), (long)landmarks.size() });

					// Get the output data pointer
					char *out_bp;
					jit_object_method(out_matrix, _jit_sym_getdata, &out_bp);
					if (!out_bp) { return JIT_ERR_INVALID_OUTPUT; }

					// Copy the landmarks to the output matrix
					for (std::vector<cv::Point2f> & face : landmarks) {
						float * out_data = (float *)out_bp;

						for (cv::Point2f & point : face) {
							out_data[0] = point.x;
							out_data[1] = point.y;
							out_data += 2;
						}

						out_bp += out_minfo.dimstride[1];
					}
				}

				else {
					// No landmarks found!
					cvjit::resize_matrix(out_matrix, { 1 });
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
