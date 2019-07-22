/*
cv.jit.unproject
	

Copyright 2010, Jean-Marc Pelletier
jmp@jmpelletier.com

This file is part of cv.jit.

cv.jit is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published 
by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

cv.jit is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with cv.jit.  If not, see <http://www.gnu.org/licenses/>.

*/

/*
Possible improvements:
	As written, the external makes no use of either vector processing or parallel 
	execution. It would be best to support Altivec/SSL and multiple cores, for better 
	performance.
*/

#include "c74_jitter.h"
#include "cvjit.h"
#include <opencv2/calib3d.hpp>

using namespace c74::max;

constexpr float DEFAULT_FOCAL_LENGTH = 1.f;
constexpr float DEFAULT_IMAGE_WIDTH = 1.f;
constexpr float DEFAULT_IMAGE_HEIGHT = 1.f;

constexpr int TRANSLATION_VEC_MAX_SIZE = 3;
constexpr int ROTATION_VEC_MAX_SIZE = 3 * 3; // Rotation matrix

enum RotationFormat {
	Matrix = 0,
	Quaternion,
	Euler,
	Rodrigues,
	ROTATION_FORMAT_COUNT
};

// Attribute symbols
static t_symbol * rotation_formats[ROTATION_FORMAT_COUNT];

typedef struct _cv_jit_unproject
{
	t_object	ob;
	
	float focal_length;
	t_atom format;
	long flip_y_axis;

	t_atom image_size[2]; 
	long image_size_count;
	t_atom translation[TRANSLATION_VEC_MAX_SIZE];
	long translation_count;
	t_atom rotation[ROTATION_VEC_MAX_SIZE];
	long rotation_count;

	std::vector<cv::Point2f> image_points;
	std::vector<cv::Point3f> object_points;

	RotationFormat get_rotation_format() {
		if (format.a_type == A_LONG) {
			return static_cast<RotationFormat>(atom_getlong(&format));
		}
		else if (format.a_type == A_SYM) {
			t_symbol * sym = atom_getsym(&format);
			for (int i = 0; i < ROTATION_FORMAT_COUNT; i++) {
				if (sym == rotation_formats[i]) {
					return static_cast<RotationFormat>(i);
				}
			}
		}

		return Matrix;
	}

} t_cv_jit_unproject;

t_jit_err cv_jit_unproject_init(void); 
t_jit_err cv_jit_unproject_matrix_calc(t_cv_jit_unproject *x, void *inputs, void *outputs);
t_cv_jit_unproject *cv_jit_unproject_new(void);
void cv_jit_unproject_free(t_cv_jit_unproject *x);

// Attributes
t_jit_err cv_jit_unproject_set_format(t_cv_jit_unproject *x, void *attr, long ac, t_atom *av);

void *_cv_jit_unproject_class;

