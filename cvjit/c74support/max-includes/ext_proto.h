/* ext_proto.h -- prototypes for MAX external methods */
/* copyright 1996 Opcode/IRCAM */
#ifndef _EXT_PROTO_H_
#define _EXT_PROTO_H_

#include "ext_types.h"
#include "ext_maxtypes.h"	// contains box, patcher, wind, atombuf
#include "ext_sysmem.h"
#include "ext_sysfile.h"
#include "ext_systime.h"
#include "ext_expr.h"
#include "ext_path.h"
#include "ext_qtimage.h"
#include "ext_wind.h"
#ifdef WIN_VERSION
#include "ext_proto_win.h"
#include "ext_sysinfo.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

// object/class functions
void setup(t_messlist **ident, method makefun, method freefun, short size,
	method menufun, short type, ...);
void addmess(method f, char *s, short type, ...);
void addbang(method f);
void addint(method f);
void addfloat(method f);
void addinx(method f, short n);
void addftx(method f, short n);
void *newobject(void *maxclass);
void freeobject(t_object *op);
void *newinstance(t_symbol *s, short argc, t_atom *argv);
void finder_addclass(char *category, char *classString);
void alias(char *name);
void class_noinlet(t_messlist *m);
void class_setname(char *obname, char *filename);
short force_install(char *classname);
void loader_setpath(long type, short path);

// memory functions
char *getbytes(short size);
void freebytes(void *b, short size);
char *getbytes16(short size);
void freebytes16(char *mem, short size);
char **newhandle(long size);
short growhandle(void *h, long size);
void disposhandle(char **h);

// symbol/string/text/error functions
t_symbol *gensym(char *s);
void post(char *fmt, ...);
void error(char *, ...);
void ouchstring(char *s, ...);
short advise(char *s, ...);
void t_cpytext(void);
void drawstr(char *s);
void postatom(t_atom *ap);
void assist_string(short id,long msg,long arg, short firstin, short firstout,char *dst,...);
void assist_drawstr(t_patcher *p, char *s);
void debug_printf(char *,...);
void error_subscribe(t_object *x);
void error_unsubscribe(t_object *x);
void xsetpost();
void post_getpos(short *row, short *col);
void poststring(char *s);
#ifndef WIN_VERSION
int sprintf(char *, const char *, ...);
int sscanf(const char *, const char *, ...);
#endif //WIN_VERSION

// inlet/outlet functions
void *inlet_new(void *x, char *s);
void *intin(void *x, short n);
void *floatin(void *x, short n);
void *outlet_new(void *x, char *s);
void *bangout(void *x);
void *intout(void *x);
void *floatout(void *x);
void *listout(void *x);
void *outlet_bang(void *o);
void *outlet_int(void *o, long n);
void *outlet_float(void *o, double f);
void *outlet_list(void *o, t_symbol *s, short ac, t_atom *av);
void *outlet_anything(void *o, t_symbol *s, short ac, t_atom *av);
void *inlet4(void *x, void *w, char *s, char *s1);
void inlet_to(void *x, void *w);
short outlet_add(void *x, void *ip);
void outlet_rm(void *x, void *ip);
void outlet_atoms(void *out, short argc, t_atom *argv);

// clock functions
void *clock_new(void *obj, method fn);
void clock_set(void *obj,long when);
void clock_delay(void *x, long n);
void clock_unset(void *x);
void clock_xdelay(void *x, long n);
void clock_xset(void *x, long n);
void clock_xunset(void *x);
short clock_getextfmt(void);
void clock_fdelay(void *c, double time);
void clock_fset(void *x, double when);
void clock_fset2(void *x, double when, double offset);
void clock_fdelay(void *x, double f);
void clock_fdelay2(void *x, double delay, double offset);
void clock_getftime(double *time);
void setclock_delay(t_object *x, void *c, long time);
void setclock_unset(t_object *x, void *c);
long setclock_gettime(t_object *x);
void setclock_fdelay(t_object *s, void *c, double time);
void setclock_getftime(t_object *s, double *time);

// real-time
double systimer_gettime(void);

// scheduler functions
long gettime(void);
long getschedtime(void);
long getexttime(void);
void sched_suspend(void);
void sched_resume(void);
void schedule(void *ob, method fun, long when, t_symbol *sym, short argc, Atom *argv);
void schedulef(void *ob, method fun, double when, t_symbol *sym, short argc, Atom *argv);
void *scheduler_new(void);
void *scheduler_set(void *x);
void scheduler_run(void *x, double until);
void scheduler_settime(void *x, double time);
void scheduler_gettime(void *x, double *time);
void schedule_delay(void *ob, method fun, long delay, t_symbol *sym, short argc, t_atom *argv);
void schedule_fdelay(void *ob, method fun, double delay, t_symbol *sym, short argc, t_atom *argv);
void schedule_defer(void *ob, method fun, long delay, t_symbol *sym, short argc, t_atom *arv);
void schedule_fdefer(void *ob, method fun, double delay, t_symbol *sym, short argc, t_atom *arv);
short lockout_set(short);
long isr(void);
short isr_set(short way);

