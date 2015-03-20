/*
max.cv.jit.moments
	

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

#ifdef __cplusplus
extern "C" {
#endif
#include "jit.common.h"
#include "max.jit.mop.h"
#ifdef __cplusplus 
} //extern "C"
#endif

typedef struct _max_cv_jit_moments 
{
	t_object			ob;
	void				*obex;
	//Outlet pointers
	void 				*momout;
	void 				*huout;
	void 				*centout;	
	void				*massout;
} t_max_cv_jit_moments;

t_jit_err cv_jit_moments_init(void); 

void *max_cv_jit_moments_new(t_symbol *s, long argc, t_atom *argv);
void max_cv_jit_moments_free(t_max_cv_jit_moments *x);
void max_cv_jit_moments_assist(t_max_cv_jit_moments *x, void *b, long m, long a, char *s);
void max_cv_jit_moments_mproc(t_max_cv_jit_moments *x, void *mop);

void *max_cv_jit_moments_class;

t_symbol *ps_getmoments,*ps_gethu,*ps_getcents,*ps_getmass;

#ifdef __cplusplus
extern "C"
#endif	
int main(void)
{	
	void *p,*q;
	
	union { void **v_ptr; t_messlist **m_ptr; } alias_ptr;
	alias_ptr.v_ptr = &max_cv_jit_moments_class;
	cv_jit_moments_init();
	setup(alias_ptr.m_ptr, (method)max_cv_jit_moments_new, (method)max_cv_jit_moments_free, (short)sizeof(t_max_cv_jit_moments), 
		0L, A_GIMME, 0);

	p = max_jit_classex_setup(calcoffset(t_max_cv_jit_moments,obex));
	q = jit_class_findbyname(gensym("cv_jit_moments"));    
    	max_jit_classex_mop_wrap(p,q,MAX_JIT_MOP_FLAGS_OWN_BANG|MAX_JIT_MOP_FLAGS_OWN_OUTPUTMATRIX); //custom bang/outputmatrix 		
    	max_jit_classex_mop_mproc(p,q,max_cv_jit_moments_mproc); 	//custom mproc
    	max_jit_classex_standard_wrap(p,q,0); 	
 	addmess((method)max_cv_jit_moments_assist, "assist", A_CANT,0);

	ps_getmoments = gensym("getmoments");
	ps_gethu = gensym("gethu");
	ps_getcents = gensym("getcentroids");
	ps_getmass = gensym("getmass");
	
	return 0;
}


void max_cv_jit_moments_mproc(t_max_cv_jit_moments *x, void *mop)
{
	t_jit_err err;
	long ac = 0;
	t_atom *av = NULL;
	void *o;
	
	//Get pointer to Jitter object
	o = max_jit_obex_jitob_get(x);
	if (err=(t_jit_err) jit_object_method(  //Call matrix_calc method
		o,
		_jit_sym_matrix_calc,
		jit_object_method(mop,_jit_sym_getinputlist),
		jit_object_method(mop,_jit_sym_getoutputlist))) 
	{
		jit_error_code(x,err); 
	} else {
		//Get mass and output
		jit_object_method(o,ps_getmass,&ac,&av);
		switch(ac) {
		case 1:
			outlet_float(x->massout,jit_atom_getfloat(av));
			break;
		default:		
			outlet_anything(x->massout,_jit_sym_list,ac,av);
			break;
		}
		if (av) jit_freebytes(av,(ac)*sizeof(t_atom));
		av=NULL; ac=0;
		
		//Get centroids and output
		jit_object_method(o,ps_getcents,&ac,&av);
		
		switch(ac) {
		case 1:
			outlet_float(x->centout,jit_atom_getfloat(av));
			break;
		default:		
			outlet_anything(x->centout,_jit_sym_list,ac,av);
			break;
		}
		if (av) jit_freebytes(av,(ac)*sizeof(t_atom));
		av=NULL; ac=0;
		
		//Get Hu invariants and output
		jit_object_method(o,ps_gethu,&ac,&av);
		switch(ac) {
		case 1:
			outlet_float(x->huout,jit_atom_getfloat(av));
			break;
		default:		
			outlet_anything(x->huout,_jit_sym_list,ac,av);
			break;
		}
		if (av) jit_freebytes(av,(ac)*sizeof(t_atom));
		av=NULL; ac=0;
		
		//Get moments and output
		jit_object_method(o,ps_getmoments,&ac,&av);
		switch(ac) {
		case 1:
			outlet_float(x->momout,jit_atom_getfloat(av));
			break;
		default:		
			outlet_anything(x->momout,_jit_sym_list,ac,av);
			break;
		}
		if (av) jit_freebytes(av,(ac)*sizeof(t_atom));
		av=NULL; ac=0;
	}
}

void max_cv_jit_moments_assist(t_max_cv_jit_moments *x, void *b, long m, long a, char *s)
{
	if (m == 1) { //input
		max_jit_mop_assist(x,b,m,a,s);
	} else { //output
		switch (a) {
		case 0:
			sprintf(s,"(list) Moments");
			break; 			
		case 1:
			sprintf(s,"(list) Hu invariants");
			break; 			
		case 2:
			sprintf(s,"(list) Centroids");
			break; 	
		case 3:
			sprintf(s,"(list) Mass");
			break; 		
		case 4:
			sprintf(s,"dumpout");
			break; 			
		}
	}
}

void max_cv_jit_moments_free(t_max_cv_jit_moments *x)
{
	max_jit_mop_free(x);
	jit_object_free(max_jit_obex_jitob_get(x));
	max_jit_obex_free(x);
}

void *max_cv_jit_moments_new(t_symbol *s, long argc, t_atom *argv)
{
	t_max_cv_jit_moments *x;
	void *o;

	if (x=(t_max_cv_jit_moments *)max_jit_obex_new(max_cv_jit_moments_class,gensym("cv_jit_moments"))) {
		if (o=jit_object_new(gensym("cv_jit_moments"))) {
			max_jit_mop_setup_simple(x,o,argc,argv);			
			//add additional non-matrix outputs
			x->massout 	= outlet_new(x,0L);	
			x->centout 	= outlet_new(x,0L); 
			x->huout 	= outlet_new(x,0L);
			x->momout = outlet_new(x,0L);
			max_jit_attr_args(x,argc,argv);
		} else {
			error("cv.jit.moments: could not allocate object");
			freeobject((t_object *)x);
		}
	}
	return (x);
}
