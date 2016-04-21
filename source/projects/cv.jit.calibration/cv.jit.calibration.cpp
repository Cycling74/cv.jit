/*
 @file cv.jit.calibration
 
 @ingroup cv.jit
 
 Copyright 2010 - Antoine Villeret
 antoine.villeret@gmail.com
 */

/*
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


#include "cv.h"
#include "jitOpenCV.h"
#include "c74_jitter.h"

using namespace c74::max;

//using namespace cv;


// Our Jitter object instance data
typedef struct _cv_jit_calibration {
	t_object	ob;
	int			pattern_size[2];		// number of inner corners on the board
	int			board_view_nb;			// number of views to take
	int			success_count;			// number of successful detection
	int			dim[2];
	int			frame;					// frame counter
	int			wait_n_frame;			// number of frames to wait between 2 takes
	int			array_size;
	int			calibration;			// flag = 1 during calibration 0 otherwise
	
	// filenames
	char		intrinsic_filename[512],
	dist_filename[512],
	dirbootpath[512];
	
	// Storage Matrix
	CvMat		*image_points, 
	*object_points, 
	*point_counts,
	*intrinsic_matrix, 
	*distortion_coeffs;
	
	// Distorsion Matrix
	IplImage *mapx, *mapy;
	
	
} t_cv_jit_calibration;


// prototypes
BEGIN_USING_C_LINKAGE
t_jit_err				cv_jit_calibration_init					(void); 
t_cv_jit_calibration	*cv_jit_calibration_new					(void);
void					cv_jit_calibration_free					(t_cv_jit_calibration *x);
t_jit_err				cv_jit_calibration_matrix_calc			(t_cv_jit_calibration *x, void *inputs, void *outputs);
void					cv_jit_calibration_findcorners			(t_cv_jit_calibration *x, 
																 t_jit_matrix_info in_minfo, 
																 t_jit_matrix_info out_minfo,
																 void *in_matrix, 
																 void *out_matrix,
																 CvMat in_cv, char *out_bp );
void					cv_jit_calibration_allocate				(t_cv_jit_calibration *x);
void					cv_jit_calibration_desallocate			(t_cv_jit_calibration *x);
void					cv_jit_calibration_build_undistort_map	(t_cv_jit_calibration *x);
void					cv_jit_calibration_doread				(t_cv_jit_calibration *x, t_symbol *s, long argc, t_atom *argv);
void					cv_jit_calibration_read					(t_cv_jit_calibration *x, t_symbol *s, long argc, t_atom *argv);
void					cv_jit_calibration_dowrite				(t_cv_jit_calibration *x, t_symbol *s, long argc, t_atom *argv);
void					cv_jit_calibration_write				(t_cv_jit_calibration *x, t_symbol *s, long argc, t_atom *argv);
void					cv_jit_calibration_load_param			(t_cv_jit_calibration *x);
void					cv_jit_calibration_docalibration		(t_cv_jit_calibration *x, t_symbol *s, long argc, t_atom *argv);
void					cv_jit_calibration_make_identity		(t_cv_jit_calibration *x);
void					cv_jit_calibration_print_parameters		(t_cv_jit_calibration *x);
void					cv_jit_calibration_print_matrixinfo		(t_jit_matrix_info minfo);
END_USING_C_LINKAGE


// globals
static void *_cv_jit_calibration_class = NULL;


/************************************************************************************/

