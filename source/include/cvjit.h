#ifndef CVJIT_H
#define CVJIT_H

//Parameters
#define JITTER
//#define OPENCV

#include <sys/types.h>
#ifdef __APPLE__
	#include <pthread.h>
#endif
#include <limits>
#include <cmath>
#include <string>
#include <vector>
#include <algorithm>

#include "jitOpenCV.h"

using namespace c74::max;



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

	template <typename T>
	inline T rad2deg(T rad) {
		return rad * (T)57.295779513082320876798154814105;
	}

	class Flags {
	public:
		static constexpr long get_set = ATTR_GET_DEFER_LOW | ATTR_SET_USURP_LOW;
		static constexpr long private_set = ATTR_GET_DEFER_LOW | ATTR_SET_OPAQUE;
	};

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

		template <typename T>
		T * get_data(long row, long col = 0) { return (T *)(m_data + row * m_info.dimstride[1] + col * m_info.dimstride[0]); }

		bool empty() const {
			for (long i = 0; i < m_info.dimcount; i++) {
				if (m_info.dim[i] > 1) {
					return false;
				}
			}
			return read<long>(0, 0, 0) == 0;
		}

		double normalization_scale_x() const {
			if (m_info.dim[0] == 0) {
				return 0.0;
			}
			return 1.0 / (double)m_info.dim[0];
		}

		double normalization_scale_y() const {
			if (m_info.dimcount < 2 || m_info.dim[0] == 0) {
				return 0.0;
			}
			return 1.0 / (double)m_info.dim[1];
		}

		double wh_ratio() const {
			if (m_info.dimcount < 2) {
				return 1;
			}

			if (m_info.dim[1] == 0) {
				return 0;
			}

			return (double)m_info.dim[0] / (double)m_info.dim[1];
		}

		template <typename... Args>
		void set_size(long dim0, Args... other_dims) {
			if (m_matrix) {
				const int count = sizeof...(other_dims) + 1;
				const std::vector<long> dims = {dim0, other_dims...};
				m_info.dimcount = count;
				for (int i = 0; i < count && i < JIT_MATRIX_MAX_DIMCOUNT; i++) {
					m_info.dim[i] = std::max(1L, (long)dims[i]);
				}

				update_info();
			}
		}

		void clear() {
			if (m_matrix) {
				jit_object_method(m_matrix, _jit_sym_clear);
			}
		}

		void set_planecount(long planecount) {
			if (m_matrix) {
				m_info.planecount = planecount;

				update_info();
			}
		}

		template <typename T>
		T read(unsigned int plane, unsigned int x, unsigned int y) const {
			if (m_info.dimcount >= 2 && plane < (unsigned int)m_info.planecount) {
				char * p = m_data + y * m_info.dimstride[1] + x * m_info.dimstride[0];
				if (m_info.type == _jit_sym_char) {
					return (T)((uint8_t *)p)[plane];
				}
				else if (m_info.type == _jit_sym_long) {
					return (T)((int32_t *)p)[plane];
				}
				else if (m_info.type == _jit_sym_float32) {
					return (T)((float *)p)[plane];
				}
				else if (m_info.type == _jit_sym_float64) {
					return (T)((double *)p)[plane];
				}
			}
			return 0;
		}

		operator cv::Mat() {
			return cvjit::wrapJitterMatrix(m_matrix, m_info, m_data);
		}

#ifdef CVJIT_LEGACY
		operator CvMat() {
			return cvJitter2CvMat(m_info, m_data);
		}

		void wrap(CvMat const & mat) {
			m_info.dimcount = 2;
			m_info.dim[0] = mat.cols;
			m_info.dim[1] = mat.rows;
			m_info.planecount = CV_MAT_CN(mat.type);

			switch (CV_MAT_DEPTH(mat.type)) {
			case CV_8U:
				m_info.type = c74::max::_jit_sym_char;
				m_info.dimstride[0] = m_info.planecount;
				break;
			case CV_32S:
				m_info.type = c74::max::_jit_sym_long;
				m_info.dimstride[0] = m_info.planecount * 4;
				break;
			case CV_32F:
				m_info.type = c74::max::_jit_sym_float32;
				m_info.dimstride[0] = m_info.planecount * sizeof(float);
				break;
			case CV_64F:
				m_info.type = c74::max::_jit_sym_float64;
				m_info.dimstride[0] = m_info.planecount * sizeof(double);
				break;
			default:
				c74::max::object_error(NULL, "Error converting to Jitter matrix: unsupported depth.");
				return;
	}
			m_info.dimstride[1] = mat.step;
			m_info.size = mat.step * mat.rows;
			m_info.flags = JIT_MATRIX_DATA_REFERENCE | JIT_MATRIX_DATA_FLAGS_USE;

			m_data = (char *)mat.data.ptr;
			jit_object_method(m_matrix, c74::max::_jit_sym_setinfo_ex, &m_info);
			jit_object_method(m_matrix, c74::max::_jit_sym_data, m_data);
		}
