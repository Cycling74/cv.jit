#ifndef _JIT_CUBICSPLINE_H_
#define _JIT_CUBICSPLINE_H_

/*
 * Copyright 2001-2005 - Cycling '74
 * Derek Gerstmann - derek@cycling74.com
 *
 * Cubic spline evaluation and utility methods
 *
 */

// --------------------------------------------------------------------------

#ifdef __cplusplus
extern "C" {
#endif

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(push, 2)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack(2)
#endif

typedef	long t_jit_cubicspline_basismatrix_fixed[4][4];
typedef	float t_jit_cubicspline_basismatrix_float32[4][4];
typedef	double t_jit_cubicspline_basismatrix_float64[4][4];

// --------------------------------------------------------------------------

extern t_symbol *ps_jit_cubicspline_basisname_bezier;
extern t_symbol *ps_jit_cubicspline_basisname_bspline;
extern t_symbol *ps_jit_cubicspline_basisname_catmullrom;
extern t_symbol *ps_jit_cubicspline_basisname_hermite;
extern t_symbol *ps_jit_cubicspline_basisname_power;


// --------------------------------------------------------------------------

t_jit_err jit_cubicspline_fillbasis_fixed(
	t_symbol *name, t_jit_cubicspline_basismatrix_fixed *matrix, 
	long *stepcount);

t_jit_err jit_cubicspline_fillbasis_float32(
	t_symbol *name, t_jit_cubicspline_basismatrix_float32 *matrix, 
	long *stepcount);

t_jit_err jit_cubicspline_fillbasis_float64(
	t_symbol *name, t_jit_cubicspline_basismatrix_float64 *matrix, 
	long *stepcount);

long jit_cubicspline_general_eval_fixed(
	long val, long stepcount, long knotcount, long *knots, 
	t_jit_cubicspline_basismatrix_fixed matrix);

float jit_cubicspline_general_eval_float32(
	float val, long stepcount, long knotcount, float *knots, 
	t_jit_cubicspline_basismatrix_float32 matrix);

double jit_cubicspline_general_eval_float64(
	double val, long stepcount, long knotcount, double *knots, 
	t_jit_cubicspline_basismatrix_float64 matrix);

// --------------------------------------------------------------------------


#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(pop)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack()
#endif

#ifdef __cplusplus
}
#endif

#endif