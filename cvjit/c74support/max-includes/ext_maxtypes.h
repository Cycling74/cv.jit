// ext_maxtypes.h: Max data types and structure definitions for external objects
// Copyright 1990-2004 IRCAM/Cycling '74 -- All rights reserved

#ifndef _EXT_MAXTYPES_H_
#define _EXT_MAXTYPES_H_


#ifdef __cplusplus
extern "C" {
#endif

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(push, 2)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack(2)
#endif

// atombuf -- collection of atoms

typedef struct atombuf {
	long a_argc;
	t_atom a_argv[1];
} t_atombuf;

// wind -- wrapper for OS windows

#if defined(MAC_VERSION) && !TARGET_API_MAC_CARBON
#define WIND_USE_WINDOW_RECORD 1
#else
#define WIND_USE_WINDOW_RECORD 0
#endif

typedef struct wind
{
	struct object w_ob;
	short w_x1;					// location of window
	short w_x2;
	short w_y1;
	short w_y2;
	short w_xoffset;			// scroll offsets
	short w_yoffset;
	short w_scrollgrain;		// scroll grain in pixels
	short w_refcount;			// reference count
	char w_vis;					// visible
	char w_titled;				// has a title
	char w_grow;				// has a grow region 
	char w_close;				// has a close region 
	char w_scrollx;				// has an x scroll region 
	char w_scrolly;				// has a y scroll region 
	char w_dirty;				// dirty flag (can save) 
	char w_scratch;				// scratch flag -- don't complain on close 
	char w_bin;					// binary save 
	char w_font;				// text font 
	char w_fsize;				// font size 
	char w_fontindex;			// font index (0 = 9 points, 7 = 24 points)  
#if WIND_USE_WINDOW_RECORD
	WindowRecord w_wind;
#endif

	short w_vsmax;				// vertical scroll max 
	ControlHandle w_vscroll;
	short w_hsmax;				// horizontal scroll max 
	ControlHandle w_hscroll;
	void *w_assoc;				// associated object 
	method w_idle;				// window idle function 
	char w_name[80];			// filename = window title 
	short w_vol;					// file volume number (working directory) 
	short  w_proc;				// window proc id (0 = normal) 
	char w_keeptitle;			// set window title on saveas 
	char w_canon;				// slot in canonical list of locations 
	char w_silentgrow;			// has invisible grow region -- don't draw icon 
	char w_color;				// try to make color window if you can 
	char w_bits;				// number of bits (i.e. 2 for b&w) 
	char w_divscrollx;			// divided horiz scroll bar 
	char w_zoom;				// has zoom rect 
	short w_realfont;			// real font in 16 bits 
	short w_hsleft;				// left of scroll bar 
	Rect w_oldsize;
	short w_oldproc;
	char w_select;				// always select on click 
	char w_frame;				// special 'frame' mode 
	long w_flags;				// used by thispatcher window message 
	WindowPtr w_wptr;			// DDZ 6/11/98, contains pre-existing window or ptr to w_wind
	long w_local;				// window's memory stored locally
	Rect w_growbounds;			// optional grow bounds for a window
	char w_helper;				// is a helper (used by the Windows menu)
	short w_hviewsize;			// h view size for proportional scrolling
	short w_vviewsize;			// v view size for proportional scrolling
	void *w_printsession;		// printing stuff
	void *w_hpageformat;		// printing stuff
	Point w_idealstate;			// for zooming on OS X
	char w_noselect;			// don't ever call SelectWindow when clicking on this window
	char w_noupdate;			// no update flag for OS X
	void *w_idletasklist;		// list of idle tasks to run
} t_wind;

/* definition of t_syswind */
#if TARGET_API_MAC_CARBON || defined(WIN_VERSION)
#define t_syswind	void *
#else
#define t_syswind	WindowPtr
#endif

	/* flags for window object */
#define WVIS		01		/* visible */
#define WGROW		02		/* grow region */
#define WSCROLLX	04		/* x scrollbar */
#define WSCROLLY	010		/* y scrollbar */
#define WCLOSE		020		/* close region */
#define WKEEPT		040		/* keep window title away from saveas */
#define WSGROW		0100 	/* silent grow region */
#define WCOLOR		0200 	/* color window */
#define WPATCHPROC	0400 	/* patcher wdef */
#define WSHADOWPROC 01000 	/* shadow wdef */
#define WDIVSCROLLX 02000 	/* divided horizontal scroll bar (min 140 pixels) */
#define WZOOM		04000	/* has a zoom box */
#define WSELECT		010000	/* always select on click (disobey all windows active) */
#define WFROZEN     020000  /* prevent "thispatcher window" messages */
#define WFLOATING	040000	// floating window (OS 8.6 or higher)

#define W_WIDTH(w) (w->w_x2 - w->w_x1)
#define W_HEIGHT(w) (w->w_y2 - w->w_y1)
#define SBARWIDTH	15
#define DIVBARMIN	130

#define ISMAXWINDOW(window) ((window->windowKind == userKind) && (window->refCon))

/* event codes returned from patcher WDEF */

#define inLock 9		/* lock on/off */
#define inRock 10		/* midi on/off */
#define inDock 11		/* dock on (eventually) */

#define aaYes 1
#define aaNo 2
#define aaCancel 3

#define C_ARROW		1
#define C_WATCH		2
#define C_IBEAM		3
#define C_HAND		4
#define C_CROSS		5
#define C_PENCIL	6
#define C_GROW		8


// ed -- the text editor window

#ifdef MAC_VERSION
typedef struct ed
{
	struct object	e_ob;
	TEHandle		e_teh;
	int				e_nlines;
	Point			e_origin;
	struct wind		*e_wind;
	ProcPtr 		e_docClik;
	struct object	*e_assoc;	/* <z1> associated object */
} Ed, t_ed;
#endif /* MAC_VERSION */

#ifdef WIN_VERSION
typedef struct ed
{
	struct object	e_ob;
	void			*e_teh;		// will be 0
	short			e_nlines;
	Point			e_origin;	// not used
	struct wind		*e_wind;
	HWND			e_docClick;
	struct object	*e_assoc;	/* <z1> associated object */
	WNDPROC			e_wproc;
	HWND			e_sbhorz;
	HWND			e_sbvert;

} t_ed;
#endif /* WIN_VERSION */

// menuinfo: structure to control which menu items to enable, used in chkmenu message to a window

typedef struct menuinfo	
{
	short i_cut;
	short i_paste;
	short i_dup;
	short i_save;
	short i_pastepic;
	short i_edit;
	short i_range;
	short i_lineup;
	short i_fixwidth;
	short i_size;
	short i_hide;
	short i_show;
	short i_selectall;
	short i_find;
	short i_findagain;
	short i_replace;
	short i_print;
	short i_font;
	short i_color;
	short i_savecoll;
	short i_noclick;
	short i_respond;
	short i_front;
	short i_back;
	short i_lockbg;
	short i_showbg;
	short i_showfg; 
	short i_includebg;
	short i_excludebg;
	short i_coloritem;
	short i_setorigin;
	short i_restoreorigin;
	short i_name;
	short i_showconnections;
	short i_showpal;
	short i_pastereplace;
} Menuinfo, t_menuinfo;

// zll: used in a funbuff

typedef struct zll		/* doubly linked list */
{											/* note:  no obj header  */
	long	z_x;
	long	z_y;
	struct zll *z_next;
	struct zll *z_prev;
} t_zll,Zll;

// funbuff: the structure of a funbuff object

typedef struct funbuff
{
	t_object f_obj;
	void *f_outlet;
	void *f_outlet1;
	void *f_outlet2;
	t_zll f_head;	   	/* head of double linked list of function elements */
	t_zll *f_foot;		/* foot in the door pointer for list  */
	long f_gotoDelta;		/* used by goto and next */
	long f_selectX;			/* selected region start   */
	long f_selectW;			/* selected region width   */
	t_symbol *f_sym;	/* filename */
	long f_y;				/* y-value from inlet */
	char f_yvalid;			/* flag that y has been set since x has */
	char f_embed;			/* flag for embedding funbuff values in patcher */
} t_funbuff,Funbuff;

// numerical structure, used in tables and available for externs that make windows

#define N_HILITE 1
#define N_RIGHT 2
#define N_LEFT  4
#define N_FRAME 8
#define N_CLIP 16
#define N_ENDTRACK 32
#define N_BOLD 64
#define N_FREE 128

typedef struct num {
	t_tinyobject n_ob;
	long n_max,n_min,n_val;
	void *(*n_draw)();
	void *(*n_track)();
	void *(*n_inc)();
	Rect n_outline;
	Point n_start;
	int n_hilite;
	int n_font,n_fsize;
	long n_flags;
	void *n_arg;
	GrafPtr n_port;
} t_numerical, Numerical;

#define DEFSIZE 128		/* default size 128 elements */
#define DEFRANGE 128	/* range 0-127 */
#define ELEM long	/* table element type */

// tabwind: the structure associated with a table window

typedef struct tabwind
{
	t_object w_ob;
	t_wind *w_wind;
	t_symbol *w_sym;
	ELEM **w_tab;
	long w_size;		/* size of actual table */
	long w_range;		/* editable range (y values) */
	long w_xoff;		/* x-value of first point displayed */
	long w_yoff;		/* y-value of top line */
	long w_xshift;		/* x-shift for displaying */
	long w_yshift;		/* y-shift */
	long w_xzoom;		/* x zoom */
	long w_yzoom;		/* y zoom */
	long w_cliprange;	/* range, anded to be 0 mod 1 << w_xzoom */
	long w_dpoints;		/* display points (size >> xshift rounded up) */
	long w_dragx;		/* previous x-value changed by dragging */
	long w_selstart;	/* starting sample of selected region (inclusive) */
	long w_selend;		/* ending sample of selected region (exclusive) */
	long w_saveno;		/* <a> added; serial number of last time saved to prevent duplicates */
	void *w_clock;		/* <a> clock to delay updating */
	void *w_qelem;		/* <a> qelem to queue updating to low pri */
	short w_xdisp;		/* number of points displayed */
	short w_ydisp;		/* number of y-values displayed */	
	char w_signed;		/* flag for signed display */
	char w_clkset;		/* <a> flag indicating clock is already set */
	char w_selmode;		/* tool 0 = select,1 = move,2 = line,3 = pencil */
	long w_xwas;       	/* last x value legended */
	long w_ywas;		/* last x value legended */
	short w_xcenter;		/* last x point legend drawn at */
	short w_ycenter;		/* last y point legend drawn at */
	Point w_scroll;     /* last known scroll values, a la Patcher */
	char w_ylegmode;    /* 0 for Y legend as numbers,
							1 for notes.  w_signed turns this off */
	char w_embed;		/* save it in a patcher */
	char w_crossguide;	/* show cross guide */
	char w_act;			/* activated? */
	long w_vwas;		/* last value legended */
	struct num *w_numrange;	/* range numerical */
	struct num *w_numsize;	/* size numerical */
	struct table *w_reftab;	/* list of reference tables */
	struct object *w_client;	/* send "tabchanged" message when table is changed */
	short w_xscale;		/* scrollbar scaling when values > 16 bits */
	short w_yscale;
} t_tabwind, Tabwind;

// user interface object structures

// the box is used by patcher user interface objects

typedef struct box
{
	t_object b_ob;

	short b_inlet:1;			/* this box is an inlet */
	short b_outlet:1;			/* this box is an outlet */
	short b_textdirty:1;		/* text has been changed */
	short b_drawfirstin:1;	/* draw inlet for the real object */
	short b_outline:1;		/* draw the box */
	short b_drawn:1;			/* has been drawn */
	short b_spooled:1;		/* is spooled for drawing */
	short b_growy:1;			/* can grow in y direction */
	unsigned short b_inset:3;	/* top-and-bottom inset for text */
	short b_selected:1;		/* on if selected */
	unsigned short b_color:4;	/* index into palette (default 0) */
	unsigned short b_fsize;	/* font size */
	short b_fontindex;		/* font index (get from window) */
	short b_growboth:1;		/* can grow independently in both directions */
	short b_ignorelockclick:1; /* ignore clicks if patcher is locked (be "transparent") */
	short b_hidden:1;			/* hide box on lock */
	short b_nogrow:1;			/* don't grow at all */
	short b_hilited:1;		/* hilited, typeable object */
	short b_pending:1;		/* typing is pending */
	short b_hiliteable:1;		/* hiliteable object */
	short b_nofloatinsp:1;		/* don't show a floating inspector */
	short b_saveselect:1;		/* save select state when window is not active */
	short b_undo:2;			/* undo bit */
	short b_bogus:1;			/* box's bogus bit--patcher creates its inlets/outlets on connect */
	short b_checkinvis:1;		/* check when invizzing */
	short b_visible:1;		/* for vnewobj patchers, is box visible? */
	short b_drawinlast:1;		/* used by vnewobj, inlet, outlet to draw inlets/outlets */
	short b_dynamic:1;
	short b_temp2:1;			// used by bagline/saveline
	short b_ignoreclick:1;	/* user setting for ignoring a lock click */
	short b_background:1;	// part of background
	short b_transparent:1;
	short b_clipaware:1;
	short b_temp3:1;
	short b_unused:3;		/* extra space for future bits */
	short b_temp;					/* temporary space */
	struct box *b_upd;		/* used in saving */
	Rect b_rect;					/* location */
	struct box *b_next;				/* next box in patcher */
	struct patcher *b_patcher;		/* owning patcher */
	void *b_firstin;				/* first inlet if nonzero */
	void *b_binbuf;					/* contained message in binary */
	union
	{
		void *b_vpout;		/* patchoutlet in this patcher's visobj */
		void *b_vpin;		/* patchinlet in this patcher's visobj */
		void *b_teh;		/* text editor handle */
	} b_un;
} t_box, Box;

// box flags

#define F_DRAWFIRSTIN	1		/* draw first inlet */
#define F_GROWY			2		/* can grow in y direction by dragging */
#define F_NODRAWBOX		4		/* don't draw the box  */
#define F_MOVING		8
#define F_DRAWN 		16
#define F_GROWBOTH		32		/* can grow independently in both x and y */
#define F_IGNORELOCKCLICK 64    /* box should ignore a click if patcher is locked */
#define F_NOGROW		128
#define F_HILITE		256
#define F_DRAWINLAST	512		/* draw inlets after update method */
#define F_TRANSPARENT	1024
#define F_SAVVY			2048
#define F_BACKGROUND	4096
#define F_NOFLOATINSPECTOR 8192	// no floating inspector window

// clipregion message

#define CLIPRGN_REGION 0
#define CLIPRGN_RECT 1
#define CLIPRGN_EMPTY 2
#define CLIPRGN_COMPLEX 3

// other constants

#define POX 10	/* patcher outlet width and height */
#define POY 3
#define SIZE1 15	/* frequently used control dimensions */
#define SIZE2 50
#define UNIT 256
#define USHIFT 8

// font info for a patcher during save

typedef struct _fontinfo
{
	t_symbol *f_name;
	short f_number;
	double f_size;
	long f_reserved;
} t_fontinfo;

// the patcher

enum {
	PATCHER_WILLFRAME = 0,
	PATCHER_WILLFLAGS,
	PATCHER_WILLSIZE,
	PATCHER_WILLCLOSE,
	PATCHER_WILLGROW,
	PATCHER_WILLZOOM,
	PATCHER_WILLFLOAT,
	PATCHER_WILLCOUNT,
	PATCHER_WILLNOMAD
};

typedef struct patcher
{
	t_object p_ob;
	t_wind *p_wind;		/* window object */
	void *p_vnewobj;			/* containing box if any */
	void *p_instr;				/* associated instrument if any */
						/* graphing */
	struct box *p_boxupd;		/* list of boxes to redwraw */
	void *p_lineunused;			/* $ddz -- no longer used, lines to redraw */
	long p_whenupd;				/* when to redraw */
						/* selection and editing */
	void *p_updclock;			/* update clock */
	struct box *p_seltext;		/* if != 0, box to send keys to */
						/* other */
	struct box *p_box;			/* the boxes */
	struct patchline *p_line;	/* the lines */
	Rect p_span;				/* rectangle spanned by all boxes */
	Point p_scroll;				/* last known scroll values */
	void *p_pushed;				/* patcher we pushed to name this one "Pat" */
	struct box *p_hilited;		/* "operational selection" */
	void *p_parent;				/* parent object (eg. pr-type thing) */
	short p_nselect;				/* number of selected boxes */	
	short p_vol;					/* filesys volume to look up classes in */
	char p_lock;				/* on if the patcher is locked */
	char p_dirtybar;			/* on if the edit bar needs drawing */
	char p_noedit;				/* can't unlock this patcher */
	char p_enabled;				/* is MIDI enabled? */
	short p_pasted:1;				/* just did a paste (don't edit text) */
	short p_freed:1;				/* being freed, no need to redraw */
	short p_remote:1;				/* has remote version */
	short p_bghidden:1;				/* has host version */
	short p_traceactive:1;		/* making patcher active during trace */
	short p_tl:1;					/* timeline subpatcher? */
	short p_fghidden:1;
	short p_paranoid:1;			/* was "no unlock" variable true when this file read in? */
	char p_cursor;				/* index of the user interface object of the cursor */
	char p_loadbanged;			/* have I been loadbanged already? */
	char p_color;				/* is this patcher in color (mult devices only) == 4 for 16, 8 otherwise */
	void *p_hiout;				/* hilited outlet */
	struct box *p_hibox;		/* hilited outlet's box */
	void *p_okhook;				/* object to send okclose message to */
	long p_search;				/* search info field */
	void *p_assoc;				/* object (eg. lib) associated with this patcher */
	void *p_undo;				/* undo object */
	short p_deffont;				/* default font for new objects */
	short p_defsize;				/* default font size for new objects */
	void *p_collective;			/* collective record if this patcher comes from one */
	short p_idleicon;			/* icon last assisted in idle */
	char p_savewindow;			/* save window info in patcher */
	char p_filler;				/* while we're adding fields... */
	void *p_vartab;				// script variable table
	Point p_origin;				// current relative offset of the 0-0 point, patcher will be opened with this set to 0,0
	void *p_bpushed;			// previous box before patcher was made
	Rect *p_invalrect;			// when box_invalnow is happening, what's the clip rect?
	short p_hideconnections:1;	// connections hidden/uneditable
	short p_hidepalette:1;
	short p_windowchanging:1;	// currently inside window exec
	short p_unused2:5;
	long p_findindex;
	short p_defcolor;			// default color for new objects
	void *p_savehilitebox;		// saved hilited box (rather than bit in box)
	short p_bglocked:1;			// is patcher background locked?
	short p_scriptmakingnew:1;			// is patcher background locked?
	void *p_pvartab;			// pvar table
	RGBColor p_bgcolor;			// background color (default white)
	void *p_printport;			// printing port if in use
	char p_willwinds[PATCHER_WILLCOUNT];
	Rect p_willframe;
	t_fontinfo *p_setfont;
	short p_saveboxoffsetx;		// used during the patcher loading process to preserve paste offset
	short p_saveboxoffsety;
} t_patcher, Patcher;


#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(pop)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack()
#endif

#ifdef __cplusplus
}
#endif

#endif // _EXT_MAXTYPES_H_


