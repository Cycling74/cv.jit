#ifndef _EXT_PREFIX_H_
#define _EXT_PREFIX_H_

////////////////////////////////////////////////////////////////////////////////
// macros

#ifndef WIN_VERSION
#define MAC_VERSION 1 // we'll assume that if we aren't requesting the windows version, that we build the mac version(s) of the product
#endif  // WIN_VERSION

#ifdef __cplusplus
#define BEGIN_USING_C_LINKAGE \
	extern "C" {
#else
#define BEGIN_USING_C_LINKAGE
#endif // __cplusplus

#ifdef __cplusplus
#define END_USING_C_LINKAGE \
	}
#else
#define END_USING_C_LINKAGE
#endif // __cplusplus

////////////////////////////////////////////////////////////////////////////////
// Mac Target

#ifdef MAC_VERSION
#ifndef powerc
#pragma d0_pointers on
#endif
#define _K( k )	

#define INCLUDE_APPLE_HEADERS

#if !TARGET_API_MAC_CARBON
#define GRAFPORT_IN_WIND
#endif

#if 1 // defined( __MOTO__ ) && !defined( __cplusplus )
#define FPTR_ELLIPSES		0
#else 
#define FPTR_ELLIPSES		1
#endif

// the C74_PRAGMA_STRUCT_PACK* macros are used to ensure that 
// Win32 builds of Max externals use a 2 byte struct packing 
// for all Max structs in projects that have a default struct 
// packing other than 2 (this is typically 4). On Macintosh
// the default byte packing is 4, and it is with this packing
// that all Max structs are packed on Macintosh. If for some 
// reason you are using a struct byte packing of something other
// than 4 on macintosh, there may be problems. Please let us
// know, and we can address this and the other Max header files to 
// ensure 4 byte struct packing on Macintosh in such a setting.
#define C74_PRAGMA_STRUCT_PACKPUSH	0
#define C74_PRAGMA_STRUCT_PACK		0
#define C74_STRUCT_PACK_SIZE		4

#endif // MAC_VERSION

////////////////////////////////////////////////////////////////////////////////
// Win32 Target

#ifdef WIN_VERSION

#if !defined( __cplusplus )
#define FPTR_ELLIPSES		0
#else
#define FPTR_ELLIPSES		1
#endif

// the C74_PRAGMA_STRUCT_PACK* macros are used to ensure that 
// Win32 builds of Max externals use a 2 byte struct packing 
// for all Max structs in projects that have a default struct 
// packing other than 2 (this is typically 4). On Macintosh
// the default byte packing is 4, and it is with this packing
// that all Max structs are packed on Macintosh. If for some 
// reason you are using a struct byte packing of something other
// than 4 on macintosh, there may be problems. Please let us
// know, and we can address this and the other Max header files to 
// ensure 4 byte struct packing on Macintosh in such a setting.
#if ((defined(_MSC_VER) && !defined(__MWERKS__)) || (defined(__MWERKS__)&&(__MWERKS__ >= 0x0900)))
// Visual C++ or Metrowerks >=0x0900 support pack(push,n)
// this may not accomodate building for a windows target
// using Metrowerks on a macintosh, which might need to use 
// the pragma align statement.
#define C74_PRAGMA_STRUCT_PACKPUSH	1
#else
#define C74_PRAGMA_STRUCT_PACKPUSH	0
#endif
#define C74_PRAGMA_STRUCT_PACK		1
#define C74_STRUCT_PACK_SIZE		2

#pragma warning( disable : 4005 ) // macro redefinition
#pragma warning( disable : 4101 ) // unreferenced local
#pragma warning( disable : 4800 ) // forcing value to bool 'true' or 'false'
#pragma warning( disable : 4805 ) // unsafe mix of type 'BOOL' and type 'bool'
#pragma warning( disable : 4087 ) // 'function' declared with 'void' parameter list
#pragma warning( disable : 4068 ) // unknown pragma
#pragma warning( disable : 4244 ) // implicit larger to smaller type conversion (int + float)
#pragma warning( disable : 4245 ) // implicit unsigned/signed type conversion
#pragma warning( disable : 4305 ) // truncation from 'type1' to 'type2' (e.g. double->float)


// crtl
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <ctype.h>
#include <math.h>
#include <string.h>
#include <setjmp.h>
#include <assert.h>

// windows
#include <windows.h>
#include <richedit.h>
#include <commctrl.h>

#ifdef C74_PRIVATE
#include "ext_prefix_win.h"
#endif

#ifdef USE_QTML
#ifndef INCLUDE_APPLE_HEADERS
#define INCLUDE_APPLE_HEADERS
#endif
#include "qtml.h"
#endif

#endif // WIN_VERSION

#endif // _EXT_PREFIX_H_
