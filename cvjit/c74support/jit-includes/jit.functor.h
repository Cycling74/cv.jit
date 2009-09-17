/* 
	jit.functor.h

	Copyright 2001-2005 - Cycling '74
	Joshua Kit Clayton jkc@cycling74.com
		
*/

#ifndef _JIT_FUNCTOR_H_
#define _JIT_FUNCTOR_H_

#include "jit.fixmath.h"

#ifdef __cplusplus
extern "C" {
#endif

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(push, 2)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack(2)
#endif

typedef long(*(t_jit_functor_fixed_sig))(void *, long, long *);
typedef float(*(t_jit_functor_float32_sig))(void *, long, float *);
typedef double(*(t_jit_functor_float64_sig))(void *, long, double *);

typedef long(*(t_jit_functor_fixed_scalar_sig))(void *, long);
typedef float(*(t_jit_functor_float32_scalar_sig))(void *, float);
typedef double(*(t_jit_functor_float64_scalar_sig))(void *, double);

typedef struct _jit_functor_interface 
{
	t_jit_functor_fixed_sig		evalfixed;
	t_jit_functor_fixed_sig		evalfixed_1d;
	t_jit_functor_fixed_sig		evalfixed_2d;
	t_jit_functor_fixed_sig		evalfixed_3d;

	t_jit_functor_float32_sig	evalfloat32;
	t_jit_functor_float32_sig	evalfloat32_1d;
	t_jit_functor_float32_sig	evalfloat32_2d;
	t_jit_functor_float32_sig	evalfloat32_3d;

	t_jit_functor_float64_sig	evalfloat64;
	t_jit_functor_float64_sig	evalfloat64_1d;
	t_jit_functor_float64_sig	evalfloat64_2d;
	t_jit_functor_float64_sig	evalfloat64_3d;
	
} t_jit_functor_interface;

typedef struct _jit_functor_wrapper
{
	t_jit_object					*ob;		// functor object
	t_jit_functor_interface			*fm;		// functor methods

} t_jit_functor_wrapper;

// combined scalar value
typedef struct _jit_functor_combined_value
{
	long fixed;
	float float32;
	double float64;

} t_jit_functor_combined_value;

#define JIT_FUNCTOR_COMBINED_VALUE_SETALL(x,v) \
	(x).float64 = (double)(v);\
	(x).float32 = (float)(v);\
	(x).fixed = DoubleToFixed((double)(v))

// combined dimensional value
typedef struct _jit_functor_combined_dimvalue
{
	long fixed[JIT_MATRIX_MAX_DIMCOUNT];
	float float32[JIT_MATRIX_MAX_DIMCOUNT];
	double float64[JIT_MATRIX_MAX_DIMCOUNT];
	long dimcount;

} t_jit_functor_combined_dimvalue;

#define JIT_FUNCTOR_COMBINED_ARRAY_SETALL(i,x,v) \
	(x).float64[i] = (double)(v);\
	(x).float32[i] = (float)(v);\
	(x).fixed[i] = DoubleToFixed((double)(v))

// combined dynamic array
typedef struct _jit_functor_combined_dynarray
{
	long *fixed;
	float *float32;
	double *float64;
	long count;

} t_jit_functor_combined_dynarray;


t_jit_err jit_functor_setup_class(t_class *c, char *categoryname, char *classname);
t_jit_err jit_functor_addcategory(t_class *c, t_symbol *categoryname);
t_jit_object *jit_functor_getcategorylist(t_class *c);
t_jit_object *jit_functor_classlist_in_category(t_symbol *categoryname);
t_class *jit_functor_lookup_relaxed(t_symbol *categoryname, t_symbol *classname);
t_class *jit_functor_lookup(t_symbol *categoryname, t_symbol *classname);
t_jit_err jit_functor_new_object_with_interface(t_jit_object **ob, t_jit_functor_interface **fi, t_symbol *category, t_symbol *name);
t_jit_err jit_functor_wrapper_init(t_jit_functor_wrapper *e, t_symbol *category, t_symbol *name);
t_jit_err jit_functor_setattr(t_jit_object *x, t_symbol *s, long ac, t_atom *av);

// utility functions
long jit_functor_eval_fixed_with_float32(t_jit_object *x, long dimcount, long *vals, t_jit_functor_float32_sig fp);
long jit_functor_eval_fixed_with_float64(t_jit_object *x, long dimcount, long *vals, t_jit_functor_float64_sig fp);
float jit_functor_eval_float32_with_fixed(t_jit_object *x, long dimcount, float *vals, t_jit_functor_fixed_sig fp);
float jit_functor_eval_float32_with_float64(t_jit_object *x, long dimcount, float *vals, t_jit_functor_float64_sig fp);
double jit_functor_eval_float64_with_fixed(t_jit_object *x, long dimcount, double *vals, t_jit_functor_fixed_sig fp);
double jit_functor_eval_float64_with_float32(t_jit_object *x, long dimcount, double *vals, t_jit_functor_float32_sig fp);

long jit_functor_eval_fixed_with_scalar_product(t_jit_object *x, long dimcount, long *vals, t_jit_functor_fixed_scalar_sig fp);
float jit_functor_eval_float32_with_scalar_product(t_jit_object *x, long dimcount, float *vals, t_jit_functor_float32_scalar_sig fp);
double jit_functor_eval_float64_with_scalar_product(t_jit_object *x, long dimcount, double *vals, t_jit_functor_float64_scalar_sig fp);
long jit_functor_eval_fixed_with_scalar_sum(t_jit_object *x, long dimcount, long *vals, t_jit_functor_fixed_scalar_sig fp);
float jit_functor_eval_float32_with_scalar_sum(t_jit_object *x, long dimcount, float *vals, t_jit_functor_float32_scalar_sig fp);
double jit_functor_eval_float64_with_scalar_sum(t_jit_object *x, long dimcount, double *vals, t_jit_functor_float64_scalar_sig fp);

long jit_functor_eval_fixed_with_lut_wrap_product(t_jit_object *x, long dimcount, long *vals, long *fixlut);
long jit_functor_eval_fixed_with_lut_wrap_sum(t_jit_object *x, long dimcount, long *vals, long *fixlut);
long jit_functor_eval_fixed_with_lut_clip_product(t_jit_object *x, long dimcount, long *vals, long *fixlut);
long jit_functor_eval_fixed_with_lut_clip_sum(t_jit_object *x, long dimcount, long *vals, long *fixlut);

// dynamic array utility functions
t_jit_err jit_functor_combined_dynarray_init(t_jit_functor_combined_dynarray *x, long count);
t_jit_err jit_functor_combined_dynarray_destroy(t_jit_functor_combined_dynarray *x);

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(pop)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack()
#endif

#ifdef __cplusplus
}
#endif

#endif //_JIT_FUNCTOR_H_

