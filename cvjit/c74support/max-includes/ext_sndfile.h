#ifndef _EXT_SNDFILE_H_
#define _EXT_SNDFILE_H_

#ifdef __cplusplus
extern "C" {
#endif

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(push, 2)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack(2)
#endif

typedef struct _sndfileinfo
{
	long sr;
	long length;
	long sampsize; // in bytes
	unsigned long filetype;
	unsigned long comptype;
	unsigned long format;
	char name[128];
	long byteswap;
	long nchans;
	long frames;
	void *inst;
	void *markers;
	long framesize;
	long offset;
} t_sndfileinfo;

short sndfile_info(char *filename, short vol, unsigned long type, t_sndfileinfo *info);

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(pop)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack()
#endif

#ifdef __cplusplus
}
#endif

#endif // _EXT_SNDFILE_H_
