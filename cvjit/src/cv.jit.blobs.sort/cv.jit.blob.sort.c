/*
cv.jit.blobs.sort
	

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

#ifdef __cplusplus
extern "C" {
#endif
#include "jit.common.h"
#ifdef __cplusplus 
} //extern "C"
#endif
#include <stdlib.h>

typedef struct _arrF
{
    int length;
    float data[256];
}ArrayF;

typedef struct _arrI
{
    int length;
    int data[256];
}ArrayI;


typedef struct _cv_jit_blobs_sort 
{
	t_object				ob;
	ArrayI					set;
	ArrayI					ndx;
	ArrayI					available;
	ArrayF					ptx;
	ArrayF					pty;
	float					threshold;
} t_cv_jit_blobs_sort;

void *_cv_jit_blobs_sort_class;

t_jit_err 				cv_jit_blobs_sort_init(void); 
t_cv_jit_blobs_sort *	cv_jit_blobs_sort_new(void);
void 					cv_jit_blobs_sort_free(t_cv_jit_blobs_sort *x);
t_jit_err 				cv_jit_blobs_sort_matrix_calc(t_cv_jit_blobs_sort *x, void *inputs, void *outputs);
void 					cv_jit_blobs_sort_calculate(t_cv_jit_blobs_sort *x, float *in, char *out, int w, int planecount);

//Functions for array operations
void fArrPush(ArrayF *arr,float val);
void fArrRemove(ArrayF *arr,int index);
void iArrPush(ArrayI *arr,int val);
void iArrRemove(ArrayI *arr,int index);
int iArrShift(ArrayI *arr);
int compare(const void* a, const void* b);

t_jit_err cv_jit_blobs_sort_init(void) 
{
	long attrflags=0;
	t_jit_object *attr,*mop,*output;
	t_symbol *atsym;
	
	atsym = gensym("jit_attr_offset");
	
	_cv_jit_blobs_sort_class = jit_class_new("cv_jit_blobs_sort",(method)cv_jit_blobs_sort_new,(method)cv_jit_blobs_sort_free,
		sizeof(t_cv_jit_blobs_sort),0L); 

	//add mop
	mop = jit_object_new(_jit_sym_jit_mop,1,1);  //Object has one input and one output

   	jit_mop_single_type(mop,_jit_sym_float32);   //Set input type and planecount
   	jit_mop_output_nolink(mop,1); //Turn off output linking so that output matrix does not adapt to input
   	
   	output = jit_object_method(mop,_jit_sym_getoutput,1); //Get a pointer to the output matrix
   	jit_attr_setlong(output,_jit_sym_minplanecount,1);
  	jit_attr_setlong(output,_jit_sym_maxplanecount,1);
  	jit_attr_setlong(output,_jit_sym_mindim,1);
  	jit_attr_setlong(output,_jit_sym_maxdim,1);
  	jit_attr_setsym(output,_jit_sym_types,_jit_sym_char);
   	   	
	jit_class_addadornment(_cv_jit_blobs_sort_class,mop);
	
	
	//add methods
	jit_class_addmethod(_cv_jit_blobs_sort_class, (method)cv_jit_blobs_sort_matrix_calc, 		"matrix_calc", 		A_CANT, 0L);	

	//add attributes	
	attrflags = JIT_ATTR_GET_DEFER_LOW | JIT_ATTR_SET_USURP_LOW;
	
	attr = jit_object_new(	_jit_sym_jit_attr_offset,"threshold",_jit_sym_float32,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_blobs_sort,threshold));			
	jit_class_addattr(_cv_jit_blobs_sort_class, attr);
	
	jit_class_register(_cv_jit_blobs_sort_class);

	return JIT_ERR_NONE;
}

t_jit_err cv_jit_blobs_sort_matrix_calc(t_cv_jit_blobs_sort *x, void *inputs, void *outputs)
{
	t_jit_err err=JIT_ERR_NONE;
	long in_savelock=0,out_savelock=0;
	t_jit_matrix_info in_minfo,out_minfo;
	char *out_bp,*in_bp;
	void *in_matrix,*out_matrix;
	float *in_data;
	//long *out_data;
	
	//Get pointers to matrices
	in_matrix 	= jit_object_method(inputs,_jit_sym_getindex,0);
	out_matrix  = jit_object_method(outputs,_jit_sym_getindex,0);

	if (x&&in_matrix&&out_matrix) 
	{
		//Lock the matrices
		in_savelock = (long) jit_object_method(in_matrix,_jit_sym_lock,1);
		out_savelock = (long) jit_object_method(out_matrix,_jit_sym_lock,1);
		
		//Make sure input is of proper format
		jit_object_method(in_matrix,_jit_sym_getinfo,&in_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);

		if(in_minfo.dimcount != 1)
		{
			err = JIT_ERR_MISMATCH_DIM;
			error("Make sure object is connected to leftmost outlet of cv.jit.blobs.centroids!");
			goto out;
		}
		if((in_minfo.planecount != 3)&&(in_minfo.planecount != 17))
		{
			err = JIT_ERR_MISMATCH_PLANE;
			error("Make sure object is connected to leftmost outlet of cv.jit.blobs.centroids or cv.jit.blobs.moments!");
			goto out;
		}
		if(in_minfo.type != _jit_sym_float32)
		{
			err = JIT_ERR_MISMATCH_TYPE;
			error("Make sure object is connected to leftmost outlet of cv.jit.blobs.centroids or cv.jit.blobs.moments!");
			goto out;
		}

		//Get the data pointers
		jit_object_method(in_matrix,_jit_sym_getdata,&in_bp);
		if (!in_bp) { err=JIT_ERR_INVALID_INPUT; goto out;}
		
		out_minfo.dim[0] = in_minfo.dim[0];
		jit_object_method(out_matrix,_jit_sym_setinfo,&out_minfo);
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);
		jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);
		if (!out_bp) { err=JIT_ERR_INVALID_OUTPUT; goto out;}
		
		in_data = (float *)in_bp;
		//out_data = (long *)out_bp;
		
		//Calculate
		cv_jit_blobs_sort_calculate(x, in_data, out_bp, in_minfo.dim[0], in_minfo.planecount);
	}
		
out:
	jit_object_method(out_matrix,gensym("lock"),out_savelock);
	jit_object_method(in_matrix,gensym("lock"),in_savelock);
	return err;
}

void cv_jit_blobs_sort_calculate(t_cv_jit_blobs_sort *x, float *in, char *out, int w, int planecount)
{
	int i,j;
	float distance,dx,dy,cx,cy;
	float *input;
	char *output;
	float thresh;
	float closest;
	long id = -1;
	int step;
	
	input = in;
	output = out;
	thresh = x->threshold * x->threshold;
	
	step = (planecount == 3) ? 0 : 14;
	
	//Init
	for(i=0;i<x->set.length;i++)
		x->set.data[i] = 0;
		
	//Latch
	for(j=0;j<w;j++) //For every input blob
	{ 
		cx = input[step];
		cy = input[step+1];
		closest = -1;
		id = -1;
		
		if((cx == 0) && (cy == 0) && (w == 1)) //Special case, original image was empty, no blobs
		{
			*output = 0;
			return;
		}
		
		for(i=0;i<x->ptx.length;i++) //Try to latch onto blobs previously found
		{
			dx = cx - x->ptx.data[i];
			dy = cy - x->pty.data[i];
			distance = dx * dx + dy * dy;
			if(distance < thresh)
			{
				if((distance < closest)||(closest == -1)) //Found a candidate
				{
					closest = distance;
					id = i;
				}
			}
		}
		if(closest == -1) //Blob did not successfully latch onto a previous blob
		{
			fArrPush(&(x->ptx),cx);
			fArrPush(&(x->pty),cy);
			iArrPush(&(x->set),1);
			
			//Find lowest available id
			if(x->available.length > 0)
				id = (long)iArrShift(&(x->available));
			else
				id = x->ptx.length;
							
			iArrPush(&(x->ndx),id);
			
			*output = (char)id;
		}
		else
		{
			x->ptx.data[id] = cx;
			x->pty.data[id] = cy;
			x->set.data[id] = 1;
			
			*output = (char)x->ndx.data[id];
		}
		
		//Update pointers
		input += planecount;
		output++;
	}
	
	//Cleanup
	for(i=0;i<x->set.length;i++)
	{
		if(x->set.data[i] == 0) //This blob was lost, free the id
		{
			iArrPush(&(x->available),x->ndx.data[i]);
			iArrRemove(&(x->set),i);
			iArrRemove(&(x->ndx),i);
			fArrRemove(&(x->ptx),i);
			fArrRemove(&(x->pty),i);
			i = -1;
		}
	}
	qsort(x->available.data,x->available.length,sizeof(int),compare);
}

t_cv_jit_blobs_sort *cv_jit_blobs_sort_new(void)
{
	t_cv_jit_blobs_sort *x;
		
	if (x=(t_cv_jit_blobs_sort *)jit_object_alloc(_cv_jit_blobs_sort_class)) {
	
		x->threshold = 10;
		
		x->set.length = 0;
		x->available.length = 0;
		x->ndx.length = 0;
		x->ptx.length = 0;
		x->pty.length = 0;

	} else {
		x = NULL;
	}	
	return x;
}

void cv_jit_blobs_sort_free(t_cv_jit_blobs_sort *x)
{
	/*Nothing to free*/
}

void fArrPush(ArrayF *arr,float val)
{
    if(arr->length == 256)
        return;
    arr->data[arr->length] = val;
    arr->length++;
}

void fArrRemove(ArrayF *arr,int index)
{
    int i,j;
    if(index >= arr->length)
        return;

    for(i=index,j=index+1;j<arr->length;i++,j++)
    {
        arr->data[i] = arr->data[j];
    }
    arr->length--;
}

void iArrPush(ArrayI *arr,int val)
{
    if(arr->length == 256)
        return;
    arr->data[arr->length] = val;
    arr->length++;
}

void iArrRemove(ArrayI *arr,int index)
{
    int i,j;
    if(index >= arr->length)
        return;

    for(i=index,j=index+1;j<arr->length;i++,j++)
    {
        arr->data[i] = arr->data[j];
    }
    arr->length--;
}

int iArrShift(ArrayI *arr)
{
    int i,j;
    int val = arr->data[0];
    for(i=0,j=1;j<arr->length;i++,j++)
    {
        arr->data[i] = arr->data[j];
    }
    arr->length--;
    
    return val;
} 

int compare(const void* a, const void* b)
{
	return *(int *)a - *(int *)b;
}