t_jit_err cv_jit_unproject_init(void) 
{
	constexpr int INPUT_COUNT = 2;
	constexpr int OUTPUT_COUNT = 0; // No matrix output


	// Generate symbols
	rotation_formats[Matrix] = gensym("matrix");
	rotation_formats[Euler] = gensym("euler");
	rotation_formats[Quaternion] = gensym("quaternion");
	rotation_formats[Rodrigues] = gensym("rodrigues");

	_cv_jit_unproject_class = jit_class_new("cv_jit_unproject",(method)cv_jit_unproject_new,(method)cv_jit_unproject_free, sizeof(t_cv_jit_unproject),0L);

	//add mop
	t_jit_object * mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop, INPUT_COUNT, OUTPUT_COUNT);
	jit_class_addadornment(_cv_jit_unproject_class, mop);

	jit_mop_input_nolink(mop, 2); // Turn off input linking
	t_object * in2 = (t_jit_object *)jit_object_method(mop, _jit_sym_getinput, 2); // Indices start at 1...
	jit_object_method(in2, _jit_sym_ioproc, jit_mop_ioproc_copy_adapt); // If we don't call this, nolink won't work for input
	jit_mop_output_nolink(mop, 1); //Turn off output linking so that output matrix does not adapt to input

	//add methods
	jit_class_addmethod(_cv_jit_unproject_class, (method)cv_jit_unproject_matrix_calc, "matrix_calc", A_CANT, 0L);

	//add attributes	
	constexpr long flags_get_private_set = ATTR_SET_OPAQUE_USER | ATTR_GET_DEFER_LOW;
	constexpr long flags_get_set = ATTR_SET_USURP_LOW | ATTR_GET_DEFER_LOW; 

	t_jit_object * attr;

	// Read / write attributes
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset, "f_number", _jit_sym_float32, flags_get_set,
		(method)0L, (method)0L, calcoffset(t_cv_jit_unproject, focal_length));
	jit_class_addattr(_cv_jit_unproject_class, attr);

	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset_array, "image_size", _jit_sym_atom, 2, flags_get_set,
		(method)0L, (method)0L, calcoffset(t_cv_jit_unproject, image_size_count), calcoffset(t_cv_jit_unproject, image_size));
	jit_class_addattr(_cv_jit_unproject_class, attr);

	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset, "format", _jit_sym_atom, flags_get_set, 
		(method)0L, (method)cv_jit_unproject_set_format, calcoffset(t_cv_jit_unproject, format));
	jit_class_addattr(_cv_jit_unproject_class, attr);

	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset, "yflip", _jit_sym_atom, flags_get_set,
		(method)0L, (method)0L, calcoffset(t_cv_jit_unproject, flip_y_axis));
	jit_attr_addfilterset_clip(attr, 0, 1, true, true);
	jit_class_addattr(_cv_jit_unproject_class, attr);

	// Read-only attributes
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset_array, "translation", _jit_sym_atom, TRANSLATION_VEC_MAX_SIZE, flags_get_private_set,
		(method)0L, (method)0L, calcoffset(t_cv_jit_unproject, translation_count), calcoffset(t_cv_jit_unproject, translation));
	jit_class_addattr(_cv_jit_unproject_class, attr);

	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset_array, "rotation", _jit_sym_atom, ROTATION_VEC_MAX_SIZE, flags_get_private_set,
		(method)0L, (method)0L, calcoffset(t_cv_jit_unproject, rotation_count), calcoffset(t_cv_jit_unproject, rotation));
	jit_class_addattr(_cv_jit_unproject_class, attr);
	
	// Register class
	jit_class_register(_cv_jit_unproject_class);

	return JIT_ERR_NONE;
}

t_jit_err cv_jit_unproject_set_format(t_cv_jit_unproject *x, void *attr, long ac, t_atom *av)
{
	if (ac > 0) {
		if (av[0].a_type == A_LONG || av[0].a_type == A_FLOAT) {
			t_atom_long val = atom_getlong(av);
			if (val < 0 || val >= ROTATION_FORMAT_COUNT) {
				object_error((t_object *)x, "Invalid format, make sure value is between 0 and %d.", ROTATION_FORMAT_COUNT - 1);
			}
			else {
				atom_setsym(&x->format, rotation_formats[val]);
			}
		}
		else if (av[0].a_type == A_SYM) {
			t_symbol * sym = atom_getsym(av);
			for (int i = 0; i < ROTATION_FORMAT_COUNT; i++) {
				if (sym == rotation_formats[i]) {
					x->format = av[0];
					return JIT_ERR_NONE;
				}
			}
			object_error((t_object *)x, "Invalid format: %s", sym->s_name);
		}
		else {
			object_error((t_object *)x, "Invalid format, please provide a format name or number.");
		}
	}
	return JIT_ERR_NONE;
}

template <typename T>
void read_points(char * ptr, long stride, std::vector<cv::Point2f> & points) {
	char * p = ptr;
	for (cv::Point2f & pt : points) {
		T * data = (T *)p;
		pt.x = (float)data[0];
		pt.y = (float)data[1];
		p += stride;
	}
}

template <typename T>
void read_points(char * ptr, long stride, std::vector<cv::Point3f> & points) {
	char * p = ptr;
	for (cv::Point3f & pt : points) {
		T * data = (T *)p;
		pt.x = (float)data[0];
		pt.y = (float)data[1];
		pt.z = (float)data[2];
		p += stride;
	}
}

