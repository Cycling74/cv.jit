/* 
	jit.linklist.h

	Copyright 2001-2005 - Cycling '74
	Joshua Kit Clayton jkc@cycling74.com
		
*/

#ifndef _JIT_LINKLIST_H_
#define _JIT_LINKLIST_H_

#include "ext_linklist.h"

#ifdef __cplusplus
extern "C" {
#endif

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(push, 2)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack(2)
#endif

typedef struct _jit_llelem
{
	t_jit_object 		*thing;
	struct _jit_llelem	*next;
	struct _jit_llelem	*prev;
} t_jit_llelem;		

typedef struct _jit_linklist
{
	t_jit_object 	ob;
	long			count;
	t_jit_llelem	*head;
	t_jit_llelem	*tail;
} t_jit_linklist;		

// This is now defined in ext_linklist.h
//typedef long (*t_cmpfn)(void *, void *);


void jit_linklist_init(void); //manual class registration
void *jit_linklist_new(void);
void jit_linklist_free(t_jit_linklist *x);
void jit_linklist_chuck(t_jit_linklist *x); //like free, but don't free the objects
long jit_linklist_getsize(t_jit_linklist *x);
void *jit_linklist_getindex(t_jit_linklist *x, long index);
t_jit_llelem *jit_linklist_index2ptr(t_jit_linklist *x, long index);
long jit_linklist_ptr2index(t_jit_linklist *x, t_jit_llelem *p);
long jit_linklist_objptr2index(t_jit_linklist *x, void *p);
long jit_linklist_append(t_jit_linklist *x, void *o);
long jit_linklist_insertindex(t_jit_linklist *x,  void *o, long index); // inserts at index(0 is head)
t_jit_llelem *jit_linklist_insertptr(t_jit_linklist *x,  void *o, t_jit_llelem *p); //inserts before ptr
long jit_linklist_deleteindex(t_jit_linklist *x, long index); 
long jit_linklist_chuckindex(t_jit_linklist *x, long index);
long jit_linklist_deleteptr(t_jit_linklist *x, t_jit_llelem *p);
long jit_linklist_chuckptr(t_jit_linklist *x, t_jit_llelem *p); //like delete, but don't free it
void jit_linklist_clear(t_jit_linklist *x);

long jit_linklist_insertnodeindex(t_jit_linklist *x, t_jit_llelem *p, long index);
t_jit_llelem *jit_linklist_insertnodeptr(t_jit_linklist *x, t_jit_llelem *p1, t_jit_llelem *p2);
long jit_linklist_appendnode(t_jit_linklist *x, t_jit_llelem *p);

t_jit_llelem *jit_linklistelem_new(void);
void jit_linklistelem_free(t_jit_llelem *x);

long jit_linklist_makearray(t_jit_linklist *x, void **a, long max);

void jit_linklist_reverse(t_jit_linklist *x);
void jit_linklist_rotate(t_jit_linklist *x, long i);
void jit_linklist_shuffle(t_jit_linklist *x);
void jit_linklist_swap(t_jit_linklist *x, long a, long b); 
void jit_linklist_findfirst(t_jit_linklist *x, void **o, long cmpfn(void *, void *), void *cmpdata);
void jit_linklist_findall(t_jit_linklist *x, t_jit_linklist **out, long cmpfn(void *, void *), void *cmpdata);
long jit_linklist_findcount(t_jit_linklist *x, long cmpfn(void *, void *), void *cmpdata); 
void jit_linklist_methodall(t_jit_linklist *x, t_symbol *s, ...); 
void *jit_linklist_methodindex(t_jit_linklist *x, long i, t_symbol *s, ...); 
void jit_linklist_sort(t_jit_linklist *x, long cmpfn(void *, void *));
void jit_linklist_funall(t_jit_linklist *x, method fun, void *arg);
void jit_linklist_funallsafe(t_jit_linklist *x, method fun, void *arg);
void *jit_linklist_funindex(t_jit_linklist *x, long i, method fun, void *arg);


#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(pop)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack()
#endif

#ifdef __cplusplus
}
#endif

#endif _JIT_LINKLIST_H_

