/*
cv.jit.kalman
	

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

#include "cvjit.h"
#include "jitOpenCV.h"
#include "c74_jitter.h"

using namespace c74::max;


typedef struct {
	t_object b_ob;  //The object

	void * outlet;

	long measurement_dims;
	long dynamic_dims;
	long control_dims;

	float vel_weight;
	float accel_weight;

	bool should_init_model;
	
	short output_ac;
	t_atom * output_av;

	cv::KalmanFilter filter;
	cv::Mat control;
	cv::Mat measurement;
	cv::Mat prediction;
} t_cv_jit_kalman;

void cv_jit_kalman_list(t_cv_jit_kalman *x, t_symbol *s, short argc, t_atom *argv);
void cv_jit_kalman_control(t_cv_jit_kalman *x, t_symbol *s, short argc, t_atom *argv);
void cv_jit_kalman_assist(t_cv_jit_kalman *x, void *b, long m, long a, char *s);
void cv_jit_kalman_free(t_cv_jit_kalman *x);
void *cv_jit_kalman_new(long num);
void cv_jit_kalman_clear(t_cv_jit_kalman *x);

t_class * cv_jit_kalman_class;

t_symbol *ps_list;

#ifdef __cplusplus
extern "C"
#endif
void ext_main(void* unused)
{
	t_class * c = class_new("cv.jit.kalman", (method)cv_jit_kalman_new, (method)cv_jit_kalman_free, sizeof(t_cv_jit_kalman), 0L, A_GIMME, 0L);

	// Add methods
	class_addmethod(c, (method)cv_jit_kalman_list, "list", A_GIMME, 0);
	class_addmethod(c, (method)cv_jit_kalman_control, "control", A_GIMME, 0);
	class_addmethod(c, (method)cv_jit_kalman_clear, "clear", 0);
	class_addmethod(c, (method)cv_jit_kalman_clear, "reset", 0);
	class_addmethod(c, (method)cv_jit_kalman_assist, "assist", A_CANT, 0);

	// Add attributes
	CLASS_ATTR_FLOAT(c, "velocity_weight", 0, t_cv_jit_kalman, vel_weight);
	CLASS_ATTR_FLOAT(c, "acceleration_weight", 0, t_cv_jit_kalman, accel_weight);

	// Register class
	class_register(CLASS_BOX, c);

	cv_jit_kalman_class = c;

	ps_list = gensym("list");
}

void cv_jit_kalman_clear(t_cv_jit_kalman *x)
{	
	x->filter.init(x->dynamic_dims, x->measurement_dims, x->control_dims);

	cv::setIdentity(x->filter.measurementMatrix);
	cv::setIdentity(x->filter.processNoiseCov, cv::Scalar::all(1e-5));
	cv::setIdentity(x->filter.measurementNoiseCov, cv::Scalar::all(1e-1));
	cv::setIdentity(x->filter.errorCovPost, cv::Scalar::all(1));

	x->filter.transitionMatrix = cv::Mat_<float>(x->dynamic_dims, x->dynamic_dims, 0.f);

	x->filter.statePre.setTo(cv::Scalar(0));
	x->filter.statePost.setTo(cv::Scalar(0));

	x->should_init_model = true;
}

void cv_jit_kalman_list(t_cv_jit_kalman *x, t_symbol *s, short argc, t_atom *argv)
{
	if (argc != x->measurement_dims) {
		x->measurement_dims = argc;
		x->dynamic_dims = x->measurement_dims * 3; // For every dimension, the model tracks state, velocity and acceleration
		cv_jit_kalman_clear(x);
	}

	// Just to be sure...
	if (x->measurement.rows != x->measurement_dims) {
		x->measurement = cv::Mat(x->measurement_dims, 1, CV_32F);
	}

	for (int i = 0; i < argc; i++) {
		const float val = (float)atom_getfloat(argv + i);
		x->measurement.at<float>(i) = val;
		 
		if (x->should_init_model) {
			x->filter.statePre.at<float>(i) = val;
		}
	}

	x->should_init_model = false;

	// Update the transition matrix
	const float weights[3] = { 1.f, x->vel_weight, x->accel_weight };
	for (int i = 0; i < x->dynamic_dims; i++) {
		for (int j = i, k = 0; j < x->dynamic_dims && k < 3; j += x->measurement_dims, k++) {
			x->filter.transitionMatrix.at<float>(i, j) = weights[k];
		}
	}

	try {
		// Predict
		x->prediction = x->filter.predict(x->control);

		// Correct
		x->filter.correct(x->measurement);

		// Output prediction
		if (x->output_ac != argc) {
			x->output_av = (t_atom *)sysmem_resizeptr(x->output_av, sizeof(t_atom) * argc);
			if (!x->output_av) {
				x->output_ac = 0;
				object_error((t_object *)x, "Out of memory!");
				return;
			}
			x->output_ac = (short)argc;
		}

		for (int i = 0; i < x->output_ac; i++) {
			atom_setfloat(x->output_av + i, x->prediction.at<float>(i, 0));
		}

		outlet_list(x->outlet, nullptr, x->output_ac, x->output_av);
	}

	catch (cv::Exception & exception) {
		object_error((t_object *)x, "OpenCV error: %s", exception.what());
		return;
	}
}

void cv_jit_kalman_control(t_cv_jit_kalman *x, t_symbol *s, short argc, t_atom *argv)
{
	if (argc != x->control_dims) {
		// The number of control dimensions has changed, re-init
		x->control_dims = argc;
		cv_jit_kalman_clear(x);
	}

	// Just to be sure...
	if (x->control.rows != x->control_dims) {
		x->control = x->control_dims == 0 ? cv::Mat() : cv::Mat(1, x->control_dims, CV_32F);
	}

	for (int i = 0; i < argc; i++) {
		const float val = (float)atom_getfloat(argv + i);
		x->control.at<float>(i) = val;
	}
}

void cv_jit_kalman_assist(t_cv_jit_kalman *x, void *b, long m, long a, char *s)
{
	if (m == 1)
	{ 
		switch (a) 
		{ 
		case 0: 
			snprintf(s, 32, "(list) measured state"); 
			break; 
		} 
	} else if (m == 2)
	{ 
		switch (a)
		{
		case 0:
			snprintf(s, 32, "(list) predicted state");
			break;
		}
		
	} 
}

void cv_jit_kalman_free(t_cv_jit_kalman *x)
{
	sysmem_freeptr(x->output_av);
}

void *cv_jit_kalman_new(long arg)
{	
	// Create object
	t_cv_jit_kalman * x = (t_cv_jit_kalman *)object_alloc(cv_jit_kalman_class);

	if (x) {
		// Create outlet
		x->outlet = outlet_new(x, "list");

		// Initialize parameters
		x->control_dims = 0;
		x->dynamic_dims = 0;
		x->measurement_dims = 0;

		x->vel_weight = 0.3f;
		x->accel_weight = 0.2f;
		x->should_init_model = true;
	}
	else {
		object_error(nullptr, "Could not allocate object!");
	}
	
	return x;
}

