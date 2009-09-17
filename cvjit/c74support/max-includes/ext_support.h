#ifndef _EXT_SUPPORT_H_
#define _EXT_SUPPORT_H_

enum
{
	f_setup,		/* set up class */
	f_addmess,		/* add an incoming message */
	f_addbang,		/* add a "bang" message ... */
	f_addint,		/* "int" */
	f_addfloat,		/* "float" */
	f_addinx,		/* "in1", etc */
	f_addftx,		/* "ft1", etc */
	f_newobject,	/* get space for this class */
	f_getbytes,		/* get a given amount of space */
	f_freebytes,	/* release it */
	f_intin,		/* add an "int" inlet ... */
	f_floatin,		/* "float" */
	f_outlet_new,	/* add an outlet */
	f_bangout,		/* add a "bang" outlet ... */
	f_intout,		/* "int" */
	f_floatout,		/* "float" */
	f_listout,		/* "list" */
	f_outlet_bang,	/* send "bang" to an outlet ... */
	f_outlet_int,	/* "int" */
	f_outlet_float,	/* "float" */
	f_outlet_list,	/* "list" */
	f_outlet_anything,	/* any message */
	f_gensym,		/* convert a string to a symbol */
	f_clock,		/* make a new clock */
	f_clock_set,	/* set it, absolute time */
	f_clock_delay,	/* set it */
	f_clock_unset,	/* unset it */
	f_clock_free,	/* free it */
	f_gettime,
		/* advanced (mostly for window control access) */
	f_qelem,
	f_qelem_set,
	f_qelem_unset,
	f_qelem_free,
	f_newhandle,	/* get a new handle */
	f_disposhandle,	/* release it */
	f_growhandle,	/* grow it */
	f_post,			/* debugging printout */
	f_wind,			/* make a new window */
	f_wind_free,		/* free a window */
	f_wind_vis,			/* make it visible */
	f_wind_invis,		/* make it invisible */
	f_wind_setport,		/* set grafport to window (returns old one) */
	f_wind_settitle,	/* set filename and volume */
	f_wind_dirty,		/* dirty the window */
	f_wind_setsmax,		/* set maxima of scrollbars */
	f_wind_setsval,		/* set values of scrollbars */
	f_wind_drag,		/* start a drag */
	f_wind_defaultscroll,		/* default scrolling action */
	f_defvolume,		/* get default volume number */
	f_binbuf_new,		/* get new binbuf */
	f_binbuf_free,		/* dispose of binbuf */
	f_binbuf_vinsert,	/* insert into binbuf, formatted */
	f_binbuf_insert,	/* insert raw */
	f_binbuf_eval,		/* evaluate contents */
	f_binbuf_getatom,	/* look at contents */
	f_binbuf_text,		/* convert text to binbuf */
	f_binbuf_totext,	/* convert binbuf to text */
	f_sprintf,			/* sprintf */
	f_sscanf,			/* sscanf */
	f_cpytext,			/* tell everyone you copied text */
	f_typedmess,		/* send a message, typechecked args */
	f_binbuf_set,		/* set contents of binbuf, raw */
	f_binbuf_append,	/* append to contents of binbuf, raw */
	f_patcher_setport,	/* set grafport to patcher's window, if visible */
	f_box_new,			/* a new box */
	f_box_free,			/* free the box */
	f_box_ready,		/* select the box when creating */
	f_patchbox,			/* utility to call function with size */
	f_lockout_set,		/*  set lockout, returns previous value */
	f_patcher_dirty,	/* dirty the object's owning patcher */
	f_patcher_selectbox,/* select a box */
	f_patcher_deselectbox, /* "unselect" a box */
	f_drawstr,			/* draw a c string at the current pen location */
	f_binbuf_savebox,	/* save a box to a binbuf */
	f_textbox,			/* utility to call function and create a box with text */
	f_box_ownerlocked,	/* returns 1 if box's owning patcher locked */
	f_box_size,			/* resize a box */
	f_rescopy,			/* copy your resource to Max's temporary file */
	f_inlet_new,		/* create a general inlet */
	f_wind_noworrymove,	/* don't worry if mouse doesn't move */
	f_wind_setundo,		/* set the text of the Undo menu item */
	f_getschedtime,		/* get time within clock function */
	f_getexttime,		/* get time of external clock */
	f_clock_xdelay,		/* clock_delay for external clock */
	f_clock_xset,		/* clock_set for external clock */
	f_clock_xunset,		/* clock_unset for external clock */
	f_clock_getextfmt,	/* get format of external clock */
	f_isr,				/* are we at interrupt level? */
	f_maxversion,		/* return MAX version number */
	f_table_get,		/* gets table handle and size (returns 0 if success) */
	f_table_dirty,		/* marks table as having changed */
	f_binbuf_read,		/* read a binbuf from a file */
	f_binbuf_write,		/* write a binbuf to a file */
	f_ouchstring,		/* alert box */
	f_palette,			/* return the current palette */
	f_ispatcher,		/* patcher's messlist */
	f_isnewex,			/* newex's messlist */
	f_newex_knows, 		/* does the box's newex object know this message? */
	f_expr_new,			/* create a new expression */
	f_expr_eval,		/* evaluate an expression */
	f_expr_free,		/* free an expression */
	f_freeobject,		/* free an object made with newobject */
	f_error,			/* error message, like post */
	f_preset_store,		/* store stuff into a preset */
	f_preset_set,		/* easier storage of a single item */
	f_preset_int,		/* storage with int message (preferred) */
	f_colorinfo,		/* get system color variables */
	f_finder_addclass,	/* add class name to finder list */
	f_newinstance,		/* send a message to the "new" object */
	f_getfn,			/* get function assoc with message */
	f_egetfn,			/* get function assoc with message */
	f_zgetfn,			/* get function assoc with message */
	f_ed_new,			/* open a new edit window */
	f_ed_vis,			/* make edit visible */
	f_ed_free,			/* dispose of edit window */
	f_ed_settext,		/* set edit window text */
	f_readatom,			/* read an atom from text */
	f_open_dialog,		/* standard file open dialog wrapper */
	f_saveas_dialog, 	/* standard file saveas dialog wrapper */
	f_locatefile,		/* locate a file in current paths */
	f_inlet4,			/* secret */
	f_inlet_to,			/* secret */
	f_patcher_okclose,	/* set receiver of patcher's okclose message */
	f_advise,			/* put up Yes/No/Cancel alert */
	f_qelem_front,		/* set qelem at front of queue (don't overuse) */
	f_enbugger,			/* re-enable debugger */
	f_evnum_incr,		/* increment global event counter */
	f_evnum_get,		/* get global event counter */
	f_patcher_eachdo,	/* do something in each patcher */
	f_box_nodraw,		/* ok to draw a box (is hidden & locked?) */
	f_wind_setcursor,	/* set the cursor to something */
	f_num_new,			/* new numerical */
	f_num_draw,			/* draw numerical */
	f_num_hilite,		/* hilite numerical */
	f_num_test,			/* test numerical */
	f_num_track,		/* track numerical */
	f_num_setvalue,		/* set numerical value */
	f_proxy_new,		/* new proxy object */
	f_gwind_new,		/* new graphics window */
	f_gwind_offscreen,	/* make offscreen for graphics */
	f_gwind_setport,	/* set graphics port */
	f_gwind_get,		/* get gwind from symbol */
	f_off_new,			/* new offscreen */
	f_off_free,			/* free offscreen */
	f_sprite_new,		/* new sprite */
	f_sprite_moveto,	/* move sprite abs */
	f_off_maxrect,		/* determine big clipped rect */
	f_sprite_move,		/* move delta */
	f_sprite_redraw,	/* move & change delta */
	f_off_copy,			/* copy off to screen */
	f_sprite_draw,		/* draw sprite at current loc */
	f_sprite_erase,		/* erase sprite */
	f_sprite_rect,		/* change sprite rectangle & change */
	f_off_tooff,		/* unused */
	f_off_size,		/* fix color table of offscreen */
	f_off_copyrect,		/* copy part of offscreen to screen */
	f_alias,				/* object can be called more than one thing */
	f_locatefiletype,	/* locate a file of type X creator Y */
	f_midiinfo,			/* get info about MIDI Manager */
	f_serialno,			/* get count for saving check */
	f_postatom,			/* post a single thing without cr */
	f_sprite_newpriority, /* change sprite priority */
	f_assist_string,	/* respond to assist message */
	f_box_erase,		/* erase and have patcher redraw box */
	f_defer,			/* defer a function call if at interrupt level */
	f_defer_low,		/* same, but always defers & at lower priority */
	f_callback_new,	 	/* make A5-based callback */
	f_locatefilelist,	/* locatefile with list of types */
	f_resnamecopy,		/* copy named resource */
	f_binbuf_delete,	/* delete part of a binbuf (low level) */
	f_force_install,	/* force a class to be loaded pretty soon now */
	f_sched_suspend,	
	f_sched_resume,		
	f_readtohandle,		/* read a file like a text file into a handle */
	f_fileload,			/* load a patcher file */
	f_intload,			/* " " inside a patcher */
	f_outlet_add,
	f_outlet_rm,
	f_box_color,		/* set PmForeColor to box color */
	f_box_getcolor,		/* get RGB values of palette color of a box */
	f_assist_drawstr,	/* draw any string in the assistance area */
	f_schedule,			/* make a clock, call a function */
	f_usecolor,			/* should I be drawing this rect in color? */
	f_palette_getcolor,	/* get color of palette index */
	f_f_fopen,
	f_fclose,
	f_fprintf,
	f_fscanf,
	f_fseek,
	f_message_register,
	f_editor_register,
	f_atombuf_new,
	f_atombuf_free,
	f_atombuf_text,
	f_event_new,
	f_event_box,
	f_message_patcherRegister,
	f_bf_singlefast,
	f_open_promptset,
	f_saveas_promptset,
	f_stringload,
	f_resource_install,
	f_toolfile_new,
	f_toolfile_fread,
	f_toolfile_fwrite,
	f_wind_filename,
	f_wind_close,
	f_wind_nocancel,
	f_wind_inhscroll,
	f_wind_setbin,
	f_class_noinlet,
	f_expr_install,
	f_dialog_poll,
	f_message_unregister,
	f_message_patcherUnregister,
	f_connection_client,
	f_connection_server,
	f_connection_send,
	f_connection_delete,
	f_toolfile_getc,
	f_debug_printf,
	f_event_spool,
	f_event_schedule,
	f_track_clipBegin,
	f_track_clipEnd,
	f_event_offsetRect,
	f_track_eraseDragTime,
	f_track_drawDragParam,
	f_track_drawDragTime,
	f_track_drawTime,
	f_track_pixToMS,
	f_track_MSToPix,
	f_track_posToMS,
	f_track_MSToPos,
	f_track_setport,
	f_event_clock,
	f_linkThing_new,
	f_event_avoidRect,
	f_event_save,
	f_tabfromhandle,
	f_stdlist,
	f_setclock_delay,
	f_setclock_unset,
	f_setclock_gettime,
	f_patcher_avoidrect,
	f_collective_load,
	f_oms_writetime,
	f_oms_beat2smpte,
	f_oms_smpte2beat,
	f_oms_getframerate,
	f_getsmptetime,
	f_assist_queue,
	f_clock_fdelay,
	f_setclock_fdelay,
	f_clock_getftime,
	f_setclock_getftime,
	f_wind_syswind
};

#endif /* _EXT_SUPPORT_H_ */