// queue functions
void *qelem_new(void *obj, method fn);
void qelem_set(void *q);
void qelem_unset(void *q);
void qelem_free(void *x);
void qelem_front(void *x);
void *defer(void *ob,method fn,t_symbol *sym,short argc,t_atom *argv);
void *defer_low(void *ob,method fn,t_symbol *sym,short argc,t_atom *argv);
void *defer_medium(void *ob, method fn, t_symbol *sym, short argc, t_atom *argv);
void *defer_front(void *ob, method fn, t_symbol *sym, short argc, t_atom *argv);

// binbuf functions
void *binbuf_new(void);
void binbuf_vinsert(void *x, char *fmt, ...);
void binbuf_insert(void *x, t_symbol *s, short argc, t_atom *argv);
void *binbuf_eval(void *x, short ac, t_atom *av, void *to);
short binbuf_getatom(void *x, long *p1, long *p2, t_atom *ap);
short binbuf_text(void *x, char **shit, long n);
short binbuf_totext(void *x, char **shit, long *sizep);
void binbuf_set(void *x, t_symbol *s, short argc, t_atom *argv);
void binbuf_append(void *x, t_symbol *s, short argc, t_atom *argv);
void binbuf_savebox(void *x, void *w, t_symbol *what, short d1, short d2,
	 short d3, long d4, short hidden, short user);
short binbuf_read(void *x, char *name, short volume, short binary);
short binbuf_write(void *x, char *fn, short vol, short binary);
void binbuf_delete(void *x, long fromType, long toType, long fromData, long toData);
void binbuf_addtext(void *x, char **text, long size);

// atombuf functions
void *atombuf_new(long argc, t_atom *argv);
void atombuf_free(t_atombuf *x);
void atombuf_text(t_atombuf **x, char **text, long size);
void atombuf_totext(t_atombuf *x, char **text, long *size);


// message functions
void *typedmess(t_object *op, t_symbol *msg, short argc, t_atom *argp);
method getfn(t_object *op, t_symbol *msg);
method egetfn(t_object *op, t_symbol *msg);
method zgetfn(t_object *op, t_symbol *msg);

// patcher functions
GrafPtr patcher_setport(t_patcher *p);
#ifdef WIN_VERSION
void patcher_restoreport(GrafPtr gp);
#endif
#ifdef MAC_VERSION
#define patcher_restoreport  SetPort
#endif
void *patchbox(void *p, method fn, short ac, t_atom *av, short defwidth);
void patcher_dirty(t_patcher *p);
void patcher_selectbox(t_patcher *p, t_box *b);
void patcher_deselectbox(t_patcher *p, t_box *b);
void patcher_okclose(t_patcher *p, void *x);
void patcher_eachdo(eachdomethod fun, void *arg);
void patcher_avoidrect(t_patcher *p, Rect *r2, short id);
short patcher_boxname(t_patcher *p, t_box *b, t_symbol **s);
void patcher_setboxname(t_patcher *p, t_box *b, t_symbol *s);
void patcher_nohilite(t_patcher *p);
void hilite_settarget(t_patcher *p, t_box *b);
void loadbang_suspend(void);
void loadbang_resume(void);
void *patcher_parentpatcher(t_patcher *p);

// box functions 
void box_new(t_box *b, t_patcher *patcher, short flags, short x1, short y1, short x2, short y2);
void box_free(t_box *b);
void box_ready(t_box *b);
short box_ownerlocked(t_box *b);
void box_size(void *b, short x, short y);
void *textbox(void *p, method fn, short ac, t_atom *av);
short box_nodraw(t_box *b);
void box_erase(t_box *b);
short box_invalnow(t_box *b);
void *box_clip(t_box *b);
void box_enddraw(t_box *b);
short box_visible(t_box *b);
void box_hilite(t_box *b, short way);
void box_color(t_box *b);
void box_getcolor(t_box *b,short index, RGBColor *rgb);
long usecolor(t_box *b);
void palette_getcolor(t_box *b, short index, RGBColor *rgb);
long boxcolor_rgb2index(RGBColor *n);

