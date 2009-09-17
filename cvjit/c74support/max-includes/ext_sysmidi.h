// sysmidi.h
#ifndef _SYSMIDI_H_
#define _SYSMIDI_H_

#ifdef __cplusplus
extern "C" {
#endif

#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(push, 2)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack(2)
#endif

enum {
	SYSMIDI_ENABLED = 1,
	SYSMIDI_DYNAMIC = 2,
	SYSMIDI_PERMANENT = 4
};

typedef struct midistate
{
	long arg1;      /* the second byte of a three-byte message */
	long midicmd;   /* top nibble of the most recent status byte */
	long chan;      /* midi channel (if not sysex) */
	long sysex;     /* true if we are getting a sysex message */
	long argc;      /* # of bytes received in msg excluding status byte */
	long miditime;  /* time the most recent byte was received */
	long gotbyte;   /* received but unparsed byte (-1 if none) */
	Byte *data;
} t_midistate;

typedef struct _iq {
	long q_head;
	long q_tail;
	long q_nitems;
	long q_size;
	long q_busy;
	long q_busy2;
	Byte *q_data;
	Byte q_psysex;
	Byte q_gsysex;
} t_iq;

typedef struct _midiportinfo {
	t_symbol *p_name;
	struct _sysmididriver *p_driver;
	long p_refnum;
	short p_id;
	short p_abbrev;
	short p_chanoffset;
	char p_enabled;
	char p_dynamic;		// is (was) a dynamically created port
	char p_permanent;	// should be saved in prefs
	char p_delete;
	void *p_data1;
	long p_data2;
	void *p_wait;
	t_midistate p_state;
} t_midiportinfo;

typedef struct _sysmididriver {
	t_object d_ob;
	t_symbol *d_name;
	char d_available;	// positive response on informational instantiation
	char d_hastimer;
	method d_sendmethod;
	method d_bytesreceivedmethod;
	// driver-specific info follows
} t_sysmididriver;

typedef struct _sysmidi {
	t_object s_ob;
	short s_inchans;
	short s_outchans;
	long s_qsize;
	t_iq s_q;
	void *s_drivers;
	void *s_inports;
	void *s_outports;
	t_patcher *s_dialog;
	Point s_topleft;		// saved location of dialog
	t_box *s_ibp;
	t_box *s_obp;
	void *s_qelem;
	short s_portsopened;
	long s_loaddelay;
	short s_dstpath;
} t_sysmidi;

short sysmidi_numinports(void);
short sysmidi_numoutports(void);
t_symbol *sysmidi_indextoname(long index, short io);
void sysmidi_iterate(method meth, void *arg, short io);
void sysmidi_enqbigpacket(t_midiportinfo *port, Byte *data, double ts, long len, short contFlags);
t_midiportinfo *sysmidi_createport(long id, long refnum, t_symbol *name, t_sysmididriver *dx, short io, long flags);
void sysmidi_deletemarked(short io);
t_midiportinfo *sysmidi_idtoport(long id, short io);
long sysmidi_uniqueid(void);
t_midiportinfo *sysmidi_data1toport(void *data, short io);


#if C74_PRAGMA_STRUCT_PACKPUSH
    #pragma pack(pop)
#elif C74_PRAGMA_STRUCT_PACK
    #pragma pack()
#endif

#ifdef __cplusplus
}
#endif

#endif // _SYSMIDI_H_
