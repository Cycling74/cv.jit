#ifndef CVJIT
#define CVJIT

//Parameters
#define JITTER
//#define OPENCV


#include <limits>

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

	class Savelock {
	private:
		void * m_savelock;
		c74::max::t_object * m_object;
	public:
		Savelock(c74::max::t_object * matrix) : m_object(matrix) {
			m_savelock = jit_object_method(m_object, _jit_sym_lock, 1);
		}

		~Savelock() {
			if (m_savelock && m_object) {
				jit_object_method(m_object, gensym("lock"), m_savelock);
			}
		}
	};

	t_jit_err check_matrix_type(t_jit_matrix_info const & info, t_symbol const * const t1, t_symbol const * const t2 = nullptr, t_symbol const * const t3 = nullptr, t_symbol const * const t4 = nullptr) {
		return info.type == t1 || info.type == t2 || info.type == t3 || info.type == t4 ? JIT_ERR_NONE : JIT_ERR_MISMATCH_TYPE;
	}
	
	t_jit_err check_matrix_dimcount(t_jit_matrix_info const & info, unsigned int min_dimcount, unsigned int max_dimcount) {
		return info.dimcount >= min_dimcount && info.dimcount <= max_dimcount ? JIT_ERR_NONE : JIT_ERR_MISMATCH_DIM;
	}

	t_jit_err check_matrix_planecount(t_jit_matrix_info const & info, unsigned int min_planecount, unsigned int max_planecount) {
		return info.dimcount >= min_planecount && info.dimcount <= max_planecount ? JIT_ERR_NONE : JIT_ERR_MISMATCH_PLANE;
	}

	t_jit_err check_matrix_size(t_jit_matrix_info const & info, unsigned int dim, long min_size, long max_size = std::numeric_limits<long>::max()) {
		if (dim < info.dimcount) {
			if (info.dim[dim] < min_size || info.dim[dim] > max_size) {
				return JIT_ERR_MISMATCH_DIM;
			}
		}
		return JIT_ERR_NONE;
	}

	template <typename... Args>
	t_jit_err check_matrix(t_jit_err check, Args... extraChecks) {
		t_jit_err err = check_matrix(into, extraChecks...);
		return check != JIT_ERR_NONE ? check : (err != JIT_ERR_NONE ? err : JIT_ERR_NONE);
	}
}


#endif //#ifndef CVJIT