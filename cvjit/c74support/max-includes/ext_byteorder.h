#ifndef _BYTEORDER_H_
#define _BYTEORDER_H_

#ifdef MAC_VERSION
#if TARGET_RT_LITTLE_ENDIAN
#define C74_LITTLE_ENDIAN 1
#define C74_BIG_ENDIAN 0
#else
#define C74_LITTLE_ENDIAN 0
#define C74_BIG_ENDIAN 1
#endif
#endif // MAC_VERSION

#ifdef WIN_VERSION

#define C74_LITTLE_ENDIAN 1
#define C74_BIG_ENDIAN 0

#endif // WIN_VERSION

#define BYTEORDER_SWAPW16(x) ((short)(((((unsigned short)(x))>>8)&0x00ff)+((((unsigned short)(x))<<8)&0xff00)))
#define BYTEORDER_SWAPW32(x) ((long)(((((unsigned long)(x))>>24L)&0x000000ff)+((((unsigned long)(x))>>8L)&0x0000ff00)+ \
									((((unsigned long)(x))<<24L)&0xff000000)+((((unsigned long)(x))<<8L)&0x00ff0000)))
#define BYTEORDER_SWAPF32 byteorder_swapf32
#define BYTEORDER_SWAPF64 byteorder_swapf64

float byteorder_swapf32(float f);
double byteorder_swapf64(double f);

#if C74_BIG_ENDIAN
#define BYTEORDER_LSBW16(x) 		BYTEORDER_SWAPW16(x)
#define BYTEORDER_LSBW32(x) 		BYTEORDER_SWAPW32(x)
#define BYTEORDER_LSBF32(x) 		BYTEORDER_SWAPF32(x)
#define BYTEORDER_LSBF64(x) 		BYTEORDER_SWAPF64(x)
#define BYTEORDER_MSBW16(x) 		(x)
#define BYTEORDER_MSBW32(x) 		(x)
#define BYTEORDER_MSBF32(x)			(x)
#define BYTEORDER_MSBF64(x) 		(x)
#else
#define BYTEORDER_LSBW16(x) 		(x)
#define BYTEORDER_LSBW32(x) 		(x)
#define BYTEORDER_LSBF32(x) 		(x)
#define BYTEORDER_LSBF64(x) 		(x)
#define BYTEORDER_MSBW16(x) 		BYTEORDER_SWAPW16(x)
#define BYTEORDER_MSBW32(x) 		BYTEORDER_SWAPW32(x)
#define BYTEORDER_MSBF32(x) 		BYTEORDER_SWAPF32(x)
#define BYTEORDER_MSBF64(x) 		BYTEORDER_SWAPF64(x)
#endif

#if C74_LITTLE_ENDIAN
#define STR_TO_FOURCC(x)	((x) = \
							(((unsigned long) ((x) & 0x000000FF)) << 24) | \
							(((unsigned long) ((x) & 0x0000FF00)) << 8)  | \
							(((unsigned long) ((x) & 0x00FF0000)) >> 8)  | \
							(((unsigned long) ((x) & 0xFF000000)) >> 24))\
							
#else
#define STR_TO_FOURCC(x)	(x)
#endif // C74_LITTLE_ENDIAN


#endif // _BYTEORDER_H