t_jit_err cv_jit_calibration_init(void) 
{
	long			attrflags = ATTR_GET_DEFER_LOW | ATTR_SET_USURP_LOW;
	t_jit_object	*attr, *o, *mop;
	
	_cv_jit_calibration_class = jit_class_new("cv_jit_calibration", (method)cv_jit_calibration_new, (method)cv_jit_calibration_free, sizeof(t_cv_jit_calibration), 0);
	
	// add matrix operator (mop)
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop,1,1); //#inputs,#outputs
	jit_mop_single_type(mop, _jit_sym_char);
	o=(t_jit_object *)jit_object_method(mop,_jit_sym_getoutput,1);
	jit_attr_setlong(o,_jit_sym_planelink,1);
	jit_class_addadornment(_cv_jit_calibration_class,mop);
	
	// add method(s)
	jit_class_addmethod(_cv_jit_calibration_class, (method)cv_jit_calibration_matrix_calc,		"matrix_calc",		A_CANT,		0);
	jit_class_addmethod(_cv_jit_calibration_class, (method)cv_jit_calibration_read,				"read",				A_GIMME,	0L);
	jit_class_addmethod(_cv_jit_calibration_class, (method)cv_jit_calibration_write,			"write",			A_GIMME,	0L);
	
	// add attribute(s)	
	attr = (t_jit_object *)	jit_object_new(_jit_sym_jit_attr_offset_array,
										   "pattern_size",
										   _jit_sym_long,
										   2,
										   attrflags,
										   (method)0L,
										   (method)0L,
										   calcoffset(t_cv_jit_calibration,array_size),
										   calcoffset(t_cv_jit_calibration,pattern_size));
	jit_class_addattr(_cv_jit_calibration_class,attr);

	attr = (t_jit_object *)	jit_object_new(_jit_sym_jit_attr_offset,
										   "calibration",
										   _jit_sym_long,
										   attrflags,
										   (method)0L,
										   (method)cv_jit_calibration_docalibration,
										   calcoffset(t_cv_jit_calibration,calibration));
	jit_class_addattr(_cv_jit_calibration_class,attr);
	
	attr = (t_jit_object *)	jit_object_new(_jit_sym_jit_attr_offset,
										   "views",
										   _jit_sym_long,
										   attrflags,
										   (method)0L,
										   (method)cv_jit_calibration_docalibration,
										   calcoffset(t_cv_jit_calibration,board_view_nb));
	jit_class_addattr(_cv_jit_calibration_class,attr);
	
	attrflags = ATTR_GET_DEFER_LOW | ATTR_SET_OPAQUE;
	
	attr = (t_jit_object *)	jit_object_new(_jit_sym_jit_attr_offset,
										   "success_count",
										   _jit_sym_long,
										   attrflags,
										   (method)0L,
										   (method)cv_jit_calibration_docalibration,
										   calcoffset(t_cv_jit_calibration,success_count));
	jit_class_addattr(_cv_jit_calibration_class,attr);
	
	
	
	// finalize class
	jit_class_register(_cv_jit_calibration_class);
	object_post(NULL, "cv.jit.calibration by Antoine Villeret - build on the %s at %s.",__DATE__, __TIME__);
	
	return JIT_ERR_NONE;
}

/************************************************************************************/
// Object Life Cycle

t_cv_jit_calibration *cv_jit_calibration_new(void)
{
	t_cv_jit_calibration	*x = NULL;
	
	x = (t_cv_jit_calibration*)jit_object_alloc(_cv_jit_calibration_class);
	if (x) {
		// some initialization
		x->pattern_size[0] = 7;
		x->pattern_size[1] = 6;
		x->board_view_nb = 20;
		x->dim[0] = 320;
		x->dim[1] = 240;
		x->frame = 0;
		x->wait_n_frame = 20;
		x->array_size = 2;
		strcpy(x->intrinsic_filename, "");
		strcpy(x->dist_filename, "");
		
		// allocate storage memory
		cv_jit_calibration_allocate(x);
		
		// build undistord map
		cv_jit_calibration_build_undistort_map(x);
		
		// load parameters
		cv_jit_calibration_load_param(x);
		
		x->calibration = 0;
		
	} 
	return x;
}


void cv_jit_calibration_free(t_cv_jit_calibration *x)
{
	cv_jit_calibration_desallocate(x);
}


/************************************************************************************/
// Methods bound to input/inlets

