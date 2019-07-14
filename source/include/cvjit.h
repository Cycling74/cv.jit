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

	/* Useful type definitions */
	using cstring = char const * const;

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

	class JitterMatrix {
	private:
		c74::max::t_object * m_matrix;
		c74::max::t_jit_matrix_info m_info;
		char * m_data{ nullptr };
	protected:
		void report_error(t_jit_err err) {
			jit_error_code(m_matrix, err);
		}

		void update_info() {
			t_jit_err err = (t_jit_err)jit_object_method(m_matrix, _jit_sym_setinfo, &m_info);
			if (JIT_ERR_NONE != err) { 
				report_error(err);
				m_data = nullptr;
				return; 
			}

			err = (t_jit_err)jit_object_method(m_matrix, _jit_sym_getinfo, &m_info);
			if (JIT_ERR_NONE != err) { 
				report_error(err);
				m_data = nullptr;
				return; 
			}

			err = (t_jit_err)jit_object_method(m_matrix, _jit_sym_getdata, &m_data);
			if (JIT_ERR_NONE != err) { report_error(err); return; }
		}
	public:
		JitterMatrix(void * matrix) : m_matrix(static_cast<c74::max::t_object * >(matrix)) {
			if (m_matrix) {
				t_jit_err err = (t_jit_err)jit_object_method(m_matrix, _jit_sym_getinfo, &m_info);
				if (JIT_ERR_NONE != err) { report_error(err); return; }

				err = (t_jit_err)jit_object_method(m_matrix, _jit_sym_getdata, &m_data);
				if (JIT_ERR_NONE != err) { report_error(err); return; }
			}
		}

		virtual ~JitterMatrix() = default;

		char * get_data() { return m_data; }
		c74::max::t_jit_matrix_info const & get_info() const { return m_info; }

		template <typename T>
		T * get_data() { return (T *)m_data; }

		template <typename... Args>
		void set_size(long dim0, Args... other_dims) {
			if (m_matrix) {
				const int count = sizeof...(other_dims) + 1;
				const std::vector<long> dims = {dim0, other_dims...};
				m_info.dimcount = count;
				for (int i = 0; i < count && i < JIT_MATRIX_MAX_DIMCOUNT; i++) {
					m_info.dim[i] = std::max(1, dims[i]);
				}

				update_info();
			}
		}

		void set_planecount(long planecount) {
			if (m_matrix) {
				m_info.planecount = planecount;

				update_info();
			}
		}
	};

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

	class Validate {
	private:
		c74::max::t_object * m_matrix;
		c74::max::t_jit_matrix_info m_info;
		c74::max::t_jit_err m_state{ JIT_ERR_NONE };
	public:
		Validate(c74::max::t_object * matrix) : m_matrix(matrix) {
			jit_object_method(m_matrix, _jit_sym_getinfo, &m_info);
		}

		Validate & planecount(int count) {
			if (m_state == JIT_ERR_NONE && count != m_info.planecount) {
				m_state = JIT_ERR_MISMATCH_PLANE;
			}
			return *this;
		}

		Validate & planecount(int min, int max) {
			if (m_state == JIT_ERR_NONE && m_info.planecount < min && m_info.planecount > max) {
				m_state = JIT_ERR_MISMATCH_PLANE;
			}
			return *this;
		}

		Validate & dimcount(int count) {
			if (m_state == JIT_ERR_NONE && count != m_info.dimcount) {
				m_state = JIT_ERR_MISMATCH_DIM;
			}
			return *this;
		}

		Validate & dimcount(int min, int max) {
			if (m_state == JIT_ERR_NONE && m_info.dimcount < min && m_info.dimcount > max) {
				m_state = JIT_ERR_MISMATCH_DIM;
			}
			return *this;
		}

		Validate & type(c74::max::t_symbol * a, c74::max::t_symbol * b = nullptr, c74::max::t_symbol * c = nullptr, c74::max::t_symbol * d = nullptr) {
			if (m_state == JIT_ERR_NONE && !(m_info.type == a || m_info.type == b || m_info.type == c || m_info.type == d)) {
				m_state = JIT_ERR_MISMATCH_TYPE;
			}
			return *this;
		}

		Validate & dim(int index, int min_size)  {
			if (m_state == JIT_ERR_NONE && index >= m_info.dimcount || m_info.dim[index] < min_size) {
				m_state = JIT_ERR_MISMATCH_DIM;
			}
			return *this;
		}

		Validate & min_dimsize(int min_size) {
			if (m_state == JIT_ERR_NONE) {
				for (int i = 0; i < m_info.dimcount; i++) {
					if (m_info.dim[i] < min_size) {
						m_state = JIT_ERR_MISMATCH_DIM;
						break;
					}
				}
			}
			return *this;
		}

		operator c74::max::t_jit_err() const {
			return m_state;
		}
	};

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

	t_jit_matrix_info resize_matrix(t_object * matrix, int n, ...) {
		t_jit_matrix_info info;
		jit_object_method(matrix, _jit_sym_getinfo, &info);
		info.dimcount = std::max(1, n);

		va_list vl;
		va_start(vl, n);

		for (int i = 0; i < n && i < JIT_MATRIX_MAX_DIMCOUNT; i++) {
			info.dim[i] = va_arg(vl, long);
		}

		va_end(vl);
		
		jit_object_method(matrix, _jit_sym_setinfo, &info);
		jit_object_method(matrix, _jit_sym_getinfo, &info);
		return info;
	}
}


#endif //#ifndef CVJIT