template <typename T>
void read_points(char * ptr, t_symbol * type, long stride, std::vector<T> & points) {
	if (type == _jit_sym_char) {
		read_points<uint8_t>(ptr, stride, points);
	}
	if (type == _jit_sym_long) {
		read_points<int32_t>(ptr, stride, points);
	}
	if (type == _jit_sym_float32) {
		read_points<float>(ptr, stride, points);
	}
	if (type == _jit_sym_float64) {
		read_points<double>(ptr, stride, points);
	}
}

inline cv::Vec3d euler_angles(cv::Mat & mat) {
	const double sy = std::sqrt(
		mat.at<double>(0, 0) * mat.at<double>(0, 0) +
		mat.at<double>(1, 0) * mat.at<double>(1, 0));

	if (sy > 1e-6)
	{
		return cv::Vec3d(
			atan2(mat.at<double>(2, 1), mat.at<double>(2, 2)),
			atan2(-mat.at<double>(2, 0), sy),
			atan2(mat.at<double>(1, 0), mat.at<double>(0, 0)));
	}
	else
	{
		return cv::Vec3d(
			atan2(-mat.at<double>(1, 2), mat.at<double>(1, 1)),
			atan2(-mat.at<double>(2, 0), sy),
			0
		);
	}
}

inline cv::Vec4d quaternion(cv::Mat & mat) {
	const double w = std::sqrt(1.0 + mat.at<double>(0, 0) + mat.at<double>(1, 1) + mat.at<double>(2, 2)) * 0.5;
	const double s = 1.0 / (4.0 * w);
	return cv::Vec4d(
		w,
		(mat.at<double>(2, 1) - mat.at<double>(1, 2)) * s,
		(mat.at<double>(0, 2) - mat.at<double>(2, 0)) * s,
		(mat.at<double>(1, 0) - mat.at<double>(0, 1)) * s
	);
}

