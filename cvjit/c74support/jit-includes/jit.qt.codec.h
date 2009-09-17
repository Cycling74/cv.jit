#ifndef __JIT_QT_CODEC_H__
#define __JIT_QT_CODEC_H__

#ifdef __cplusplus
	extern "C" {
#endif 

t_jit_err jit_qt_codec_getcodeclist_video(void *x, void *attr, long *ac, t_atom **av);
t_jit_err jit_qt_codec_getcodeclist_audio(void *x, void *attr, long *ac, t_atom **av);
t_jit_err jit_qt_codec_getcodeclist_gfx(void *x, void *attr, long *ac, t_atom **av);
void jit_qt_codec_getcodeclist_video_raw(long *count, t_symbol ***names);
void jit_qt_codec_getcodeclist_audio_raw(long *count, t_symbol ***names);
void jit_qt_codec_getcodeclist_gfx_raw(long *count, t_symbol ***names);
long jit_qt_codec_sym2qual(t_symbol *s); 
long jit_qt_codec_sym2type(t_symbol *s); 
long jit_qt_codec_sym2type_valid(t_symbol *s); 
t_symbol *jit_qt_codec_qual2sym(long qual); 
t_symbol *jit_qt_codec_type2sym(long type); 
t_symbol *jit_qt_codec_type2sym_valid(long type); 
long jit_qt_codec_sym2acodec(t_symbol *s); 
t_symbol *jit_qt_codec_acodec2sym(long acodec); 

/*
//codec types;
raw, cinepak, graphics, animation, video, componentvideo, jpeg, mjpega, 
mjpegb, sgi, planarrgb, macpaint, gif, photocd, qdgx, avrjpeg, opendmljpeg, 
bmp, winraw, vector, qd, h261, h263, dvntsc, dvpal, dvprontsc, dvpropal, flc, 
targa, png, tiff, componentvideosigned, componentvideounsigned, cmyk, 
microsoft, sorenson, indeo4, argb64, rgb48, alphagrey32, grey16, mpegyuv420, 
yuv420, sorensonyuv9, mpeg4, dvcntsc, dvcpal, dvcprontsc, dvcpropal,
yuv422, v308, v408, v216, v210, v410, r408, jpeg2000, pixlet, h264;
;
//codec qualities;
lossless, max, min, low, normal, high;
;
//audio codecs;
none, raw, big16, little16, float32, float64, 24bit, 32bit, 
little32, mace3, mace6, cdxa4, cdxa2, ima, ulaw, alaw, adpcm, 
dviima, dvaudio, qdesign, qdesign2, qualcomm, mp3, vdva, mpeg4;
*/

JIT_EX_DATA t_symbol *_jit_sym_codec_raw;
JIT_EX_DATA t_symbol *_jit_sym_codec_cinepak;
JIT_EX_DATA t_symbol *_jit_sym_codec_graphics;
JIT_EX_DATA t_symbol *_jit_sym_codec_animation;
JIT_EX_DATA t_symbol *_jit_sym_codec_video;
JIT_EX_DATA t_symbol *_jit_sym_codec_componentvideo;
JIT_EX_DATA t_symbol *_jit_sym_codec_jpeg;
JIT_EX_DATA t_symbol *_jit_sym_codec_mjpega;
JIT_EX_DATA t_symbol *_jit_sym_codec_mjpegb;
JIT_EX_DATA t_symbol *_jit_sym_codec_sgi;
JIT_EX_DATA t_symbol *_jit_sym_codec_planarrgb;
JIT_EX_DATA t_symbol *_jit_sym_codec_macpaint;
JIT_EX_DATA t_symbol *_jit_sym_codec_gif;
JIT_EX_DATA t_symbol *_jit_sym_codec_photocd;
JIT_EX_DATA t_symbol *_jit_sym_codec_qdgx;
JIT_EX_DATA t_symbol *_jit_sym_codec_avrjpeg;
JIT_EX_DATA t_symbol *_jit_sym_codec_opendmljpeg;
JIT_EX_DATA t_symbol *_jit_sym_codec_bmp;
JIT_EX_DATA t_symbol *_jit_sym_codec_winraw;
JIT_EX_DATA t_symbol *_jit_sym_codec_vector;
JIT_EX_DATA t_symbol *_jit_sym_codec_qd;
JIT_EX_DATA t_symbol *_jit_sym_codec_h261;
JIT_EX_DATA t_symbol *_jit_sym_codec_h263;
JIT_EX_DATA t_symbol *_jit_sym_codec_dvntsc;
JIT_EX_DATA t_symbol *_jit_sym_codec_dvpal;
JIT_EX_DATA t_symbol *_jit_sym_codec_dvprontsc;
JIT_EX_DATA t_symbol *_jit_sym_codec_dvpropal;
JIT_EX_DATA t_symbol *_jit_sym_codec_flc;
JIT_EX_DATA t_symbol *_jit_sym_codec_targa;
JIT_EX_DATA t_symbol *_jit_sym_codec_png;
JIT_EX_DATA t_symbol *_jit_sym_codec_tiff;
JIT_EX_DATA t_symbol *_jit_sym_codec_componentvideosigned;
JIT_EX_DATA t_symbol *_jit_sym_codec_componentvideounsigned;
JIT_EX_DATA t_symbol *_jit_sym_codec_cmyk;
JIT_EX_DATA t_symbol *_jit_sym_codec_microsoft;
JIT_EX_DATA t_symbol *_jit_sym_codec_sorenson;
JIT_EX_DATA t_symbol *_jit_sym_codec_sorenson3;
JIT_EX_DATA t_symbol *_jit_sym_codec_indeo4;
JIT_EX_DATA t_symbol *_jit_sym_codec_argb64;
JIT_EX_DATA t_symbol *_jit_sym_codec_rgb48;
JIT_EX_DATA t_symbol *_jit_sym_codec_alphagrey32;
JIT_EX_DATA t_symbol *_jit_sym_codec_grey16;
JIT_EX_DATA t_symbol *_jit_sym_codec_mpegyuv420;
JIT_EX_DATA t_symbol *_jit_sym_codec_yuv420;
JIT_EX_DATA t_symbol *_jit_sym_codec_sorensonyuv9;
JIT_EX_DATA t_symbol *_jit_sym_codec_mpeg4;
JIT_EX_DATA t_symbol *_jit_sym_codec_dvcntsc; // alias to dvntsc
JIT_EX_DATA t_symbol *_jit_sym_codec_dvcpal; // alias to dvpal
JIT_EX_DATA t_symbol *_jit_sym_codec_dvcprontsc; // alias to dvprontsc
JIT_EX_DATA t_symbol *_jit_sym_codec_dvcpropal; // // alias to dvpropal
// qt 7
JIT_EX_DATA t_symbol *_jit_sym_codec_yuv422;
JIT_EX_DATA t_symbol *_jit_sym_codec_v308;
JIT_EX_DATA t_symbol *_jit_sym_codec_v408;
JIT_EX_DATA t_symbol *_jit_sym_codec_v216;
JIT_EX_DATA t_symbol *_jit_sym_codec_v210;
JIT_EX_DATA t_symbol *_jit_sym_codec_v410;
JIT_EX_DATA t_symbol *_jit_sym_codec_r408;
JIT_EX_DATA t_symbol *_jit_sym_codec_jpeg2000;
JIT_EX_DATA t_symbol *_jit_sym_codec_pixlet;
JIT_EX_DATA t_symbol *_jit_sym_codec_h264;

//quality
JIT_EX_DATA t_symbol *_jit_sym_codec_lossless;
JIT_EX_DATA t_symbol *_jit_sym_codec_max;
JIT_EX_DATA t_symbol *_jit_sym_codec_min;
JIT_EX_DATA t_symbol *_jit_sym_codec_low;
JIT_EX_DATA t_symbol *_jit_sym_codec_normal;
JIT_EX_DATA t_symbol *_jit_sym_codec_high;

//audio
JIT_EX_DATA t_symbol *_jit_sym_codec_a_none;
JIT_EX_DATA t_symbol *_jit_sym_codec_a_raw;
JIT_EX_DATA t_symbol *_jit_sym_codec_a_big16;
JIT_EX_DATA t_symbol *_jit_sym_codec_a_little16;
JIT_EX_DATA t_symbol *_jit_sym_codec_a_float32;
JIT_EX_DATA t_symbol *_jit_sym_codec_a_float64;
JIT_EX_DATA t_symbol *_jit_sym_codec_a_24bit;
JIT_EX_DATA t_symbol *_jit_sym_codec_a_32bit;
JIT_EX_DATA t_symbol *_jit_sym_codec_a_little32;
JIT_EX_DATA t_symbol *_jit_sym_codec_a_mace3;
JIT_EX_DATA t_symbol *_jit_sym_codec_a_mace6;
JIT_EX_DATA t_symbol *_jit_sym_codec_a_cdxa4;
JIT_EX_DATA t_symbol *_jit_sym_codec_a_cdxa2;
JIT_EX_DATA t_symbol *_jit_sym_codec_a_ima;
JIT_EX_DATA t_symbol *_jit_sym_codec_a_ulaw;
JIT_EX_DATA t_symbol *_jit_sym_codec_a_alaw;
JIT_EX_DATA t_symbol *_jit_sym_codec_a_adpcm;
JIT_EX_DATA t_symbol *_jit_sym_codec_a_dviima;
JIT_EX_DATA t_symbol *_jit_sym_codec_a_dvaudio;
JIT_EX_DATA t_symbol *_jit_sym_codec_a_qdesign;
JIT_EX_DATA t_symbol *_jit_sym_codec_a_qdesign2;
JIT_EX_DATA t_symbol *_jit_sym_codec_a_qualcomm;
JIT_EX_DATA t_symbol *_jit_sym_codec_a_mp3;
JIT_EX_DATA t_symbol *_jit_sym_codec_a_vdva;
JIT_EX_DATA t_symbol *_jit_sym_codec_a_mpeg4;

#ifdef __cplusplus
}
#endif

#endif //__JIT_QT_CODEC_H__