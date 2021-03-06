/*
max.cv.jit.faces
	

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

//#include "cvjit_wrappers.h"

//CVJIT_GENERATE_STANDARD_MAX_WRAPPER(cv_jit_face_landmarks, "cv.jit.face.landmarks")

#include "c74_jitter.h"

using namespace c74::max;

typedef struct _max_cv_jit_face_landmarks
{
	t_object		ob;
	void			*obex;
} t_max_cv_jit_face_landmarks;

t_jit_err cv_jit_face_landmarks_init(void);

void *max_cv_jit_face_landmarks_new(t_symbol *s, long argc, t_atom *argv);
void max_cv_jit_face_landmarks_free(t_max_cv_jit_face_landmarks *x);
void max_cv_jit_face_landmarks_assist(t_max_cv_jit_face_landmarks * x, void * b, long m, long a, char * s);

void *max_cv_jit_face_landmarks_class;

#ifdef __cplusplus
extern "C"
#endif		 	
void ext_main(void* unused)
{
	void *p, *q;

	union { void **v_ptr; t_messlist **m_ptr; } alias_ptr;
	alias_ptr.v_ptr = &max_cv_jit_face_landmarks_class;
	cv_jit_face_landmarks_init();
	setup(alias_ptr.m_ptr, (method)max_cv_jit_face_landmarks_new, (method)max_cv_jit_face_landmarks_free, (short)sizeof(t_max_cv_jit_face_landmarks),
		0L, A_GIMME, 0);

	p = max_jit_classex_setup(calcoffset(t_max_cv_jit_face_landmarks, obex));
	q = jit_class_findbyname(gensym("cv_jit_face_landmarks"));
	max_jit_classex_mop_wrap(p, q, 0);
	max_jit_classex_standard_wrap(p, q, 0);
	addmess((method)max_cv_jit_face_landmarks_assist, "assist", A_CANT, 0);

	return;
}

void max_cv_jit_face_landmarks_free(t_max_cv_jit_face_landmarks *x)
{
	max_jit_mop_free(x);
	jit_object_free(max_jit_obex_jitob_get(x));
	max_jit_obex_free(x);
}

void *max_cv_jit_face_landmarks_new(t_symbol *s, long argc, t_atom *argv)
{
	t_max_cv_jit_face_landmarks *x;
	void *o;

	if ((x = (t_max_cv_jit_face_landmarks *)max_jit_obex_new(max_cv_jit_face_landmarks_class, gensym("cv_jit_face_landmarks")))) {
		if ((o = (t_jit_object*)jit_object_new(gensym("cv_jit_face_landmarks")))) {
			max_jit_mop_setup_simple(x, o, argc, argv);
			max_jit_attr_args(x, (short)argc, argv);
		}
		else {
			object_error((t_object*)x, "cv.jit.face.landmarks: could not allocate object");
			object_free((t_object *)x);
		}
	}
	return (x);
}

void max_cv_jit_face_landmarks_assist(t_max_cv_jit_face_landmarks * x, void * b, long m, long a, char * s)
{
	const int MAX_ASSIST_LENGTH = 32;
	if (m == 1) { //input
		switch (a) {
		case 0:
			snprintf(s, MAX_ASSIST_LENGTH, "(matrix) face rectangles");
			break;
		case 1:
			snprintf(s, MAX_ASSIST_LENGTH, "(matrix) input image");
			break;
		}
	}
	else { //output
		max_jit_mop_assist(x, b, m, a, s);
	}
}