t_jit_err cv_jit_calibration_matrix_calc(t_cv_jit_calibration *x, void *inputs, void *outputs)
{
	t_jit_err			err = JIT_ERR_NONE;
	long				in_savelock;
	long				out_savelock;
	t_jit_matrix_info	in_minfo; 
	t_jit_matrix_info	out_minfo;
	char				*in_bp;
	char				*out_bp;
	void				*in_matrix;
	void				*out_matrix;
	CvMat				in_cv,out_cv;
	
	in_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);
	out_matrix 	= jit_object_method(outputs,_jit_sym_getindex,0);
	
	if (x && in_matrix && out_matrix) {
		in_savelock = (long) jit_object_method(in_matrix, _jit_sym_lock, 1);
		out_savelock = (long) jit_object_method(out_matrix, _jit_sym_lock, 1);
		
		jit_object_method(in_matrix, _jit_sym_getinfo, &in_minfo);
		jit_object_method(out_matrix, _jit_sym_getinfo, &out_minfo);
		
		jit_object_method(in_matrix, _jit_sym_getdata, &in_bp);
		jit_object_method(out_matrix, _jit_sym_getdata, &out_bp);
		
		if (!in_bp) { 
			err=JIT_ERR_INVALID_INPUT; 
			goto out;
		}
		if (!out_bp) {
			err=JIT_ERR_INVALID_OUTPUT; 
			goto out;
		}		
		if (in_minfo.type != _jit_sym_char) {
			err = JIT_ERR_MISMATCH_TYPE; 
			goto out;
		}
		
		if (in_minfo.planecount != 4 && in_minfo.planecount != 1) {
			err=JIT_ERR_MISMATCH_PLANE; 
			goto out;
		}
		
		if (in_minfo.dimcount != 2) {
			err=JIT_ERR_MISMATCH_DIM; 
			goto out;
		}
		
		if ( x->dim[0] != in_minfo.dim[0] || x->dim[1] != in_minfo.dim[1]) {
			x->dim[0] = in_minfo.dim[0];
			x->dim[1] = in_minfo.dim[1];
			cv_jit_calibration_load_param(x);
			
		}
		
		cvJitter2CvMat(in_matrix,	&in_cv); // convert Jitter matrix into CvMat
		cvJitter2CvMat(out_matrix, &out_cv);
		
		// this will loop until we got enought views (x->board_view_nb) with all corners visible
		if ( x->success_count < x->board_view_nb && x->calibration != 0 ) {
				cv_jit_calibration_findcorners(x, in_minfo, out_minfo, in_matrix, out_matrix, in_cv, out_bp );
		}
		if ( x->success_count >= x->board_view_nb && x->calibration != 0 ) {
			
			//CALIBRATE THE CAMERA! 
			cvCalibrateCamera2(x->object_points,
							   x->image_points,
							   x->point_counts,
							   cvSize( in_minfo.dim[0], in_minfo.dim[1] ),
							   x->intrinsic_matrix,
							   x->distortion_coeffs,
							   NULL, 
							   NULL,
							   0);
			
			//cv_jit_calibration_print_parameters(x);
			
			cv_jit_calibration_build_undistort_map(x);
			
			x->calibration = 0;
		}
		
		if (x->calibration == 0) {
			// undistort the input image
			cvRemap( &in_cv, &out_cv, x->mapx, x->mapy );			// Undistort image
		}
	} 
	else
		return JIT_ERR_INVALID_PTR;
	
out:
	jit_object_method(out_matrix,_jit_sym_lock,out_savelock);
	jit_object_method(in_matrix,_jit_sym_lock,in_savelock);
	return err;
}

