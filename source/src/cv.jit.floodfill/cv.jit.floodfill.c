/*
cv.jit.floodfill
	

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

//Segment structure
typedef struct Segment    
{
    int y;
    int l;
    int r;
    int Prevl;
    int Prevr;
    int flag;
} Segment;


typedef struct _cv_jit_floodfill 
{
	t_object				ob;
	long					seedcount;
	int						seed[2];
	Segment					*buffer;
	long					bufferSize;
} t_cv_jit_floodfill;


t_cv_jit_floodfill 	*cv_jit_floodfill_new			(void);
void 				cv_jit_floodfill_free			(t_cv_jit_floodfill *x);
t_jit_err 			cv_jit_floodfill_matrix_calc	(t_cv_jit_floodfill *x, void *inputs, void *outputs);
void 				cv_jit_floodfill_calculate 		(t_cv_jit_floodfill *x, long *dim, t_jit_matrix_info *in_minfo, uchar *bip, t_jit_matrix_info *out_minfo, uchar *bop);
t_jit_err 			cv_jit_floodfill_init			(void);
static long			cv_jit_floodfill(uchar *in, uchar *out, void *stack, int width, int height, int step, int seedx, int seedy, char val);

void 				*_cv_jit_floodfill_class;


t_jit_err cv_jit_floodfill_init(void) 
{
	long 			attrflags=0; //attribute flags
	t_jit_object 	*attr, *mop; //attributes and mop (Matrix OPerator)

	//Register class. Change the class and method names accordingly
	_cv_jit_floodfill_class = jit_class_new("cv_jit_floodfill",(method)cv_jit_floodfill_new,(method)cv_jit_floodfill_free,sizeof(t_cv_jit_floodfill),0L);

	//add mop:
	mop = (t_jit_object *)jit_object_new(_jit_sym_jit_mop,1,1); //#inputs,#outputs
	jit_mop_single_type(mop,_jit_sym_char);
	jit_mop_single_planecount(mop,1);	
	jit_class_addadornment(_cv_jit_floodfill_class,mop);

	//add methods
	jit_class_addmethod(_cv_jit_floodfill_class, (method)cv_jit_floodfill_matrix_calc, 		"matrix_calc", 		A_CANT, 0L);

	//add attributes	
	attrflags = JIT_ATTR_GET_DEFER_LOW | JIT_ATTR_SET_USURP_LOW;

	// seed -- sets seed
	attr = (t_jit_object *)jit_object_new(_jit_sym_jit_attr_offset_array, "seed", _jit_sym_long, 2, attrflags, (method)0L, (method)0L, calcoffset(t_cv_jit_floodfill, seedcount),calcoffset(t_cv_jit_floodfill,seed));
	jit_class_addattr(_cv_jit_floodfill_class,attr);
	
	//Register class
	jit_class_register(_cv_jit_floodfill_class);

	return JIT_ERR_NONE;
}


t_jit_err cv_jit_floodfill_matrix_calc(t_cv_jit_floodfill *x, void *inputs, void *outputs)
{
	//Variable definitions
	t_jit_err 			err=JIT_ERR_NONE; 
	long 				in_savelock=0,out_savelock=0;
	t_jit_matrix_info 	in_minfo,out_minfo;
	uchar 				*in_bp,*out_bp;
	long 				dim[2];	
	void 				*in_matrix, *out_matrix;
	long				size = 0;
	
	in_matrix = jit_object_method(inputs, _jit_sym_getindex, 0);		//Get pointer to input matrix
	out_matrix = jit_object_method(outputs, _jit_sym_getindex, 0);   	//Get pointer to output matrix

	if (x&&in_matrix&&out_matrix) 	//If all pointers are valid...
	{
		in_savelock = (long) jit_object_method(in_matrix,_jit_sym_lock,1);		//Lock input matrix
		out_savelock = (long) jit_object_method(out_matrix,_jit_sym_lock,1);	//Lock output matrix
		
		jit_object_method(in_matrix,_jit_sym_getinfo,&in_minfo);		//Get input matrix info structure
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);		//Get output matrix info structure

		
		jit_object_method(in_matrix,_jit_sym_getdata,&in_bp);		//Get input matrix data pointer
		jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);		//Get output matrix data pointer	
		
		if (!in_bp) { err=JIT_ERR_GENERIC; goto out;}	//If a data pointer is invalid, exit and return generic error
		if (!out_bp) { err=JIT_ERR_GENERIC; goto out;}
		
		//compatible types?
		if ((in_minfo.type!=_jit_sym_char)||(in_minfo.type!=out_minfo.type)) //cv.jit.floodfill only accepts char as input and output type
		{ 
			err=JIT_ERR_MISMATCH_TYPE; 
			goto out;
		}		

		//compatible planes?
		if ((in_minfo.planecount!=1)||(out_minfo.planecount!=1)) //cv.jit.floodfill only accepts 1-plane matrices as input and output type		
		{ 
			err=JIT_ERR_MISMATCH_PLANE; 
			goto out;
		}	
		
		//compatible dimensions?
		if ((in_minfo.dimcount!=2)||(out_minfo.dimcount!=2)) //cv.jit.floodfill only accepts 2-dimension matrices as input and output type
		{
			err=JIT_ERR_MISMATCH_DIM; 
			goto out;
		}	

		dim[0] = in_minfo.dim[0];
		dim[1] = in_minfo.dim[1];
		
		//Do we need to change buffer size?
		size = in_minfo.dim[0] * in_minfo.dim[1] * (sizeof(Segment)) >> 2; 
		if(size != x->bufferSize)
		{
			if(x->buffer)free(x->buffer);
			x->buffer = (Segment *)malloc(size);
			if(!x->buffer){err = JIT_ERR_OUT_OF_MEM; goto out;}
			x->bufferSize = size;
		}
			
		//calculate
		jit_object_method(out_matrix,_jit_sym_clear); //First clear output matrix
		cv_jit_floodfill_calculate(x,dim,&in_minfo,in_bp,&out_minfo,out_bp);
		

	} else //If either pointer to input or output matrix are invalid...
	{ 
		return JIT_ERR_INVALID_PTR;
	}
	
out:
	jit_object_method(out_matrix,gensym("lock"),out_savelock);  
	jit_object_method(in_matrix,gensym("lock"),in_savelock); 	
	return err;
}

void cv_jit_floodfill_calculate (t_cv_jit_floodfill *x, long *dim, t_jit_matrix_info *in_minfo, uchar *bip, t_jit_matrix_info *out_minfo, uchar *bop)
{
	cv_jit_floodfill(bip, bop, x->buffer, dim[0], dim[1], in_minfo->dimstride[1], x->seed[0], x->seed[1], 255);
}

t_cv_jit_floodfill *cv_jit_floodfill_new(void)
{
	t_cv_jit_floodfill *x;
		
	if (x=(t_cv_jit_floodfill *)jit_object_alloc(_cv_jit_floodfill_class)) 
	{
		//Init class members
		x->seedcount = 2; 
		x->seed[0] = 0;
		x->seed[1] = 0;
		x->buffer = NULL;
		x->bufferSize = 0;
		
	} else 
	{
		x = NULL;
	}	
	return x;
}

void cv_jit_floodfill_free(t_cv_jit_floodfill *x)
{
	if(x->buffer)free(x->buffer);
}

/*** Floodfill implementation ***/

