// jit.gl.h
// 
//
// author: randall jones
// © 2002-2005 cycling '74


#ifndef __JIT_GL_H__
#define __JIT_GL_H__

// --------------------------------------------------------------------------------

#include "jit.common.h"

// --------------------------------------------------------------------------------

#ifdef MAC_VERSION 
#if TARGET_RT_MAC_MACHO
#include <AGL/agl.h>
#include <OpenGL/glu.h>
#else
#include "agl.h"
#include "glu.h"
#endif

#include "jit.agl.h"
#include "jit.glext.h"
#define glGetProcAddress aglGetProcAddress	// defined in jit.agl.h
#endif 

// --------------------------------------------------------------------------------

#ifdef WIN_VERSION
#include <windows.h>
#include "gl\gl.h"
#include "gl\glu.h"
#include "jit.wglext.h"
#include "jit.glext.h"
#define glGetProcAddress wglGetProcAddress
#endif

// --------------------------------------------------------------------------------

#include "jit.gl.chunk.h"
#include "jit.gl.ob3d.h"
#include "jit.gl.procs.h"
#include "jit.gl.support.h"
#include "jit.gl.context.h"
#include "jit.gl.drawinfo.h"
#include "jit.gl.pixelformat.h"
#include <math.h>

/****************************************************************************/

#ifdef __cplusplus
extern "C" {
#endif

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(push, 2)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack(2)
#endif

/****************************************************************************/
// konstants

#define		JIT_GL_RENDER_REG_STR	"jit_r3nd3r_"
#define		JIT_CLASS3D_FINDER		"this_is_the_jit_class3d"

#ifndef PI
#define		PI	3.141592653589793
#endif

// --------------------------------------------------------------------------------
// utility methods

long jit_gl_available(void);
void jit_gl_init(void);
void jit_gl_renderer_set(void * p);
void * jit_gl_renderer_get();
void jit_gl_set_floats(float *pf, int count, ...);
int jit_gl_get_blend_mode(int index);
long jit_gl_report_error (char *prefix);

// --------------------------------------------------------------------------------
// query methods

const char* jit_gl_get_vendor();
const char* jit_gl_get_renderer();
const char* jit_gl_get_version();
const char* jit_gl_get_glu_version();
const char* jit_gl_get_extensions();
char jit_gl_is_min_version(int major, int minor, int release);
long jit_gl_get_datasize_from_datatype(GLenum e);

// --------------------------------------------------------------------------------
// misc

/**
 * t_wind_mouse_info_struct provided by jit.window and jit.pwindow mouse events
 *
 */
typedef struct 
{
   Atom			mouseatoms[8];	///< h, v, (up/down), cmdKey, shiftKey, alphaLock, option, control.
   int			argc;			///< argument count
   t_symbol 	* mousesymbol;	///< mouse event type
}  t_wind_mouse_info;


// --------------------------------------------------------------------------------
// geometry stuff

/** 2D point (GLfloat) */
typedef GLfloat t_point_2d[2];
/** 3D point (GLfloat) */
typedef GLfloat t_point_3d[3];
/** 3D vector (GLfloat) */
typedef GLfloat t_vec_3d[3];		
/** 4D quaternion (GLfloat). Used for rotation */
typedef GLfloat t_quaternion[4];
/** 4D angle/axis rotation vector (GLfloat) */
typedef GLfloat t_rotation[4];		
/** RGBA color vector (GLfloat) */
typedef GLfloat t_color[4];			

/** Line or line segment in 3D space (GLfloat) */
typedef struct 
{
 	GLfloat	u[3]; ///< starting point
 	GLfloat	v[3]; ///< ending point
}  	t_line_3d;						// line or line segment

/****************************************************************************/

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(pop)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack()
#endif

#ifdef __cplusplus
}
#endif

/****************************************************************************/

#endif // __JIT_GL_H__
