#ifndef _JIT_AGL_H_
#define _JIT_AGL_H_

#ifdef __cplusplus
extern "C" {
#endif

#ifdef MAC_VERSION

OSStatus aglInitEntryPoints (void);
void aglDellocEntryPoints (void);
void * aglGetProcAddress (char * pszProc);

#endif

#ifdef __cplusplus
}
#endif

#endif
