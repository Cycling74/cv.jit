
/*

	jit.bin.h
	Copyright 2001-2005 - Cycling '74
	Joshua Kit Clayton jkc@cycling74.com	

	jit binary file format(similar to AIFF/RIFF)

	All multibyte integers/floats are stored in BigEndian format.

	All chunks have:

	ckid 		- 4 byte char string
	cksize		- 32 bit int chunk size

*/

#ifndef _JIT_BIN_H_
#define _JIT_BIN_H_


#ifdef __cplusplus
extern "C" {
#endif

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(push, 2)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack(2)
#endif

#define JIT_BIN_MAC_TYPE  				FOUR_CHAR('JiT!')

#define JIT_BIN_VERSION_1 				0x3C93DC80 //2002/03/17 00:00:00 UTC

#define JIT_BIN_CHUNK_CONTAINER  		FOUR_CHAR('FORM')
#define JIT_BIN_CHUNK_FORMAT_VERSION  	FOUR_CHAR('FVER')
#define JIT_BIN_CHUNK_MATRIX  			FOUR_CHAR('MTRX')

#define JIT_BIN_FORMAT  				FOUR_CHAR('JIT!')

#define JIT_BIN_FILESIZE_UNKNOWN  		0xFFFFFFFF

#define JIT_BIN_TYPE_CHAR  				FOUR_CHAR('CHAR')
#define JIT_BIN_TYPE_LONG  				FOUR_CHAR('LONG')
#define JIT_BIN_TYPE_FLOAT32  			FOUR_CHAR('FL32')
#define JIT_BIN_TYPE_FLOAT64  			FOUR_CHAR('FL64')

typedef struct _jit_bin_chunk_container
{
	ulong	ckid; 		//'FORM'
	long	cksize;		//filesize
	ulong	formtype;	//'JIT!'
} t_jit_bin_chunk_container;

typedef struct _jit_bin_chunk_format_version
{
	ulong	ckid; 		//'FVER'
	long	cksize;		//12
	ulong	vers;		//timestamp
} t_jit_bin_chunk_format_version;

typedef struct _jit_bin_chunk_matrix
{
	ulong	ckid; 		//'MTRX'
	long	cksize;		//varies(should be equal to 24+(4*dimcount)+(typesize*planecount*totalpoints))
	long 	offset;		//data offset(should be equal to 24+(4*dimcount))
	ulong	type;		//'CHAR','LONG','FL32','FL64'
	long	planecount;
	long	dimcount;
	long	dim[1];
} t_jit_bin_chunk_matrix;


//later we can add things like variable/value pairs, attributes, 
//time code, comments, metadata, atom lists, audio, etc.

t_jit_err jit_bin_read_header(t_filehandle fh, ulong *version, long *filesize);
t_jit_err jit_bin_read_chunk_info(t_filehandle fh, ulong *ckid, long *cksize);
t_jit_err jit_bin_read_matrix(t_filehandle fh, void *matrix);

t_jit_err jit_bin_write_header(t_filehandle fh, long filesize);
t_jit_err jit_bin_write_matrix(t_filehandle fh, void *matrix);


#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(pop)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack()
#endif

#ifdef __cplusplus
}
#endif

#endif //_JIT_BIN_H_
