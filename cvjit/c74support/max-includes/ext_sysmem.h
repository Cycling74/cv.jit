
#ifndef _SYSMEM_H_
#define _SYSMEM_H_

#ifdef __cplusplus
extern "C" {
#endif

// sysmem.c
extern t_ptr sysmem_newptr(long size);
extern t_ptr sysmem_newptrclear(long size);
extern t_ptr sysmem_resizeptr(void *ptr, long newsize);
extern t_ptr sysmem_resizeptrclear(void *ptr, long newsize);
extern long sysmem_ptrsize(void *ptr);
extern void sysmem_freeptr(void *ptr);
extern void sysmem_copyptr(const void *src, void *dst, long bytes);
extern t_handle sysmem_newhandle(long size);
extern long sysmem_resizehandle(t_handle handle, long newsize);
extern long sysmem_handlesize(t_handle handle);
extern void sysmem_freehandle(t_handle handle);
extern long sysmem_lockhandle(t_handle handle, long lock);
extern long sysmem_ptrandhand(void *p, t_handle h, long size);

#ifdef __cplusplus
}
#endif

#endif // _SYSMEM_H_

