#ifndef JIT_GL_OB3D_H
#define JIT_GL_OB3D_H

/****************************************************************************/

#include "jit.gl.h"

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

// ob3d stuff
// flags -- default: all flags off.

#define JIT_OB3D_NO_ROTATION_SCALE			1 << 0
#define JIT_OB3D_NO_POLY_VARS				1 << 1
#define JIT_OB3D_NO_BLEND					1 << 2
#define JIT_OB3D_NO_TEXTURE					1 << 3
#define JIT_OB3D_NO_MATRIXOUTPUT			1 << 4
#define JIT_OB3D_AUTO_ONLY					1 << 5
#define JIT_OB3D_DOES_UI					1 << 6
#define JIT_OB3D_NO_DEPTH					1 << 7
#define JIT_OB3D_NO_ANTIALIAS				1 << 8
#define JIT_OB3D_NO_FOG						1 << 9
#define JIT_OB3D_NO_LIGHTING_MATERIAL		1 << 10
#define JIT_OB3D_HAS_LIGHTS					1 << 11
#define JIT_OB3D_HAS_CAMERA					1 << 12
#define JIT_OB3D_IS_RENDERER				1 << 13
#define JIT_OB3D_NO_COLOR					1 << 14
#define JIT_OB3D_IS_SLAB					1 << 15

/****************************************************************************/

typedef struct _jit_class3d
{
	long				oboffset; 		// instance byte offset to the ob3d struct.
	long				flags;
	// extensible
} t_jit_class3d;

/****************************************************************************/

void *jit_ob3d_setup(void * jit_class, long oboffset, long ob3d_flags);
t_jit_err jit_ob3d_set(void *x, void *p);
void *jit_ob3d_get(void *x);
void *jit_ob3d_new(void *x, t_symbol * dest_name);
void jit_ob3d_free(void *x);
t_jit_err jit_ob3d_set_context(void *x);
t_jit_err jit_ob3d_draw_chunk(void *ob3d, t_jit_glchunk * chunk);

void max_ob3d_setup(void);

// attach jit object bearing an ob3d to a max object and its outlet.
void max_jit_ob3d_attach(void *x, t_jit_object *jit_ob, void *outlet);
void max_jit_ob3d_detach(void *x);
t_jit_err max_jit_ob3d_assist(void *x, void *b, long m, long a, char *s);

void * ob3d_jitob_get(void *v);
void * ob3d_next_get(void *v);
long ob3d_auto_get(void *v);
long ob3d_enable_get(void *v);
long ob3d_ui_get(void *v);
void * ob3d_outlet_get(void *v);
long ob3d_dirty_get(void *v);
void ob3d_dirty_set(void *v, long c);

t_jit_err ob3d_draw_begin(void *ob3d, long setup);
t_jit_err ob3d_draw_end(void *ob3d, long setup);
t_jit_err ob3d_draw_preamble(void *ob3d);
void *jit_gl_current_ob3d_set(void * p);
void *jit_gl_current_ob3d_get();
void jit_gl_ob3d_set(void * p);
void *jit_gl_ob3d_get();

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

#endif