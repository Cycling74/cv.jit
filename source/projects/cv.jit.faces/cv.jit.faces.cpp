/*
cv.jit.faces
	

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


#include "jitOpenCV.h"
#include "cvjit.h"

#include <opencv2/objdetect.hpp>

using namespace c74::max;

typedef struct _cv_jit_faces 
{
	t_object ob;
	long model;
	cv::CascadeClassifier cascade;
	long nfaces;
	long normalize;
} t_cv_jit_faces;

char const * const defaultCascadeFilenames[] = {
	"haarFaceCascade1.xml",
	"haarFaceCascade2.xml",
	"haarFaceCascade3.xml",
	"haarFaceCascade4.xml"
};

constexpr int DEFAULT_CASCADE_COUNT = 4;

void *_cv_jit_faces_class;

t_jit_err 				cv_jit_faces_init(void); 
t_cv_jit_faces 			*cv_jit_faces_new(void);
void 					cv_jit_faces_free(t_cv_jit_faces *x);
t_jit_err 				cv_jit_faces_matrix_calc(t_cv_jit_faces *x, void *inputs, void *outputs);
void 					cv_jit_faces_model(t_cv_jit_faces *x, t_symbol *s, long argc, t_atom *argv);
void                    cv_jit_faces_read(t_cv_jit_faces *x, t_symbol *s, short argc, t_atom *argv);
short                   cv_jit_faces_load(t_cv_jit_faces *x,const char *m);

t_jit_err cv_jit_faces_init(void) 
{
	t_jit_object *attr,*mop,*output;
	t_symbol *atsym;
	
	atsym = gensym("jit_attr_offset");
	
	_cv_jit_faces_class = jit_class_new("cv_jit_faces",(method)cv_jit_faces_new,(method)cv_jit_faces_free,
		sizeof(t_cv_jit_faces),0L); 

	//add mop
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop,1,1);  //Object has one input and one output
	output = (t_jit_object *)jit_object_method(mop,_jit_sym_getoutput,1); //Get a pointer to the output matrix

   	jit_mop_single_type(mop,_jit_sym_char);   //Set input type and planecount
   	jit_mop_single_planecount(mop,1);  
   	
   	jit_mop_output_nolink(mop,1); //Turn off output linking so that output matrix does not adapt to input
   	
   	jit_attr_setlong(output,_jit_sym_minplanecount,4);  //Four planes, for representing rectangle corners 
  	jit_attr_setlong(output,_jit_sym_maxplanecount,4);
  	jit_attr_setlong(output,_jit_sym_mindim,1); //Only one dimension
  	jit_attr_setlong(output,_jit_sym_maxdim,1);
  	jit_attr_setsym(output,_jit_sym_types,_jit_sym_float32); //Coordinates are returned with sub-pixel accuracy
   	   	
	jit_class_addadornment(_cv_jit_faces_class,mop);
	
	
	//add methods
	jit_class_addmethod(_cv_jit_faces_class, (method)cv_jit_faces_matrix_calc, 		"matrix_calc", 		A_CANT, 0L);
	jit_class_addmethod(_cv_jit_faces_class, (method)cv_jit_faces_read, 		"read", 		A_GIMME, 0L);

	//add attributes

	attr = (t_jit_object *)jit_object_new(	_jit_sym_jit_attr_offset, "model", _jit_sym_long, cvjit::Flags::get_set, (method)0L, (method)cv_jit_faces_model, calcoffset(t_cv_jit_faces, model));			
	jit_attr_addfilterset_clip(attr, 1, 4, true, true);	//clip to 1-4
	jit_class_addattr(_cv_jit_faces_class, attr);

	// Normalize attribute
	jit_class_addattr(_cv_jit_faces_class, cvjit::normalize_attr<t_cv_jit_faces>());
	
	attr = (t_jit_object *)jit_object_new(	_jit_sym_jit_attr_offset, "nfaces", _jit_sym_long, cvjit::Flags::private_set, (method)0L, (method)0L, calcoffset(t_cv_jit_faces, nfaces));
	jit_class_addattr(_cv_jit_faces_class, attr);
			
	jit_class_register(_cv_jit_faces_class);

	return JIT_ERR_NONE;
}

void cv_jit_faces_model(t_cv_jit_faces *x, t_symbol *s, long argc, t_atom *argv)
{
	long m;

	m = (long)atom_getlong(argv);

	if (m != x->model && m >= 1 && m <= DEFAULT_CASCADE_COUNT) {
		if (0 == cv_jit_faces_load(x, defaultCascadeFilenames[m - 1])) {
			x->model = m;
		}
		else {
			// Error
			x->model = 0;
		}
	}
}

t_jit_err cv_jit_faces_matrix_calc(t_cv_jit_faces *x, void *inputs, void *outputs)
{
	cv::Mat source;
	std::vector<cv::Rect> faces;

	//Get pointers to matrices
	t_object * in_matrix 	= (t_object *)jit_object_method(inputs,_jit_sym_getindex,0);
	t_object *out_matrix  = (t_object *)jit_object_method(outputs,_jit_sym_getindex,0);

	if (x && in_matrix && out_matrix && x->model > 0) 
	{
		//Lock the matrices
		cvjit::Savelock savelocks[] = { in_matrix, out_matrix };

		// Wrap the matrices
		cvjit::JitterMatrix input(in_matrix);
		cvjit::JitterMatrix results(out_matrix);
		
		//Make sure input is of proper format
		t_jit_err err = cvjit::Validate(x, input)
			.type(_jit_sym_char)
			.planecount(1)
			.dimcount(2)
			.min_dimsize(2);
		
		if (JIT_ERR_NONE == err) 
		{
			//Convert Jitter matrix to OpenCV matrix
			char * in_bp, * out_bp;
			jit_object_method(in_matrix, _jit_sym_getdata, &in_bp);
            jit_object_method(out_matrix, _jit_sym_getdata, &out_bp);
			cv::Mat source = input;

			//Calculate		
			x->cascade.detectMultiScale(source, faces);
			x->nfaces = (long)faces.size();

			//Prepare output
			cvjit::resize_matrix(out_matrix, { (long)faces.size() });
			
			jit_object_method(out_matrix, _jit_sym_getdata, &out_bp);
			if (!out_bp) { return JIT_ERR_INVALID_OUTPUT; }
			if (x->nfaces == 0) {
				results.set_size(1);
				results.clear();
				return JIT_ERR_NONE;
			}

			results.set_size(x->nfaces);

			const float scale_x = x->normalize ? (float)input.normalization_scale_x() : 1.f;
			const float scale_y = x->normalize ? (float)input.normalization_scale_y() : 1.f;

			float * out_data = results.get_data<float>();

			for (cv::Rect & rect : faces) {
				out_data[0] = (float)rect.x * scale_x;
				out_data[1] = (float)rect.y * scale_y;
				out_data[2] = (float)(rect.x + rect.width) * scale_x;
				out_data[3] = (float)(rect.y + rect.height) * scale_y;
				out_data += 4;
			}
		}
		else {
			return err;
		}
	}
	return JIT_ERR_NONE;
}



t_cv_jit_faces *cv_jit_faces_new(void)
{
	t_cv_jit_faces *x;

	if ((x=(t_cv_jit_faces *)jit_object_alloc(_cv_jit_faces_class))) {
		
		x->model = 1;
		if (cv_jit_faces_load(x, defaultCascadeFilenames[1])) {
			// Error loading cascade
			x->model = 0;
		}
		x->nfaces = 0;
		x->normalize = 0;

	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_faces_read(t_cv_jit_faces *x, t_symbol *s, short argc, t_atom *argv)
{
	char fname[MAX_FILENAME_CHARS];
	char pname[MAX_PATH_CHARS];
	short id;
	t_fourcc type;
	t_fourcc code;


	code = 'TEXT' ;
	
	if(argc > 0)
	{
		if(argv[0].a_type != A_SYM)
		{
			object_error((t_object*)x, "Invalid argument to read command. Make sure argument is a symbol.");
			return;
		}
		strncpy(fname, argv[0].a_w.w_sym->s_name, MAX_FILENAME_CHARS);
		if(locatefile_extended(fname,&id,&type,&type,-1))
		{
			object_error((t_object*)x, "Could not find file %s", argv[0].a_w.w_sym->s_name);
			return;
		}

		//Load file
		if (cv_jit_faces_load(x, fname)) {
			x->model = 0;
		}
		else {
			x->model = DEFAULT_CASCADE_COUNT + 1;
		}
			
	}	
	else 
	{
		if(open_dialog(fname, &id, &type,&code,1))
		{
			object_error((t_object*)x, "Could not find file %s", fname);
			return;
		}
		path_topathname(id, fname, pname); 
		path_nameconform(pname, fname,PATH_STYLE_SLASH, PATH_TYPE_BOOT);

		if (!x->cascade.load(fname)) {
			object_error((t_object*)x, "Can't load face description file: %s", fname);
			x->model = 0;
			return;
		}
		else {
			x->model = 5;
		}
	}

	
	
}

short cv_jit_faces_load(t_cv_jit_faces *x, const char *m)
{
	short path; 
	char name[MAX_FILENAME_CHARS];
	char full_name[MAX_PATH_CHARS];
	char conform_name[MAX_PATH_CHARS];
	t_fourcc type;

	strncpy(name, m, MAX_FILENAME_CHARS);
	
	if (locatefile_extended(name,&path,&type,&type,-1)) 
	{
		object_error((t_object*)x, "Can't find face description file: %s", name); 
		return 1;
	}	
	else
	{
		if(!path_topathname(path, name, full_name))
		{
			//On Mactel, this function returns OS9 style paths with PATH_STYLE_NATIVE, PATH_TYPE_ABSOLUTE works on Windows but not OSX
			if(!path_nameconform(full_name, conform_name,PATH_STYLE_SLASH, PATH_TYPE_BOOT))
			{
				if (x->cascade.load(conform_name)) {
					return 0;
				}
				else {
					object_error((t_object*)x, "Can't load face description file: %s", conform_name);
				}
			}
		}
	}

	return 1;
}

void cv_jit_faces_free(t_cv_jit_faces *x)
{
	// Nothing
}
