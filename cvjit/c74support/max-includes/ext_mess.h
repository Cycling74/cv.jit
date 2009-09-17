/*************************/
/* Copyright 1988 IRCAM. */
/*************************/

#ifndef _EXT_MESS_H_
#define _EXT_MESS_H_

#ifdef __cplusplus
extern "C" {
#endif

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(push, 2)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack(2)
#endif

/* mess.h -- define a symbol table and message-passing system.  */
typedef void *(*method)(void *, ...);
typedef long (*longmethod)(void *, ...);
typedef void *(*voidstarvoid)();

typedef char *ptr,*t_ptr;
typedef char **t_handle;
#ifndef VPTR_TYPEDEF
typedef void *vptr,*t_vptr;
#define VPTR_TYPEDEF
#endif 


typedef struct symbol
{
	char *s_name;			/* name */
	struct object *s_thing;	/* possible binding to an object */
} t_symbol, Symbol;

#define CAREFUL

#define MAGIC 1758379419L	/* random (but odd) */
#ifdef  WIN_VERSION
#define NOGOOD(x) ( IsBadReadPtr((void *)(x),sizeof(struct object)) || ((struct object *)(x))->o_magic != MAGIC )
#else
#define NOGOOD(x) (((struct object *)x)->o_magic != MAGIC)
#endif
#define MAXARG 7

/* messlist -- list of symbols and their corresponding methods,		*/
/* complete with typechecking information							*/
typedef struct messlist
{
	struct symbol *m_sym;
	method m_fun;
	char m_type[MAXARG + 1];	/* wish this were indep of MAXARG	*/
} t_messlist, Messlist;

/* this structure sits at the head of any object to which you may	*/
/* pass messages (and which you may feed to freeobject()).			*/
typedef struct tinyobject
{
	struct messlist *t_messlist;	/* list of messages and methods */
									/* (also used as freelist link) */
#ifdef CAREFUL
	long t_magic;					/* magic number */
#endif
} t_tinyobject, Tinyobject;

/* any object which wants to have inlets or outlets					*/
/* needs a header with more fields:									*/
typedef struct object
{
	struct messlist *o_messlist;	/* list of messages and methods */
									/* (also used as freelist link) */
#ifdef CAREFUL
	long o_magic;					/* magic number					*/
#endif
	struct inlet *o_inlet;			/* list of inlets				*/
	struct outlet *o_outlet;		/* list of outlets				*/
} t_object, Object;

/* the -1 entry of the message list of an object contains a pointer	*/
/* to its class entry, defined as follows:							*/
typedef struct maxclass
{
	struct symbol *c_sym;			// symbol giving name of class
	struct object **c_freelist;		// linked list of free ones
	method c_freefun;				// function to call when freeing
	short c_size;					// size of an instance
	char c_tiny;					// flag indicating tiny header
	char c_noinlet;					// flag indicating no first inlet for patcher
	struct symbol *c_filename;		// name of file associated with this class
	t_messlist *c_newmess;			// constructor method/type information
	method c_menufun;				// function to call when creating from object pallette (default constructor)
	long c_flags;					// class flags used to determine context in which class may be used
	long c_messcount;				// size of messlist array
	t_messlist *c_messlist;			// messlist arrray
	void *c_attributes;				// t_hashtab object
	void *c_extra;					// t_hashtab object
	long c_obexoffset;				// if non zero, object struct contains obex pointer at specified byte offset
									// the obex pointer is currently just a t_hashtab, and hence extensible
} t_class, Maxclass;

// class flags
// If not box or polyglot, class is only accessible in C via known interface
#define	CLASS_FLAG_BOX				0x00000001L		// for use in a patcher
#define	CLASS_FLAG_POLYGLOT			0x00000002L 	// for use by any text language (c/js/java/etc)
#define CLASS_FLAG_NOATTRIBUTES		0x00010000L		// for efficiency
#define CLASS_FLAG_OWNATTRIBUTES	0x00020000L		// for classes which support a custom attr interface (e.g. jitter)



/* the list of officially recognized types, including pseudotypes for
	commas and semicolons.  Used in two places: 1. the reader, when it reads
	a string, returns long, float, sym, comma, semi, or dollar;
	and 2. each object method comes with an array of them saying what types
	it needs, from among long, float, sym, obj, gimme, and cant.
*/
#define A_NOTHING	0
#define A_LONG		1
#define A_FLOAT		2
#define A_SYM		3
#define A_OBJ		4	/* for argtype lists; passes the value of sym */
#define A_DEFLONG	5	/* long but defaults to zero */
#define A_DEFFLOAT	6	/* float, same default */
#define A_DEFSYM	7	/* symbol, defaults to "" */
#define A_GIMME		8	/* request that args be passed as an array; */
						/* the routine will check the types itself. */
#define A_CANT		9	/* cannot typecheck args */
#define A_SEMI		10
#define A_COMMA		11
#define A_DOLLAR	12
#define A_DOLLSYM	13
#define A_GIMMEBACK	14	/* request that args be passed as an array. */
						/* the routine will check the types itself. */
						/* can return atom value in final atom ptr arg. */
						/* function returns long error code 0 = no err. */
						/* see gimmeback_meth typedef below */

union word		/* union for packing any above datum */
{
	long w_long;
	float w_float;
	struct symbol *w_sym;
	struct object *w_obj;
};

typedef struct atom		/* and an atom which is a typed datum */
{
	short a_type;		/* from the above defs */
	union word a_w;
} t_atom, Atom;

typedef void *(*zero_meth)(void *x);
typedef void *(*one_meth)(void *x, void *z);
typedef void *(*two_meth)(void *x, void *z, void *a);
typedef long *(*gimmeback_meth)(void *x, t_symbol *s, long ac, t_atom *av, t_atom *rv);


#define BAG(s) {error(s); return (0);}
#define BAG2(s,t) {error(s,t); return (0);}
#define ob_messlist(x) (((struct object *)(x))->o_messlist - 1)
#define ob_class(x) ((struct maxclass *) \
	(((struct object *)(x))->o_messlist[-1].m_sym))
