/*
cv.jit.faces
	

Copyright 2019, Jean-Marc Pelletier
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

This file links to the OpenPose library <https://github.com/CMU-Perceptual-Computing-Lab/openpose>

*/

#include <openpose/headers.hpp>

#include "c74_jitter.h"
#include "cvjit.h"

#include <vector>
#include <memory>

using namespace c74::max;

// Define the absolute maximum number of people that can be detected
// at the same time. 
constexpr int MAX_NUMBER_OF_PEOPLE = 32;
constexpr char const * const DEFAULT_MODEL_FN = "pose_iter_584000.caffemodel";
constexpr char const * const DEFAULT_PROTO_FN = "pose_deploy.prototxt";

// Some useful aliases
using PoseVector = std::vector<std::shared_ptr<op::Datum>>;
using PoseVectorPtr = std::shared_ptr<PoseVector>;

//// This structure *defines* a keypoint; it does not actually store any 
//// keypoint information.
//struct Keypoint {
//	char const * const name;
//	t_symbol * symbol;
//	Keypoint(char const * const keyoint_name) : name(keyoint_name) {
//		gensym();
//	}
//
//	void gensym() {
//		symbol = c74::max::gensym(name);
//	}
//};
//
//// Define our keypoints
//const std::vector<Keypoint> keypoints = {
//	// Lower body
//	"toe_tip_L",
//	"toe_joint_L",
//	"ankle_L",
//	"knee_L",
//	"hip_L",
//
//	"toe_tip_R",
//	"toe_joint_R",
//	"ankle_R",
//	"knee_R",
//	"hip_R",
//
//	// Spine
//	"spine_0",
//	"spine_1",
//	"spine_2",
//	"spine_3",
//
//	// Arms
//	"shoulder_L",
//	"elbow_L",
//	"wrist_L",
//	"finger_0_0_L",
//	"finger_0_1_L",
//	"finger_0_2_L",
//	"finger_0_tip_L",
//	"finger_1_0_L",
//	"finger_1_1_L",
//	"finger_1_2_L",
//	"finger_1_tip_L",
//	"finger_2_0_L",
//	"finger_2_1_L",
//	"finger_2_2_L",
//	"finger_2_tip_L",
//	"finger_3_0_L",
//	"finger_3_1_L",
//	"finger_3_2_L",
//	"finger_3_tip_L",
//	"finger_4_0_L",
//	"finger_4_1_L",
//	"finger_4_2_L",
//	"finger_4_tip_L",
//
//	"shoulder_R",
//	"elbow_R",
//	"wrist_R",
//	"finger_0_0_R",
//	"finger_0_1_R",
//	"finger_0_2_R",
//	"finger_0_tip_R",
//	"finger_1_0_R",
//	"finger_1_1_R",
//	"finger_1_2_R",
//	"finger_1_tip_R",
//	"finger_2_0_R",
//	"finger_2_1_R",
//	"finger_2_2_R",
//	"finger_2_tip_R",
//	"finger_3_0_R",
//	"finger_3_1_R",
//	"finger_3_2_R",
//	"finger_3_tip_R",
//	"finger_4_0_R",
//	"finger_4_1_R",
//	"finger_4_2_R",
//	"finger_4_tip_R",
//
//	// Head
//	"head_base",
//	"head_top",
//	"nose_tip",
//
//	// Face
//	"face_outer_points",
//	"face_brow_points_L",
//	"face_brow_points_R",
//	"face_eye_points_L",
//	"face_eye_points_R",
//	"face_nose_ridge_points",
//	"face_nose_base_points",
//	"face_mouth_outer_points",
//	"face_mouth_inner_points"
//};



typedef struct _cv_jit_pose 
{
	t_object ob;

	//t_atom configuration_file_name; // The name of the .protoTxt file
	//t_atom model_file_name; // The name of the .caffemodel file

	//op::WrapperStructFace faceConfig;
	//op::WrapperStructHand handConfig;
	op::WrapperStructPose poseConfig;

	//t_dictionary * pose_dictionary;
	//t_atom pose_dictionary_name;

	//t_dictionary * all_poses[MAX_NUMBER_OF_PEOPLE];

	op::Wrapper openposeWrapper{ op::ThreadManagerMode::Synchronous };
} t_cv_jit_pose;