// atom functions
short readatom(char *outstr, char **shit, long *n, long e, t_atom *ap);
char *atom_string(t_atom *a);

// table functions
short table_get(t_symbol *s, long ***hp, long *sp);
short table_dirty(t_symbol *s);

// ed functions
void *ed_new(t_object *assoc);
void ed_vis(t_ed *x);
void ed_settext(t_ed *x, t_handle text, long len);

// file functions
short readtohandle(char *name, short volume, char ***h, long *sizep);
void *fileload(char *name,short vol);
void *intload(char *name, short volume, t_symbol *s, short ac, t_atom *av, short couldedit);
void *stringload(char *name);
void *resource_install(char *name, long rsrc);
void *toolfile_new(char *name, short vol, long type);
long toolfile_fread(void *t, char *buf, long n);
long toolfile_fwrite(void *t, char *buf, long n);
short toolfile_getc(void *t);
short collective_load(char *name, short vol, short argc, t_atom *argv);

// resource functions
short rescopy(long type,short id);
short resnamecopy(long type, char *name);

// preset functions
void preset_store(char *fmt, ... /*struct b100 arg1 */);
void preset_set(t_object *obj, long val);
void preset_int(void *x,long n);

// num functions
void evnum_incr(void);
long evnum_get(void);
t_numerical *num_new(short top, short left, short bottom, short right, method draw,
	longmethod inc, long flags, long min, long max, long val, short font, short fsize);
void num_draw(t_numerical *x);
void num_hilite(t_numerical *x, short way);
long num_test(t_numerical *x, Point pt);
void num_track(t_numerical *x, Point pt, method track, void *arg);
void num_setvalue(t_numerical *x, long newval, short redraw);

// proxy functions
void *proxy_new(void *x,long id,long *stuffloc);
long proxy_getinlet(t_object *master);
void *gwind_new(t_object *assoc, t_symbol *s, short style, 
	short left, short top, short bottom, short right);

// connection functions
void *connection_client(t_object *cli, t_symbol *name, t_symbol *classname, method traverse);
void connection_server(t_object *obj, t_symbol *name);
void connection_send(t_object *server, t_symbol *name, t_symbol *mess, void *arg);
void connection_delete(t_object *ob, t_symbol *name);

// quittask functions
void quittask_install(method m, void *a);
void quittask_remove(method m);
void quittask_remove2(method m, void *a);

// notify functions
void *notify_new(t_object *owner);
void notify_enlist(t_object *dependent, t_object *owner);
void notify_update(void *xx);
void notify_free(t_object *owner);

// syswind functions
Boolean syswindow_inlist(t_syswind w);
Boolean syswindow_isvisible(t_syswind w);
Boolean syswindow_isfloating(t_syswind w);
void syswindow_show(t_syswind w);
void syswindow_hide(t_syswind w);
void syswindow_move(t_syswind w, long x, long y, Boolean front);
void syswindow_size(t_syswind w, long width, long height, Boolean update);
t_wind *syswindow_wind(t_syswind w);

// miscellaneous functions
short maxversion(void);
long serialno(void);
char **palette(void);
short ispatcher(t_object *x);
short isnewex(t_object *x);
short newex_knows(t_box *x, t_symbol *selector);
void colorinfo(void *r);
void *callback_new(void *assoc, ProcPtr proc, long refCon, short offset, ProcPtr *callfun);
void open_promptset(char *s);
void saveas_promptset(char *s);
void dialog_setkey(long type);
void dialog_poll(short dosched, short doevent, unsigned short evtMask);
void forecolor(short index, short way);
void backcolor(short index, short way);
void *tabfromhandle(long **handle, long size);
void stdlist(t_object *x, t_symbol *s, short ac, t_atom *av);
void assist_queue(t_object *x, method fun);
void inspector_open(t_object *x, void *p, void *b);
void *object_subpatcher(t_object *x, long *index, void *arg);

// filewatch functions

void *filewatcher_new(t_object *owner, short path, char *filename);
void filewatcher_start(void *x);
void filewatcher_stop(void *x);

// fileusage functions

void fileusage_addfile(void *w, long flags, char *name, short path);
void fileusage_addfilename(void *w, long flags, char *name);
void fileusage_addpathname(void *w, long flags, char *name);
void fileusage_copyfolder(void *w, char *name, long recursive);
void fileusage_makefolder(void *w, char *name);

// fileformat functions
void fileformat_stripsuffix(char *name, long *types, short numtypes);

#ifdef WIN_VERSION
// systext functions
void systext_mactoansi(char *sz);
void systext_ansitomac(char *sz);
#endif

#ifdef __cplusplus
}
#endif

#endif // _EXT_PROTO_H_

