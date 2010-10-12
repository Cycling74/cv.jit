/*
cv.jit.hough
	

Copyright 2004, 2010, Chrstopher P. Baker, mateusz herczka and Jean-Marc Pelletier
bakercp@umn.edu
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
	classical hough transform
	
	in: image matrix - 2D, 1 plane, char
	out: accumulator matrix - 2D, 1 plane, long	
	
	typedef struct _jit_matrix_info
	{
		long			size;			// in bytes (0xFFFFFFFF=UNKNOWN)
		t_symbol		*type;			// primitive type
		long			flags;			// my data?, handle?
		long			dimcount;		
		long			dim[JIT_MATRIX_MAX_DIMCOUNT];		
		long			dimstride[JIT_MATRIX_MAX_DIMCOUNT]; // in bytes(array of size dimcount)
		long			planecount;		// # planes
	} t_jit_matrix_info;
 
*/

#include "jit.common.h"
#include "ext_strings.h"

#ifndef PI
#define	PI (double)3.141592653589793
#endif

// define pi/2
#ifndef HALF_PI
#define HALF_PI (double)1.570796326795
#endif

// define a degree in radians
// ((double)PI/180.0)
#ifndef DEG
#define DEG (double)0.01745329252
#endif

// this is equivalent to one degree
// theta is clamped between DEG and HALF_PI
// #ifndef MAX_ANGLE_QUANT_STEPS
// #define MAX_ANGLE_QUANT_STEPS (long)360
// #endif

// max lines allowed 
#ifndef MAX_LINES
#define MAX_LINES (long)4096
#endif

// the object struct
typedef struct _cv_jit_hough 
{
	t_object	ob;				// object
	
	double		rho;			// rho attribute
	double		theta;			// theta attribute - clamp 1-180 degrees
	
	double 		tab_sin[360];		// sin table pointer
	double		tab_cos[360];		// cos table pointer
	//long		tab_size;		// size of these tables in bytes
	//long		tab_count;
} t_cv_jit_hough;

// the class
void *_cv_jit_hough_class;

// constructor
t_cv_jit_hough *cv_jit_hough_new(void);
	
// destructor				
void cv_jit_hough_free(t_cv_jit_hough *x);

// matrix calc			
t_jit_err cv_jit_hough_matrix_calc(t_cv_jit_hough *x, void *inputs, void *outputs);

// initializer
t_jit_err cv_jit_hough_init(void);

										
//------------------------------

// init
// setup/register class, mop, attributes
t_jit_err cv_jit_hough_init(void) 
{
	long attrflags=0;
	t_jit_object *attr;	// attribute handle
	t_jit_object *mop;	// pointer to mop
	
	// setup class
	_cv_jit_hough_class = jit_class_new(	"cv_jit_hough",			// name
										(method)cv_jit_hough_new,	// constructor
										(method)cv_jit_hough_free,	// destructor
										sizeof(t_cv_jit_hough),	// size
										A_CANT,					// A_CANT = untyped
										0L	); 					// end

	// add mop
	mop = jit_object_new(	_jit_sym_jit_mop,	// create mop
							1,					// 1 input
							1	);				// 1 output
	
	// disable link between left in and the outputs
	jit_mop_output_nolink(	mop,
							1	);	// output 1
	
	// add class to mop	
	jit_class_addadornment(	_cv_jit_hough_class,
							mop	);
							
	// add methods
	jit_class_addmethod(	_cv_jit_hough_class, 
							(method)cv_jit_hough_matrix_calc, 	// matrix calc method
							"matrix_calc", 					// matrix_calc message
							A_CANT, 
							0L	);

	// set attribute flags
	attrflags = JIT_ATTR_GET_DEFER_LOW | JIT_ATTR_SET_USURP_LOW;
	
	// setup attribute
	attr = jit_object_new(	_jit_sym_jit_attr_offset,	// setup attribute		
							"rho",						// attribute
							_jit_sym_float64,			// attribute type
							attrflags, 					// attribute flags
							(method)0L,					
							(method)0L,
							calcoffset(t_cv_jit_hough,rho));	// offset for the attribute
	
	// add attribute			
	jit_class_addattr(_cv_jit_hough_class, attr);
	
	// setup attribute					
	attr = jit_object_new(	_jit_sym_jit_attr_offset,
							"theta",
							_jit_sym_float64,
							attrflags, 
							(method)0L,
							(method)0L,
							calcoffset(t_cv_jit_hough,theta));
	
	// add attribute
	jit_class_addattr(_cv_jit_hough_class, attr);
	
	

	//add methods
	
	// register class
	jit_class_register(_cv_jit_hough_class);

	return JIT_ERR_NONE;
}

