#ifndef CVJIT
#define CVJIT

//Parameters
#define JITTER
//#define OPENCV


#include <limits>
#include <cmath>
#include <string>

#include "c74_jitter.h"
using namespace c74::max;

#ifdef OPENCV
#ifndef _CV_H_
#include "cv.h"
#endif
#endif

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
	
	t_jit_err check_matrix_dimcount(t_jit_matrix_info const & info, long min_dimcount, long max_dimcount) {
		return info.dimcount >= min_dimcount && info.dimcount <= max_dimcount ? JIT_ERR_NONE : JIT_ERR_MISMATCH_DIM;
	}

	t_jit_err check_matrix_planecount(t_jit_matrix_info const & info, long min_planecount, long max_planecount) {
		return info.dimcount >= min_planecount && info.dimcount <= max_planecount ? JIT_ERR_NONE : JIT_ERR_MISMATCH_PLANE;
	}

	t_jit_err check_matrix_size(t_jit_matrix_info const & info, long dim, long min_size, long max_size = std::numeric_limits<long>::max()) {
		if (dim < info.dimcount) {
			if (info.dim[dim] < min_size || info.dim[dim] > max_size) {
				return JIT_ERR_MISMATCH_DIM;
			}
		}
		return JIT_ERR_NONE;
	}

	template <typename... Args>
	t_jit_err check_matrix(t_jit_err check, Args... extraChecks) {
		t_jit_err all_checks[] = {check, extraChecks...};
		for (t_jit_err const & err : all_checks) {
			if (err != JIT_ERR_NONE) {
				return err;
			}
		}
		return JIT_ERR_NONE;
	}

	t_jit_err validate_attribute_memory(long atom_count, long *ac, t_atom **av) {
		// Check if count matches
		if (*ac < atom_count) {
			// Count doesn't match, free the memory
			sysmem_freeptr(*av);
			*av = nullptr;
			*ac = 0;
		}

		if (0 == *ac || nullptr == *av) {
			// Need to allocate memory
			*ac = std::max(1L, atom_count);
			if (!(*av = (t_atom*)sysmem_newptr(sizeof(t_atom)*(*ac)))) {
				*ac = 0;
				return JIT_ERR_OUT_OF_MEM;
			}
		}

		return JIT_ERR_NONE;
	}

	// Looks for a file in the Max search path and outputs its absolute
	// path. If the file is not found, it outputs and empty string, ""
	std::string get_absolute_path(std::string const & filename) {
		short path;
		char name[MAX_FILENAME_CHARS];
		char full_name[MAX_PATH_CHARS];
		char conform_name[MAX_PATH_CHARS];
		t_fourcc type;

		strncpy(name, filename.c_str(), MAX_FILENAME_CHARS);
		if (!locatefile_extended(name, &path, &type, &type, -1)) {
			if (!path_topathname(path, name, full_name)) {
				//On Mactel, this function returns OS9 style paths with PATH_STYLE_NATIVE, PATH_TYPE_ABSOLUTE works on Windows but not OSX
				if (!path_nameconform(full_name, conform_name, PATH_STYLE_SLASH, PATH_TYPE_BOOT)) {
					return conform_name;
				}
			}
		}

		return "";
	}
}


#endif //#ifndef CVJIT