void *_cv_jit_pose_class;

// Symbols
//t_symbol * dict_name_sym;
//t_symbol * dict_poses_array_sym;

t_jit_err cv_jit_pose_init(void); 
t_cv_jit_pose *cv_jit_pose_new(void);
void cv_jit_pose_free(t_cv_jit_pose *x);
t_jit_err cv_jit_pose_matrix_calc(t_cv_jit_pose *x, void *inputs, void *outputs);
void cv_jit_pose_load(t_cv_jit_pose *x, t_symbol *s, short argc, t_atom *argv);
t_jit_err cv_jit_pose_load_model(t_cv_jit_pose *x, char const * const model_fn, char const * const proto_fn);

// Attribute setters and getters
inline int netImageDimSize(t_atom_long input) {
	return static_cast<int>(input <= 0 ? -1 : input < 16 ? 16 : (input / 16) * 16);
}

inline t_jit_err update_pose_configuration(t_cv_jit_pose * x) {
	try {
		x->openposeWrapper.configure(x->poseConfig);
		return JIT_ERR_NONE;
	}
	catch (std::exception const & e) {
		object_error((t_object *)x, "cv.jit.pose: An error occured while updating OpenPose configuration: %s", e.what());
		return JIT_ERR_GENERIC;
	}
}

t_jit_err cv_jit_pose_get_pose_input_size(t_cv_jit_pose * x, void * attr, long * ac, t_atom **av) {
	t_jit_err err = cvjit::validate_attribute_memory(2, ac, av);
	if (!err) {
		*ac = 2;
		atom_setlong(av[0], x->poseConfig.netInputSize.x);
		atom_setlong(av[1], x->poseConfig.netInputSize.y);
	}
	return err;
}

