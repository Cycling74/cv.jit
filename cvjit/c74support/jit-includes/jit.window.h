
// jit.window.h
//
// author: randall jones
// © 2001 cycling '74

#ifndef __JIT_WINDOW_H__
#define __JIT_WINDOW_H__

#if TARGET_RT_MAC_MACHO
// don't need these includes
#else
#include <Devices.h>
#include <Dialogs.h>
#include <DriverServices.h>
#include <Events.h>
#include <LowMem.h>
#include <TextEdit.h>
#include <ToolUtils.h>
#include <Windows.h>
#include <MacWindows.h>

#include <math.h>
#include <stdio.h>
#endif

#ifndef WIN_VERSION //win_todo
#if TARGET_RT_MAC_MACHO
#include <AGL/agl.h>
#include <GLUT/glut.h>
#else
#include "agl.h"
#include "glut.h"
#endif
#endif
#include "jit.common.h"

#ifndef __max_ext_wind_h
#define __max_ext_wind_h
        #include "ext_wind.h"
#endif

// t_jit_window flags
#define JIT_WINDOW_USING_GL                     1 << 0
#define JIT_WINDOW_NO_ACCEL                     1 << 1

#define MIN_WIND_DIM    9
#define MAX_WIND_COORD  8192


#ifdef __cplusplus
extern "C" {
#endif

void jit_window_dragcheck(void *x);
t_jit_err jit_window_init(void);

#ifdef __cplusplus
}
#endif


#endif //__JIT_WINDOW_H__
