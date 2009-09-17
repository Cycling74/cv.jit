/* anim.h */

#ifndef _EXT_ANIM_H_
#define _EXT_ANIM_H_
#if TARGET_RT_MAC_MACHO
#include <ApplicationServices/ApplicationServices.h>
#else
#include <Palettes.h>
#endif

#define ANIM

#ifdef ANIM

typedef struct offscreen {
	t_object *o_ob;
	PixMapHandle offPix;
	Handle offMem;
	BitMap offBits;
	BitMap curBits;
	PixMapHandle curPix;
	Rect imageClip,screenRect;
	Rect temp;
	GrafPtr dest;
	Boolean realityChecked;
	RgnHandle saveVisRgn,wholeRgn,mRgn,invisRgn,visCopy;
	struct sprt *spriteList;
	struct sprt *lastSprite;		/* used eventually... */
#ifdef _Offscreen_
	GWorldPtr world;
#else
	Ptr world;
#endif
	CGrafPtr savePort;
	GDHandle saveDevice;
} OffScreen, t_offscreen;

typedef struct colorinfo {
	short c_hasColorQD;
	short c_depth;
	short c_has32bitQD;
	short c_inColor;
	short c_curDevH;
	short c_curDevV;
} CInfoRec, t_colorinfo;

typedef struct gwind {
	t_object g_ob;
	t_wind *g_wind;
	short g_style;
	Point g_last;
	PaletteHandle g_palette;
	char g_inited;
	char g_mousein;				/* mouse in window flag */
	t_symbol *g_sym;		/* associated symbol (name) */
	t_object *g_assoc;		/* associated graphic object */
	t_offscreen *g_off;			/* offscreen buffer */
	struct gwind *g_next;		/* next graphics window in the list */
} GWind, t_gwind;

typedef struct sprite {
	t_object s_ob;
	GrafPtr s_dest;				/* screen dest */
	Rect s_rect;				/* rectangle */
	BitMapHandle s_mask;		/* mask */
	RgnHandle s_rgn;			/* mask rgn */
	short s_number;				/* sprite number (priority) */
	char s_drawn;				/* is it drawn */
	char s_change;				/* message to sprite proc to go to its "next" frame */
	method s_proc;			/* procedure that draws */
	long s_frame;				/* current frame, used by s_proc */
	long s_misc;				/* used by s_proc */
	void *s_assoc;				/* an associated object */
	t_offscreen *s_owner;			/* owning system */
	struct sprite *s_prev;		/* link */
	struct sprite *s_next;		/* link */
} t_sprite;

void gwind_offscreen(t_gwind *x);
void *gwind_setport(t_gwind *x);
t_gwind *gwind_get(t_symbol *s);
t_offscreen *off_new(GrafPtr port);
void off_free(t_offscreen *o);
void off_maxrect(t_offscreen *o,Rect *a,Rect *b,Rect *maxRect);
void off_copy(t_offscreen *o);
void off_tooff(t_offscreen *o,PixMapHandle pm,Rect *src,Rect *dst);
void off_size(t_offscreen *o);
void off_copyrect(t_offscreen *o,Rect *r);
t_sprite *sprite_new(void *assoc, t_offscreen *owner, long number, Rect *rect, method proc);
void sprite_moveto(t_sprite *x, short h, short v);
void sprite_move(t_sprite *x, short dh, short dv);
void sprite_redraw(t_sprite *x, short dh, short dv, short frame, short next);
void sprite_draw(t_sprite *x);
void sprite_erase(t_sprite *x);
void sprite_rect(t_sprite *x, Rect *newRect, short frame, short next);
void sprite_newpriority(t_sprite *x, long newpri);

#endif /* ANIM */

#endif /* _EXT_ANIM_H_ */