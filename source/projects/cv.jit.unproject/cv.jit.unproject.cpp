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

#include "cvjit.h"
#include "cvjit_keypoints.h"
#include <opencv2/calib3d.hpp>

using namespace c74::max;

constexpr float DEFAULT_FOCAL_LENGTH = 0.906f;
constexpr float DEFAULT_IMAGE_WIDTH = 1.f;
constexpr float DEFAULT_IMAGE_HEIGHT = 0.75f;

constexpr int TRANSLATION_VEC_MAX_SIZE = 3;
constexpr int ROTATION_VEC_MAX_SIZE = 3 * 3; // Rotation matrix

enum class RotationFormat {
	Euler = 0,
	Quaternion,
	AxisAngle,
	Matrix,
	COUNT
};

enum class Method {
	Iterative = 0,
	EPNP,
	P3P,
	DLS,
	COUNT
};

constexpr int method_flags[(int)Method::COUNT] = {
	cv::SOLVEPNP_ITERATIVE,
	cv::SOLVEPNP_EPNP,
	cv::SOLVEPNP_P3P,
	cv::SOLVEPNP_DLS
};


static const cvjit::AttributeAliases<RotationFormat> format_aliases(
	std::make_pair(RotationFormat::Euler, "Euler"),
	std::make_pair(RotationFormat::Quaternion, "quaternion"),
	std::make_pair(RotationFormat::AxisAngle, "axis-angle"),
	std::make_pair(RotationFormat::Matrix, "matrix"));

static const cvjit::AttributeAliases<Method> method_aliases(
	std::make_pair(Method::Iterative, "iterative"),
	std::make_pair(Method::EPNP, "EPNP"),
	std::make_pair(Method::P3P, "P3P"),
	std::make_pair(Method::DLS, "DLS"));

typedef struct _cv_jit_unproject
{
	t_object	ob;
	
	float focal_length;
	// t_atom method;
	// t_atom format;

	cvjit::AttributeAlias method;
	cvjit::AttributeAlias format;

	long normalize;

	t_atom image_size[2]; 
	long image_size_count;
	t_atom translation[TRANSLATION_VEC_MAX_SIZE];
	long translation_count;
	t_atom rotation[ROTATION_VEC_MAX_SIZE];
	long rotation_count;

	long valid;

	std::vector<cv::Point2f> image_points;
	std::vector<cv::Point3f> object_points;

} t_cv_jit_unproject;

t_jit_err cv_jit_unproject_init(void); 
t_jit_err cv_jit_unproject_matrix_calc(t_cv_jit_unproject *x, void *inputs, void *outputs);
t_cv_jit_unproject *cv_jit_unproject_new(void);
void cv_jit_unproject_free(t_cv_jit_unproject *x);


void *_cv_jit_unproject_class;

constexpr int METHOD_COUND = 4;

// Attributes
t_jit_err cv_jit_unproject_set_method(t_cv_jit_unproject *x, void *attr, long ac, t_atom *av)
{
	if (ac > 0 && av) {
		x->method = method_aliases.get(av);
	}

	return JIT_ERR_NONE;
}

