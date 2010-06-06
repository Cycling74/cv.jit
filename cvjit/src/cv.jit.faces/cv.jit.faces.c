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


#ifdef __cplusplus
extern "C" {
#endif
#include "jit.common.h"
#ifdef __cplusplus 
} //extern "C"
#endif
#include "cv.h"
#include "jitOpenCV.h"
#include "stdio.h"

typedef struct _cv_jit_faces 
{
	t_object				 ob;
	long                     model;
	CvHaarClassifierCascade* cascade;	
	long	nfaces;
} t_cv_jit_faces;

const char cascade1[] = "haarFaceCascade1.xml";
const char cascade2[] = "haarFaceCascade2.xml";
const char cascade3[] = "haarFaceCascade3.xml";
const char cascade4[] = "haarFaceCascade4.xml";

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
	long attrflags=0;
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
	attrflags = JIT_ATTR_GET_DEFER_LOW | JIT_ATTR_SET_USURP_LOW;
	
	attr = (t_jit_object *)jit_object_new(	_jit_sym_jit_attr_offset,"model",_jit_sym_long,attrflags,(method)0L,(method)cv_jit_faces_model,calcoffset(t_cv_jit_faces,model));			
	jit_attr_addfilterset_clip(attr,1,4,TRUE,TRUE);	//clip to 1-4
	jit_class_addattr(_cv_jit_faces_class, attr);
	
	attrflags = JIT_ATTR_GET_DEFER_LOW | JIT_ATTR_SET_OPAQUE;
	
	attr = (t_jit_object *)jit_object_new(	_jit_sym_jit_attr_offset,"nfaces",_jit_sym_long,attrflags,(method)0L,(method)cv_jit_faces_model,calcoffset(t_cv_jit_faces,nfaces));			
	jit_class_addattr(_cv_jit_faces_class, attr);
			
	jit_class_register(_cv_jit_faces_class);

	return JIT_ERR_NONE;
}

void cv_jit_faces_model(t_cv_jit_faces *x, t_symbol *s, long argc, t_atom *argv)
{
	long m;

	short err;

	m = jit_atom_getlong(argv);
	
	if(x->model == m)
		return;

	switch(m)
	{
	case 1:
		err = cv_jit_faces_load(x,cascade1);
		break;
	case 2:
		err = cv_jit_faces_load(x,cascade2);
		break;
	case 3:
		err = cv_jit_faces_load(x,cascade3);
		break;
	case 4:
		err = cv_jit_faces_load(x,cascade4);
		break;
	default:
		return;
	}

	if(err)
		x->model = 0;
}

t_jit_err cv_jit_faces_matrix_calc(t_cv_jit_faces *x, void *inputs, void *outputs)
{
	t_jit_err err=JIT_ERR_NONE;
	long in_savelock = 0,out_savelock = 0;
	t_jit_matrix_info in_minfo,out_minfo;
	char *out_bp;
	void *in_matrix,*out_matrix;
	float *out_data;
	int i;
	CvMat source;
	CvSeq *faces;
	CvMemStorage* storage;
	CvRect rect;
	
	if(x->model == 0) //No valid model has been loaded, exit
		return err;

	if(!x->cascade)
		return err;

	storage = cvCreateMemStorage(0);

	//Get pointers to matrices
	in_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);
	out_matrix  = jit_object_method(outputs,_jit_sym_getindex,0);

	if (x&&in_matrix&&out_matrix&&storage) 
	{
		//Lock the matrices
		in_savelock = (long) jit_object_method(in_matrix,_jit_sym_lock,1);
		out_savelock = (long) jit_object_method(out_matrix,_jit_sym_lock,1);
		
		//Make sure input is of proper format
		jit_object_method(in_matrix,_jit_sym_getinfo,&in_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);

		if(in_minfo.dimcount != 2)
		{
			err = JIT_ERR_MISMATCH_DIM;
			goto out;
		}
		if(in_minfo.planecount != 1)
		{
			err = JIT_ERR_MISMATCH_PLANE;
			goto out;
		}
		if(in_minfo.type != _jit_sym_char)
		{
			err = JIT_ERR_MISMATCH_TYPE;
			goto out;
		}

		//Don't process if image is too small
		if((in_minfo.dim[0] < 2)||(in_minfo.dim[1] < 2))
			goto out;

		//Convert Jitter matrix to OpenCV matrix
		cvJitter2CvMat(in_matrix, &source);
		
		//Calculate		
		faces = cvHaarDetectObjects(&source,x->cascade,storage,1.1,3,CV_HAAR_DO_CANNY_PRUNING,cvSize(20,20));
		
		x->nfaces = faces->total;

		//Prepare output
		out_minfo.dim[0] = faces->total;
		jit_object_method(out_matrix,_jit_sym_setinfo,&out_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);
		jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);
		if (!out_bp) { err=JIT_ERR_INVALID_OUTPUT; goto out;}
		
		out_data = (float *)out_bp;
		
		for(i=0; i < faces->total; i++)
		{
			rect = *(CvRect *)cvGetSeqElem(faces,i);
			out_data[0] = rect.x;
			out_data[1] = rect.y;
			out_data[2] = rect.x + rect.width;
			out_data[3] = rect.y + rect.height;

			out_data+=4;
		}
	}

	
