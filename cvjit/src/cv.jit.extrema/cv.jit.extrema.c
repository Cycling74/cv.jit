/*
cv.jit.extrema
	

Copyright 2010, Chrstopher P. Baker and Jean-Marc Pelletier
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



/*Note: removed experimental code that was commented out. --jmp*/

#ifdef __cplusplus
extern "C" {
#endif
#include "jit.common.h"
#include "ext_strings.h"
#ifdef __cplusplus 
} //extern "C"
#endif


// max points allowed 
#ifndef MAX_POINTS
#define MAX_POINTS (long)4096
#endif

// max points allowed 
#ifndef MAX_THRESH
#define MAX_THRESH (long)4096
#endif


// the object struct
typedef struct _cv_jit_extrema 
{
	t_object	ob;				// object
	long		threshold;		// threshold attribute
	long		maxpoints;		// maxpoints attribute
	long 		mode;	//  0 = 4 connectivity, 1 = 8 connectivity

} t_cv_jit_extrema;

// the class
void *_cv_jit_extrema_class;

// constructor
t_cv_jit_extrema *cv_jit_extrema_new(void);
	
// destructor				
void cv_jit_extrema_free(t_cv_jit_extrema *x);

// matrix calc			
t_jit_err cv_jit_extrema_matrix_calc(t_cv_jit_extrema *x, void *inputs, void *outputs);

// initializer
t_jit_err cv_jit_extrema_init(void);

										
//------------------------------

// init
// setup/register class, mop, attributes
t_jit_err cv_jit_extrema_init(void) 
{
	long attrflags=0;
	t_jit_object *attr;	// attribute handle
	t_jit_object *mop;	// pointer to mop
	
	void *output; //jmp
	
	// setup class
	_cv_jit_extrema_class = jit_class_new(	"cv_jit_extrema",			// name
										(method)cv_jit_extrema_new,	// constructor
										(method)cv_jit_extrema_free,	// destructor
										sizeof(t_cv_jit_extrema),	// size
										0L	); 					// end

	// add mop
	mop = jit_object_new(	_jit_sym_jit_mop,	// create mop
							1,					// 1 input
							1	);				// 1 outputs
	
	// disable link between left in and the outputs
	jit_mop_output_nolink(	mop,
							1	);	// output 1
		
							
	/*Output matrix size and planes can be set here. Christopher did this in the matrix_calc method, but I prefer to do it here, 
	as it saves some redundent processing. 
	Furthermore, I changed the format for output, to mirror other cv.jit objects and ease processing for the user. See matrix_calc for 
	more details. --jmp*/
	output = jit_object_method(mop,_jit_sym_getoutput,1); //Get a pointer to the output matrix
   	jit_attr_setlong(output,_jit_sym_minplanecount,2);  //Set output plane count 
  	jit_attr_setlong(output,_jit_sym_maxplanecount,2); 
  	jit_attr_setlong(output,_jit_sym_mindim,1);  //Only one dimension
  	jit_attr_setlong(output,_jit_sym_maxdim,1);
  	jit_attr_setsym(output,_jit_sym_types,_jit_sym_float32);
  	
  	
	// add class to mop	
	jit_class_addadornment(	_cv_jit_extrema_class,
							mop	);
							
	// add methods
	jit_class_addmethod(	_cv_jit_extrema_class, 
							(method)cv_jit_extrema_matrix_calc, 	// matrix calc method
							"matrix_calc", 					// matrix_calc message
							A_CANT, 
							0L	);

	// set attribute flags
	attrflags = JIT_ATTR_GET_DEFER_LOW | JIT_ATTR_SET_USURP_LOW;
	
	
	// setup attribute
	attr = jit_object_new(	_jit_sym_jit_attr_offset,
							"threshold",
							_jit_sym_long,
							attrflags, 
							(method)0L,
							(method)0L,
							calcoffset(t_cv_jit_extrema,threshold));
							
	// add attribute
	jit_class_addattr(_cv_jit_extrema_class, attr);
	
	// setup attribute
	attr = jit_object_new(	_jit_sym_jit_attr_offset,
							"maxpoints",
							_jit_sym_long,
							attrflags, 
							(method)0L,
							(method)0L,
							calcoffset(t_cv_jit_extrema,maxpoints));
							
							
	// add attribute
	jit_class_addattr(_cv_jit_extrema_class, attr);	

	// setup attribute
	attr = jit_object_new(	_jit_sym_jit_attr_offset,
							"mode",
							_jit_sym_long,
							attrflags, 
							(method)0L,
							(method)0L,
							calcoffset(t_cv_jit_extrema,mode));
							
							
	// add attribute
	jit_class_addattr(_cv_jit_extrema_class, attr);	



	//add methods
	
	// register class
	jit_class_register(_cv_jit_extrema_class);

	return JIT_ERR_NONE;
}