t_jit_err cv_jit_pose_set_pose_input_size(t_cv_jit_pose * x, void * attr, long ac, t_atom *av) {
	if (ac >= 2) {
		x->poseConfig.netInputSize = {
			netImageDimSize(atom_getlong(&av[0])),
			netImageDimSize(atom_getlong(&av[1]))
		};

		update_pose_configuration(x);
	}
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_pose_get_pose_output_size(t_cv_jit_pose * x, void * attr, long * ac, t_atom **av) {
	t_jit_err err = cvjit::validate_attribute_memory(2, ac, av);
	if (!err) {
		*ac = 2;
		atom_setlong(av[0], x->poseConfig.outputSize.x);
		atom_setlong(av[1], x->poseConfig.outputSize.y);
	}
	return err;
}

t_jit_err cv_jit_pose_set_pose_output_size(t_cv_jit_pose * x, void * attr, long ac, t_atom *av) {
	if (ac >= 2) {
		x->poseConfig.outputSize = {
			netImageDimSize(atom_getlong(&av[0])),
			netImageDimSize(atom_getlong(&av[1]))
		};

		x->openposeWrapper.configure(x->poseConfig);
	}
	return JIT_ERR_NONE;
}

t_jit_err cv_jit_pose_load_model(t_cv_jit_pose *x, char const * const model_fn, char const * const proto_fn)
{
	const std::string model_path = cvjit::get_absolute_path(model_fn);
	const std::string proto_path = cvjit::get_absolute_path(proto_fn);

	if (!model_path.empty() && !proto_path.empty()) {
		x->poseConfig.caffeModelPath = model_path;
		x->poseConfig.protoTxtPath = proto_path;
		return update_pose_configuration(x);
	}
	else {
		if (model_path.empty()) {
			object_error((t_object *)x, "cv.jit.pose: Could not find file %s", model_fn);
		}
		if (proto_path.empty()) {
			object_error((t_object *)x, "cv.jit.pose: Could not find file %s", proto_path);
		}
	}

	return JIT_ERR_GENERIC;
}

void cv_jit_pose_load(t_cv_jit_pose *x, t_symbol *s, short argc, t_atom *argv)
{
	if (argc < 2) {
		object_error((t_object *)x, "cv.jit.pose: Not enough parameters for load. You must provide the filename of the .prototxt and .caffemodel files you wish to use.");
		return;
	}

	if (argv[0].a_type != A_SYM && argv[1].a_type != A_SYM) {
		object_error((t_object *)x, "cv.jit.pose: Invalid arguments. You must provide the filename of the .prototxt and .caffemodel files you wish to use.");
		return;
	}

	cv_jit_pose_load_model(x, argv[0].a_w.w_sym->s_name, argv[1].a_w.w_sym->s_name);
}


// Attribute getters / setters
//t_jit_err cv_jit_pose_set_dict_name(t_cv_jit_pose *x, void *attr, long ac, t_atom *av);

// Poses
//void clear_pose_dictionary(t_dictionary * dictionary);
//void add_poses_to_dictionary(t_dictionary * dictionary, PoseVectorPtr const & poses);



t_jit_err cv_jit_pose_init(void) 
{
	t_jit_object * attr, * mop;
	t_symbol * atsym;

	// Generate symbols
	//dict_name_sym = gensym("dict_name");
	//dict_poses_array_sym = gensym("poses");

	//for (Keypoint & k : keypoints) {
	//	k.gensym();
	//}
	
	atsym = gensym("jit_attr_offset");
	
	_cv_jit_pose_class = jit_class_new("cv_jit_pose", (method)cv_jit_pose_new, (method)cv_jit_pose_free, sizeof(t_cv_jit_pose),0L); 

	//add mop
	const int input_count = 1;
	const int output_count = 1;

	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop, input_count, output_count);

	// We only accept char matrices
   	jit_mop_single_type(mop, _jit_sym_char);
   	   	
	jit_class_addadornment(_cv_jit_pose_class,mop);
	
	//add methods
	jit_class_addmethod(_cv_jit_pose_class, (method)cv_jit_pose_matrix_calc, "matrix_calc", A_CANT, 0L);
	jit_class_addmethod(_cv_jit_pose_class, (method)cv_jit_pose_load, "load", A_GIMME, 0L);

	//add attributes
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset, "input_size", _jit_sym_list, ATTR_GET_DEFER_LOW | ATTR_SET_USURP_LOW, cv_jit_pose_get_pose_input_size, cv_jit_pose_set_pose_input_size, nullptr);
	jit_class_addattr(_cv_jit_pose_class, attr);

	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset, "output_size", _jit_sym_list, ATTR_GET_DEFER_LOW | ATTR_SET_USURP_LOW, cv_jit_pose_get_pose_output_size, cv_jit_pose_set_pose_output_size, nullptr);
	jit_class_addattr(_cv_jit_pose_class, attr);


	//attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,
	//	"configuration_file",  // Attribute name
	//	_jit_sym_atom,  // Type
	//	ATTR_GET_DEFER_LOW | ATTR_SET_USURP_LOW, // Flags
	//	nullptr, // Getter
	//	nullptr, // Setter
	//	calcoffset(t_cv_jit_pose, configuration_file_name)); // Data
	//jit_class_addattr(_cv_jit_pose_class, attr);

	//attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,
	//	"model_file",  // Attribute name
	//	_jit_sym_atom,  // Type
	//	ATTR_GET_DEFER_LOW | ATTR_SET_USURP_LOW, // Flags
	//	nullptr, // Getter
	//	nullptr, // Setter
	//	calcoffset(t_cv_jit_pose, model_file_name)); // Data
	//jit_class_addattr(_cv_jit_pose_class, attr);
	
	jit_class_register(_cv_jit_pose_class);

	return JIT_ERR_NONE;
}