void cv_jit_calibration_findcorners(t_cv_jit_calibration *x, 
									t_jit_matrix_info in_minfo, 
									t_jit_matrix_info out_minfo, 
									void *in_matrix, void *out_matrix, 
									CvMat in_cv, char *out_bp ){
	
	int					board_point_nb = x->pattern_size[0]*x->pattern_size[1];
	CvPoint2D32f		*corners = new CvPoint2D32f[board_point_nb];
	int					corner_count;
	int					step;
	CvSize				pattern_size, image_size;
	IplImage			*gray_image, *color_image, in_image;
	
	//in_image = cvCreateImageHeader(cvSize(in_minfo.dim[0], in_minfo.dim[1]), 8, in_minfo.planecount);
	
	if ( x->pattern_size[0] < 3 || x->pattern_size[1] < 3 ) {
		object_error((t_object *) x, "pattern_size must be at least 3 x 3");
		return;
	}
	pattern_size = cvSize( x->pattern_size[0], x->pattern_size[1] );
	image_size = cvSize(in_minfo.dim[0], in_minfo.dim[1]);
	cvGetImage	(&in_cv,	&in_image);	// create an IplImage from a CvMat
	
	// Here we create 2 copies of input matrix, a color and a grayscale
	// This is to avoid modifying the original 
	// and also to deal with different kind of images supported by the following functions
	
	color_image	=	cvCreateImage(image_size, 8, 4);
	gray_image	=	cvCreateImage(image_size, 8, 1);
	
	// convert image colorspace
	if ( in_minfo.planecount == 1 ) {
		cvCvtColor(&in_image, color_image, CV_GRAY2RGBA);
		memcpy(gray_image->imageData, in_image.imageData, in_image.imageSize);
	}
	
	else {
		cvCvtColor(&in_image, gray_image, CV_RGBA2GRAY);
		memcpy(color_image->imageData, in_image.imageData, in_image.imageSize);
	}
	
	// find chessboard corners (grayscale or color image)
	int found = cvFindChessboardCorners(&in_cv, 
										pattern_size, 
										corners, 
										&corner_count, 
										CV_CALIB_CB_ADAPTIVE_THRESH | CV_CALIB_CB_FILTER_QUADS);
	
	// get subpixel accuracy on those corners (grayscale image only)
	cvFindCornerSubPix(gray_image, 
					   corners, 
					   corner_count, 
					   cvSize(11,11), 
					   cvSize(-1,-1), 
					   cvTermCriteria(CV_TERMCRIT_EPS+CV_TERMCRIT_ITER, 30, 0.1));
	
	// draw chessboard corner (color image only)

	cvDrawChessboardCorners(color_image, pattern_size, corners, corner_count, found);
	
	x->frame++;

	if ( x->frame % x->wait_n_frame == 0 ) {

	// update arrays
		if( corner_count == board_point_nb ) {

			step = x->success_count*board_point_nb;
			for( int i=step, j=0; j<board_point_nb; ++i,++j ) {
				CV_MAT_ELEM(*x->image_points, float,i,0) = corners[j].x; 
				CV_MAT_ELEM(*x->image_points, float,i,1) = corners[j].y; 
				CV_MAT_ELEM(*x->object_points,float,i,0) = j/x->pattern_size[0]; 
				CV_MAT_ELEM(*x->object_points,float,i,1) = j%x->pattern_size[0]; 
				CV_MAT_ELEM(*x->object_points,float,i,2) = 0.0f;
			}
			CV_MAT_ELEM(*x->point_counts, int,x->success_count,0) = board_point_nb; 
			x->success_count++;
			
			// invert view
			cvNot( color_image , color_image );
		}
	}
	
	if ( in_minfo.planecount == 1 ) {
		cvCvtColor(color_image, gray_image, CV_RGBA2GRAY);
		memcpy(out_bp,gray_image->imageData,gray_image->imageSize);
		
	}
	
	else {
		memcpy(out_bp,color_image->imageData,color_image->imageSize);
	}
	
	//CvMat *t = cvCloneMat(&in_cv);
	//cvMat2Jitter(&in_cv, out_matrix);
	//cvReleaseMat( &t );
	cvReleaseImage( &gray_image );
	cvReleaseImage( &color_image );
}

