
#ifndef _EXT_H_
#define _EXT_H_

#include "ext_prefix.h"	/* this header must always be first */

BEGIN_USING_C_LINKAGE

#include "ext_mess.h"

typedef short (*fretint)(void *, ...);	/* kludge to cast to function returning int */
typedef short (*eachdomethod)(void *, ...);
typedef long (*exprmethod)(void *, ...);
typedef long (*fptr)(void *, ...);
typedef void *(*methodptr)(void *, ...);

#define clock_free freeobject
#define binbuf_free freeobject
#define wind_free freeobject

#define ASSIST_INLET 1
#define ASSIST_OUTLET 2

#include "ext_types.h"
#include "ext_maxtypes.h"
#include "ext_byteorder.h"

#include "ext_proto.h"

END_USING_C_LINKAGE

#endif /* _EXT_H_ */
