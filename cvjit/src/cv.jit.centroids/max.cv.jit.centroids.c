/*
max.cv.jit.centroids
	

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

typedef struct _max_cv_jit_centroids 
{
	t_object			ob;
	void				*obex;
	void 				*centroidsout;
	void 				*massout;
	t_atom				*av;
} t_max_cv_jit_centroids;

t_jit_err cv_jit_centroids_init(void); 

void *max_cv_jit_centroids_new(t_symbol *s, long argc, t_atom *argv);
void max_cv_jit_centroids_free(t_max_cv_jit_centroids *x);
void max_cv_jit_centroids_assist(t_max_cv_jit_centroids *x, void *b, long m, long a, char *s);
void max_cv_jit_centroids_bang(t_max_cv_jit_centroids *x);
void max_cv_jit_centroids_mproc(t_max_cv_jit_centroids *x, void *mop);
void *max_cv_jit_centroids_class;

t_symbol *ps_getmin,*ps_getcentroids,*ps_getmax,*ps_getmass;
		 
#ifdef __cplusplus
extern "C"
#endif
int main(void)
{	
	void *p,*q;
	
	union { void **v_ptr; t_messlist **m_ptr; } alias_ptr;
	alias_ptr.v_ptr = &max_cv_jit_centroids_class;
	cv_jit_centroids_init();
	setup(alias_ptr.m_ptr, (method)max_cv_jit_centroids_new, (method)max_cv_jit_centroids_free, (short)sizeof(t_max_cv_jit_centroids), 
		0L, A_GIMME, 0);

	p = max_jit_classex_setup(calcoffset(t_max_cv_jit_centroids,obex));
	q = jit_class_findbyname(gensym("cv_jit_centroids"));    
    max_jit_classex_mop_wrap(p,q,MAX_JIT_MOP_FLAGS_OWN_BANG|MAX_JIT_MOP_FLAGS_OWN_OUTPUTMATRIX); //custom bang/outputmatrix 		
    max_jit_classex_mop_mproc(p,q,max_cv_jit_centroids_mproc); 	//custom mproc
    max_jit_classex_standard_wrap(p,q,0); 	
 	addmess((method)max_cv_jit_centroids_assist,			"assist",			A_CANT,0);
 	addbang((method)max_cv_jit_centroids_bang);

	ps_getcentroids	= gensym("getcentroids");
	ps_getmass = gensym("getmass");
	
	return 1;
}

void max_cv_jit_centroids_bang(t_max_cv_jit_centroids *x)
{
	long ac;
	void *o;
	
	if (max_jit_mop_getoutputmode(x)&&x->av) 
	{
		o=max_jit_obex_jitob_get(x);
		//passing in memory to attr function. be sure object knows how to handle this
		
		ac=JIT_MATRIX_MAX_PLANECOUNT;
		jit_object_method(o,ps_getmass,&ac,&(x->av));
		
		if (ac>1)
			outlet_anything(x->massout,_jit_sym_list,ac,x->av);
		else 
		{
			if (x->av->a_type==A_FLOAT)
				outlet_float(x->massout,jit_atom_getfloat(x->av));
			else 
				outlet_int(x->massout,jit_atom_getlong(x->av));
		}
		
		ac=JIT_MATRIX_MAX_PLANECOUNT;
		jit_object_method(o,ps_getcentroids,&ac,&(x->av));
		
		if (ac>1)
			outlet_anything(x->centroidsout,_jit_sym_list,ac,x->av);
		else 
		{
			if (x->av->a_type==A_FLOAT)
				outlet_float(x->centroidsout,jit_atom_getfloat(x->av));
			else 
				outlet_int(x->centroidsout,jit_atom_getlong(x->av));
		}
	}
}

void max_cv_jit_centroids_mproc(t_max_cv_jit_centroids *x, void *mop)
{
	t_jit_err err;
	
	if (err=(t_jit_err) jit_object_method(
		max_jit_obex_jitob_get(x),
		_jit_sym_matrix_calc,
		jit_object_method(mop,_jit_sym_getinputlist),
		jit_object_method(mop,_jit_sym_getoutputlist))) 
	{
		jit_error_code(x,err); 
	} else {
		max_cv_jit_centroids_bang(x);
	}
}

void max_cv_jit_centroids_assist(t_max_cv_jit_centroids *x, void *b, long m, long a, char *s)
{
	if (m == 1) { //input
		max_jit_mop_assist(x,b,m,a,s);
	} else { //output
		switch (a) {
		case 0:
			sprintf(s,"(list) centroids");
			break; 	
		case 1:
			sprintf(s,"(list) mass");
			break; 		
		case 2:
			sprintf(s,"dumpout");
			break; 			
		}
	}
}

void max_cv_jit_centroids_free(t_max_cv_jit_centroids *x)
{
	max_jit_mop_free(x);
	jit_object_free(max_jit_obex_jitob_get(x));
	if (x->av)
		jit_freebytes(x->av,sizeof(t_atom)*JIT_MATRIX_MAX_PLANECOUNT);
	max_jit_obex_free(x);
}

void *max_cv_jit_centroids_new(t_symbol *s, long argc, t_atom *argv)
{
	t_max_cv_jit_centroids *x;
	void *o;

	if (x=(t_max_cv_jit_centroids *)max_jit_obex_new(max_cv_jit_centroids_class,gensym("cv_jit_centroids"))) {
		if (o=jit_object_new(gensym("cv_jit_centroids"))) {
			max_jit_mop_setup_simple(x,o,argc,argv);			
			//add additional non-matrix outputs
			x->massout 	= outlet_new(x,0L); 
			x->centroidsout 	= outlet_new(x,0L); 
			x->av		= jit_getbytes(sizeof(t_atom)*JIT_MATRIX_MAX_PLANECOUNT);
			max_jit_attr_args(x,argc,argv);
		} else {
			error("cv.jit.centroids: could not allocate object");
			freeobject((t_object *)x);
		}
	}
	return (x);
}