t_jit_err cv_jit_unproject_get_method(t_cv_jit_unproject *x, void *attr, long *ac, t_atom **av)
{
	x->method.get(ac, av);
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_unproject_set_format(t_cv_jit_unproject *x, void *attr, long ac, t_atom *av)
{
	if (ac > 0 && av) {
		x->format = format_aliases.get(av);
	}

	return JIT_ERR_NONE;
}

t_jit_err cv_jit_unproject_get_format(t_cv_jit_unproject *x, void *attr, long *ac, t_atom **av)
{
	x->format.get(ac, av);
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_unproject_init(void) 
{
	constexpr int INPUT_COUNT = 2;
	constexpr int OUTPUT_COUNT = 0; // No matrix output

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

	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset, "method", _jit_sym_atom, flags_get_set,
		(method)cv_jit_unproject_get_method, (method)cv_jit_unproject_set_method, 0L);
	jit_class_addattr(_cv_jit_unproject_class, attr);

	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset, "format", _jit_sym_atom, flags_get_set,
		(method)cv_jit_unproject_get_format, (method)cv_jit_unproject_set_format, 0L);
	jit_class_addattr(_cv_jit_unproject_class, attr);

	// Normalize attribute
	jit_class_addattr(_cv_jit_unproject_class, cvjit::normalize_attr<t_cv_jit_unproject>());

	// Read-only attributes
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset_array, "translation", _jit_sym_atom, TRANSLATION_VEC_MAX_SIZE, flags_get_private_set,
		(method)0L, (method)0L, calcoffset(t_cv_jit_unproject, translation_count), calcoffset(t_cv_jit_unproject, translation));
	jit_class_addattr(_cv_jit_unproject_class, attr);

	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset_array, "rotation", _jit_sym_atom, ROTATION_VEC_MAX_SIZE, flags_get_private_set,
		(method)0L, (method)0L, calcoffset(t_cv_jit_unproject, rotation_count), calcoffset(t_cv_jit_unproject, rotation));
	jit_class_addattr(_cv_jit_unproject_class, attr);

	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset, "valid", _jit_sym_long, cvjit::Flags::private_set,
		(method)0L, (method)0L, calcoffset(t_cv_jit_unproject, valid));
	jit_class_addattr(_cv_jit_unproject_class, attr);
	
	// Register class
	jit_class_register(_cv_jit_unproject_class);

	return JIT_ERR_NONE;
}


template <typename T>
void read_points(char * ptr, long stride, long planes, std::vector<cv::Point2f> & points) {
	char * p = ptr;
	if (planes == 2 || planes == cvjit::KEYPOINT_FIELD_COUNT) {
		for (cv::Point2f & pt : points) {
			T * data = (T *)p;
			pt.x = (float)data[0];
			pt.y = (float)data[1];
			p += stride;
		}
	}
}

template <typename T>
void read_points(char * ptr, long stride, long planes, std::vector<cv::Point3f> & points) {
	char * p = ptr;
	if (planes == 3) {
		for (cv::Point3f & pt : points) {
			T * data = (T *)p;
			pt.x = (float)data[0];
			pt.y = (float)data[1];
			pt.z = (float)data[2];
			p += stride;
		}
	}
	else if (planes == 2 || planes == cvjit::KEYPOINT_FIELD_COUNT) {
		for (cv::Point3f & pt : points) {
			T * data = (T *)p;
			pt.x = (float)data[0];
			pt.y = (float)data[1];
			pt.z = 0.f;
			p += stride;
		}
	}
	
}

template <typename T>
void read_points(char * ptr, t_symbol * type, long stride, long planes, std::vector<T> & points) {
	if (type == _jit_sym_char) {
		read_points<uint8_t>(ptr, stride, planes, points);
	}
	if (type == _jit_sym_long) {
		read_points<int32_t>(ptr, stride, planes, points);
	}
	if (type == _jit_sym_float32) {
		read_points<float>(ptr, stride, planes, points);
	}
	if (type == _jit_sym_float64) {
		read_points<double>(ptr, stride, planes, points);
	}
}

