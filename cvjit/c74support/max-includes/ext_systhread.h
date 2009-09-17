#ifndef _EXT_SYSTHREAD_H_
#define _EXT_SYSTHREAD_H_

#ifdef __cplusplus
extern "C" {
#endif

typedef void *t_systhread;
typedef void *t_systhread_mutex;
typedef void *t_systhread_cond;

// systhread_mutex_new flags
#define SYSTHREAD_MUTEX_NORMAL		0x00000000
#define SYSTHREAD_MUTEX_ERRORCHECK	0x00000001
#define SYSTHREAD_MUTEX_RECURSIVE	0x00000002

long systhread_create(method entryproc, void *arg, long stacksize, long priority, long flags, t_systhread *thread);
long systhread_terminate(t_systhread thread);	// kill a thread -- not recommended
void systhread_sleep(long milliseconds);
void systhread_exit(long status);				// call this from your threadproc to exit thread.
long systhread_join(t_systhread thread, unsigned int* retval);	// wait for thread to quit, and get return value. 
t_systhread systhread_self(void);
char *systhread_getstackbase(void);
void systhread_init(void);
void systhread_mainstacksetup(void);
void systhread_timerstacksetup(void);
short systhread_stackcheck(void);
short systhread_ismainthread(void);
short systhread_istimerthread(void);
long systhread_mutex_new(t_systhread_mutex *pmutex,long flags);
long systhread_mutex_free(t_systhread_mutex pmutex);
long systhread_mutex_lock(t_systhread_mutex pmutex);
long systhread_mutex_unlock(t_systhread_mutex pmutex);
long systhread_mutex_trylock(t_systhread_mutex pmutex);
long systhread_mutex_newlock(t_systhread_mutex *pmutex,long flags); // combo util of new + lock
long systhread_cond_new(t_systhread_cond *pcond, long flags);
long systhread_cond_free(t_systhread_cond pcond);
long systhread_cond_wait(t_systhread_cond pcond, t_systhread_mutex pmutex);
long systhread_cond_signal(t_systhread_cond pcond);
long systhread_cond_broadcast(t_systhread_cond pcond);


#ifdef __cplusplus
}
#endif

#endif // _EXT_SYSTHREAD_H_