#define UP 1
#define DOWN -1             

#define PUSH(Y,L,R,PL,PR,F) {  segments[stackIn].y=Y; \
								segments[stackIn].l=L; \
								segments[stackIn].r=R; \
								segments[stackIn].Prevl=PL; \
								segments[stackIn].Prevr=PR; \
								segments[stackIn].flag=F; \
								stackIn++; }

#define POP(Y,L,R,PL,PR,F)  {  stackIn--; \
								Y=segments[stackIn].y; \
								L=segments[stackIn].l; \
								R=segments[stackIn].r;\
								PL=segments[stackIn].Prevl; \
								PR=segments[stackIn].Prevr; \
								F=segments[stackIn].flag; }

static long cv_jit_floodfill(uchar *in, uchar *out, void *stack, int width, int height, int step, int seedx, int seedy, char val)
{
	uchar *inData, *outData;
	Segment *segments = (Segment *)stack;
	int maxIters = width * height >> 2;
	int stackIn = 0;
	int i,j;
	int row, left, right, prevLeft, prevRight, flag;
	long area = 0;
	
	inData = in + (step*seedy);
	outData = out + (step*seedy);
	
	if(val == 0)return 0; //Safety
	if((seedx >= width)||(seedx < 0)||(seedy >= height)||(seedy < 0))return 0;
	
	if(inData[seedx] == 0) return 0; //Seed is zero, don't do anything
	
	outData[seedx] = val; //Set seed pixel
	area++;
	
	//Process the rest of the starting row
	left = right = seedx;
	row = seedy;
	
	while((right < width -1)&&(inData[right +1] != 0)){ outData[++right] = val; area++;}
	while(left && (inData[left-1] != 0)){ outData[--left] = val; area++;}
	
	if(height == 1) return area;
	
	if(height == 2) //Special case
	{
		if(row == 1)
		{
			inData = in;
			outData = out;
		}
		else
		{
			inData = in + step;
			outData = out + step;
		}
		i = left;
		while(i && (inData[i-1] != 0)){ outData[--i] = val; area++;}
		i = left;
		while((i < width -1) && (inData[i+1] != 0)){ outData[++i] = val; area++;}
	}
	
	flag = (row != height -1) ? UP : DOWN; 
	
	PUSH(row,left,right,right+1,right,flag); 
	
	while(stackIn &&(stackIn<maxIters))
	{
		POP(row,left,right,prevLeft,prevRight,flag);
										
		if(((row - flag))<height)
		{
			inData = in + (row - flag) * step;		
			outData = out + (row - flag) * step;
		
			for(i=left;i<right+1;i++)
			{
				if((inData[i] != 0)&&(outData[i] == 0))
				{
					j=i;
					outData[i] = val; area++;
					
					while(j && (inData[j-1]!=0)){ outData[--j] = val;  area++;}
					while((i<width-1)&&(inData[i+1] != 0)){ outData[++i] = val;  area++;}
	
					PUSH(row-flag,j,i++,left,right,flag); 
				}
			}
		}
		
		inData = in + (row + flag) * step;
		outData = out + (row + flag) * step;
		
		for(i=left;i<prevLeft;i++)
		{
			if((inData[i] != 0) && (outData[i] == 0))
			{
				j=i;
				outData[i] = val;  area++;
				
				while(j && (inData[j - 1] != 0)){ outData[--j] = val;  area++;}
				while( (i < width - 1) && (inData[i + 1] != 0) ){ outData[++i] = val;  area++;}
				
				PUSH(row+flag,j,i++,left,right,-flag);
			}
		}
		
		for(i = prevRight + 1; i < right + 1; i++)
		{
			if((inData[i] != 0) && (outData[i] == 0))
			{
				j = i;
				outData[i] = val;  area++;
				while(j && (inData[j - 1] != 0)){ outData[--j] = val;  area++;}
				while((i < width - 1) && (inData[i + 1] != 0)){ outData[++i] = val;  area++;}
				PUSH(row+flag,j,i++,left,right,-flag);
			}
		}
	}
	return area;
}