inline cv::Vec4d quaternion(cv::Mat & mat) {
	const double trace = mat.at<double>(0, 0) + mat.at<double>(1, 1) + mat.at<double>(2, 2);
	double w, x, y, z;
	if (trace > 0.0) {
		const double s = std::sqrt(trace + 1.0) * 2.0;
		w = 0.25 * s;
		x = (mat.at<double>(2, 1) - mat.at<double>(1, 2)) / s;
		y = (mat.at<double>(0, 2) - mat.at<double>(2, 0)) / s;
		z = (mat.at<double>(1, 0) - mat.at<double>(0, 1)) / s;
	}
	else if ((mat.at<double>(0, 0) > mat.at<double>(1, 1)) && (mat.at<double>(0, 0) > mat.at<double>(2, 2))) {
		double const s = std::sqrt(1.0 + mat.at<double>(0, 0) - mat.at<double>(1, 1) - mat.at<double>(2, 2)) * 2.0;
		w = (mat.at<double>(2, 1) - mat.at<double>(1, 2)) / s;
		x = 0.25 * s;
		y = (mat.at<double>(0, 1) + mat.at<double>(1, 0)) / s;
		z = (mat.at<double>(0, 2) + mat.at<double>(2, 0)) / s;
	}
	else if (mat.at<double>(1, 1) > mat.at<double>(2, 2)) {
		const double s = std::sqrt(1.0 + mat.at<double>(1, 1) - mat.at<double>(0, 0) - mat.at<double>(2, 2)) * 2.0;
		w = (mat.at<double>(0, 2) - mat.at<double>(2, 0)) / s;
		x = (mat.at<double>(0, 1) + mat.at<double>(1, 0)) / s;
		y = 0.25 * s;
		z = (mat.at<double>(1, 2) + mat.at<double>(2, 1)) / s;
	}
	else {
		const double s = std::sqrt(1.0 + mat.at<double>(2, 2) - mat.at<double>(0, 0) - mat.at<double>(1, 1)) * 2;
		w = (mat.at<double>(1, 0) - mat.at<double>(0, 1)) / s;
		x = (mat.at<double>(0, 2) + mat.at<double>(2, 0)) / s;
		y = (mat.at<double>(1, 2) + mat.at<double>(2, 1)) / s;
		z = 0.25 * s;
	}

	return cv::Vec4d(x, y, z, w);
}

