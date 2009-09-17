/* 
	jit.max.h

	Copyright 2001-2005 - Cycling '74
	Joshua Kit Clayton jkc@cycling74.com
	
*/

#ifndef __JIT_MAX_H__
#define __JIT_MAX_H__


#include "ext.h"
#include "ext_proto.h"
#include "ext_strings.h"
#include "ext_critical.h"


#ifdef __cplusplus
extern "C" {
#endif

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(push, 2)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack(2)
#endif

//atom,symbol,method shared with max
typedef t_object 	t_jit_object; 
typedef t_class 	t_max_class;
typedef t_object 	t_max_object;
typedef t_messlist 	t_max_messlist;

#define A_DEFER			0x41
#define A_USURP			0x42
#define A_DEFER_LOW		0x43
#define A_USURP_LOW		0x44

void *max_jit_obex_new(void *mc, t_symbol *classname);
void max_jit_obex_free(void *x);
void *max_jit_classex_setup(long oboffset);
long max_jit_classex_addattr(void *x, void *attr);
void max_jit_classex_standard_wrap(void *mclass, void *jclass, long flags);

void max_jit_class_addmethods(void *x);
void max_jit_class_attrlist2methods(void *x);
void max_jit_object_attr_dump(void *x);
long max_jit_attr_args_offset(short ac, t_atom *av);
void max_jit_attr_args(void *x, short ac, t_atom *av);
//utils for max objects
void max_addmethod_defer(method m, char *s);
void max_addmethod_defer_low(method m, char *s);
void max_addmethod_usurp(method m, char *s);
void max_addmethod_usurp_low(method m, char *s);

void *max_jit_obex_attrlist_get(void *x);
long max_jit_obex_attr_set(void *x, t_symbol *s, long ac, t_atom *av);
long max_jit_obex_attr_get(void *x, t_symbol *s, long *ac, t_atom **av);
void max_jit_obex_attr_getdump(void *x, t_symbol *s, short argc, t_atom *argv);
long max_jit_obex_set(void *x, void *p);
void *max_jit_obex_get(void *x);
void *max_jit_obex_jitob_get(void *x);
void max_jit_obex_jitob_set(void *x, void *jitob);
void *max_jit_obex_usurplist_get(void *x);
void max_jit_obex_usurplist_set(void *x, void *usurplist);
void *max_jit_obex_proxylist_get(void *x);
void max_jit_obex_proxylist_set(void *x, void *proxylist);
long max_jit_obex_inletnumber_get(void *x);
void max_jit_obex_inletnumber_set(void *x, long inletnumber);
long max_jit_obex_proxy_new(void *x, long c);
void max_jit_obex_dumpout_set(void *x, void *outlet);
void *max_jit_obex_dumpout_get(void *x);
void max_jit_obex_dumpout(void *x, t_symbol *s, short argc, t_atom *argv);
void *max_jit_obex_adornmentlist_get(void *x);
void max_jit_obex_adornmentlist_set(void *x, void *adornmentlist);
void *max_jit_obex_adornment_get(void *x, t_symbol *classname);
long max_jit_obex_addadornment(void *x,void *adornment);
void max_jit_obex_gimmeback(void *x, t_symbol *s, long ac, t_atom *av);
void max_jit_obex_gimmeback_dumpout(void *x, t_symbol *s, long ac, t_atom *av);

long max_jit_method_is_attr(void *x, t_symbol *s);

long max_jit_getqueuestate(void);

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(pop)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack()
#endif

#ifdef __cplusplus
}
#endif

#endif //__JIT_MAX_H__