#endif
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
		c74::max::t_object * m_context;
		c74::max::t_jit_matrix_info const &  m_info;
		c74::max::t_jit_err m_state{ JIT_ERR_NONE };
	public:
		Validate(void * context, c74::max::t_jit_matrix_info const & info) : m_context(static_cast<c74::max::t_object *>(context)), m_info(info) {}
		Validate(void * context, JitterMatrix & mat) : m_context(static_cast<c74::max::t_object *>(context)), m_info(mat.get_info()) {}

		Validate & planecount(int count) {
			if (m_state == JIT_ERR_NONE && count != m_info.planecount) {
				m_state = JIT_ERR_MISMATCH_PLANE;
				object_error(m_context, "Invalid plane count: expected %d was %d", count, m_info.planecount);
			}
			return *this;
		}

		Validate & planecount(int min, int max) {
			if (m_state == JIT_ERR_NONE && m_info.planecount < min && m_info.planecount > max) {
				m_state = JIT_ERR_MISMATCH_PLANE;
				object_error(m_context, "Invalid plane count: expected between %d and %d was %d", min, max, m_info.planecount);
			}
			return *this;
		}

		Validate & dimcount(int count) {
			if (m_state == JIT_ERR_NONE && count != m_info.dimcount) {
				m_state = JIT_ERR_MISMATCH_DIM;
				object_error(m_context, "Invalid dimension count: expected %d was %d", count, m_info.dimcount);
			}
			return *this;
		}

		Validate & dimcount(int min, int max) {
			if (m_state == JIT_ERR_NONE && m_info.dimcount < min && m_info.dimcount > max) {
				m_state = JIT_ERR_MISMATCH_DIM;
				object_error(m_context, "Invalid dim count: expected between %d and %d was %d", min, max, m_info.dimcount);
			}
			return *this;
		}

		Validate & type(c74::max::t_symbol * a, c74::max::t_symbol * b = nullptr, c74::max::t_symbol * c = nullptr, c74::max::t_symbol * d = nullptr) {
			if (m_state == JIT_ERR_NONE && !(m_info.type == a || m_info.type == b || m_info.type == c || m_info.type == d)) {
				m_state = JIT_ERR_MISMATCH_TYPE;
				object_error(m_context, "Unsupported type");
			}
			return *this;
		}

		Validate & dim(int index, int min_size)  {
			if ((m_state == JIT_ERR_NONE && index >= m_info.dimcount) || m_info.dim[index] < min_size) {
				m_state = JIT_ERR_MISMATCH_DIM;
			}
			return *this;
		}

		Validate & min_dimsize(int min_size) {
			if (m_state == JIT_ERR_NONE) {
				for (int i = 0; i < m_info.dimcount; i++) {
					if (m_info.dim[i] < min_size) {
						m_state = JIT_ERR_MISMATCH_DIM;
						object_error(m_context, "Matrix too small: dimension %d must be at least %d, was %d", i, min_size, m_info.dim[i]);
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

	template <typename T, typename M> M get_member_type(M T::*);
	template <typename T, typename M> T get_class_type(M T::*);

	template <typename T, typename R, R T::*M>
	constexpr R * member_offset() {
		return &((((T*)0)->*M));
	}

#define CVJIT_CALCOFFSET(member) (cvjit::member_offset<decltype(cvjit::get_class_type(member)), decltype(cvjit::get_member_type(member)), member>())

	struct AttributeAlias {
		t_symbol * sym;
		t_atom_long val;
		t_atom atom;

		AttributeAlias(t_symbol * s, t_atom_long v) : sym(s), val(v) {
			atom_setsym(&atom, s);
		}

		template <typename T>
		T as() const {
			return static_cast<T>(val);
		}

		void get(long *ac, t_atom **av) {
			if (*ac && *av) {
				atom_setsym(*av, sym);
				*ac = 1;
			}
			else {
				// no memory passed in therefore we must allocate
				*av = (t_atom*)sysmem_newptr(sizeof(t_atom));
				*ac = 1;
				**av = atom;
			}
		}
	};

	template <typename T>
	struct AttributeAliases {
	private:
		static constexpr std::size_t count = (std::size_t)T::COUNT;
		t_symbol * m_symbols[count];
	public:
		template <typename... Args>
		AttributeAliases(std::pair<T, cvjit::cstring> pair, Args... args) {
			static_assert(sizeof...(Args) + 1 == (std::size_t)count, "Incorrect number of arguments");
			std::array <std::pair <T, cvjit::cstring>, count> arr = { pair, args... };
			for (int i = 0; i < count; i++) {
				m_symbols[(std::size_t)arr[i].first] = gensym(arr[i].second);
			}
		}

		AttributeAlias get() const {
			return { m_symbols[0], 0 };
		}

		AttributeAlias get(t_atom * a) const {
			if (a->a_type == A_SYM) {
				for (t_atom_long i = 0; i < (t_atom_long)count; i++) {
					if (m_symbols[i] == a->a_w.w_sym) {
						return { m_symbols[i], i };
					}
				}
				return get();
			}
			t_atom_long val = std::clamp(atom_getlong(a), (t_atom_long)0, (t_atom_long)(count - 1));
			return { m_symbols[val], val };
		}
	};

	struct AttributeManager {
	private:
		void * m_class;

		template <typename T>
		inline t_symbol * type_sym() {
            return 0L;
		}

		template <>
		inline t_symbol * type_sym<unsigned char>() {
			return _jit_sym_char;
		}

		template <>
		inline t_symbol * type_sym<long>() {
			return _jit_sym_long;
		}

		template <>
		inline t_symbol * type_sym<float>() {
			return _jit_sym_float32;
		}

		template <>
		inline t_symbol * type_sym<double>() {
			return _jit_sym_float64;
		}

	public:
		AttributeManager() = delete;
		AttributeManager(void * jitter_class) : m_class(jitter_class) {}

		template <typename T>
		void add(cvjit::cstring name, T * offset) {
			t_object * attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset, name, type_sym<T>(), cvjit::Flags::get_set,
				(method)0L, (method)0L, (t_ptr_int)offset);
			jit_class_addattr(m_class, attr);
		}

		template <typename T>
		void add(cvjit::cstring name, T min, T * offset) {
			t_object * attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset, name, type_sym<T>(), cvjit::Flags::get_set,
				(method)0L, (method)0L, (t_ptr_int)offset);
			jit_attr_addfilterset_clip(attr, min, 0, true, false);
			jit_class_addattr(m_class, attr);
		}

		template <typename T>
		void add(cvjit::cstring name, T min, T max, T * offset) {
			t_object * attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset, name, type_sym<T>(), cvjit::Flags::get_set,
				(method)0L, (method)0L, (t_ptr_int)offset);
			jit_attr_addfilterset_clip(attr, min, max, true, true);
			jit_class_addattr(m_class, attr);
		}

		template <typename T>
		void add_bool(cvjit::cstring name, T * offset) {
			t_object * attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset, name, type_sym<T>(), cvjit::Flags::get_set,
				(method)0L, (method)0L, (t_ptr_int)offset);
			jit_attr_addfilterset_clip(attr, 0, 1, true, true);
			jit_class_addattr(m_class, attr);
		}
	};

	template <typename T>
	t_jit_object * normalize_attr() {
		t_object * attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset, "normalize", _jit_sym_long, cvjit::Flags::get_set,
			(method)0L, (method)0L, calcoffset(T, normalize));
		jit_attr_addfilterset_clip(attr, 0, 1, true, true);
		return attr;
	}

	t_jit_matrix_info resize_matrix(t_object * matrix, const std::vector<long> & dims) {
		t_jit_matrix_info info;
		jit_object_method(matrix, _jit_sym_getinfo, &info);
		info.dimcount = std::clamp((int)dims.size(), 1, (int)JIT_MATRIX_MAX_DIMCOUNT);

		for (int i = 0; i < info.dimcount; i++) {
			info.dim[i] = dims[i];
		}
		
		jit_object_method(matrix, _jit_sym_setinfo, &info);
		jit_object_method(matrix, _jit_sym_getinfo, &info);
		return info;
	}

	inline void post_info(void * sender, cvjit::cstring  name, t_jit_matrix_info const & info) {
		object_post((t_object *)sender, "%s::\nPlanecount: %d\nDimcount: %d\nSize: %d, %d\nType: %s", name,
			info.planecount,
			info.dimcount,
			info.dim[0], info.dim[0],
			info.type == _jit_sym_char ? "char" : info.type == _jit_sym_long ? "long" : info.type == _jit_sym_float32 ? "float32" : "float64");
	}

	using max_object_constructor = auto (*)(t_symbol *s, short argc, t_atom *argv) -> void *;

	template <typename T>
	using max_object_destructor = auto (*)(T *) -> void;