t_jit_err cv_jit_unproject_matrix_calc(t_cv_jit_unproject *x, void *inputs, void *outputs)
{
	t_object * image_point_matrix = (t_object *)jit_object_method(inputs, _jit_sym_getindex, 0);
	t_object * reference_point_matrix = (t_object *)jit_object_method(inputs, _jit_sym_getindex, 1);


	if (x && image_point_matrix && reference_point_matrix) {
		cvjit::Savelock locks[] = { image_point_matrix, reference_point_matrix };

		// Wrap the matrices
		cvjit::JitterMatrix image_points(image_point_matrix);
		cvjit::JitterMatrix reference_points(reference_point_matrix);

		// Will be updated if calculation is succesful
		x->valid = 0;

		// If the image point matrix is empty, skip
		if (image_points.empty()) {
			return JIT_ERR_NONE;
		}

		// Make sure the plane counts are correct
		if (image_points.get_info().planecount != 2 && image_points.get_info().planecount != cvjit::KEYPOINT_FIELD_COUNT) {
			object_error((t_object *)x, "Image point matrix must have 2 or %d planes", cvjit::KEYPOINT_FIELD_COUNT);
			return JIT_ERR_MISMATCH_PLANE;
		}

		if (reference_points.get_info().planecount != 2 && reference_points.get_info().planecount != 3 && reference_points.get_info().planecount != cvjit::KEYPOINT_FIELD_COUNT) {
			object_error((t_object *)x, "Reference point matrix must have 2, 3 or %d planes", cvjit::KEYPOINT_FIELD_COUNT);
			return JIT_ERR_MISMATCH_PLANE;
		}

		// Find out how the points are arranged
		long in_dim1 = image_points.get_info().dim[0] == 1 ? 1 : 0;
		long in_dim2 = reference_points.get_info().dim[0] == 1 ? 1 : 0;

		// Make sure the number of points match
		if (image_points.get_info().dim[in_dim1] != reference_points.get_info().dim[in_dim2]) {
			// object_error((t_object *)x, "The numbers of image and reference points do not match: %d and %d", image_points.get_info().dim[in_dim1], reference_points.get_info().dim[in_dim2]);
			// return JIT_ERR_MISMATCH_DIM;

			// This situation is common enough that it's best to quietly exit.
			// The user can check the valid attribute instead.
			return JIT_ERR_NONE;
		}

		if (image_points.get_info().dim[in_dim1] < 4) {	
			return JIT_ERR_NONE;
		}

		// Prepare the inputs
		x->image_points.resize(image_points.get_info().dim[in_dim1]);
		x->object_points.resize(reference_points.get_info().dim[in_dim2]);

		read_points(image_points.get_data(), image_points.get_info().type, 
			image_points.get_info().dimstride[in_dim1], image_points.get_info().planecount, x->image_points);
	
		read_points(reference_points.get_data(), reference_points.get_info().type, 
			reference_points.get_info().dimstride[in_dim2], reference_points.get_info().planecount, x->object_points);

		const double image_width = atom_getfloat(&x->image_size[0]);
		const double image_height = atom_getfloat(&x->image_size[1]);

		const double cx = image_width * 0.5;
		const double cy = image_height * 0.5;

		// Adjust input if normalized
		if (x->normalize) {
			for (cv::Point2f & p : x->image_points) {
				p.x *= (float)image_width;
				p.y *= (float)image_height;
			}
		}

		try {
			cv::Mat camera_matrix = (cv::Mat_<double>(3, 3) << 
				x->focal_length, 0,               cx,
				0,               x->focal_length, cy,
				0,               0,               1
			);
			cv::Mat distortion_coeffs = cv::Mat::zeros(4, 1, cv::DataType<double>::type); // No distortion
			cv::Mat rotation_vector;
			cv::Mat translation_vector;

			// Calculate
			cv::solvePnPRansac(
				x->object_points, 
				x->image_points, 
				camera_matrix, 
				distortion_coeffs, 
				rotation_vector, 
				translation_vector, 
				false, // useExtrinsicGuess 
				100, // iterationsCount 
				8.0, // reprojectionError 
				0.99, // confidence
				cv::noArray(), // inliers
				method_flags[x->method.val]
			);

			x->valid = 1;

			cv::Mat rotation_mat;
			cv::Rodrigues(rotation_vector, rotation_mat);
			
			// Correct rotation and translation:
			if (translation_vector.at<double>(2, 0) < 0.) {
				// Object can't be behind the camera
				translation_vector.at<double>(2, 0) *= -1.0;
			}
			else {
				// Object is in front of camera, but translation and rotation still need to be fixed.
				rotation_mat.at<double>(0, 0) *= -1.0;
				rotation_mat.at<double>(0, 1) *= -1.0;
				rotation_mat.at<double>(0, 2) *= -1.0;
				rotation_mat.at<double>(1, 0) *= -1.0;
				rotation_mat.at<double>(1, 1) *= -1.0;
				rotation_mat.at<double>(1, 2) *= -1.0;

				translation_vector.at<double>(0, 0) *= -1.0;
				translation_vector.at<double>(1, 0) *= -1.0;
			}

			cv::Vec4d quat = quaternion(rotation_mat);

			// Copy output
			x->translation_count = std::min(translation_vector.rows, TRANSLATION_VEC_MAX_SIZE);
			for (int i = 0; i < x->translation_count; i++) {
				double val = translation_vector.at<double>(i, 0);
				atom_setfloat(x->translation + i, val);
			}

			const RotationFormat format = x->format.as<RotationFormat>();

			switch (format) {
			case RotationFormat::Quaternion:
			case RotationFormat::AxisAngle:
				x->rotation_count = 4;
				break;
			case RotationFormat::Matrix:
				x->rotation_count = 3 * 3;
				break;
			default:
				x->rotation_count = 3;
				break;
			}

			switch (format) {
			case RotationFormat::Quaternion:
			{
				// Results already in quaternion form, output as is
				atom_setfloat(x->rotation, quat[0]);
				atom_setfloat(x->rotation + 1, quat[1]);
				atom_setfloat(x->rotation + 2, quat[2]);
				atom_setfloat(x->rotation + 3, quat[3]);
				break;
			}

			case RotationFormat::AxisAngle:
			{
				cv::Vec3d axis(0, 0, 1);
				double theta = 2.0 * std::acos(quat[3]);
				if (std::fpclassify(theta) != FP_NORMAL) {
					// Almost zero or NaN
					theta = 0.0;
				}
				else {
					double a = std::sqrt(1.0 - quat[3] * quat[3]);
					axis[0] = quat[0] / a;
					axis[1] = quat[1] / a;
					axis[2] = quat[2] / a;
				}

				atom_setfloat(x->rotation, cvjit::rad2deg(theta)); // Theta
				atom_setfloat(x->rotation + 1, axis[0]); // x
				atom_setfloat(x->rotation + 2, axis[1]); // y
				atom_setfloat(x->rotation + 3, axis[2]); // z

				break;
			}

			case RotationFormat::Euler:
			{
				const double a = quat[0] * quat[1] + quat[2] * quat[3];
				if (a > 0.4999) {
					atom_setfloat(x->rotation, 0); // bank / roll
					atom_setfloat(x->rotation + 1, cvjit::rad2deg(2.0 * std::atan2(quat[0], quat[3]))); // heading / yaw
					atom_setfloat(x->rotation + 2, 90.0); // attitute / pitch
				}
				else if (a < -0.4999) {
					atom_setfloat(x->rotation, 0); // bank / roll
					atom_setfloat(x->rotation + 1, cvjit::rad2deg(-2.0 * std::atan2(quat[0], quat[3]))); // heading / yaw
					atom_setfloat(x->rotation + 2, -90.0); // attitute / pitch
				}
				else {
					const double x_sq = quat[0] * quat[0];
					const double y_sq = quat[1] * quat[1];
					const double z_sq = quat[2] * quat[2];

					atom_setfloat(x->rotation, cvjit::rad2deg(std::atan2(2.0 * quat[0] * quat[3] - 2.0 * quat[1] * quat[2], 1.0 - 2.0 * x_sq - 2.0 * z_sq))); // bank / roll
					atom_setfloat(x->rotation + 1, cvjit::rad2deg(std::atan2(2.0 * quat[1] * quat[3] - 2.0 * quat[0] * quat[2], 1.0 - 2.0 * y_sq - 2.0 * z_sq))); // heading / yaw
					atom_setfloat(x->rotation + 2, cvjit::rad2deg(std::asin(2.0 * a))); // attitute / pitch
				}
				break;
			}

			case RotationFormat::Matrix:
			{
				atom_setfloat(x->rotation, rotation_mat.at<double>(0, 0));
				atom_setfloat(x->rotation + 1, rotation_mat.at<double>(1, 0));
				atom_setfloat(x->rotation + 2, rotation_mat.at<double>(2, 0));

				atom_setfloat(x->rotation + 3, rotation_mat.at<double>(0, 1));
				atom_setfloat(x->rotation + 4, rotation_mat.at<double>(1, 1));
				atom_setfloat(x->rotation + 5, rotation_mat.at<double>(2, 1));

				atom_setfloat(x->rotation + 6, rotation_mat.at<double>(0, 2));
				atom_setfloat(x->rotation + 7, rotation_mat.at<double>(1, 2));
				atom_setfloat(x->rotation + 8, rotation_mat.at<double>(2, 2));

				break;
			}
			} // switch
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

		atom_setfloat(&x->image_size[0], DEFAULT_IMAGE_WIDTH);
		atom_setfloat(&x->image_size[1], DEFAULT_IMAGE_HEIGHT);
		x->image_size_count = 2;

		x->valid = 0;
		x->normalize = 0;

		x->method = method_aliases.get();
		x->format = format_aliases.get();
			;
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