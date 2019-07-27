/*
max.cv.jit.keypoints
	

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

//#include "cvjit_wrappers.h"

#include "c74_jitter.h"

using namespace c74::max;

typedef struct _max_cv_jit_keypoints
{
	t_object		ob;
	void			*obex;
} t_max_cv_jit_keypoints;

t_jit_err cv_jit_keypoints_init(void);

void *max_cv_jit_keypoints_new(t_symbol *s, long argc, t_atom *argv);
void max_cv_jit_keypoints_free(t_max_cv_jit_keypoints *x);
void max_cv_jit_keypoints_assist(t_max_cv_jit_keypoints * x, void * b, long m, long a, char * s);

void *max_cv_jit_keypoints_class;

t_symbol * ps_cv_jit_keypoints;

#ifdef __cplusplus
extern "C"
#endif		 	
void ext_main(void* unused)
{
	// Generate required symbols
	ps_cv_jit_keypoints = gensym("cv_jit_keypoints");

	// Initialize the Jitter class
	cv_jit_keypoints_init();

	// Create the Max wrapper class
	union { void **v_ptr; t_messlist **m_ptr; } alias_ptr;
	alias_ptr.v_ptr = &max_cv_jit_keypoints_class;
	setup(alias_ptr.m_ptr, (method)max_cv_jit_keypoints_new, (method)max_cv_jit_keypoints_free, (short)sizeof(t_max_cv_jit_keypoints), 0L, A_GIMME, 0);
	void * classex = max_jit_classex_setup(calcoffset(t_max_cv_jit_keypoints, obex));

	// Find the Jitter class
	void * jitter_class = jit_class_findbyname(ps_cv_jit_keypoints);

	// We use standard mop
	max_jit_classex_mop_wrap(classex, jitter_class, 0);
	max_jit_classex_standard_wrap(classex, jitter_class, 0);


	// Register our custom inlet / outlet assistance
	addmess((method)max_cv_jit_keypoints_assist, "assist", A_CANT, 0);
}

void max_cv_jit_keypoints_free(t_max_cv_jit_keypoints *x)
{
	max_jit_mop_free(x);
	jit_object_free(max_jit_obex_jitob_get(x));
	max_jit_obex_free(x);
}

void *max_cv_jit_keypoints_new(t_symbol *s, long argc, t_atom *argv)
{
	t_max_cv_jit_keypoints *x;
	void *o;

	if ((x = (t_max_cv_jit_keypoints *)max_jit_obex_new(max_cv_jit_keypoints_class, gensym("cv_jit_keypoints")))) {
		if ((o = (t_jit_object*)jit_object_new(gensym("cv_jit_keypoints")))) {
			max_jit_mop_setup_simple(x, o, argc, argv);
			max_jit_attr_args(x, (short)argc, argv);
		}
		else {
			object_error((t_object*)x, "cv.jit.keypoints: could not allocate object");
			object_free((t_object *)x);
		}
	}
	return (x);
}

void max_cv_jit_keypoints_assist(t_max_cv_jit_keypoints * x, void * b, long m, long a, char * s)
{
	const int MAX_ASSIST_LENGTH = 32;
	if (m == 1) { //input
		max_jit_mop_assist(x, b, m, a, s);
	}
	else { //output
		switch (a) {
		case 0:
			snprintf(s, MAX_ASSIST_LENGTH, "(matrix) keypoints");
			break;
		case 1:
			snprintf(s, MAX_ASSIST_LENGTH, "(matrix) keypoint descriptors");
			break;
		case 2:
			snprintf(s, MAX_ASSIST_LENGTH, "dumpout");
			break;
		}
	}
}