t_jit_err cv_jit_unproject_matrix_calc(t_cv_jit_unproject *x, void *inputs, void *outputs)
{
	t_object * image_point_matrix = (t_object *)jit_object_method(inputs, _jit_sym_getindex, 0);
	t_object * reference_point_matrix = (t_object *)jit_object_method(inputs, _jit_sym_getindex, 1);

	if (x && image_point_matrix && reference_point_matrix) {
		cvjit::Savelock locks[] = { image_point_matrix, reference_point_matrix };

		// Make sure the plane counts are correct
		cvjit::JitterMatrix image_points(image_point_matrix);
		cvjit::JitterMatrix reference_points(reference_point_matrix);

		if (image_points.get_info().planecount != 2) {
			object_error((t_object *)x, "Image point matrix must have 2 planes");
			return JIT_ERR_MISMATCH_PLANE;
		}

		// Skip if image point is empty
		if (image_points.get_info().dim[0] <= 1 && image_points.get_info().dim[1] <= 1) {
			if (image_points.read<double>(0, 0, 0) == 0.0 && image_points.read<double>(1, 0, 0) == 0.0) {
				for (int i = 0; i < TRANSLATION_VEC_MAX_SIZE; i++) {
					atom_setfloat(x->translation + i, 0.0);
				}
				for (int i = 0; i < ROTATION_VEC_MAX_SIZE; i++) {
					atom_setfloat(x->rotation + i, 0.0);
				}
				return JIT_ERR_NONE;
			}
		}

		if (reference_points.get_info().planecount != 3) {
			object_error((t_object *)x, "Reference point matrix must have 3 planes");
			return JIT_ERR_MISMATCH_PLANE;
		}

		// Make sure the number of points match
		if (image_points.get_info().dim[0] != reference_points.get_info().dim[0]) {
			object_error((t_object *)x, "The numbers of image and reference points do not match: %d and %d", image_points.get_info().dim[0], reference_points.get_info().dim[0]);
			return JIT_ERR_MISMATCH_DIM;
		}

		// Prepare the inputs
		x->image_points.resize(image_points.get_info().dim[0]);
		x->object_points.resize(reference_points.get_info().dim[0]);

		read_points(image_points.get_data(), image_points.get_info().type, 
			image_points.get_info().dimstride[0], x->image_points);
	
		read_points(reference_points.get_data(), reference_points.get_info().type, 
			reference_points.get_info().dimstride[0], x->object_points);

		const float image_width = (float)atom_getfloat(&x->image_size[0]);
		const float image_height = (float)atom_getfloat(&x->image_size[1]);

		if (x->flip_y_axis) {
			for (cv::Point2f & p : x->image_points) {
				p.y = image_height - p.y;
			}
		}

		try {
			cv::Mat camera_matrix = (cv::Mat_<double>(3, 3) << 
				x->focal_length, 0,               image_width * 0.5,
				0,               x->focal_length, image_height * 0.5,
				0,               0,               1
			);
			cv::Mat distortion_coeffs = cv::Mat::zeros(4, 1, cv::DataType<double>::type); // No distortion
			cv::Mat rotation_vector;
			cv::Mat translation_vector;

			// Calculate
			cv::solvePnPRansac(x->object_points, x->image_points, camera_matrix, distortion_coeffs, rotation_vector, translation_vector);

			// Copy output
			x->translation_count = std::min(translation_vector.rows, TRANSLATION_VEC_MAX_SIZE);
			for (int i = 0; i < x->translation_count; i++) {
				atom_setfloat(x->translation + i, translation_vector.at<double>(i, 0));
			}

			RotationFormat format = x->get_rotation_format();
			switch (format) {
			case Matrix:
				x->rotation_count = 3 * 3;
				break;
			case Quaternion:
				x->rotation_count = 4;
				break;
			default:
				x->rotation_count = 3;
				break;
			}

			if (format == Rodrigues) {
				for (int i = 0; i < x->rotation_count; i++) {
					atom_setfloat(x->rotation + i, rotation_vector.at<double>(i, 0));
				}
			}
			else {
				cv::Mat rotation_mat;
				cv::Rodrigues(rotation_vector, rotation_mat);
				if (rotation_mat.cols != 3 || rotation_mat.rows != 3) {
					object_error((t_object *)x, "Invalid rotation matrix: (%d,%d)", rotation_mat.rows, rotation_mat.cols);
					return JIT_ERR_GENERIC;
				}
				if (format == Matrix) {
					t_atom * a = x->rotation;
					for (int i = 0; i < rotation_mat.rows; i++) {
						for (int j = 0; j < rotation_mat.cols; j++) {
							atom_setfloat(a, rotation_mat.at<double>(i, j));
							a++;
						}
					}
				}
				else if (format == Euler) {
					cv::Vec3f euler = euler_angles(rotation_mat);
					atom_setfloat(x->rotation, euler[0]);
					atom_setfloat(x->rotation + 1, euler[1]);
					atom_setfloat(x->rotation + 2, euler[2]);
				}
				else if (format == Quaternion) {
					cv::Vec4d quat = quaternion(rotation_mat);
					atom_setfloat(x->rotation, quat[0]);
					atom_setfloat(x->rotation + 1, quat[1]);
					atom_setfloat(x->rotation + 2, quat[2]);
					atom_setfloat(x->rotation + 3, quat[3]);
				}
			}
		}
		catch (cv::Exception & exception) {
			object_error((t_object *)x, "OpenCV error: %s", exception.what());
			return JIT_ERR_GENERIC;
		}
	}
	else {
		object_error((t_object *)x, "Could not obtain matrix.");
		return JIT_ERR_INVALID_PTR;
	}
	
	return JIT_ERR_NONE;
}

t_cv_jit_unproject *cv_jit_unproject_new(void)
{
	t_cv_jit_unproject *x;
		
	if ((x=(t_cv_jit_unproject *)jit_object_alloc(_cv_jit_unproject_class))) 
	{
		x->focal_length = DEFAULT_FOCAL_LENGTH;
		x->flip_y_axis = 1;
		atom_setsym(&x->format, rotation_formats[Euler]);

		atom_setfloat(&x->image_size[0], DEFAULT_IMAGE_WIDTH);
		atom_setfloat(&x->image_size[1], DEFAULT_IMAGE_HEIGHT);
		x->image_size_count = 2;

		for (int i = 0; i < TRANSLATION_VEC_MAX_SIZE; i++) {
			atom_setfloat(x->translation + i, 0);
		}

		for (int i = 0; i < ROTATION_VEC_MAX_SIZE; i++) {
			atom_setfloat(x->rotation + i, 0);
		}


	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_unproject_free(t_cv_jit_unproject *x)
{
	/*Nothing to free*/
}