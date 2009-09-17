#ifndef __EXT_PROTO_WIN_H__
#define __EXT_PROTO_WIN_H__

#ifdef __cplusplus
extern "C" {
#endif

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(push, 2)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack(2)
#endif

#ifdef WIN_VERSION

Boolean sysinfo_iswinxp(void);
Boolean sysinfo_iswin2k(void);
Boolean sysinfo_is_supported_os(void);
void sysinfo_get_osversion( short* pMajorVersion, short* pMinorVersion );
OSErr sysinfo_query(long selector,long* response);
void file_getfsspec_from_elaboratedname( char* szElaboratedName, FSSpec* pSpec );
void file_getelaboratedname_from_fsspec( FSSpec* pSpec, char* szElaboratedName );
HINSTANCE main_get_instance(void);
HWND main_get_client(void);
HWND main_get_frame(void);
LPSTR main_get_commandline(void);
LPSTR main_get_appfilename(void);
HWND patcher_gethwnd(t_patcher *p);
HWND wind_gethwnd(t_wind *x);
t_wind* wind_fromhwnd(HWND hWnd); 

#endif // WIN_VERSION

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(pop)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack()
#endif

#ifdef __cplusplus
}
#endif


#endif // __EXT_PROTO_WIN_H__
