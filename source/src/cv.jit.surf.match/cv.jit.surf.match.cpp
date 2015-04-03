/*
cv.jit.surf.match
	

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
This file links to the OpenCV library <http://sourceforge.net/projects/opencvlibrary/>

Please refer to the  Intel License Agreement For Open Source Computer Vision Library.

Please also read the notes concerning technical issues with using the OpenCV library
in Jitter externals.
*/


#ifdef __cplusplus
extern "C" {
#endif
#include "jit.common.h"
#ifdef __cplusplus 
} //extern "C"
#endif

#include <vector>

typedef struct _feature_match{
	float x1;
	float y1;
	float z1;
	float x2;
	float y2;
	float z2;
	float a_index;
	float b_index;
	float distance;
} FeatureMatch;

typedef struct _cv_jit_surf_match 
{
	t_object				ob;
	float threshold;
	std::vector <FeatureMatch> matches;
	
} t_cv_jit_surf_match;



void *_cv_jit_surf_match_class;

t_jit_err 				cv_jit_surf_match_init(void); 
t_cv_jit_surf_match *	cv_jit_surf_match_new(void);
void 					cv_jit_surf_match_free(t_cv_jit_surf_match *x);
t_jit_err 				cv_jit_surf_match_matrix_calc(t_cv_jit_surf_match *x, void *inputs, void *outputs);

t_jit_err cv_jit_surf_match_init(void) 
{
	long attrflags=0;
	t_jit_object *mop,*output,*io;
	
	_cv_jit_surf_match_class = jit_class_new("cv_jit_surf_match",(method)cv_jit_surf_match_new,(method)cv_jit_surf_match_free,
		sizeof(t_cv_jit_surf_match),A_CANT,0L); //A_CANT = untyped

	//add mop
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop,2,1);  //Object has two inputs and one output
	output = (t_jit_object *)jit_object_method(mop,_jit_sym_getoutput,1); //Get a pointer to the output matrix

   	jit_mop_single_type(mop,_jit_sym_float32);   //Set input type and planecount
   	jit_mop_single_planecount(mop,1);  
   	
   	jit_mop_output_nolink(mop,1); //Turn off output linking so that output matrix does not adapt to input
	jit_mop_input_nolink(mop, 2); //Turn off input linking
	
	//Set input format
	io = (t_jit_object *)jit_object_method(mop,_jit_sym_getinput,2); //Get a pointer to the input matrix
	jit_object_method(io,_jit_sym_ioproc,jit_mop_ioproc_copy_adapt); //We need to set this so that input2 adapts to incoming matrix
	
	io = (t_jit_object *)jit_object_method(mop,_jit_sym_getinput,1); //Get a pointer to the input matrix
	jit_attr_setlong(io,_jit_sym_minplanecount,1);
  	jit_attr_setlong(io,_jit_sym_maxplanecount,1);
  	jit_attr_setlong(io,_jit_sym_mindim,2);
  	jit_attr_setlong(io,_jit_sym_maxdim,2);
  	jit_attr_setsym(io,_jit_sym_types,_jit_sym_float32);
   	
   	jit_attr_setlong(output,_jit_sym_minplanecount,9);  //Nine planes:
  	jit_attr_setlong(output,_jit_sym_maxplanecount,9);	//Feature A x-coord, feature A y-coord
														//feature A size, feature B x-coord, feature B y-coord, 
														//feature B size, feature index A, feature index B, distance
  	jit_attr_setlong(output,_jit_sym_mindim,1); //Only one dimension
  	jit_attr_setlong(output,_jit_sym_maxdim,1);
  	jit_attr_setsym(output,_jit_sym_types,_jit_sym_float32); //Coordinates are returned with sub-pixel accuracy
   	   	
	jit_class_addadornment(_cv_jit_surf_match_class,mop);
	
	
	//add methods
	jit_class_addmethod(_cv_jit_surf_match_class, (method)cv_jit_surf_match_matrix_calc, 		"matrix_calc", 		A_CANT, 0L);	
	
	//add attributes
	attrflags = JIT_ATTR_GET_DEFER_LOW | JIT_ATTR_SET_USURP_LOW;
	/*
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset,"threshold",_jit_sym_float32,
										  attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_surf_match,threshold));
	jit_class_addattr(_cv_jit_surf_match_class,attr);
	 */
			
	jit_class_register(_cv_jit_surf_match_class);

	return JIT_ERR_NONE;
}