#define ob_name(x) (ob_class(x)->c_sym->s_name)
#define ob_sym(x) (ob_class(x)->c_sym)
#define ob_filename(x) (ob_class(x)->c_filename->s_name)
#define ob_filesym(x) (ob_class(x)->c_filename)
#define mess0(x, y)  (*((zero_meth)(getfn(x, y))))(x)
#define mess1(x, y, z1) (*((one_meth)(getfn(x, y))))(x, z1)
#define mess2(x, y, z1,z2) (*((two_meth)(getfn(x, y))))(x, z1,z2)
#define mess3(x, y, z1,z2,z3) (*(getfn(x, y)))(x, z1,z2,z3)
#define mess4(x, y, z1,z2,z3,z4) (*(getfn(x, y)))(x, z1,z2,z3,z4)
#define mess5(x, y, z1,z2,z3,z4,z5) (*(getfn(x, y)))(x, z1,z2,z3,z4,z5)
#define NIL ((void *)0)
#define SETCOMMA(ap) ((ap)->a_type = A_COMMA)
#define SETSEMI(ap) ((ap)->a_type = A_SEMI)
#define SETSYM(ap, x) ((ap)->a_type = A_SYM, (ap)->a_w.w_sym = (x))
#define SETOBJ(ap, x) ((ap)->a_type = A_OBJ, (ap)->a_w.w_obj = (x))
#define SETLONG(ap, x) ((ap)->a_type = A_LONG, (ap)->a_w.w_long = (x))
#define SETFLOAT(ap, x) ((ap)->a_type = A_FLOAT, (ap)->a_w.w_float = (x))
#define SETDOLLAR(ap, x) ((ap)->a_type = A_DOLLAR, (ap)->a_w.w_long = (x))

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(pop)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack()
#endif

#ifdef __cplusplus
}
#endif

#endif /* _EXT_MESS_H_ */