void cv_jit_calibration_allocate(t_cv_jit_calibration *x){
	
	//CvSize size = cvSize(x->dim[0], x->dim[1]);
	
	int board_point_nb = x->pattern_size[0] * x->pattern_size[1];
	
	
	cv_jit_calibration_desallocate(x);
	
	// ALLOCATE STORAGE
	x->image_points			=	cvCreateMat(board_point_nb*x->board_view_nb, 2, CV_32FC1);
	x->object_points		=	cvCreateMat(board_point_nb*x->board_view_nb, 3, CV_32FC1);
	x->point_counts			=	cvCreateMat(x->board_view_nb, 1, CV_32SC1);
	x->intrinsic_matrix		=	cvCreateMat(3, 3, CV_32FC1);
	x->distortion_coeffs	=	cvCreateMat(5, 1, CV_32FC1);
}

void cv_jit_calibration_desallocate(t_cv_jit_calibration *x){
	
	// printf("desallocate\n");
	
	// DESALLOCATE
	if( x->image_points)		cvReleaseMat( &x->image_points );
	if( x->object_points )		cvReleaseMat( &x->object_points );
	if( x->point_counts )		cvReleaseMat( &x->point_counts );
	if( x->intrinsic_matrix )	cvReleaseMat( &x->intrinsic_matrix );
	if( x->distortion_coeffs )	cvReleaseMat( &x->distortion_coeffs );
	
	if( x->mapx )	cvReleaseImage( &x->mapx );
	if( x->mapy )	cvReleaseImage( &x->mapy );
}

void cv_jit_calibration_build_undistort_map(t_cv_jit_calibration *x) {
	// Build the undistort map that we will use for all 
	// subsequent frames. 
	//
	
	CvSize size = cvSize( x->dim[0], x->dim[1] );
	x->mapx = cvCreateImage( size, IPL_DEPTH_32F, 1 );
	x->mapy = cvCreateImage( size, IPL_DEPTH_32F, 1 );
	
	cvInitUndistortMap(x->intrinsic_matrix, x->distortion_coeffs, x->mapx, x->mapy);
}

/*******************/
/*  FILE HANDLING  */
/*******************/

void cv_jit_calibration_read(t_cv_jit_calibration *x, t_symbol *s, long argc, t_atom *argv){
	// printf("read method has %ld args\n", argc);
	defer(x, (method)cv_jit_calibration_doread, NULL, argc, argv);
}

void cv_jit_calibration_doread(t_cv_jit_calibration *x, t_symbol *s, long argc, t_atom *argv){
	
	t_fourcc filetype = NULL, intrinsic_outtype, dist_outtype;
	//short numtype = 1;
	char	intrinsic_filename[512],
	dist_filename[512],
	intrinsic_fullpathname[512],
	dist_fullpathname[512],
	intrinsic_fullpathname2[512],
	dist_fullpathname2[512];
	
	short intrinsic_path,dist_path;
	
	// printf("doread method has %ld args\n", argc);
	if (argc !=2 && argc != 0 ){
		object_error((t_object *)x, "read message needs 0 or 2 arguments");
		return;
	}
	if (argc == 0) {
		if (open_dialog(intrinsic_filename, &intrinsic_path, &intrinsic_outtype, &filetype, 1)) return; // if non zero (= user cancels), return
		if (open_dialog(dist_filename, &dist_path, &dist_outtype, &filetype, 1)) return; // if non zero (= user cancels), return
	} else {
		if ( argv[0].a_type != A_SYM || argv[1].a_type != A_SYM ) {
			object_error((t_object *)x, "arguments of read message must be 2 symbols");
		}
		strcpy(intrinsic_filename, argv[0].a_w.w_sym->s_name); // must copy before calling locate_extended
		// printf("filename : %s\n",intrinsic_filename);
		if (locatefile_extended(intrinsic_filename, &intrinsic_path, &intrinsic_outtype, &filetype, 1)) {	// non zero = file not found
			object_error((t_object *)x, "%s : not found", argv[0].a_w.w_sym->s_name);
			return;
		}
		strcpy(dist_filename, argv[1].a_w.w_sym->s_name); // must copy before calling locate_extended
		// printf("filename : %s\n\n",dist_filename);
		if (locatefile_extended(dist_filename, &dist_path, &dist_outtype, &filetype, 1)) {	// non zero = file not found
			object_error((t_object *)x, "%s : not found", argv[1].a_w.w_sym->s_name);
			return;
		}
	}
	path_topathname(intrinsic_path, intrinsic_filename, intrinsic_fullpathname);
	path_topathname(dist_path, dist_filename, dist_fullpathname);
	// printf("full intrinsic pathname : %s\n",intrinsic_fullpathname);
	// printf("full distorsion pathname : %s\n",dist_fullpathname);
	
	// printf("matrix before reading file");
	// cv_jit_calibration_print_parameters(x);
	
	// load matrix
	
	path_nameconform(intrinsic_fullpathname, intrinsic_fullpathname2, PATH_TYPE_ABSOLUTE, PATH_TYPE_BOOT);
	path_nameconform(dist_fullpathname, dist_fullpathname2, PATH_TYPE_ABSOLUTE, PATH_TYPE_BOOT);
	
	strcpy(x->intrinsic_filename, intrinsic_fullpathname2);
	strcpy(x->dist_filename, dist_fullpathname2);
	
	printf("intrinsic_filename : %s\n",x->intrinsic_filename);
	printf("dist_filename : %s\n",x->dist_filename);
	
	// printf("absolute path name : \n\t\t%s\n\t\t%s\n",intrinsic_fullpathname2,dist_fullpathname2);
	
	cv_jit_calibration_load_param(x);
	
	
	
	return;
};


