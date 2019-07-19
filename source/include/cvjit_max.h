#ifndef CVJIT_MAX
#define CVJIT_MAX

#include <vector>
#include <cmath>
#include <string>
#include <sstream>
#include <algorithm>

#include "c74_jitter.h"

using namespace c74::max;

namespace cvjit {

    using cstring = char const * const;

	class WrapperTool {
	protected:
		void * m_owner{ nullptr };
	public:
		WrapperTool() = default;
		virtual ~WrapperTool() = default;

		WrapperTool(void * owner) : m_owner(owner) {}

		void post(std::string const & message) {
			object_post((t_object *)m_owner, message.c_str());
		}

		void post_error(std::string const & message) {
			object_error((t_object *)m_owner, message.c_str());
		}
	};
    
    class WrapperOutlet : public WrapperTool {
	private:
		
		void * m_outlet;
		void * m_jitter_object{ nullptr };
		t_symbol * m_getter;
		std::vector<t_atom> m_data;

	public:
		static const size_t MAX_LENGTH_DEFAULT = 256;

		WrapperOutlet() = default;

		WrapperOutlet(void * owner, cvjit::cstring property, size_t length = MAX_LENGTH_DEFAULT) :
			WrapperTool(owner)
		{
			if (nullptr != m_owner) {
				m_data.resize(length);
				m_jitter_object = max_jit_obex_jitob_get(m_owner);
				if (!m_jitter_object) {
					post_error("Could not retrieve Jitter object for outlet.");
					return;
				}

				if (!property) {
					post_error("No property provided for outlet.");
					return;
				}

				const std::string getter_string = std::string("get") + std::string(property);
				m_getter = gensym(getter_string.c_str());

				m_outlet = outlet_new(m_owner, property);
				if (!m_outlet) {
					post_error("Could not create outlet.");
				}
			}
			else {
				post_error("No owner provided for outlet.");
			}
		}

		~WrapperOutlet() = default;

		void output() {
			if (m_owner && m_jitter_object && m_getter) {
				long count = 0;
				t_atom * data = m_data.data();
				t_jit_err err = (t_jit_err)jit_object_method(m_jitter_object, m_getter, &count, &data);
				if (JIT_ERR_NONE != err) {
					post_error("Could not retrieve outlet data.");
					jit_error_code(m_jitter_object, err);
					return;
				}

				if (!data) {
					post_error("No data from Jitter object.");
				}

				void * outlet_no_err = nullptr;

				if (count == 1) {
					switch (data[0].a_type) {
					case A_FLOAT:
						outlet_no_err = outlet_float(m_outlet, atom_getfloat(data));
						break;
					case A_LONG:
						outlet_no_err = outlet_int(m_outlet, atom_getlong(data));
						break;
					case A_SYM:
						outlet_no_err = outlet_anything(m_outlet, atom_getsym(data), 0, nullptr);
					}
				}
				else if (count > 1) {
					outlet_no_err = outlet_list(m_outlet, nullptr, (short)count, data);
				}
				else {
					post_error("Empty outlet data.");
				}

				if (!outlet_no_err) {
					post_error("Stack overflow during outlet output.");
				}
			}
		}
	};
}

#endif