t_jit_err cv_jit_pose_matrix_calc(t_cv_jit_pose *x, void *inputs, void *outputs)
{
	t_jit_err err = JIT_ERR_NONE;
	t_jit_matrix_info in_minfo;


	t_object * in_matrix = static_cast<t_object *>(jit_object_method(inputs, _jit_sym_getindex, 0));
	t_object * out_matrix = static_cast<t_object *>(jit_object_method(outputs, _jit_sym_getindex, 0));

	if (x && in_matrix) 
	{
		//Lock the matrices
		cvjit::Savelock locks[] = { in_matrix, out_matrix };
		
		//Make sure input is of proper format
		jit_object_method(in_matrix, _jit_sym_getinfo, &in_minfo);

		err = cvjit::check_matrix(
			cvjit::check_matrix_dimcount(in_minfo, 2, 2),
			cvjit::check_matrix_planecount(in_minfo, 4, 4),
			cvjit::check_matrix_type(in_minfo, _jit_sym_char),
			cvjit::check_matrix_size(in_minfo, 0, 4),
			cvjit::check_matrix_size(in_minfo, 1, 4)
		);

		if (err == JIT_ERR_NONE) {

		}
	}

	return err;
}

//static t_dictionary * create_pose_dictionary() {
//	t_dictionary * pose_dict = dictionary_new();
//	if (pose_dict) {
//		t_atom points[3];
//		for (t_atom & a : points) {
//			atom_setfloat(&a, 0);
//		}
//
//		const size_t count = keypoints.size();
//		for (int i = 0; i < count; i++) {
//			dictionary_appendatoms(pose_dict, keypoints[i].symbol, 3, points);
//		}
//	}
//
//	return pose_dict;
//}

t_cv_jit_pose *cv_jit_pose_new(void)
{
	t_cv_jit_pose *x;

	if ((x=(t_cv_jit_pose *)jit_object_alloc(_cv_jit_pose_class))) {
		
		// Generate a name for the pose dictionary if needed
		// The attribute setter will take care of allocating a new dictionary for us here
		//t_symbol * name = symbol_unique();
		//object_attr_setsym(x, dict_name_sym, name);

		// Initialize wrapper

		// Check to see if user has downloaded the required files
		std::string proto_path = cvjit::get_absolute_path(DEFAULT_PROTO_FN);
		std::string model_path = cvjit::get_absolute_path(DEFAULT_MODEL_FN);

		
		x->poseConfig.keypointScaleMode = op::ScaleMode::ZeroToOne;
		x->poseConfig.enableGoogleLogging = false;

		if (proto_path.empty() || model_path.empty()) {
			object_warn((t_object *)x, "Could not find default .prototxt and .caffemodel files.\nBefore using cv.jit.pose, you should first download the required files to your Max search path. The download helper in the extras menu can take care of this for you.");
		}
		else {
			x->poseConfig.protoTxtPath = proto_path;
			x->poseConfig.caffeModelPath = model_path;
		}

		update_pose_configuration(x);
		
	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_pose_free(t_cv_jit_pose *x)
{
	// Don't forget to free the dictionary
	//object_free(x->pose_dictionary);
}

// Attributes
//t_jit_err cv_jit_pose_set_dict_name(t_cv_jit_pose *x, void *attr, long ac, t_atom *av)
//{
//	if (ac < 1) {
//		//Not enough parameters?
//		return JIT_ERR_NONE;
//	}
//
//	t_symbol * new_name = atom_getsym(av);
//	t_symbol * old_name = atom_getsym(&x->pose_dictionary_name);
//
//	if (!old_name || !new_name || old_name != new_name) {
//		object_free(x->pose_dictionary);
//		x->pose_dictionary = dictionary_new();
//		x->pose_dictionary = dictobj_register(x->pose_dictionary, &new_name);
//		atom_setsym(&x->pose_dictionary_name, new_name);
//
//		clear_pose_dictionary(x->pose_dictionary);
//	}
//
//	if (!x->pose_dictionary) {
//		object_error((t_object *)x, "could not create dictionary named %s", new_name->s_name);
//	}
//
//	return JIT_ERR_NONE;
//}
//
//void clear_pose_dictionary(t_dictionary * dictionary)
//{
//	if (dictionary) {
//		t_atomarray * atomarray = atomarray_new(0, nullptr);
//		dictionary_clear(dictionary);
//		if (atomarray) {
//			dictionary_appendatomarray(dictionary, dict_poses_array_sym, atomarray);
//		}
//	}
//}



//void add_poses_to_dictionary(t_dictionary * dictionary, PoseVectorPtr const & poses)
//{
//	if (dictionary) {
//		// Can we re-use existing dictionaries?
//	}
//}