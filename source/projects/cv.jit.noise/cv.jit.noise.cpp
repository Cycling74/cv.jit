/*
cv.jit.noise
	

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

#include <chrono>
#include <random>
#include <vector>

#include "cvjit.h"
#include "ext_sysfile.h"
using namespace c74::max;

constexpr t_atom_long MAX_DIMS = 128;

static constexpr char const * distrubution_names[] = {
	"uniform",
	"normal"
};

static constexpr int distribution_count = sizeof(distrubution_names) / sizeof(distrubution_names[0]);

static t_symbol * distribution_syms[distribution_count];

typedef struct {
	t_object b_ob;  //The object
	void *m_out;  //Pointer to outlet

	t_atom_long m_seed;
	t_atom_long m_dims;

	std::vector<t_atom> m_values;
	std::vector<t_atom> m_mode;
	std::vector<t_atom_float> m_min;
	std::vector<t_atom_float> m_max;
	std::vector<t_atom_float> m_mean;
	std::vector<t_atom_float> m_stddev;
	
	std::vector<std::uniform_real_distribution<double> > m_uniform_distributions;
	std::vector<std::normal_distribution<double> > m_normal_distributions;

	std::mt19937 m_generator;
	
} t_cv_jit_noise;

//#define cv_jit_noise_PROXY_GETINLET(x) (proxy_getinlet? proxy_getinlet((t_object *)x) : x->b_id)


void cv_jit_noise_free(t_cv_jit_noise *x);
void *cv_jit_noise_new(t_symbol *s, short argc, t_atom *argv);
void cv_jit_noise_bang(t_cv_jit_noise *x);
void cv_jit_noise_assist(t_cv_jit_noise *x, void *b, long m, long a, char *s);

void cv_jit_noise_set_seed(t_cv_jit_noise *x, t_symbol *s, short argc, t_atom *argv);
void cv_jit_noise_set_dims(t_cv_jit_noise *x, t_symbol *s, short argc, t_atom *argv);

void cv_jit_noise_set_mode(t_cv_jit_noise *x, t_symbol *s, short argc, t_atom *argv);
void cv_jit_noise_set_min(t_cv_jit_noise *x, t_symbol *s, short argc, t_atom *argv);
void cv_jit_noise_set_max(t_cv_jit_noise *x, t_symbol *s, short argc, t_atom *argv);
void cv_jit_noise_set_mean(t_cv_jit_noise *x, t_symbol *s, short argc, t_atom *argv);
void cv_jit_noise_set_stddev(t_cv_jit_noise *x, t_symbol *s, short argc, t_atom *argv);

#define DEFINE_GETTER(attr) \
void cv_jit_noise_get_##attr(t_cv_jit_noise *x, t_symbol *s, short *argc, t_atom **argv) \
{\
	if (x) {\
		cvjit::attribute_get(x->m_##attr, argc, argv); \
	} \
}

DEFINE_GETTER(mode)
DEFINE_GETTER(min)
DEFINE_GETTER(max)
DEFINE_GETTER(mean)
DEFINE_GETTER(stddev)


static t_class * cv_jit_noise_class = nullptr;

#ifdef __cplusplus
extern "C"
#endif
void ext_main(void* unused)
{
#if defined(_DEBUG) || defined(DEBUG) 
	object_post(nullptr, "cv.jit.noise\nBuilt on %s at %s", __DATE__, __TIME__);
#endif

	// Generate symbols
	for (int i = 0; i < distribution_count; i++) {
		distribution_syms[i] = gensym(distrubution_names[i]);
	}

	// Create class
	cvjit::ClassGenerator generator("cv.jit.noise", cv_jit_noise_new, cv_jit_noise_free);
	cv_jit_noise_class = generator.get_ptr();

	generator.set_bang(cv_jit_noise_bang);
	generator.set_assist(cv_jit_noise_assist);

	// Attributes
	class_addattr(cv_jit_noise_class, attr_offset_array_new("mode", gensym("atom"), MAX_DIMS, 0, (method)cv_jit_noise_get_mode, (method)cv_jit_noise_set_mode, calcoffset(t_cv_jit_noise, m_dims), 0));
	class_addattr(cv_jit_noise_class, attr_offset_array_new("min", gensym("float64"), MAX_DIMS, 0, (method)cv_jit_noise_get_min, (method)cv_jit_noise_set_min, calcoffset(t_cv_jit_noise, m_dims), 0));
	class_addattr(cv_jit_noise_class, attr_offset_array_new("max", gensym("float64"), MAX_DIMS, 0, (method)cv_jit_noise_get_max, (method)cv_jit_noise_set_max, calcoffset(t_cv_jit_noise, m_dims), 0));
	class_addattr(cv_jit_noise_class, attr_offset_array_new("mean", gensym("float64"), MAX_DIMS, 0, (method)cv_jit_noise_get_mean, (method)cv_jit_noise_set_mean, calcoffset(t_cv_jit_noise, m_dims), 0));
	class_addattr(cv_jit_noise_class, attr_offset_array_new("stddev", gensym("float64"), MAX_DIMS, 0, (method)cv_jit_noise_get_stddev, (method)cv_jit_noise_set_stddev, calcoffset(t_cv_jit_noise, m_dims), 0));
	class_addattr(cv_jit_noise_class, attr_offset_new("seed", gensym("long"), 0, (method)nullptr, (method)cv_jit_noise_set_seed, calcoffset(t_cv_jit_noise, m_seed)));
	class_addattr(cv_jit_noise_class, attr_offset_new("dims", gensym("long"), 0, (method)nullptr, (method)cv_jit_noise_set_dims, calcoffset(t_cv_jit_noise, m_dims)));
}

void cv_jit_noise_bang(t_cv_jit_noise *x)
{	
	if (x) {
		for (int i = 0; i < x->m_dims; i++) {
			t_symbol * sym = atom_getsym(&x->m_mode[i]);
			if (sym == distribution_syms[0]) {
				// uniform
				atom_setfloat(&x->m_values[i], x->m_uniform_distributions[i](x->m_generator));
			}
			else if (sym == distribution_syms[1]) {
				// normal
				atom_setfloat(&x->m_values[i], x->m_normal_distributions[i](x->m_generator));
			}
		}
			
		outlet_list(x->m_out, nullptr, (short)x->m_dims, x->m_values.data());
	}
}

void cv_jit_noise_assist(t_cv_jit_noise *x, void *b, long m, long a, char *s)
{
	if (m == 1)
	{ 
		switch (a) 
		{ 
		case 0: 
			snprintf(s, 64, "(bang) Generate a new random number"); 
			break; 
		} 
	} else if (m == 2)
	{ 
		snprintf(s, 64, "(float) Random  number"); 
	} 
}

void cv_jit_noise_free(t_cv_jit_noise *x)
{
	// Nothing
}

template <typename T>
inline void resize_vec(std::vector<T> & vec, t_atom_long size) {
	t_atom_long s = (t_atom_long)vec.size();
	vec.resize(size);
	if (s && size > s) {
		T val = vec[s - 1];
		for (t_atom_long i = s; i < size; i++) {
			vec[i] = val;
		}
	}
}

inline void set_dims(t_cv_jit_noise * x, t_atom_long count) {
	if (x) {
		x->m_dims = std::clamp(count, (t_atom_long)1, MAX_DIMS);

		resize_vec(x->m_mode, x->m_dims);
		resize_vec(x->m_min, x->m_dims);
		resize_vec(x->m_max, x->m_dims);
		resize_vec(x->m_mean, x->m_dims);
		resize_vec(x->m_stddev, x->m_dims);
		x->m_values.resize(x->m_dims);

		x->m_normal_distributions.resize(x->m_dims);
		x->m_uniform_distributions.resize(x->m_dims);
	}
}

inline void set_seed(t_cv_jit_noise * x, t_atom_long s) {
	x->m_seed = s;
	x->m_generator.seed((unsigned int)x->m_seed);
}

inline void set_seed(t_cv_jit_noise * x) {
	set_seed(x, (t_atom_long)std::chrono::system_clock::now().time_since_epoch().count());
}

inline t_atom_long get_dims(t_atom * a) {
	return std::clamp(atom_getlong(a), (t_atom_long)1, MAX_DIMS);
}

void *cv_jit_noise_new(t_symbol *s, short argc, t_atom *argv)
{	
	// Create object
	t_cv_jit_noise * x = (t_cv_jit_noise *)object_alloc(cv_jit_noise_class);

	if (x) {
		// Create outlet
		x->m_out = outlet_new(x, "float");

		// Get the attribute start offset
		long args_offset = attr_args_offset(argc, argv);

		// Initialize values
		set_dims(x, args_offset > 0 ? get_dims(argv) : 1);

		t_atom_float a, b;
		a = args_offset > 1 ? atom_getfloat(argv + 1) : 0;
		b = args_offset > 2 ? atom_getfloat(argv + 2) : 1.0;

		const double min = std::min(a, b);
		const double max = std::max(a, b);
		std::fill(x->m_min.begin(), x->m_min.end(), min);
		std::fill(x->m_max.begin(), x->m_max.end(), max);

		std::fill(x->m_mean.begin(), x->m_mean.end(), a);
		std::fill(x->m_stddev.begin(), x->m_stddev.end(), b);

		std::fill(x->m_uniform_distributions.begin(), x->m_uniform_distributions.end(), std::uniform_real_distribution<double>(min, max));
		std::fill(x->m_normal_distributions.begin(), x->m_normal_distributions.end(), std::normal_distribution<double>(a, b));

		for (t_atom & a : x->m_mode) {
			atom_setsym(&a, distribution_syms[0]);
		}

		set_seed(x);

		// Process attributes
		attr_args_process(x, argc, argv);
	}
	
	return x;
}

void cv_jit_noise_set_seed(t_cv_jit_noise *x, t_symbol *s, short argc, t_atom *argv)
{
	if (x) {
		if (argc > 0 && argv[0].a_type == A_LONG) {
			t_atom_long val = atom_getlong(argv);
			x->m_seed = val;
		}
		else {
			x->m_seed = (t_atom_long)std::chrono::system_clock::now().time_since_epoch().count();
		}

		x->m_generator.seed((unsigned int)x->m_seed);
	}
}

void cv_jit_noise_set_dims(t_cv_jit_noise *x, t_symbol *s, short argc, t_atom *argv)
{
	if (x) {
		if (argc > 0 && argv[0].a_type == A_LONG) {
			set_dims(x, get_dims(argv));
		}
	}
}

void cv_jit_noise_set_mode(t_cv_jit_noise *x, t_symbol *s, short argc, t_atom *argv)
{
	if (x && argc > 0) {
		for (short i = 0; i < x->m_dims; i++) {
			short j = i < argc ? i : argc - 1;
			t_symbol * s = nullptr;

			if (argv[j].a_type == A_SYM) {
				t_symbol * sym = atom_getsym(argv);
				for (int k = 0; k < distribution_count; k++) {
					if (distribution_syms[k] == sym) {
						s = sym;
						break;
					}
				}
				if (!s) {
					object_error((t_object *)x, "\"%s\" is not a valid distribution.", sym->s_name);
				}
			}
			else {
				t_atom_long v = std::clamp(atom_getlong(argv + j), (t_atom_long)0, (t_atom_long)distribution_count - 1);
				s = distribution_syms[v];
			}

			if (s) {
				atom_setsym(&x->m_mode[i], s);
			}
		}
	}
}

void cv_jit_noise_set_min(t_cv_jit_noise *x, t_symbol *s, short argc, t_atom *argv)
{
	if (x && argc > 0) {
		for (short i = 0; i < x->m_dims; i++) {
			short j = i < argc ? i : argc - 1;
			x->m_min[i] = atom_getfloat(argv + j);
			x->m_uniform_distributions[i] = std::uniform_real_distribution<double>(x->m_min[i], x->m_max[i]);
		}
	}
}

void cv_jit_noise_set_max(t_cv_jit_noise *x, t_symbol *s, short argc, t_atom *argv)
{
	if (x && argc > 0) {
		for (short i = 0; i < x->m_dims; i++) {
			short j = i < argc ? i : argc - 1;
			x->m_max[i] = atom_getfloat(argv + j);
			x->m_uniform_distributions[i] = std::uniform_real_distribution<double>(x->m_min[i], x->m_max[i]);
		}
	}
}

void cv_jit_noise_set_mean(t_cv_jit_noise *x, t_symbol *s, short argc, t_atom *argv)
{
	if (x && argc > 0) {
		for (short i = 0; i < x->m_dims; i++) {
			short j = i < argc ? i : argc - 1;
			x->m_mean[i] = atom_getfloat(argv + j);
			x->m_normal_distributions[i] = std::normal_distribution<double>(x->m_mean[i], x->m_stddev[i]);
		}
	}
}

void cv_jit_noise_set_stddev(t_cv_jit_noise *x, t_symbol *s, short argc, t_atom *argv)
{
	if (x && argc > 0) {
		for (short i = 0; i < x->m_dims; i++) {
			short j = i < argc ? i : argc - 1;
			x->m_stddev[i] = atom_getfloat(argv + j);
			x->m_normal_distributions[i] = std::normal_distribution<double>(x->m_mean[i], x->m_stddev[i]);
		}
	}
}

