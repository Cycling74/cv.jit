
#ifndef _LINKLIST_H_
#define _LINKLIST_H_

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(push, 2)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack(2)
#endif

typedef struct _llelem
{
	long opaque;
} t_llelem;		

typedef struct _linklist
{
	long opaque;
} t_linklist;		

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(pop)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack()
#endif

typedef long (*t_cmpfn)(void *, void *);

#ifdef __cplusplus
	extern "C" {
#endif // __cplusplus


void *object_method(void *x, t_symbol *s, ...);
void c_linklist(void);
void *linklist_new(void);
void linklist_free(t_linklist *x);
void linklist_chuck(t_linklist *x); //like free, but don't free the objects
long linklist_getsize(t_linklist *x);
void *linklist_getindex(t_linklist *x, long index);
t_llelem *linklist_index2ptr(t_linklist *x, long index);
long linklist_ptr2index(t_linklist *x, t_llelem *p);
long linklist_objptr2index(t_linklist *x, void *p);
long linklist_append(t_linklist *x, void *o);
long linklist_insertindex(t_linklist *x,  void *o, long index); // inserts at index(0 is head)
t_llelem *linklist_insertptr(t_linklist *x,  void *o, t_llelem *p); //inserts before ptr
long linklist_deleteindex(t_linklist *x, long index); 
long linklist_chuckindex(t_linklist *x, long index);
long linklist_deleteptr(t_linklist *x, t_llelem *p);
long linklist_chuckptr(t_linklist *x, t_llelem *p); //like delete, but don't free it
void linklist_clear(t_linklist *x);

long linklist_insertnodeindex(t_linklist *x, t_llelem *p, long index);
t_llelem *linklist_insertnodeptr(t_linklist *x, t_llelem *p1, t_llelem *p2);
long linklist_appendnode(t_linklist *x, t_llelem *p);

t_llelem *linklistelem_new(void);
void linklistelem_free(t_llelem *x);

long linklist_makearray(t_linklist *x, void **a, long max);

void linklist_reverse(t_linklist *x);
void linklist_rotate(t_linklist *x, long i);
void linklist_shuffle(t_linklist *x);
void linklist_swap(t_linklist *x, long a, long b); 
long linklist_findfirst(t_linklist *x, void **o, long cmpfn(void *, void *), void *cmpdata);
void linklist_findall(t_linklist *x, t_linklist **out, long cmpfn(void *, void *), void *cmpdata);
void linklist_methodall(t_linklist *x, t_symbol *s, ...); 
void *linklist_methodindex(t_linklist *x, long i, t_symbol *s, ...); 
void linklist_sort(t_linklist *x, long cmpfn(void *, void *));
void linklist_funall(t_linklist *x, method fun, void *arg);
void *linklist_funindex(t_linklist *x, long i, method fun, void *arg);

void linklist_readonly(t_linklist *x, long readonly);
void *linklist_substitute(t_linklist *x, void *p, void *newp);
void *linklist_next(t_linklist *x, void *p, void **next);
void *linklist_prev(t_linklist *x, void *p, void **prev);
void *linklist_last(t_linklist *x, void **item);


#ifdef __cplusplus
}
#endif // __cplusplus

#endif // _LINKLIST_H_

