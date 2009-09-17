
#ifndef _SYSFILE_H_
#define _SYSFILE_H_



// sysfile.c
typedef void *t_filehandle;

// sysfile_setpos modes 
#define SYSFILE_ATMARK			0
#define SYSFILE_FROMSTART		1
#define SYSFILE_FROMLEOF		2
#define SYSFILE_FROMMARK		3

// flags for r/w textfile
#define TEXT_LB_NATIVE		0x01L
#define TEXT_LB_MAC			0x02L
#define TEXT_LB_PC			0x04L
#define TEXT_LB_UNIX		0x08L	

#ifdef __cplusplus
extern "C" {
#endif

extern long sysfile_close(t_filehandle f);
extern long sysfile_read( t_filehandle f, long *count, void *bufptr);
extern long sysfile_readtohandle(t_filehandle f, char ***h);
extern long sysfile_readtoptr(t_filehandle f, char **p);
extern long sysfile_write(t_filehandle f, long *count, const void *bufptr);
extern long sysfile_seteof(t_filehandle f, long logeof);
extern long sysfile_geteof(t_filehandle f, long *logeof);
extern long sysfile_setpos(t_filehandle f, long mode, long offset);
extern long sysfile_getpos(t_filehandle f, long *filepos);
long sysfile_spoolcopy(t_filehandle src, t_filehandle dst, long size);
void sysfile_setobject(t_filehandle f, t_object *o);

extern long sysfile_readtextfile(t_filehandle f, t_handle htext, long maxlen, long flags);
extern long sysfile_writetextfile(t_filehandle f, t_handle htext, long flags);

short sysfile_openhandle(char **h, long flags, t_filehandle *fh);
short sysfile_openptrsize(char *p, long length, long flags, t_filehandle *fh);


#ifdef __cplusplus
}
#endif

#endif // _SYSFILE_H_