void cv_jit_calibration_dowrite(t_cv_jit_calibration *x, t_symbol *s, long argc, t_atom *argv){
	// printf("dowrite has %ld args\n",argc);
	defer(x, (method)cv_jit_calibration_dowrite, NULL, argc, argv);
}
void cv_jit_calibration_write(t_cv_jit_calibration *x, t_symbol *s, long argc, t_atom *argv){
	t_fourcc filetype = 'TEXT', intrinsic_outtype, dist_outtype, intrinsic_filetype = 'TEXT';
	char intrinsic_filename[512], dist_filename[512], intrinsic_fullpathname[512], dist_fullpathname[512], intrinsic_bootpath[512], dist_bootpath[512];
	short intrinsic_path = 0, dist_path = 0;
	
	if ( argc != 0 && argc != 2) {
		object_error((t_object *)x, "write message needs 0 or 2 arguments");
		return;
	}
	else if (argc == 0) {	// if no argument supplied, ask for file
		if (saveasdialog_extended(intrinsic_filename, &intrinsic_path, &intrinsic_outtype, &intrinsic_filetype, 1)) return; // non-zero: user cancelled
		if (saveasdialog_extended(dist_filename, &dist_path, &dist_outtype, &filetype, 1)) return; // non-zero: user cancelled
	} else {
		if ( argv[0].a_type != A_SYM || argv[1].a_type != A_SYM){
			object_error((t_object *)x, "arguments of write message must be symbols");
			return;
		}
		strcpy(intrinsic_filename, argv[0].a_w.w_sym->s_name);
		strcpy(dist_filename, argv[1].a_w.w_sym->s_name);
	}
	
	cv_jit_calibration_print_parameters(x);

	path_topotentialname(intrinsic_path, intrinsic_filename, intrinsic_fullpathname, 0);
	path_nameconform(intrinsic_fullpathname, intrinsic_bootpath, PATH_STYLE_NATIVE, PATH_TYPE_BOOT);

	path_topotentialname(dist_path, dist_filename, dist_fullpathname, 0);
	path_nameconform(dist_fullpathname, dist_bootpath, PATH_STYLE_NATIVE, PATH_TYPE_BOOT);
	
	printf("full intrinsic bootname : %s\n",intrinsic_bootpath);
	printf("full distorsion pathname : %s\n",dist_bootpath);
	
	cvSave(intrinsic_bootpath,x->intrinsic_matrix); 
	cvSave(dist_bootpath,x->distortion_coeffs);
	
	
	return;
}