t_jit_err cv_jit_surf_match_matrix_calc(t_cv_jit_surf_match *x, void *inputs, void *outputs)
{
	t_jit_err err=JIT_ERR_NONE;
	long in1_savelock=0, in2_savelock=0, out_savelock=0;
	t_jit_matrix_info in1_minfo, in2_minfo, out_minfo;
	char *in1_bp, *in2_bp;
	void *in1_matrix, *in2_matrix, *out_matrix;
	int i,j,k,step1, step2, match_count, closest_ndx=-1;
	float d, d_temp, closest_d, next_closest_d, d2;
	float *in1, *in2;
	
	float *matches = 0, *current_match;
	
	static int fcount = 0;
		
	//Get pointers to matrices
	in1_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);
	in2_matrix 	= jit_object_method(inputs,_jit_sym_getindex,1);
	out_matrix  = jit_object_method(outputs,_jit_sym_getindex,0);

	if (x&&in1_matrix&&in2_matrix&&out_matrix) 
	{
		//Lock the matrices
		in1_savelock = (long) jit_object_method(in1_matrix,_jit_sym_lock,1);
		in2_savelock = (long) jit_object_method(in2_matrix,_jit_sym_lock,1);
		out_savelock = (long) jit_object_method(out_matrix,_jit_sym_lock,1);
		
		//Make sure input is of proper format
		jit_object_method(in1_matrix,_jit_sym_getinfo,&in1_minfo);
		jit_object_method(in2_matrix,_jit_sym_getinfo,&in2_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);

		if(in1_minfo.dimcount != 2)
		{
			err = JIT_ERR_MISMATCH_DIM;
			goto out;
		}
		if(in1_minfo.planecount != 1)
		{
			err = JIT_ERR_MISMATCH_PLANE;
			goto out;
		}
		if(in1_minfo.type != _jit_sym_float32)
		{
			err = JIT_ERR_MISMATCH_TYPE;
			goto out;
		}
		if((in1_minfo.dim[0] != 70)&&(in1_minfo.dim[0] != 134)){
			err = JIT_ERR_GENERIC;
			error("Wrong input size, make sure input matrix comes from cv.jit.surf!");
			goto out;
		}
		
		//For the second matrix, exit silently if format doesn't match. (Second input might not be initialized yet.)
		if(in2_minfo.dimcount != 2){
			//post("Dimcount off");
			goto out;
		}
		if(in2_minfo.planecount != 1){
			//post("Planecount off");
			goto out;
		}
		if(in2_minfo.type != _jit_sym_float32){
			//post("Type off");
			goto out;
		}
		if((in2_minfo.dim[0] != 70)&&(in2_minfo.dim[0] != 134)){
			goto out;
		}
		if(in2_minfo.dim[1] < 2){
			//post("Invalid feature count");
			goto out; //Needs at least two features
		}
		
		//Size of matrices must match
		if(in1_minfo.dim[0] != in2_minfo.dim[0]){
			err = JIT_ERR_MISMATCH_DIM;
			error("Make sure the two input matrices were computed with the same 'mode' attribute value.\n Currently, left input mode is %d and right input is %d.",in1_minfo.dim[0] == 134, in2_minfo.dim[0] == 134);
		}
		
		if(in2_minfo.dim[1] != fcount){
			fcount = in2_minfo.dim[1];
			post("Features: %d", fcount);
		}
		
		//Get data
		jit_object_method(in1_matrix,_jit_sym_getdata,&in1_bp);
		jit_object_method(in2_matrix,_jit_sym_getdata,&in2_bp);
		if(!in1_bp || !in2_bp){
			err = JIT_ERR_INVALID_INPUT;
			goto out;
		}
		
		x->matches.reserve(9*in1_minfo.dim[0]);
		x->matches.clear();
		
		//Compare
		//matches = (float *)out_bp;
		current_match = matches;
		in1 = (float *)in1_bp;
		in2 = (float *)in2_bp;
		step1 = in1_minfo.dimstride[1] / sizeof(float);
		step2 = in2_minfo.dimstride[1] / sizeof(float);
		match_count = 0;
		//std::vector<int> closest_index(in2_minfo.dim[1],-1);
		//std::vector<float> closest_distance(in2_minfo.dim[1],FLT_MAX);
		FeatureMatch match_vector;
		
		for(i=0;i<in1_minfo.dim[1];i++){
			closest_d = next_closest_d = FLT_MAX;
			for(j=0;j<in2_minfo.dim[1];j++){
				if(in1[5] == in2[5]){ //If sign of Laplacian is not the same, features can't match
					d = 0;
					d_temp = 0;
					for(k=6;k<in1_minfo.dim[0];k++){
						d_temp = in2[k] - in1[k]; d_temp *= d_temp;
						d+=d_temp;
					}
					if(d < closest_d){
						next_closest_d = closest_d;
						closest_d = d;
						closest_ndx = j;
					}
				}
				in2+=step2;
			}
			in2 = (float *)in2_bp;
			d2 = sqrt(closest_d);
			if(/*(closest_ndx >= 0)&&*/((d2 / sqrt(next_closest_d)) < 0.7)){ //We have a match (nearest neighbour ratio matching)
				float *match = in2+(closest_ndx * step2);
				match_vector.x1 = in1[0];
				match_vector.y1 = in1[1];
				match_vector.z1 = in1[2];
				match_vector.x2 = match[0];
				match_vector.y2 = match[1];
				match_vector.z2 = match[2];
				match_vector.a_index = i;
				match_vector.b_index = closest_ndx;
				match_vector.distance = d2;
				x->matches.push_back(match_vector);
				match_count++;
			}
			in1+=step1;
		}
		
		
		//Prepare output:
		out_minfo.dim[0] = x->matches.size();
		out_minfo.dimcount = 1;
		out_minfo.planecount = 9;
		out_minfo.type = _jit_sym_float32;
		out_minfo.dimstride[0] = 9 * sizeof(float);
		out_minfo.dimstride[1] = out_minfo.size = out_minfo.dim[0] * out_minfo.dimstride[0];
		out_minfo.flags = JIT_MATRIX_DATA_REFERENCE | JIT_MATRIX_DATA_FLAGS_USE;
		jit_object_method(out_matrix,_jit_sym_setinfo_ex,&out_minfo);
		jit_object_method(out_matrix,_jit_sym_data,&x->matches[0]);

	}
		
	
out:
	jit_object_method(out_matrix,gensym("lock"),out_savelock);
	jit_object_method(in1_matrix,gensym("lock"),in1_savelock);
	jit_object_method(in2_matrix,gensym("lock"),in2_savelock);
	return err; ///tttttß
}



t_cv_jit_surf_match *cv_jit_surf_match_new(void)
{
	t_cv_jit_surf_match *x;
		
	if (x=(t_cv_jit_surf_match *)jit_object_alloc(_cv_jit_surf_match_class)) {
		//x->matches = 0;
		x->threshold = 0;

	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_surf_match_free(t_cv_jit_surf_match *x)
{
	//if(x->matches)free(x->matches);
}
