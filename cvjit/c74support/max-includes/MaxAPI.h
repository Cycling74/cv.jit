/*
 *  MaxAPI.h
 *  MaxAPI
 *
 *  Created by Topher LaFata on 10/30/05.
 *  Copyright 2005 Cycling '74 All rights reserved.
 *
 */

#include <MaxAPI/ext.h>
#include <MaxAPI/ext_anim.h>
#include <MaxAPI/ext_byteorder.h>
#include <MaxAPI/ext_colors.h>
#include <MaxAPI/ext_common.h>
#include <MaxAPI/ext_critical.h>
#include <MaxAPI/ext_dict.h>
#include <MaxAPI/ext_event.h>
#include <MaxAPI/ext_expr.h>
#include <MaxAPI/ext_fun.h>
#include <MaxAPI/ext_obex.h>
#include <MaxAPI/ext_hashtab.h>
#include <MaxAPI/ext_linklist.h>
#include <MaxAPI/ext_maxtypes.h>
#include <MaxAPI/ext_menu.h>
#include <MaxAPI/ext_mess.h>
#include <MaxAPI/ext_midi.h>
#include <MaxAPI/ext_numc.h>
#include <MaxAPI/ext_path.h>
#include <MaxAPI/ext_prefix.h>
#include <MaxAPI/ext_proto.h>
#include <MaxAPI/ext_qtimage.h>
#include <MaxAPI/ext_qtstubs.h>
#include <MaxAPI/ext_sndfile.h>
#include <MaxAPI/ext_support.h>
#include <MaxAPI/ext_sysfile.h>
#include <MaxAPI/ext_sysinfo.h>
#include <MaxAPI/ext_sysmem.h>
#include <MaxAPI/ext_sysmenu.h>
#include <MaxAPI/ext_sysmidi.h>
#include <MaxAPI/ext_systhread.h>
#include <MaxAPI/ext_systime.h>
#include <MaxAPI/ext_timeline.h>
#include <MaxAPI/ext_track.h>
#include <MaxAPI/ext_types.h>
#include <MaxAPI/ext_user.h>
#include <MaxAPI/ext_wind.h>
#include <MaxAPI/edit.h>

//these now have implementations in macho-exports.c in MaxAPI project
void ctopcpy(unsigned char *p1, char *p2);
void ptoccpy(char *p1, unsigned char *p2);
void setmem(void *s, long n, short b);
void pstrcpy(unsigned char *p2, unsigned char *p1);