void cv_jit_calibration_load_param( t_cv_jit_calibration *x ) {
	
	printf("load parameters\n");
	if ( ! ( (strcmp(x->intrinsic_filename, "") == 0) && (strcmp(x->dist_filename, "") == 0) ) ) {
		
		// free the matrix before allocating one more time...
		if( x->intrinsic_matrix )	cvReleaseMat(&x->intrinsic_matrix);
		if( x->distortion_coeffs )	cvReleaseMat(&x->distortion_coeffs);
		
		x->intrinsic_matrix = (CvMat*)cvLoad( x->intrinsic_filename ); 
		x->distortion_coeffs = (CvMat*)cvLoad( x->dist_filename );
		
		if( !x->intrinsic_matrix || ! x->distortion_coeffs ) {
			object_error((t_object *)x, "error when loading parameters");
		}
	}
	
	else {
		cv_jit_calibration_make_identity(x);
	}
	
	cv_jit_calibration_print_parameters(x);
	
	cv_jit_calibration_build_undistort_map(x);
}

void cv_jit_calibration_docalibration (t_cv_jit_calibration *x, t_symbol *s, long argc, t_atom *argv){
	// reset counter to start calibration
	
	if ( argc > 0 ) {
		x->calibration = atom_getlong(argv);
		if ( x->calibration == 1 ) {
			x->success_count = 0;
			x->frame = 0;
		}
	}
}

void cv_jit_calibration_make_identity(t_cv_jit_calibration *x) {
	
	printf("make identity\n");
	if ( !x->intrinsic_matrix || !x->distortion_coeffs ) {
		object_error((t_object *)x, "intrinsic & distorsion matrix not initialized");
		return;
	}
	printf("else\n");
	
	CV_MAT_ELEM( *x->intrinsic_matrix, float, 0, 0 ) = 1.0; 
	CV_MAT_ELEM( *x->intrinsic_matrix, float, 1, 1 ) = 1.0;
	CV_MAT_ELEM( *x->intrinsic_matrix, float, 2, 2 ) = 1.0;
	CV_MAT_ELEM( *x->intrinsic_matrix, float, 0, 2 ) = x->dim[0]/2.;
	CV_MAT_ELEM( *x->intrinsic_matrix, float, 1, 2 ) = x->dim[1]/2.;
	
	printf("intrinsic OK\n");
	
	for ( int i = 0 ; i < 5 ; i++ ) {
		CV_MAT_ELEM( *x->distortion_coeffs, float, i, 0 ) = 0.0;
	}
}

void cv_jit_calibration_print_parameters(t_cv_jit_calibration *x){
	int i, j;
	
	printf("---- Cameras Parameters ----\n");
	printf("Intrinsic parameters :\n");
	for ( i = 0 ; i < 3 ; i++ ) {
		for ( j = 0 ; j < 3 ; j++ ) {
			printf("\t%f",CV_MAT_ELEM( *x->intrinsic_matrix, float, i, j ));
		}
		printf("\n");
	}
	printf("Distorsion Parameters :\n");
	for ( i = 0 ; i < 5 ; i++ ) {
		printf("\t%f",CV_MAT_ELEM( *x->distortion_coeffs, float, i, 0 ));
	}
	printf("\n------------\n");
}

void cv_jit_calibration_print_matrixinfo(t_jit_matrix_info minfo){
	printf("---------MATRIX INFO---------\n");
	printf("size : %ld bytes\n", minfo.size);
	printf("type : %s\n", minfo.type->s_name);
	printf("flag : %ld\n", minfo.flags);
	printf("dimcount : %ld\n", minfo.dimcount);
	printf("dim : %ld x %ld\n", minfo.dim[0],minfo.dim[1]);
	printf("dimstride : %ld, %ld\n", minfo.dimstride[0],minfo.dimstride[1]);
	printf("planecount : %ld\n", minfo.planecount);
	printf("-----------------------------\n");
}
