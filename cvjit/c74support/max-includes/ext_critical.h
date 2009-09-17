// critical.h -- platform-independent way to define critical regions

#ifndef _CRITICAL_H_
#define _CRITICAL_H_

#ifdef __cplusplus
extern "C" {
#endif

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(push, 2)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack(2)
#endif


#if TARGET_API_MAC_CARBON || defined(WIN_VERSION)

#define CRITICAL_DEFAULT 2000 * kDurationMillisecond

#ifdef WIN_VERSION

typedef LPCRITICAL_SECTION t_critical;
typedef unsigned long t_thread;

#endif /* WIN_VERSION */

#if TARGET_API_MAC_CARBON

typedef MPCriticalRegionID t_critical;
typedef ThreadID t_thread;

#endif /* TARGET_API_MAC_CARBON */

void critical_new(t_critical *x);
void critical_enter(t_critical x);
void critical_exit(t_critical x);
void critical_free(t_critical x);
short critical_tryenter(t_critical c);	// returns non-zero if there was a problem entering

#else	/* OS 9 version or another target that doesn't use/need critical regions */

#define CRITICAL_DEFAULT 0

typedef void *t_critical;
typedef long t_thread;

#define critical_new(x)
#define critical_enter(x)
#define critical_exit(x)
#define critical_free(x)
#define thread_getcurrent(x)	(*(x) = 0)
#define critical_tryenter(x)	(0)

#endif /* OS 9 version */

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(pop)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack()
#endif

#ifdef __cplusplus
}
#endif

#endif /* _CRITICAL_H_ */