// matrix calc
t_jit_err cv_jit_hough_matrix_calc(t_cv_jit_hough *x, void *inputs, void *outputs)
{
	/** set the default err to return */
	t_jit_err err=JIT_ERR_NONE;
	
	/** init savelocks */
	long in_savelock, out_savelock;	
	
	/** init matrix infos */
	t_jit_matrix_info	in_minfo, out_minfo;
						
	/** init matrix pointers */
	void *in_matrix, *out_matrix;
	char *in_bp,*out_bp;	// these are pointers to the in/out pointers.
									// are these always char? -- seems so
	uchar *ip;	// this is a pointer to a char value in the input matrix;
	long  *op;	// this is a pointer to a long value in the output 1 matrix;
	
	/** init hough params */
	double theta = CLAMP (x->theta, DEG / 2.0 , HALF_PI);
	double rho = CLAMP (x->rho, 1, 20); // 20 was 10
	double irho = 1.0 / rho;	
	
	long numangle;
	long numrho;

	//float linerho = 0;
	//float linetheta = 0;
	
	/** init line parameters */
	//int base = 0;
	
	/** init iteration variables */
	long i, j, n, r;
	double ang;
			
	/** get the current matrix pointers */
	in_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);  // get the pointer to the input_matrix
	out_matrix 	= jit_object_method(outputs,_jit_sym_getindex,0); // get the pointer to the first output matrix
																  // matrix getindex at index 1 (?)
	/** check pointers */
	if (!x && !in_matrix && !out_matrix) //  make sure pointers point to something
	{
		err = JIT_ERR_INVALID_PTR;
		goto out;
	}
	
	/** lock the in_matrix/out_matrix pointers so's they don't change - dont forget to unlock them later */
	in_savelock = (long)jit_object_method(in_matrix, _jit_sym_lock,1);							
	out_savelock = (long)jit_object_method(out_matrix, _jit_sym_lock, 1);								
	
	/** load the matrix info into _minfo pointers */
	jit_object_method(in_matrix,_jit_sym_getinfo,&in_minfo);		
	// in here we submit the pointer to in_matrix, the method 
	// signature "_jit_sym_getinfo, and the memory address 
	// location of in_minfo (to be filled i assume)	
	jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);		// out
	
	// check types - we need a 2-dimensional 1-plane char matrix 
	if (in_minfo.type != _jit_sym_char) 
	{ 
		err = JIT_ERR_MISMATCH_TYPE; 
		goto out;
	}		
	if (in_minfo.planecount != 1) 
	{ 
		err = JIT_ERR_MISMATCH_PLANE; 
		goto out;
	}
	if (in_minfo.dimcount != 2) 
	{ 
		err = JIT_ERR_MISMATCH_DIM; 
		goto out;
	}
	
	/** set out type */
	out_minfo.type = _jit_sym_long;		// accumulator type is long
	
	/** set out planecount */
	out_minfo.planecount = 1;	// accumulator 1 plane
	
	/** set out dimcount */
	out_minfo.dimcount = 2;		// width/height
	
	/**  calculate the width and height of the hough image */
	
	// reverse these operations to determine rho/theta from hough space
	numangle = (long)(PI / theta);  // this is numangle
	numrho = (long) (((in_minfo.dim[0] + in_minfo.dim[1]) * 2 + 1) / rho);  // this is numrho
	
	/** set the out dims */
	out_minfo.dim[0] = numrho;	// width
	out_minfo.dim[1] = numangle;	// height
	
	/** check for incorrect dim setups */
	if (jit_object_method(out_matrix, _jit_sym_setinfo, &out_minfo))
	{	
		err = JIT_ERR_GENERIC;
		goto out;
	}
	jit_object_method(out_matrix, _jit_sym_getinfo, &out_minfo);
	
	
	/** clear the out matricies */
	jit_object_method(out_matrix, _jit_sym_clear);
	
	/** get the "cleaned" pointers to in_matrix and out_matrix data */
    jit_object_method(in_matrix, _jit_sym_getdata, &in_bp);
    jit_object_method(out_matrix, _jit_sym_getdata, &out_bp);	
    
    	// in_bp now represents a pointer to the first value in the input matrix
 	 	// out_bp now represents a pointer to the first value in the out1 matrix
 	 	
	/** check data pointers to make sure they were set correctly */
    if (!in_bp || !out_bp) 
    { 
		err = JIT_ERR_INVALID_PTR; 
		goto out;
	}

	/** set pointers to the first value in the new cleared matricies */
	ip = (uchar *)in_bp;		// recast to uchar*
	op = (long *)out_bp;	// recast to long*
	
	/** fill sin and cos tables precalculate sin and cos for each angle step */
    for( ang = 0, n = 0; n < numangle; ang += theta, n++ )	
    {
        x->tab_sin[n] = jit_math_sin( ang );
        x->tab_cos[n] = jit_math_cos( ang );
    }
	

	/** fill accumulator matrix */
	for( i = 0; i < in_minfo.dim[1]; i++)	//  cycle through rows of binary input image
	// height N.B. in_minfo.dim[1] = the height, in pixels, of the input matrix
	// in_minfo.dim[1] = numangle
	{	
		ip = (uchar*)(in_bp + i * in_minfo.dimstride[1]);
		//  set the input matrx pointer to the index of "in_bp + i * in_minfo.dimstride[1]"
		// basically, we are setting it to the 'nth' row 
		
		for( j = 0; j < in_minfo.dim[0]; j++ ) // cycle through columns of binary input image
		//  width N.B. in_minfo.dim[0] = the width, in pixels, of the input matrix
		// in_minfo.dim[0] = numrho
		{	
			// check for 'on' pixel (the pixel represented by *ip)
			if( *ip != 0)
			{
				// iterate each angle
				for( n = 0; n < numangle; n++ ) // angle
				{
					op = (long*)(out_bp + n * out_minfo.dimstride[1]);
					//  set the output pointer to index value of "out_bp + n * out_minfo.dimstride[1] "
								
					// r = xcos(theta) + ysin(theta)
					r = (long)jit_math_round( (j * x->tab_cos[n] + i * x->tab_sin[n]) * irho );
					r += (numrho - 1) / 2;
					
					// increment r/theta cell in hough space
					// r = x
					// theta = y
					op += r;  // increment r;
					(*op)++;  // increment the theta pointer to the next value of "theta" in the outputmatrix
				}
			}
			ip++;// increment input pointer to the next pixel in this row
		}
	}
	
    
	
out:
//					post("linecounter = %d",linecounter-1);	

//	post("\tout:");
	
	
	/** unlock the pointer savelocks */
	jit_object_method(in_matrix, _jit_sym_lock, in_savelock);
	jit_object_method(out_matrix, _jit_sym_lock, out_savelock);

	

	return err;
}

// constructor
t_cv_jit_hough *cv_jit_hough_new(void)
{
	t_cv_jit_hough *x;				// pointer to objext
	//t_jit_matrix_info info;		// matrix info struct
	//long i;						// iteration variable
	
	// allocate memory
	if (x=(t_cv_jit_hough *)jit_object_alloc(_cv_jit_hough_class)) {
	
		// init attributes
		x->rho = 4.0;
		x->theta = 5.0 * DEG;
		
	} else {
		x = NULL;	// null on failure
	}	
	return x;
}

void cv_jit_hough_free(t_cv_jit_hough *x)
{
	//nothing to free
}
