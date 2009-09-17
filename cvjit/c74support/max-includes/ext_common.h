/* common.h -- those things we define often */
#ifndef _EXT_COMMON_H_
#define _EXT_COMMON_H_

#define InRange(v,lo,hi) ((v)<=(hi)&&(v)>=(lo))
#define MAX(a,b) ((a)>(b)?(a):(b))
#define MIN(a,b) ((a)<(b)?(a):(b))
#define CLIP(a, lo, hi) ( (a)>(lo)?( (a)<(hi)?(a):(hi) ):(lo) )
#define OSTAsChars(x) (int)((x)>>24)&0xFF,(int)((x)>>16)&0xFF,(int)((x)>>8)&0xFF,(int)((x)&0xFF)

#define RetKey 13
#define EnterKey 3
#define SpaceBar 32
#define BackSpace 8
#define BackSlash 0x5C
#define VertBar 0x7C
#define Grave 0x60
#define Tilde 0x7E
#define TabKey 9
#define ClearKey 27
#define OptionSpace 202

#endif /* _EXT_COMMON_H_ */
