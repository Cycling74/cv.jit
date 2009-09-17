
#ifdef WIN_VERSION

#ifndef _EXT_SYSINFO_H_
#define _EXT_SYSINFO_H_

// contstants returned by sysinfo_get_osversion( short* pMajorVersion, short* pMinorVersion );

#define SYSINFO_MINOR_VERSION_UNDEFINED			0
#define SYSINFO_MAJOR_VERSION_UNDEFINED			0
#define SYSINFO_MAJOR_VERSION_XP				1
#define SYSINFO_MAJOR_VERSION_2K				2
#define SYSINFO_MAJOR_VERSION_NT				3
#define SYSINFO_MAJOR_VERSION_ME				4
#define SYSINFO_MAJOR_VERSION_SE				5
#define SYSINFO_MAJOR_VERSION_98				6
#define SYSINFO_MAJOR_VERSION_OSR2				7
#define SYSINFO_MAJOR_VERSION_95				8
#define SYSINFO_MAJOR_VERSION_OTHER				10

#endif // _EXT_SYSINFO_H

#endif // WIN_VERSION


