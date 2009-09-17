
#ifndef __OBEX_H__
#define __OBEX_H__

#ifdef __cplusplus
	extern "C" {
#endif // __cplusplus

#ifndef TRUE
#define TRUE 	1
#endif
#ifndef FALSE
#define FALSE 	0
#endif

#define CLASS_BOX				gensym("box")
#define CLASS_NOBOX				gensym("nobox")

#define ATTR_GET_OPAQUE			0x00000001
#define ATTR_SET_OPAQUE			0x00000002
#define ATTR_GET_OPAQUE_USER	0x00000100
#define ATTR_SET_OPAQUE_USER	0x00000200
#define ATTR_GET_DEFER			0x00010000
#define ATTR_GET_USURP			0x00020000
#define ATTR_GET_DEFER_LOW		0x00040000
#define ATTR_GET_USURP_LOW		0x00080000
#define ATTR_SET_DEFER			0x01000000
#define ATTR_SET_USURP			0x02000000
#define ATTR_SET_DEFER_LOW		0x04000000
#define ATTR_SET_USURP_LOW		0x08000000

//TODO: OBEX move these to a more relevant place(or forget about if we're not going to use for obex)
#define A_DEFER			0x41
#define A_USURP			0x42
#define A_DEFER_LOW		0x43
#define A_USURP_LOW		0x44


//TODO: OBEX do we want to establish a standard set of err codes?
#define MAX_ERR_NONE			0
#define MAX_ERR_GENERIC			-1
#define MAX_ERR_INVALID_PTR		-2
#define MAX_ERR_DUPLICATE		-3
#define MAX_ERR_OUT_OF_MEM		-4

#ifndef calcoffset //find better place for this?
#define calcoffset(x,y) ((long)(&(((x *)0L)->y)))
#endif

#ifndef __JIT_COMMON_H__
// sometimes jit.common.h is included before this file, causing a GCC redefinition error
typedef unsigned long 	ulong;
typedef unsigned char 	uchar;
typedef unsigned int 	uint;
typedef unsigned short 	ushort;
#endif

typedef long t_max_err;

#include "commonsyms.h"
#include "ext_linklist.h"
#include "ext_hashtab.h"

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(push, 2)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack(2)
#endif

//for passing on the stack in method calls
/*
typedef struct _stack_splat
{
	char b[64];
} t_stack_splat;
*/

//common attr struct
typedef struct _attr
{
	t_object		ob;
	t_symbol		*name;
	t_symbol		*type;	
	long			flags;  		//public/private get/set methods
	method			get;    		//override default get method
	method			set;    		//override default set method
	void			*filterget;		//filterobject for get method
	void			*filterset; 	//filterobject for set method
	void			*reserved;		//for future use
} t_attr;		

long method_true(void *x);
long method_false(void *x);

t_class *class_new(char *name, method mnew, method mfree, long size, method mmenu, short type, ...);
t_max_err class_free(t_class *x);
t_max_err class_register(t_symbol *name_space,t_class *x);
t_max_err class_addmethod(t_class *x, method m, char *name, ...);
t_max_err class_addattr(t_class *x,t_object *attr);
t_max_err class_addadornment(t_class *x,t_object *o);
void *class_adornment_get(t_class *x,t_symbol *classname);
t_symbol *class_nameget(t_class *x);
t_class *class_findbyname(t_symbol *name_space, t_symbol *classname);
long object_classname_compare(void *x, t_symbol *name);
method class_method(t_class *x, t_symbol *methodname);
t_messlist *class_mess(t_class *x, t_symbol *methodname);
method class_attr_method(t_class *x, t_symbol *methodname, void **attr, long *get);
void *class_attr_get(t_class *x, t_symbol *attrname);
t_max_err class_extra_store(t_class *x,t_symbol *s,t_object *o);
void *class_extra_lookup(t_class *x,t_symbol *s);
t_max_err class_addtypedwrapper(t_class *x, method m, char *name, ...);
t_messlist *class_typedwrapper_get(t_class *x, t_symbol *s);

void *object_alloc(t_class *c);
void *object_new(t_symbol *name_space, t_symbol *classname, ...);
void *object_new_typed(t_symbol *name_space, t_symbol *classname, long ac, t_atom *av);
t_max_err object_free(void *x);
void *object_method(void *x, t_symbol *s, ...);
t_max_err object_method_typed(void *x, t_symbol *s, long ac, t_atom *av, t_atom *rv);
t_max_err object_method_typedfun(void *x, t_messlist *mp, t_symbol *s, long ac, t_atom *av, t_atom *rv);
method object_getmethod(void *x, t_symbol *s);
t_symbol *object_classname(void *x);
void *object_register(t_symbol *name_space, t_symbol *s, void *x);
void *object_findregistered(t_symbol *name_space, t_symbol *s);
t_max_err object_findregisteredbyptr(t_symbol **name_space, t_symbol **s, void *x);
void *object_attach(t_symbol *name_space, t_symbol *s, void *x);
t_max_err object_detach(t_symbol *name_space, t_symbol *s, void *x);
t_max_err object_unregister(void *x);
t_max_err object_notify(void *x, t_symbol *s, void *data);
t_class *object_class(void *x);
t_max_err object_getvalueof(void *x, long *ac, t_atom **av);
t_max_err object_setvalueof(void *x, long ac, t_atom *av);

void *object_attr_get(void *x, t_symbol *attrname);
method object_attr_method(void *x, t_symbol *methodname, void **attr, long *get);
long object_attr_usercanset(void *x,t_symbol *s);
long object_attr_usercanget(void *x,t_symbol *s);
void object_attr_getdump(void *x, t_symbol *s, long argc, t_atom *argv);
t_max_err object_attr_getvalueof(void *x, t_symbol *s, long *argc, t_atom **argv);
t_max_err object_attr_setvalueof(void *x, t_symbol *s, long argc, t_atom *argv);

//object specific attributes(dynamically add/delete)
t_max_err object_addattr(void *x,t_object *attr);
t_max_err object_deleteattr(void *x,t_symbol *attrsym);
t_max_err object_chuckattr(void *x,t_symbol *attrsym);

// obex
void class_obexoffset_set(t_class *c, long offset);
long class_obexoffset_get(t_class *c);
t_max_err object_obex_lookup(void *x, t_symbol *key, t_object **val);
t_max_err object_obex_store(void *x,t_symbol *key, t_object *val);
t_max_err object_obex_set(void *x, t_hashtab *obex);
t_hashtab *object_obex_get(void *x);
void object_obex_dumpout(void *x, t_symbol *s, long argc, t_atom *argv);
void object_obex_free(void *x);


//atom functions 
t_max_err atom_setlong(t_atom *a, long b);
t_max_err atom_setfloat(t_atom *a, double b);
t_max_err atom_setsym(t_atom *a, t_symbol *b);				
t_max_err atom_setobj(t_atom *a, void *b);
long atom_getlong(t_atom *a);
float atom_getfloat(t_atom *a);
t_symbol *atom_getsym(t_atom *a);
void *atom_getobj(t_atom *a);
long atom_getcharfix(t_atom *a);
//the following are useful for setting the values _only_ if there is an arg
//rather than setting it to 0 or _sym_nothing
t_max_err atom_arg_getlong(long *c, long idx, long ac, t_atom *av);
t_max_err atom_arg_getfloat(float *c, long idx, long ac, t_atom *av);
t_max_err atom_arg_getdouble(double *c, long idx, long ac, t_atom *av);
t_max_err atom_arg_getsym(t_symbol **c, long idx, long ac, t_atom *av);


//attr functions
//TODO: OBEX investigate further...not yet implemented
long attr_args_offset(short ac, t_atom *av);
void attr_args_process(void *x, short ac, t_atom *av);

//constructors
t_object *attribute_new(char *name, t_symbol *type, long flags, method mget, method mset);
t_object *attr_offset_new(char *name, t_symbol *type, long flags, method mget, method mset, long offset);
t_object *attr_offset_array_new(char *name, t_symbol *type, long size, long flags, method mget, method mset, long offsetcount, long offset);

t_object *attr_filter_clip_new(void);
t_object *attr_filter_proc_new(method proc);

//for easy access of simple attributes
long object_attr_getlong(void *x, t_symbol *s);
t_max_err object_attr_setlong(void *x, t_symbol *s, long c);
float object_attr_getfloat(void *x, t_symbol *s);
t_max_err object_attr_setfloat(void *x, t_symbol *s, float c);
t_symbol *object_attr_getsym(void *x, t_symbol *s);
t_max_err object_attr_setsym(void *x, t_symbol *s, t_symbol *c);
long object_attr_getlong_array(void *x, t_symbol *s, long max, long *vals);
t_max_err object_attr_setlong_array(void *x, t_symbol *s, long count, long *vals);
long object_attr_getchar_array(void *x, t_symbol *s, long max, uchar *vals);
t_max_err object_attr_setchar_array(void *x, t_symbol *s, long count, uchar *vals);
long object_attr_getfloat_array(void *x, t_symbol *s, long max, float *vals);
t_max_err object_attr_setfloat_array(void *x, t_symbol *s, long count, float *vals);
long object_attr_getdouble_array(void *x, t_symbol *s, long max, double *vals);
t_max_err object_attr_setdouble_array(void *x, t_symbol *s, long count, double *vals);
long object_attr_getsym_array(void *x, t_symbol *s, long max, t_symbol **vals);
t_max_err object_attr_setsym_array(void *x, t_symbol *s, long count, t_symbol **vals);

//attr filters util
t_max_err attr_addfilterset_clip(void *x, double min, double max, long usemin, long usemax);
t_max_err attr_addfilterset_clip_scale(void *x, double scale, double min, double max, long usemin, long usemax);
t_max_err attr_addfilterget_clip(void *x, double min, double max, long usemin, long usemax);
t_max_err attr_addfilterget_clip_scale(void *x, double scale, double min, double max, long usemin, long usemax);
t_max_err attr_addfilter_clip(void *x, double min, double max, long usemin, long usemax);
t_max_err attr_addfilter_clip_scale(void *x, double scale, double min, double max, long usemin, long usemax);
t_max_err attr_addfilterset_proc(void *x, method proc);
t_max_err attr_addfilterget_proc(void *x, method proc);

//more util functions
t_symbol *symbol_unique();
void error_sym(void *x,t_symbol *s); //interrupt safe
void post_sym(void *x,t_symbol *s);  //interrupt safe
t_max_err symbolarray_sort(long ac, t_symbol **av);
void object_obex_quickref(void *x, long *numitems, t_symbol **items);


#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(pop)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack()
#endif

#ifdef __cplusplus
}
#endif // __cplusplus

#endif // __OBEX_H__