//    template <typename T, typename U>
//    inline U new_max_class(U & class_ptr, cvjit::cstring name, max_object_constructor constructor, max_object_destructor<T> destructor)
//    {
//        t_class    *c = class_new(name,
//            (method)constructor,
//            (method)destructor,
//            sizeof(T),
//            (method)NULL,
//            A_GIMME,
//            0);
//
//        static_assert(std::is_same<U, void *>::value || std::is_same<U, t_class *>::value, "Class must be void * or t_class *");
//        union { void **v_ptr; t_messlist **m_ptr; } alias_ptr;
//        alias_ptr.v_ptr = &(void *)class_ptr;
//        setup(alias_ptr.m_ptr, (method)constructor, (method)destructor, (short)sizeof(T), 0L, A_GIMME, 0);
//        return class_ptr;
//    }

	template <typename T>
	using bang_callback = auto (*)(T *) -> void;

	template <typename T>
	using assist_callback = auto (*)(T *, void *, long, long, char *) -> void;

	class ClassGenerator {
	private:
		t_class * m_class{nullptr};
	public:
		template <typename T>
		ClassGenerator(cvjit::cstring name, max_object_constructor constructor, max_object_destructor<T> destructor) {
			m_class = class_new(name,
				(method)constructor,
				(method)destructor,
				sizeof(T),
				(method)NULL,
				A_GIMME,
				0);
		}

		~ClassGenerator() {
			class_register(CLASS_BOX, m_class);
		}

		template <typename T>
		void set_bang(bang_callback<T> callback) {
			class_addmethod(m_class, (method)callback, "bang", 0);
		}

		template <typename T>
		void set_assist(assist_callback<T> callback) {
			class_addmethod(m_class, (method)callback, "assist", A_CANT, 0);
		}

		t_class * get_ptr() const { return m_class; }
	};

	

	template <typename T, typename U>
	inline void set_bang(U class_ptr, bang_callback<T> callback)
	{
		addmess((method)callback, "bang", A_CANT, 0);
	}

	template <typename T>
	inline void set_bang(bang_callback<T> callback)
	{
		addmess((method)callback, "bang", A_CANT, 0);
	}

	template <typename T, typename U>
	inline void set_assist(U class_ptr, assist_callback<T> callback)
	{
		addmess((method)callback, "assist", A_CANT, 0);
	}

	template <typename T>
	inline void set_assist(assist_callback<T> callback)
	{
		addmess((method)callback, "assist", A_CANT, 0);
	}

	template <typename T>
	inline void to_atom(T const & v, t_atom * a) {
		T::unimplemented;
	}

	template <>
	inline void to_atom<t_atom>(t_atom const & v, t_atom * a) {
		*a = v;
	}

	template <>
	inline void to_atom<t_atom_long>(t_atom_long const & v, t_atom * a) {
		atom_setlong(a, v);
	}

	template <>
	inline void to_atom<t_atom_float>(t_atom_float const & v, t_atom * a) {
		atom_setfloat(a, v);
	}

	template <>
	inline void to_atom<t_symbol *>(t_symbol * const & v, t_atom * a) {
		atom_setsym(a, v);
	}

	template <typename T>
	void attribute_get(std::vector<T> & data_src, short *argc, t_atom **argv)
	{
		const short count = static_cast<short>(std::min(static_cast<std::size_t>(std::numeric_limits<short>::max()), data_src.size()));
		t_atom * ptr = nullptr;
		if (*argc && *argv) {
			if (*argc != count) {
				ptr = (t_atom *)sysmem_resizeptr(*argv, sizeof(t_atom) * count);
			}
			else {
				ptr = *argv;
			}
		}
		else {
			ptr = (t_atom *)sysmem_newptr(sizeof(t_atom) * count);
		}

		if (!ptr) {
			object_error(nullptr, "Out of memory!");
			return;
		}

		for (std::size_t i = 0; i < count; i++) {
			to_atom(data_src[i], ptr + i);
		}

		*argv = ptr;
		*argc = (short)count;
	}

}


#endif //#ifndef CVJIT_H
