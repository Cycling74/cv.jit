/*
max.cv.jit.erode
	

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

#include "c74_jitter.h"

using namespace c74::max;

typedef struct _max_cv_jit_erode 
{
	t_object		ob;
	void			*obex;
} t_max_cv_jit_erode;

t_jit_err cv_jit_erode_init(void); 

void *max_cv_jit_erode_new(t_symbol *s, long argc, t_atom *argv);
void max_cv_jit_erode_free(t_max_cv_jit_erode *x);

void *max_cv_jit_erode_class;
		 	
#ifdef __cplusplus
extern "C"
#endif
void ext_main(void* unused)
{	
	void *p,*q;
	
	union { void **v_ptr; t_messlist **m_ptr; } alias_ptr;
	alias_ptr.v_ptr = &max_cv_jit_erode_class;
	cv_jit_erode_init();
	setup(alias_ptr.m_ptr,	//A pointer to the Max class pointer
			(method)max_cv_jit_erode_new,				//The constructor function
			(method)max_cv_jit_erode_free,			//The destructor function
			(short)sizeof(t_max_cv_jit_erode),		//The size of the Max class
			0L,											//Use only for GUI objects, null for standard Jitter objects
			A_GIMME,									//Pass arguments as a list of t_atoms
			0);											//End of type list

	p = max_jit_classex_setup(calcoffset(t_max_cv_jit_erode,obex));	//Setup Max class
	q = jit_class_findbyname(gensym("cv_jit_erode"));				//Get a pointer to the Jitter object class
    max_jit_classex_mop_wrap(p,q,0); 		//Add default methods and attributes to Max MOP wrapper class
    max_jit_classex_standard_wrap(p,q,0); 	//Add standard Jitter methods

    addmess((method)max_jit_mop_assist, "assist", A_CANT,0);	//Add outlet assistance to object

	return;
}

void max_cv_jit_erode_free(t_max_cv_jit_erode *x)
{
	max_jit_mop_free(x);		//Free the matrix operator
	jit_object_free(max_jit_obex_jitob_get(x));	//Free the Jitter object
	max_jit_obex_free(x);		//Free the Max wrapper object
}

void *max_cv_jit_erode_new(t_symbol *s, long argc, t_atom *argv)
{
	t_max_cv_jit_erode *x;
	void *o;

	if ((x=(t_max_cv_jit_erode *)max_jit_obex_new(max_cv_jit_erode_class,gensym("cv_jit_erode")))) {  //Create a new instance of Jitter object class
		if ((o= (t_jit_object*)jit_object_new(gensym("cv_jit_erode")))) { //Create a new erode object
			max_jit_mop_setup_simple(x,o,argc,argv);  //Matrix operator setup
			max_jit_attr_args(x,argc,argv); //Arguments and attributes
		} else {
			object_error((t_object*)x, "cv.jit.erode: could not allocate object");
			object_free((t_object *)x);
		}
	}
	return (x);
}