out:
	jit_object_method(out_matrix,gensym("lock"),out_savelock);
	jit_object_method(in_matrix,gensym("lock"),in_savelock);
	if(storage)
		cvReleaseMemStorage(&storage);
	return err;
}



t_cv_jit_faces *cv_jit_faces_new(void)
{
	t_cv_jit_faces *x;

	if (x=(t_cv_jit_faces *)jit_object_alloc(_cv_jit_faces_class)) {
		
		x->model = 1;
		if(cv_jit_faces_load(x,cascade1))
			x->model = 0;
		x->nfaces = 0;

	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_faces_read(t_cv_jit_faces *x, t_symbol *s, short argc, t_atom *argv)
{
	char fname[1024];
	char pname[1024];
	short id;
	long type;
	long code;


	code = FOUR_CHAR_CODE( 'TEXT' );
	
	if(argc > 0)
	{
		if(argv[0].a_type != A_SYM)
		{
			error("Invalid argument to read command. Make sure argument is a symbol.");
			return;
		}
		strcpy(fname,argv[0].a_w.w_sym->s_name);
		if(locatefile_extended(fname,&id,&type,&type,-1))
		{
			error("Could not find file %s",argv[0].a_w.w_sym->s_name);
			return;
		}

		//Load file
		if(cv_jit_faces_load(x,fname))
			x->model = 0;
		else
			x->model = 5;
	}	
	else 
	{
		if(open_dialog(fname, &id, &type,&code,1))
		{
			error("Could not find file %s",fname);
			return;
		}
		path_topathname(id, fname, pname); 
		path_nameconform(pname, fname,PATH_STYLE_SLASH, PATH_TYPE_BOOT);

		x->cascade = (CvHaarClassifierCascade*)cvLoad( fname, 0, 0, 0 );
		if(!x->cascade)
		{
			error("Can't load face description file: %s",fname); 
			x->model = 0;
			return;
		}
		x->model = 5;

	}

	
	
}

short cv_jit_faces_load(t_cv_jit_faces *x,const char *m)
{
	short path; 
	char name[1024];
	char full_name[1024];
	char conform_name[1024];
	long type;

	strcpy(name,m);
	
	if (locatefile_extended(name,&path,&type,&type,-1)) 
	{
		error("Can't find face description file: %s",name); 
		x->cascade = NULL;
		return 1;
	}	
	else
	{
		if(!path_topathname(path, name, full_name))
		{
			//On Mactel, this function returns OS9 style paths with PATH_STYLE_NATIVE, PATH_TYPE_ABSOLUTE works on Windows but not OSX
			if(!path_nameconform(full_name, conform_name,PATH_STYLE_SLASH, PATH_TYPE_BOOT))
			{
				x->cascade = (CvHaarClassifierCascade*)cvLoad( conform_name, 0, 0, 0 );
				if(!x->cascade)
				{
						error("Can't load face description file: %s",conform_name); 
						return 1;
				}
			}
			else
				return 1;
		}
		else
			return 1;
	}

	return 0;
}

void cv_jit_faces_free(t_cv_jit_faces *x)
{
	if(x->cascade)
		cvReleaseHaarClassifierCascade(&(x->cascade));
}
