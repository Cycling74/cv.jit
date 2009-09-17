#ifndef _EXT_STRINGS_H_
#define _EXT_STRINGS_H_

#ifndef WIN32

#ifdef __cplusplus
extern "C" {
#endif

char *strcpy(char *s1, const char *s2);
char *strcat(char *s1, const char *s2);
int strcmp(const char *s1, const char *s2);
unsigned long strlen(const char *s);
char *strncpy(char *s1, const char *s2, unsigned long n);
char *strncat(char *s1, const char *s2, unsigned long n);
int strncmp(const char *s1, const char *s2, unsigned long n);
void *memcpy(void *dest, const void *source, unsigned long n);
#if    TARGET_API_MAC_CARBON
#define CtoPstr(x) CopyCStringToPascal((const char *)(x),(unsigned char *)(x))
#define PtoCstr(x) CopyPascalStringToC((ConstStr255Param)(x),(char *)(x))
#endif TARGET_API_MAC_CARBON

#ifdef __cplusplus
}
#endif

#endif // WIN32

#ifdef __cplusplus
extern "C" {
#endif

void ctopcpy(unsigned char *p1, char *p2);
void ptoccpy(char *p1, unsigned char *p2);
void setmem(void *s, long n, short b);
void pstrcpy(unsigned char *p2, unsigned char *p1);

#ifdef __cplusplus
}
#endif

#endif // _EXT_STRINGS_H_