// matrix calc
t_jit_err cv_jit_extrema_matrix_calc(t_cv_jit_extrema *x, void *inputs, void *outputs)
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
					// are these always char? -- seems so (yes, cast to another pointer as necessary -- jmp)
	
	long  *ip;	// this is a pointer to a long value in the input matrix;
	float  *op;	// this is a pointer to a long value in the output  matrix
	
	/** init point parameters */
	long mode = CLAMP (x->mode,0,1);
	long maxpoints = CLAMP (x->maxpoints,1,MAX_POINTS);
	long threshold = CLAMP (x->threshold,0,MAX_THRESH);
	
	long pointcounter = 0;
	
	/** init iteration variables */
	long i, j;
			
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
	//  we do this so that we can access them later in the program and won't lose our place
	in_savelock = (long)jit_object_method(in_matrix, _jit_sym_lock,1);							
	out_savelock = (long)jit_object_method(out_matrix, _jit_sym_lock, 1);								
	
	/** load the matrix info into _minfo pointers */
	jit_object_method(in_matrix,_jit_sym_getinfo,&in_minfo);		
	// in here we submit the pointer to in_matrix, the method 
	// signature "_jit_sym_getinfo, and the memory address 
	// location of in_minfo (to be filled i assume)	
	jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);		// out
	
	// check incoming matrix type - we must have a a 2-dimensional 1-plane long matrix 
	if (in_minfo.type != _jit_sym_long) 
	{ 
		err = JIT_ERR_MISMATCH_TYPE; 
		error("The input must come from cv.jit.hough!"); //Added a friendly reminder -- jmp
		goto out;
	}		
	if (in_minfo.planecount != 1)
	{ 
		err = JIT_ERR_MISMATCH_PLANE; 
		error("The input must come from cv.jit.hough!"); //Added a friendly reminder -- jmp
		goto out;
	}
	if (in_minfo.dimcount != 2) 
	{ 
		err = JIT_ERR_MISMATCH_DIM; 
		error("The input must come from cv.jit.hough!"); //Added a friendly reminder -- jmp
		goto out;
	}
	
	
	out_minfo.dim[0] = maxpoints;
	
	/** set the out_minfo with the actual output matrix - make sure it was done correctly 
		output a generic error if something goes wrong  */
	if (jit_object_method(out_matrix, _jit_sym_setinfo, &out_minfo))
	{	
		err = JIT_ERR_GENERIC;
		goto out;
	}

	/** now get the "correctly filled" out_minfo from the out_matrix 
		(i assume that dimstride, etc was set correctly in the last step?) */
	jit_object_method(out_matrix, _jit_sym_getinfo, &out_minfo);
	
	/** clear the output matrix */
	jit_object_method(out_matrix, _jit_sym_clear);
	
	/** get the pointers to in_matrix structure */
    	jit_object_method(in_matrix, _jit_sym_getdata, &in_bp);
    
    	/** get the "cleaned" pointers to out_matrix data */
    	jit_object_method(out_matrix, _jit_sym_getdata, &out_bp);	
    
    	// in_bp now represents a pointer to the first value in the input matrix
 	 // out_bp now represents a pointer to the first value in the output matrix
 	 	
	/** check data pointers to make sure they were set correctly */
    	if (!in_bp || !out_bp) 
    	{ 
		err = JIT_ERR_INVALID_PTR; 
		goto out;
	}

	/** set pointers to the first value in the new cleared matricies */
	ip = (long *)in_bp;	  // recast to long*
	op = (float *)out_bp;  // recast to float*
	
    	/** Now find local maximums */
    
    	//  N.B.
	//  i is the row index (houghline - height, numangle (row))
	//  j is the column index (houghline - width, numrho (col))
				
    	//  do not treat edge pixels
	for( i = 1; i < in_minfo.dim[1] - 1; i++)
	//  cycle through rows of the image
	{	
		for( j = 1; j < in_minfo.dim[0] - 1; j++)
		{
			// first time, 0 coords, pointcounter = 0, maxpoints = 1
			// second time, 1 coord pointcounter = 1, maxpoints = 1
			ip = (long*)(in_bp + (i) * in_minfo.dimstride[1]) + j;
			//op = (long*)(out_bp + (pointcounter) * out_minfo.dimstride[1] );  --jmp
			
			switch (mode) {
			case 0:		//  defalut is 8 connectivity.		
				if( *ip > threshold	&& // make sure above thresh
					*ip > *(ip + 1) && // check [E]
					*ip > *(ip - 1) && // check [W]
					*ip > *(ip - in_minfo.dim[1] - 1) && // check [N]
					*ip > *(ip + in_minfo.dim[1] + 1) && // check [S]
					*ip > *(ip - in_minfo.dim[1])     && // check [NE]   
					*ip > *(ip - in_minfo.dim[1] - 2) && // check [NW]  
					*ip > *(ip + in_minfo.dim[1] + 2) && // check [SE]
					*ip > *(ip + in_minfo.dim[1])) 	     // check [SW]
				{
					//Changed ouput format --jmp
					op[0] = j;
					op[1] = i;
					op += 2;
					//*op = j;
					//op++; // increment pointer to next long
					//*op = i;
					pointcounter++;				
				}
				break;				
			case 1: 	
				if(*ip > threshold	&& 	  // make sure above thresh
					*ip > *(ip + 1) && // check [E]
					*ip > *(ip - 1) && // check [W]
					*ip > *(ip - in_minfo.dim[1] - 1) && // check [N]
					*ip > *(ip + in_minfo.dim[1] + 1)) // check [S]
				{		
					//Changed ouput format --jmp
					op[0] = j;
					op[1] = i;
					op += 2;		
					//*op = j;
					//op++; // increment pointer
					//*op = i; 
					pointcounter++;				
				
				}
				break;
			}
			
			
			if(pointcounter >= maxpoints) {  //  jump out if we have enough local maximums
				goto out;
			}			
		}
	}
	
	
	
	
	out:	
	
		/** unlock the pointer savelocks */
		jit_object_method(in_matrix, _jit_sym_lock, in_savelock);
		jit_object_method(out_matrix, _jit_sym_lock, out_savelock);
		

	return err;
}

/** constructor */
t_cv_jit_extrema *cv_jit_extrema_new(void)
{
	t_cv_jit_extrema *x;		// pointer to this object's structure
	//t_jit_matrix_info info;		// matrix info struct
	//long i;						// iteration variable
	
	/** allocate memory for this object, 
		if successful initialize the object attributes */
	if (x=(t_cv_jit_extrema *)jit_object_alloc(_cv_jit_extrema_class)) {
		// init attributes
		x->threshold = 20;
		x->maxpoints = 64;
		x->mode = 0;
	} else {
		x = NULL;	// null on failure
	}	
	return x;
}

void cv_jit_extrema_free(t_cv_jit_extrema *x)
{
	//nothing to free
}
