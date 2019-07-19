/*
max.cv.jit.unproject
	

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

#include "c74_jitter.h"
#include "cvjit_max.h"

using namespace c74::max;

typedef struct _max_cv_jit_unproject 
{
	t_object ob;
	void * obex;

	cvjit::WrapperOutlet translation_outlet;
	cvjit::WrapperOutlet rotation_outlet;

} t_max_cv_jit_unproject;

t_jit_err cv_jit_unproject_init(void); 

void *max_cv_jit_unproject_new(t_symbol *s, long argc, t_atom *argv);
void max_cv_jit_unproject_free(t_max_cv_jit_unproject *x);
void max_cv_jit_unproject_assist(t_max_cv_jit_unproject *x, void *b, long m, long a, char *s);
void max_cv_jit_unproject_bang(t_max_cv_jit_unproject *x);
void max_cv_jit_unproject_mproc(t_max_cv_jit_unproject *x, void *mop);

// Classes
void * max_cv_jit_unproject_class;

// Symbols
static t_symbol * ps_cv_jit_unproject;
		 
#ifdef __cplusplus
extern "C"
#endif
void ext_main(void* unused)
{	
#if defined(_DEBUG) || defined(DEBUG) 
	object_post(nullptr, "cv.jit.unproject\nBuilt on %s at %s", __DATE__, __TIME__);
#endif
	// Generate required symbols
	ps_cv_jit_unproject = gensym("cv_jit_unproject");

	// Initialize the Jitter class
	cv_jit_unproject_init();

	// Create the Max wrapper class
	union { void **v_ptr; t_messlist **m_ptr; } alias_ptr;
	alias_ptr.v_ptr = &max_cv_jit_unproject_class;
	setup(alias_ptr.m_ptr, (method)max_cv_jit_unproject_new, (method)max_cv_jit_unproject_free, (short)sizeof(t_max_cv_jit_unproject), 0L, A_GIMME, 0);
	void * classex = max_jit_classex_setup(calcoffset(t_max_cv_jit_unproject, obex));
	
	// Find the Jitter class
	void * jitter_class = jit_class_findbyname(ps_cv_jit_unproject);

	// We use a custom mop
	max_jit_classex_mop_wrap(classex, jitter_class, MAX_JIT_MOP_FLAGS_OWN_BANG | MAX_JIT_MOP_FLAGS_OWN_OUTPUTMATRIX);
	max_jit_classex_mop_mproc(classex, jitter_class, max_cv_jit_unproject_mproc);
	max_jit_classex_standard_wrap(classex, jitter_class, 0);

	// Register our custom bang method
	addmess((method)max_cv_jit_unproject_bang, "bang", A_CANT, 0);

	// Register our custom inlet / outlet assistance
	addmess((method)max_cv_jit_unproject_assist, "assist", A_CANT, 0);
}

void max_cv_jit_unproject_bang(t_max_cv_jit_unproject *x)
{
	if (max_jit_mop_getoutputmode(x)) {
		// Output to outlets
		x->rotation_outlet.output();
		x->translation_outlet.output();
	}
}

void max_cv_jit_unproject_mproc(t_max_cv_jit_unproject *x, void *mop)
{
	// Get the Jitter object
	void * jitter_object = max_jit_obex_jitob_get(x);
	void * input_matrix_list = jit_object_method(mop, _jit_sym_getinputlist);
	void * output_matrix_list = jit_object_method(mop, _jit_sym_getoutputlist);

	// Call the matrix calc method
	t_jit_err err = (t_jit_err)jit_object_method(jitter_object, _jit_sym_matrix_calc, input_matrix_list, output_matrix_list);
	if (JIT_ERR_NONE == err) {
		// Calculation was succesful, call the bang function to output
		max_cv_jit_unproject_bang(x);
	} else {
		jit_error_code(jitter_object, err);
	}
}

static constexpr char const * const outlet_assistance[] = {
	"(list) translation",
	"(list) rotation quaternion",
	"dumpout"
};

static constexpr int OUTLET_ASSIST_COUNT = sizeof(outlet_assistance) / sizeof(outlet_assistance[0]);

void max_cv_jit_unproject_assist(t_max_cv_jit_unproject *x, void *b, long m, long a, char *s)
{
	const int MAX_ASSIST_LENGTH = 32;
	if (m == 1) { //input
		max_jit_mop_assist(x, b, m, a, s);
	} else { //output
		if (a < OUTLET_ASSIST_COUNT) {
			snprintf(s, MAX_ASSIST_LENGTH, outlet_assistance[a]);
		}
	}
}

void max_cv_jit_unproject_free(t_max_cv_jit_unproject *x)
{
	max_jit_mop_free(x);
	jit_object_free(max_jit_obex_jitob_get(x));
	max_jit_obex_free(x);
}

void *max_cv_jit_unproject_new(t_symbol *s, long argc, t_atom *argv)
{
	t_max_cv_jit_unproject * x = (t_max_cv_jit_unproject *)max_jit_obex_new(max_cv_jit_unproject_class, ps_cv_jit_unproject);
	if (x) {
		t_jit_object * jitter_object = (t_jit_object*)jit_object_new(ps_cv_jit_unproject);
		if (jitter_object) {
			// Setup the default inlets and outlets
			max_jit_mop_setup_simple(x, jitter_object, argc, argv);

			// Add additional outlets
			x->rotation_outlet = cvjit::WrapperOutlet(x, "rotation", 4); // Max length = 4 (quaternion)
			x->translation_outlet = cvjit::WrapperOutlet(x, "translation", 3); // 3D vector

			// Process attribute arguments
			max_jit_attr_args(x, (short)argc, argv);
		}
		else {
			object_error((t_object*)x, "cv.jit.unproject: could not allocate object");
			object_free((t_object *)x);
		}
	}

	return x;
}