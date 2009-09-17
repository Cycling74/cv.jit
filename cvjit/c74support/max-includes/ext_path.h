#ifndef _EXT_PATH_H_
#define _EXT_PATH_H_

// ext_path.h -- path definitions

#ifdef __cplusplus
extern "C" {
#endif

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(push, 2)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack(2)
#endif


#if defined(MAC_VERSION) || defined(WIN_VERSION)

//#ifdef INCLUDE_APPLE_HEADERS
//#include <Files.h>
//#endif

typedef FSSpec PATH_SPEC;
typedef short FILE_REF;

#define SEPARATOR_CHAR		'/'
#define PATH_CROSS_PLAT_NAMES	

// PATH_STYLE_* + PATH_TYPE_* determine path_nameconform's behavior

#define PATH_STYLE_MAX				0		// use PATH_STYLE_MAX_PLAT
#define PATH_STYLE_NATIVE			1		// use PATH_STYLE_NATIVE_PLAT
#define PATH_STYLE_COLON			2		// ':'  sep, "vol:"   volume, ":"   relative, "^:" boot
#define PATH_STYLE_SLASH			3		// '/'  sep, "vol:/"  volume, "./"  relative, "/"  boot
#define PATH_STYLE_NATIVE_WIN		4		// '\\' sep, "vol:\\" volume, ".\\" relative, "\\" boot

#ifdef WIN_VERSION 
#define PATH_STYLE_MAX_PLAT			PATH_STYLE_SLASH
#define PATH_STYLE_NATIVE_PLAT		PATH_STYLE_NATIVE_WIN
#else
#define PATH_STYLE_MAX_PLAT			PATH_STYLE_SLASH
#define PATH_STYLE_NATIVE_PLAT		PATH_STYLE_COLON
#endif

#define PATH_TYPE_IGNORE			0
#define PATH_TYPE_ABSOLUTE			1
#define PATH_TYPE_RELATIVE			2
#define PATH_TYPE_BOOT				3
#define PATH_TYPE_C74				4

#ifdef PATH_CROSS_PLAT_NAMES
#define PATH_CHAR_IS_SEPARATOR(c) (((c) == ':') || ((c) == '/') || ((c) == '\\'))
#else
#define PATH_CHAR_IS_SEPARATOR(c) ((c) == SEPARATOR_CHAR)
#endif

#endif

// path_openfolder flags

#define PATH_REPORTPACKAGEASFOLDER 1

// fileinfo flags 
enum {	
	FILEINFO_ALIAS = 1,	
	FILEINFO_FOLDER = 2
};
	
// permissions, these are the same as on the Mac
enum {	
	READ_PERM = 1,	
	WRITE_PERM = 2,	
	RW_PERM = 3
};

enum {	
	STARTUP_PATH = 0,
	SEARCH_PATH = 1,	
	ACTION_PATH = 2,	
	HELP_PATH = 3
};

#define COLLECTIVE_FILECOPY 1	// flag for copying an object-used file to support path
#define COLLECTIVE_COPYTOMADEFOLDER 2 // flag to copying to the folder you made

// indices allow for fast access
typedef struct _fileinfo{	
	long type;	
	long creator;		// Mac-only I guess	
	long date;	
	long flags;
} t_fileinfo;

typedef struct _path{	
	void *p_name;		// all we have on Windows, may just be folder name on Mac	
	long p_dirID;		// directory ID on Mac	
	short p_vRefNum;	// volume on Mac	
	short p_wd;			// working directory on the Mac (compatibility mode)
} t_path;

typedef struct _pathlink{	
	short l_path;		// index into path table, or p_wd in compatibility mode	
	short l_parent;		// logical parent, i.e., what path caused this path to be included	
	short l_permanent;	// non-zero if a permanent path (saved in preferences)	
	struct _pathlink *l_next;
} t_pathlink;

#ifndef __PATHMETHOD__
typedef Boolean (*pathmethod)(void *arg, PATH_SPEC *par, short patharg);
#endif // __PATHMETHOD__

short genpath(PATH_SPEC *fs);
short path_lookup(PATH_SPEC *fs);
short path_new(PATH_SPEC *fs);
short path_tospec(short path, char *name, PATH_SPEC *fs);
void path_namefromspec(PATH_SPEC *fs, char *name);
void path_setpermanent(t_pathlink *list, short parent);
void path_addnamed(long pathtype, char *name, short recursive, short permanent);
void path_build(t_pathlink **head, short startpath, short recursive);
void path_eachdo(short startpath, pathmethod fun, void *arg, short patharg);
short path_resolvefile(char *name, short path, short *outpath);
short path_fileinfo(char *name, short path, void *info);
short path_extendedfileinfo(char *name, short path, t_fileinfo *info, long *typelist, short numtypes, short sniff);
// old mac compatible FILE_REF calls
short path_openfile(char *name, short path, FILE_REF *ref, short perm);
short path_openresfile(char *name, short path, FILE_REF *ref, short perm);
short path_createfile(char *name, short path, long type, FILE_REF *ref);
short path_createresfile(char *name, short path, long type, FILE_REF *ref);
// new prefered sysfile t_filehandle calls
short path_opensysfile(char *name, short path, t_filehandle *ref, short perm);
short path_openressysfile(char *name, short path, t_filehandle *ref, short perm);
short path_createsysfile(char *name, short path, long type, t_filehandle *ref);
short path_createressysfile(char *name, short path, long type, t_filehandle *ref);

short path_translate(PATH_SPEC *fs, char *name, short *vol, short resolvealias);
short path_topathname(short path, char *file, char *name);
short path_frompathname(char *name, short *path, char *filename);
short path_getnext(t_pathlink *list, short *val);
void path_setdefault(short path, short recursive);
short path_getdefault(void);
void path_setdefaultlist(struct _pathlink *list);
short path_getmoddate(short path, unsigned long *date);
short path_getfilemoddate(char *filename, short path, unsigned long *date);
long path_listcount(t_pathlink *list);
void *path_openfolder(short path);
short path_foldernextfile(void *xx, long *filetype, char *name, short descend);
void path_closefolder(void *x);
void path_makefromsymbol(long pathtype, t_symbol *sp, short recursive);
short path_getprefstring(short type, short index, t_symbol **s);
void path_setprefstring(short type, short index, t_symbol *s, short update);
void path_removefromlist(t_pathlink **list, short parent);
short path_getapppath(void);
short path_foldergetspec(void *xx, PATH_SPEC *spec, short resolve);
short path_nameconform(char *src, char *dst, long style, long type);
char path_getseparator(char *name);
short path_getstyle(char *name);

short defvolume(void);
short getfolder(short *vol);
short nameinpath(char *name, short *ref);
short open_dialog(char *name, short *volptr, long *typeptr, long *types, short ntypes);
short saveas_dialog(char *name, short *volptr, short *binptr);
short saveasdialog_extended(char *name, short *vol, long *type, long *typelist, short numtypes);
short locatefile(char *name, short *outvol, short *binflag);
short locatefiletype(char *name, short *outvol, long filetype, long creator);
short locatefilelist(char *name, short *outvol, long *outtype,
	long *filetypelist, short numtypes);
short locatefile_extended(char *name, short *outvol, long *outtype, long *filetypelist,
	short numtypes);
short locatefile_pathlist(t_pathlink *list, char *name, short *outvol, long *outtype,
	long *filetypelist, short numtypes);

short path_topotentialname(short path, char *file, char *name, short check);
short path_fileisresource(char *name, short path);
short getparref(PATH_SPEC *fs);

short path_createfolder(short path, char *name, short *newpath);
short path_copyfile(short srcpath, char *srcname, short dstpath, char *dstname);
short path_copytotempfile(short srcpath, char *srcname, short *outpath, char *outname);
short path_getsupportpath(void);
extern short path_nameinpath(char *name, short path, short *ref);
short path_sysnameinpath(char *name, short *ref);

short path_getpath(short path, char *name, short *outpath);
short path_copyfolder(short srcpath, short dstpath, char *dstname, long recurse, short *newpath);


#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(pop)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack()
#endif

#ifdef __cplusplus
}
#endif

#endif // _EXT_PATH_H_
