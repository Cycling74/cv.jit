/*
 @file cv.jit.calibration
 
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

// Max object instance data
// Note: most instance data is in the Jitter object which we will wrap
typedef struct _max_cv_jit_calibration {
	t_object	ob;
	void		*obex;
} t_max_cv_jit_calibration;


// prototypes
BEGIN_USING_C_LINKAGE
t_jit_err	cv_jit_calibration_init(void);
void		*max_cv_jit_calibration_new(t_symbol *s, long argc, t_atom *argv);
void		max_cv_jit_calibration_free(t_max_cv_jit_calibration *x);
END_USING_C_LINKAGE

// globals
static void	*max_cv_jit_calibration_class = NULL;


/************************************************************************************/
#ifdef __cplusplus
extern "C"
#endif
void ext_main(void* unused)
{	
	void *p, *q;
	
	cv_jit_calibration_init();	
	setup((t_messlist**)&max_cv_jit_calibration_class, (method)max_cv_jit_calibration_new, (method)max_cv_jit_calibration_free, sizeof(t_max_cv_jit_calibration), 0, A_GIMME, 0);

	p = max_jit_classex_setup(calcoffset(t_max_cv_jit_calibration, obex));
	q = jit_class_findbyname(gensym("cv_jit_calibration"));    
    max_jit_classex_mop_wrap(p, q, 0);							// attrs & methods for name, type, dim, planecount, bang, outputmatrix, etc
    max_jit_classex_standard_wrap(p, q, 0);						// attrs & methods for getattributes, dumpout, maxjitclassaddmethods, etc
    addmess((method)max_jit_mop_assist, "assist", A_CANT, 0);	// standard matrix-operator (mop) assist fn
}


/************************************************************************************/
// Object Life Cycle

void *max_cv_jit_calibration_new(t_symbol *s, long argc, t_atom *argv)
{
	t_max_cv_jit_calibration	*x;
	void			*o;

	x = (t_max_cv_jit_calibration*)max_jit_obex_new(max_cv_jit_calibration_class, gensym("cv_jit_calibration"));
	if (x) {
		o = (t_jit_object*)jit_object_new(gensym("cv_jit_calibration"));
		if (o) {
			max_jit_mop_setup_simple(x, o, argc, argv);	
			
			/*
			// get patcher directory
			t_object *mypatcher;
			if (!object_obex_lookup(x, gensym("#P"), &mypatcher)){
				t_symbol *path;
				char dirpath[512], dirbootpath[512];
				int i ;
				
				path = object_attr_getsym(mypatcher, gensym("filepath"));
				printf("path : %s\n",path->s_name);
				strcpy(dirpath, path->s_name);
				
				for ( i = strlen(path->s_name) ; i > 0 ; i-- ) {
					if ( dirpath[i] == '/' ) {
						dirpath[i+1] = '\0';
						break;
					}
					//dirpath = strrchr(path->s_name,'/');
					
				}
				printf("dirpath : %s\n",dirpath);
				path_nameconform(dirpath, dirbootpath, PATH_STYLE_NATIVE, PATH_TYPE_BOOT);
				printf("dirbootpath : %s\n",dirbootpath);
					 
			}
			else {
				printf("no patcher defined\n");
			}
			*/
			max_jit_attr_args(x, argc, argv);

		} 
		else {
			object_error((t_object*)x, "cv.jit.calibration : could not allocate object");
			object_free((t_object*)x);
			x = NULL;
		}
	}
	return (x);
}


void max_cv_jit_calibration_free(t_max_cv_jit_calibration *x)
{
	max_jit_mop_free(x);
	jit_object_free(max_jit_obex_jitob_get(x));
	max_jit_obex_free(x);
}

