/*
 @file cv.jit.perspective
 
 @ingroup cv.jit
 
 Copyright 2010 - Antoine Villeret
 antoine.villeret@gmail.com
 */

/*
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

#include "c74_jitter.h"
using namespace c74::max;


// Max object instance data
// Note: most instance data is in the Jitter object which we will wrap
typedef struct _max_cv_jit_perspective {
	t_object	ob;
	void		*obex;
} t_max_cv_jit_perspective;


// prototypes
BEGIN_USING_C_LINKAGE
t_jit_err	cv_jit_perspective_init(void);
void		*max_cv_jit_perspective_new(t_symbol *s, long argc, t_atom *argv);
void		max_cv_jit_perspective_free(t_max_cv_jit_perspective *x);
END_USING_C_LINKAGE

// globals
static void	*max_cv_jit_perspective_class = NULL;


/************************************************************************************/
#ifdef __cplusplus
extern "C"
#endif
void ext_main(void* unused)
{	
	void *p, *q;
	
	cv_jit_perspective_init();	
	setup((t_messlist**)&max_cv_jit_perspective_class, (method)max_cv_jit_perspective_new, (method)max_cv_jit_perspective_free, sizeof(t_max_cv_jit_perspective), 0, A_GIMME, 0);
	
	p = max_jit_classex_setup(calcoffset(t_max_cv_jit_perspective, obex));
	q = jit_class_findbyname(gensym("cv_jit_perspective"));    
    max_jit_classex_mop_wrap(p, q, 0);							// attrs & methods for name, type, dim, planecount, bang, outputmatrix, etc
    max_jit_classex_standard_wrap(p, q, 0);						// attrs & methods for getattributes, dumpout, maxjitclassaddmethods, etc
    addmess((method)max_jit_mop_assist, "assist", A_CANT, 0);	// standard matrix-operator (mop) assist fn
}


/************************************************************************************/
// Object Life Cycle

void *max_cv_jit_perspective_new(t_symbol *s, long argc, t_atom *argv)
{
	t_max_cv_jit_perspective	*x;
	void			*o,*m;
	t_jit_matrix_info info;
	long in_savelock;
	char *bip;
	float *ip;
	int i,j;
	
	x = (t_max_cv_jit_perspective*)max_jit_obex_new(max_cv_jit_perspective_class, gensym("cv_jit_perspective"));
	if (x) {
		o = (t_jit_object*)jit_object_new(gensym("cv_jit_perspective"));
		if (o) {
			max_jit_mop_setup_simple(x, o, argc, argv);	
			
		
			// 1-plane float32 3x3 input on 2nd inlet
			m = max_jit_mop_getinput(x,2);
			jit_object_method(m,_jit_sym_getinfo,&info);			
			info.type 		= _jit_sym_float32;
			info.planecount = 1;
			info.dimcount 	= 2;
			info.dim[0] 	= 3;
			info.dim[1] 	= 3;
			info.dimstride[0] = sizeof(float);
			jit_object_method(m,_jit_sym_setinfo,&info);
						

			// make identity as a default transformation matrix
			jit_object_method(m,_jit_sym_getinfo,&info);
			in_savelock = (long) jit_object_method(m, _jit_sym_lock, 1);
			jit_object_method(m,_jit_sym_getdata,&bip);
			for ( j = 0 ; j < 3 ; j++){
				for ( i = 0 ; i < 3 ; i++){
					ip = (float *)bip + i + j*4;
					if ( i == j ) * ip=1.;
					else *ip = 0.;
				}
			}
			jit_object_method(m,_jit_sym_lock,in_savelock);
			
			max_jit_attr_args(x, argc, argv);
		} 
		else {
			object_error((t_object*)x, "cv.jit.perspective : could not allocate object");
			object_free(x);
			x = NULL;
		}
	}
	return (x);
}


void max_cv_jit_perspective_free(t_max_cv_jit_perspective *x)
{
	max_jit_mop_free(x);
	jit_object_free(max_jit_obex_jitob_get(x));
	max_jit_obex_free(x);
}

