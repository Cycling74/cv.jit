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

#include "c74_jitter.h"

using namespace c74::max;

typedef struct _max_cv_jit_features_find
{
	t_object		ob;
	void			*obex;
} t_max_cv_jit_features_find;

t_jit_err cv_jit_features_find_init(void);

void *max_cv_jit_features_find_new(t_symbol *s, long argc, t_atom *argv);
void max_cv_jit_features_find_free(t_max_cv_jit_features_find *x);
void max_cv_jit_features_find_assist(t_max_cv_jit_features_find * x, void * b, long m, long a, char * s);

void *max_cv_jit_features_find_class;

t_symbol * ps_cv_jit_features_find;

#ifdef __cplusplus
extern "C"
#endif		 	
void ext_main(void* unused)
{

#if defined(_DEBUG) || defined(DEBUG) 
	object_post(nullptr, "cv.jit.features.find\nBuilt on %s at %s", __DATE__, __TIME__);
#endif

	// Generate required symbols
	ps_cv_jit_features_find = gensym("cv_jit_features_find");

	// Initialize the Jitter class
	cv_jit_features_find_init();

	// Create the Max wrapper class
	union { void **v_ptr; t_messlist **m_ptr; } alias_ptr;
	alias_ptr.v_ptr = &max_cv_jit_features_find_class;
	setup(alias_ptr.m_ptr, (method)max_cv_jit_features_find_new, (method)max_cv_jit_features_find_free, (short)sizeof(t_max_cv_jit_features_find), 0L, A_GIMME, 0);
	void * classex = max_jit_classex_setup(calcoffset(t_max_cv_jit_features_find, obex));

	// Find the Jitter class
	void * jitter_class = jit_class_findbyname(ps_cv_jit_features_find);

	// We use standard mop
	max_jit_classex_mop_wrap(classex, jitter_class, 0);
	max_jit_classex_standard_wrap(classex, jitter_class, 0);


	// Register our custom inlet / outlet assistance
	addmess((method)max_cv_jit_features_find_assist, "assist", A_CANT, 0);
}

void max_cv_jit_features_find_free(t_max_cv_jit_features_find *x)
{
	max_jit_mop_free(x);
	jit_object_free(max_jit_obex_jitob_get(x));
	max_jit_obex_free(x);
}

void *max_cv_jit_features_find_new(t_symbol *s, long argc, t_atom *argv)
{
	t_max_cv_jit_features_find *x;
	void *o;

	if ((x = (t_max_cv_jit_features_find *)max_jit_obex_new(max_cv_jit_features_find_class, gensym("cv_jit_features_find")))) {
		if ((o = (t_jit_object*)jit_object_new(gensym("cv_jit_features_find")))) {
			max_jit_mop_setup_simple(x, o, argc, argv);
			max_jit_attr_args(x, (short)argc, argv);
		}
		else {
			object_error((t_object*)x, "cv.jit.features.find: could not allocate object");
			object_free((t_object *)x);
		}
	}
	return (x);
}

void max_cv_jit_features_find_assist(t_max_cv_jit_features_find * x, void * b, long m, long a, char * s)
{
	const int MAX_ASSIST_LENGTH = 32;
	if (m == 1) { //input
		max_jit_mop_assist(x, b, m, a, s);
	}
	else { //output
		switch (a) {
		case 0:
			snprintf(s, MAX_ASSIST_LENGTH, "(matrix) feature locations");
			break;
		case 1:
			snprintf(s, MAX_ASSIST_LENGTH, "(matrix) feature descriptors");
			break;
		case 2:
			snprintf(s, MAX_ASSIST_LENGTH, "dumpout");
			break;
		}
	}
}