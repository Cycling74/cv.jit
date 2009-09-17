#ifndef __HASHTAB_H__
#define __HASHTAB_H__

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(push, 2)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack(2)
#endif

#define HASH_DEFSLOTS	57 // primes typically work well

// object structs
typedef struct _hashtab_entry
{
	long	opaque;	
} t_hashtab_entry;

typedef struct _hashtab
{
	long	opaque;	
} t_hashtab;

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(pop)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack()
#endif


#ifdef __cplusplus
	extern "C" {
#endif // __cplusplus


void hashtab_init(void);
t_hashtab *hashtab_new(long slotcount);
t_max_err hashtab_store(t_hashtab *x, t_symbol *key, t_object *val);
t_max_err hashtab_lookup(t_hashtab *x, t_symbol *key, t_object **val);
t_max_err hashtab_delete(t_hashtab *x, t_symbol *key);
t_max_err hashtab_clear(t_hashtab *x);
t_max_err hashtab_chuckkey(t_hashtab *x, t_symbol *key);
t_max_err hashtab_chuck(t_hashtab *x);
t_max_err hashtab_findfirst(t_hashtab *x, void **o, long cmpfn(void *, void *), void *cmpdata);
t_max_err hashtab_methodall(t_hashtab *x, t_symbol *s, ...);
t_max_err hashtab_funall(t_hashtab *x, method fun, void *arg);
long hashtab_getsize(t_hashtab *x);
void hashtab_print(t_hashtab *x);
void hashtab_free(t_hashtab *x);
void hashtab_readonly(t_hashtab *x, long readonly);
t_max_err hashtab_getkeys(t_hashtab *x, long *kc, t_symbol ***kv);

t_hashtab_entry *hashtab_entry_new(t_symbol *key, t_object *val);
void hashtab_entry_free(t_hashtab_entry *x);


#ifdef __cplusplus
}
#endif // __cplusplus

#endif // __HASHTAB_H__

