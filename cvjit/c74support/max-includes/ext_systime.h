
#ifndef _SYSTIME_H_
#define _SYSTIME_H_

#ifdef __cplusplus
extern "C" {
#endif

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(push, 2)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack(2)
#endif


// systime.c
typedef struct _datetime 
{
	unsigned long	year;
	unsigned long	month;
	unsigned long	day;
	unsigned long	hour;
	unsigned long	minute;
	unsigned long	second;
	unsigned long	millisecond;  //rfu
} t_datetime;

extern unsigned long systime_ticks(void);
extern unsigned long systime_ms(void);
extern void systime_datetime(t_datetime *d);
extern unsigned long systime_seconds(void);
extern void systime_secondstodate(unsigned long secs, t_datetime *d);
extern unsigned long systime_datetoseconds(t_datetime *d);

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(pop)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack()
#endif

#ifdef __cplusplus
}
#endif

#endif // _SYSTIME_H_

