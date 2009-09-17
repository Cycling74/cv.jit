#ifndef _COMPAT_H_
#define _COMPAT_H_

#ifdef THINK_C

#define GRAPHICS

#include <SetUpA4.h>
#include "ext.h"
#include "ext_wind.h"

typedef void (*t_method)();
typedef t_messlist t_maxclass;
typedef void *(*t_creator)();
typedef void t_externclass;

/* DON'T PUT A SEMICOLON after the word INITIALIZATION in your source file */

#define INITIALIZATION(n) fptr *FNS; main(fptr *f) { RememberA0(); SetUpA4(); FNS = f; \
(n)(); RestoreA4(); }

#define NEWOBJECT(c) newobject(c)
#define SETUP(c,nf,ff,mf,cn,cs,ni,t1,t2,t3,t4,t5) \
setup(&c,nf,ff,(short)cs,mf,t1,t2,t3,t4,t5);

/* if you have fewer than 5 arguments for the setup type list, just put 0 in to fill */

#define c_addmess addmess
#define c_addint  addint
#define c_addbang addbang

/* the following is for cases where gensym is required on the Next and not on Mac */

#define cgensym(s) (s)

#define obj_getclassname ob_sym

#define INLET_NEW(a,b,c,d) inlet4(a,b,c,d)

#else

#define MAX_EXTERN		/* you should be able to take this out someday */
#include "m_extern.h"
#include "x_explode.h"
#define SetUpA4()
#define RestoreA4()
#define INITIALIZATION(n)

#define NEWOBJECT(c) obj_new(&c,0)

#define SETUP(c,nf,ff,mf,cn,cs,ni,t1,t2,t3,t4,t5) \
c_extern(&c,nf,ff,gensym(cn),cs,ni,t1,t2,t3,t4,t5);

#define INLET_NEW(a,b,c,d) inlet_new(a,b,c,d)

typedef void (*Method)();
typedef struct symbol Symbol;
typedef struct messlist Messlist;
typedef struct tinyobject Tinyobject;
typedef struct object Object;
typedef struct class MaxClass;
typedef union word Word;
typedef struct atom Atom;
typedef void *(*Creator)();

/* the following is for cases where gensym is required on the Next and not on Mac */

#define cgensym(s) gensym(s)

#endif /* THINK_C */

#endif /* _COMPAT_H_ */