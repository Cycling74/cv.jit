/*************************/
/* Copyright 1988 IRCAM. */
/*************************/
#ifndef _EXT_WIND_H_
#define _EXT_WIND_H_

// wind structure definition moved to ext_maxtypes.h

#ifdef __cplusplus
extern "C" {
#endif


t_wind *wind_new(void *assoc, short x1, short y1, short x2, short y2, long flags);
void wind_vis(t_wind *x);
void wind_invis(t_wind *x);
GrafPtr wind_setport(t_wind *x);
#ifdef WIN_VERSION
void wind_restoreport(GrafPtr gp);
#endif
#ifdef MAC_VERSION
#define wind_restoreport	SetPort
#endif
void wind_settitle(t_wind *x, char *s, short brackets);
void wind_dirty(t_wind *x);
void wind_clean(t_wind *x);
void wind_setsmax(t_wind *x, short a, short b);
void wind_setsval(t_wind *x, short a, short b);
void wind_drag(method fun, void *arg, Point pt);
short wind_defaultscroll(t_wind *x, Point pt, short pageSize);
void wind_noworrymove(short way);
void wind_setundo(char *str, short enable);
void wind_setcursor(short which);
void wind_filename(t_wind *x, char *fn, short vol, short bin);
short wind_close(t_wind *x);
void wind_nocancel(void);
short wind_inhscroll(t_wind *x, Point pt);
void wind_setbin(t_wind *x, short way);
t_syswind wind_syswind(t_wind *x);
void wind_setgrowbounds(t_wind *x, short minx, short miny, short maxx, short maxy);
void *wind_validwind(void);

short wind_advise(t_wind *w, char *s, ...);

#ifdef __cplusplus
}
#endif


#endif /* _EXT_WIND_H_ */
