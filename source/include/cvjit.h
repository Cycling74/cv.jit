#ifndef CVJIT
#define CVJIT

//Parameters
#define JITTER
//#define OPENCV




#include "c74_jitter.h"
using namespace c74::max;

#ifdef OPENCV
#ifndef _CV_H_
#include "cv.h"
#endif
#endif


/*Vector operations*/
/*
#ifdef __VEC__

#define VEC_ADD_8U vec_add
#define VEC_ADD_32S vec_add
#define VEC_ADD_32F vec_add
#define VEC_ADD_64F cv_vec_add_double

#elif __SSE2__

#define VEC_ADD_8U _mm_add_epi8
#define VEC_ADD_32S _mm_add_epi32
#define VEC_ADD_32F _mm_add_ps
#define VEC_ADD_64F _mm_add_pd

#else
#error "Either Altivec or SSE must be enabled"
#endif
*/

/*Error handling*/
#ifdef JITTER
#define CV_REPORT_ERROR(str) object_error(NULL, str)
#endif

/*Type definitions*/
#define CVJIT_TYPE_8U 0
#define CVJIT_TYPE_32S 1
#define CVJIT_TYPE_32F 2
#define CVJIT_TYPE_64F 3

/*Conversion utility*/
#ifdef JITTER
inline int jit_gettype(t_jit_matrix_info *info)
{
	if(info->type == _jit_sym_char) return CVJIT_TYPE_8U;
	if(info->type == _jit_sym_long) return CVJIT_TYPE_32S;
	if(info->type == _jit_sym_float32) return CVJIT_TYPE_32F;
	if(info->type == _jit_sym_float64) return CVJIT_TYPE_64F;
	
	return -1;
}
#endif

namespace cvjit {
	void swapBytes(unsigned char * bytes, int length)
	{
		int i = 0;
		int j = length - 1;
		char tmp;
		while (i < j)
		{
			tmp = bytes[i];
			bytes[i] = bytes[j];
			bytes[j] = tmp;
			i++, j--;
		}
	}
}


#endif //#ifndef CVJIT