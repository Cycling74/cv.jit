/*
 max.cv.jit.shift
 
 
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


typedef struct _max_cv_jit_shift 
{
	t_object		ob;
	void			*obex;
	//outlets
	void			*boxout;
	void			*boxout2;
	void			*massout;
	
	t_atom			*av;
} t_max_cv_jit_shift;

//Function definitions
t_jit_err cv_jit_shift_init(void); 
void *max_cv_jit_shift_new(t_symbol *s, long argc, t_atom *argv);
void max_cv_jit_shift_free(t_max_cv_jit_shift *x);
void max_cv_jit_shift_bang(t_max_cv_jit_shift *x);
void max_cv_jit_shift_mproc(t_max_cv_jit_shift *x, void *mop);
void max_cv_jit_shift_assist(t_max_cv_jit_shift *x, void *b, long m, long a, char *s);

//Max object class
void *max_cv_jit_shift_class;

t_symbol *ps_getbox;
t_symbol *ps_getrot;
t_symbol *ps_getmass;

#ifdef __cplusplus
extern "C"
#endif
int main(void)
{	
	void *p,*q;
	
	union { void **v_ptr; t_messlist **m_ptr; } alias_ptr;
	alias_ptr.v_ptr = &max_cv_jit_shift_class;
	cv_jit_shift_init();
	setup(alias_ptr.m_ptr,	//A pointer to the Max class pointer
		  (method)max_cv_jit_shift_new,			//The constructor function
		  (method)max_cv_jit_shift_free,			//The destructor function
		  (short)sizeof(t_max_cv_jit_shift),		//The size of the Max class
		  0L,											//Use only for GUI objects, null for standard Jitter objects
		  A_GIMME,									//Pass arguments as a list of t_atoms
		  0);											//End of type list
	
	p = max_jit_classex_setup(calcoffset(t_max_cv_jit_shift,obex));	//Setup Max class
	q = jit_class_findbyname(gensym("cv_jit_shift"));				//Get a pointer to the Jitter object class
	max_jit_classex_mop_wrap(p,q,MAX_JIT_MOP_FLAGS_OWN_BANG|MAX_JIT_MOP_FLAGS_OWN_OUTPUTMATRIX); //custom bang/outputmatrix 		
    max_jit_classex_mop_mproc(p,q,(void *)max_cv_jit_shift_mproc); 	//custom matrix procedure
	max_jit_classex_standard_wrap(p,q,0); 	
 	addmess((method)max_cv_jit_shift_assist, "assist", A_CANT,0);	//Add outlet assistance to object
 	addbang((method)max_cv_jit_shift_bang);
	
	ps_getbox	= gensym("getbox");
	ps_getrot	= gensym("getvertices");
	ps_getmass	= gensym("getmass");
    
}

void max_cv_jit_shift_free(t_max_cv_jit_shift *x)
{
	if(x->av){
		sysmem_freeptr(x->av);
	}
	max_jit_mop_free(x);		//Free the matrix operator
	jit_object_free(max_jit_obex_jitob_get(x));	//Free the Jitter object
	max_jit_obex_free(x);		//Free the Max wrapper object
}

void *max_cv_jit_shift_new(t_symbol *s, long argc, t_atom *argv)
{
	t_max_cv_jit_shift *x;
	void *o;
	
	if (x=(t_max_cv_jit_shift *)max_jit_obex_new(max_cv_jit_shift_class,gensym("cv_jit_shift"))) {
		if (o=jit_object_new(gensym("cv_jit_shift"))) {
			max_jit_mop_setup_simple(x,o,argc,argv);			
			max_jit_attr_args(x,argc,argv);
			//Add outlet
			x->massout 	= outlet_new(x,0L);
			x->boxout2 	= outlet_new(x,0L);  
			x->boxout 	= outlet_new(x,0L);
			
			x->av = (t_atom *)sysmem_newptr(8*sizeof(t_atom));
		} else {
			error("cv.jit.shift: could not allocate object");
			freeobject((t_object *)x);
		}
	}
	return (x);
}

void max_cv_jit_shift_bang(t_max_cv_jit_shift *x)
{
	long ac;
	void *o;
	
	if (max_jit_mop_getoutputmode(x)) 
	{
		o=max_jit_obex_jitob_get(x);
		
		//Output mass
		ac = 8;
		jit_object_method(o,ps_getmass,&ac,&(x->av));
		//just in case...
		if (ac!=1)
			error("Could not get mass from Jitter object.");
		else 
		{
			outlet_float(x->massout,jit_atom_getfloat(x->av));
		}
		
		//Output rotated frame
		ac = 8;
		jit_object_method(o,ps_getrot,&ac,&(x->av));
		//just in case...
		if (ac!=8)
			error("Could not get rotated frame from Jitter object.");
		else 
		{
			outlet_anything(x->boxout2,_jit_sym_list,ac,x->av);
		}
		
		//Output bounding box
		ac = 8;
		jit_object_method(o,ps_getbox,&ac,&(x->av));
		//just in case...
		if (ac!=4)
			error("Could not get bounding rectangle from Jitter object.");
		else 
		{
			outlet_anything(x->boxout,_jit_sym_list,ac,x->av);
		}
	}
}

void max_cv_jit_shift_mproc(t_max_cv_jit_shift *x, void *mop)
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
		max_cv_jit_shift_bang(x);
	}
}

void max_cv_jit_shift_assist(t_max_cv_jit_shift *x, void *b, long m, long a, char *s)
{
	if (m == 1) { //input
		max_jit_mop_assist(x,b,m,a,s);
	} else { //output
		switch (a) {
			case 0:
				sprintf(s,"(list) New bounding box");
				break; 			
			case 1:
				sprintf(s,"(list) Vertices");
				break; 			
			case 2:
				sprintf(s,"(float) Mass");
				break; 	
			case 3:
				sprintf(s,"dumpout");
				break; 			
		}
	}
}
