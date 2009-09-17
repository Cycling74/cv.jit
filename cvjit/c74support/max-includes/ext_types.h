#ifndef __EXT_TYPES_H__
#define __EXT_TYPES_H__

#ifdef MAC_VERSION
#ifdef __MOTO__
#include <Types.h>
#include <Quickdraw.h>
#endif // __MOTO__
#endif // MAC_VERSION

#ifdef WIN_VERSION

#ifdef INCLUDE_APPLE_HEADERS
#include <MacTypes.h>
#include <Quickdraw.h>
#include <Controls.h>
#else
#ifndef FOUR_CHAR_CODE
#define FOUR_CHAR_CODE(x) (x)
#endif

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(push, 2)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack(2)
#endif


#ifndef nil
#define nil NULL
#endif

#ifndef __cplusplus
enum {
  false                         = 0,
  true                          = 1
};
#endif


typedef unsigned char                   UInt8;
typedef signed char                     SInt8;
typedef unsigned short                  UInt16;
typedef signed short                    SInt16;
typedef unsigned long                   UInt32;
typedef signed long                     SInt32;

typedef long                            Fixed;
typedef Fixed *                         FixedPtr;
typedef long                            Fract;
typedef Fract *                         FractPtr;
typedef unsigned long                   UnsignedFixed;
typedef UnsignedFixed *                 UnsignedFixedPtr;
typedef short                           ShortFixed;
typedef ShortFixed *                    ShortFixedPtr;

typedef char *                          Ptr;
typedef Ptr *                           Handle;
typedef long                            Size;

typedef SInt16                          OSErr;
typedef SInt32                          OSStatus;
typedef UInt8 *                         BytePtr;
typedef unsigned long                   FourCharCode;
typedef FourCharCode                    OSType;
typedef FourCharCode                    ResType;
typedef OSType *                        OSTypePtr;
typedef ResType *                       ResTypePtr;

typedef unsigned char                   Boolean;

typedef long ProcPtr();

enum {
  noErr                         = 0
};

typedef unsigned char                   Str255[256];
typedef unsigned char                   Str63[64];
typedef unsigned char                   Str32[33];
typedef unsigned char                   Str31[32];
typedef unsigned char                   Str27[28];
typedef unsigned char                   Str15[16];

struct Point {
  short               v;
  short               h;
};
typedef struct Point                    Point;
typedef Point *                         PointPtr;
struct Rect {
  short               top;
  short               left;
  short               bottom;
  short               right;
};
typedef struct Rect                     Rect;
typedef Rect *                          RectPtr;
struct FixedPoint {
  Fixed               x;
  Fixed               y;
};
typedef struct FixedPoint               FixedPoint;
struct FixedRect {
  Fixed               left;
  Fixed               top;
  Fixed               right;
  Fixed               bottom;
};
typedef struct FixedRect                FixedRect;

typedef UInt8                           Byte;
typedef SInt8                           SignedByte;

// Quickdraw Placeholders
typedef struct GrafPort					WindowRecord;
typedef struct GrafPort*				WindowPtr;
typedef WindowPtr                       DialogPtr;
typedef WindowRecord *                  WindowPeek;

struct GrafPort {
	long	opaque;
};
typedef struct GrafPort					GrafPort;
typedef struct GrafPort*				GrafPtr;

struct CGrafPort {
	long	opaque;
};
typedef struct CGrafPort				CGrafPort;
typedef struct CGrafPort*				CGrafPtr;

struct PixMap {
	long	opaque;
};
typedef struct PixMap					PixMap;
typedef struct PixMap*					PixMapPtr;
typedef struct PixMap**					PixMapHandle;

struct BitMap {
	long	opaque;
};
typedef struct BitMap					BitMap;
typedef struct BitMap*					BitMapPtr;

struct MacRegion {
	long	opaque;
};
typedef struct MacRegion				MacRegion;
typedef struct MacRegion*				RgnPtr;
typedef RgnPtr *                        RgnHandle;

struct RGBColor {
  unsigned short      red;
  unsigned short      green;
  unsigned short      blue;
};
typedef struct RGBColor                 RGBColor;
typedef RGBColor *                      RGBColorPtr;

struct GWorld {
	long	opaque;
};
typedef struct GWorld					GWorld;
typedef struct GWorld *					GWorldPtr;


// Control Placeholders
struct ControlRecord {
	long	opaque;
};
typedef struct ControlRecord            ControlRecord;
typedef ControlRecord *                 ControlPtr;
typedef ControlPtr *                    ControlRef;
typedef ControlRef                      ControlHandle;

// File placeholders
struct FSSpec {
	long	opaque;
};
typedef struct FSSpec                   FSSpec;
typedef FSSpec *                        FSSpecPtr;

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(pop)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack()
#endif


#endif // INCLUDE_APPLE_HEADERS

#endif // WIN_VERSION

#endif // __EXT_TYPES_H__
