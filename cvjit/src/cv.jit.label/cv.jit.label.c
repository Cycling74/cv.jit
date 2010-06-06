/*
cv.jit.label
	

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

//Blob struct definition
typedef struct
{
	int index;
	long size;
} Blob;

//label object definition
typedef struct _cv_jit_label 
{
	t_object				ob;
	long					threshold;
	char					mode;
	char					charmode;
	t_symbol				*matname;
	void					*buf;
	t_symbol				*matname2;
	void					*ctemp;
	Blob					Blobs[2048];
	long					equiv[2048];
} t_cv_jit_label;

//Segment structure
typedef struct    
{
    int y;
    int l;
    int r;
    int Prevl;
    int Prevr;
    int fl;
} Seg;

//Defines for label algorithm
#define UP 1
#define DOWN -1             

#define PUSH(Y,IL,IR,IPL,IPR,FL) {  stack[StIn].y=Y; \
                                    stack[StIn].l=IL; \
                                    stack[StIn].r=IR; \
                                    stack[StIn].Prevl=IPL; \
                                    stack[StIn].Prevr=IPR; \
                                    stack[StIn].fl=FL; \
                                    StIn++; }

#define POP(Y,IL,IR,IPL,IPR,FL)  {  StIn--; \
                                    Y=stack[StIn].y; \
                                    IL=stack[StIn].l; \
                                    IR=stack[StIn].r;\
                                    IPL=stack[StIn].Prevl; \
                                    IPR=stack[StIn].Prevr; \
                                    FL=stack[StIn].fl; }
//Pointer to label class
void 				*_cv_jit_label_class;

//Function definitions
t_cv_jit_label 		*cv_jit_label_new			(void);
void 				cv_jit_label_free			(t_cv_jit_label *x);
t_jit_err 			cv_jit_label_matrix_calc	(t_cv_jit_label *x, void *inputs, void *outputs);
void 				cv_jit_label_calculate		(t_cv_jit_label *x, long dimcount, long *dim, long planecount, t_jit_matrix_info *in_minfo, char *bip, t_jit_matrix_info *out_minfo, char *bop, char *st, char *tmp, t_jit_matrix_info *t_minfo);
t_jit_err 			cv_jit_label_init			(void);
long				fillBlobLong				(long row, long coll, long val, long *X, long *dim, long instep, long outstep, char *bip,  char *bop, char *st);
int					compare						(const void * a, const void * b);

t_jit_err cv_jit_label_init(void) 
{
	long 			attrflags=0;
	t_jit_object 	*attr, *mop;
	
	_cv_jit_label_class = jit_class_new("cv_jit_label",(method)cv_jit_label_new,(method)cv_jit_label_free,sizeof(t_cv_jit_label),0L);

	//add mop
	mop = jit_object_new(_jit_sym_jit_mop,1,1);
	jit_class_addadornment(_cv_jit_label_class,mop);

	//add methods
	jit_class_addmethod(_cv_jit_label_class, (method)cv_jit_label_matrix_calc, 		"matrix_calc", 		A_CANT, 0L);

	//add attributes
	//
	// threshold : the minimum blob size
	attrflags = JIT_ATTR_GET_DEFER_LOW | JIT_ATTR_SET_USURP_LOW;
	attr = jit_object_new(_jit_sym_jit_attr_offset,"threshold",_jit_sym_long,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_label,threshold));
	jit_class_addattr(_cv_jit_label_class,attr);
	//mode : 0: label sequentially, 1: label with mass
	attr = jit_object_new(_jit_sym_jit_attr_offset,"mode",_jit_sym_char,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_label,mode));
	jit_attr_addfilterset_clip(attr,0,1,TRUE,TRUE);	//clip to 0-1
	jit_class_addattr(_cv_jit_label_class,attr);
	//charmode: 0: output is long, 1: output is char
	attr = jit_object_new(_jit_sym_jit_attr_offset,"charmode",_jit_sym_char,attrflags,(method)0L,(method)0L,calcoffset(t_cv_jit_label,charmode));
	jit_attr_addfilterset_clip(attr,0,1,TRUE,TRUE);	//clip to 0-1
	jit_class_addattr(_cv_jit_label_class,attr);

	//Register class
	jit_class_register(_cv_jit_label_class);

	return JIT_ERR_NONE;
}


t_jit_err cv_jit_label_matrix_calc(t_cv_jit_label *x, void *inputs, void *outputs)
{
	//Variable definitions
	t_jit_err 			err=JIT_ERR_NONE;  									//For error code
//	Seg 				*st; 												//Pointer to segment buffer
//	int 				bufferSize; 										//Size of the segment buffer
	long 				in_savelock=0,out_savelock=0,buf_savelock=0,temp_savelock=0; 				//Savelocks
	t_jit_matrix_info 	in_minfo,out_minfo,buf_minfo,temp_minfo; 						//Matrix information structures
	char 				*in_bp,*out_bp,*buf_bp,*temp_bp; 							//Pointers to matrix data
	long 				i; 													//Used for itteration
	long 				dimcount,planecount,dim[JIT_MATRIX_MAX_DIMCOUNT];	//Variables to store information about matrices
	void 				*in_matrix, *out_matrix, *buf_matrix, *temp_matrix; 				//Pointers to actual matrices
	
	
	in_matrix = jit_object_method(inputs, _jit_sym_getindex, 0);		//Get pointer to input matrix
	out_matrix = jit_object_method(outputs, _jit_sym_getindex, 0);   	//Get pointer to output matrix
	buf_matrix = x->buf;
	temp_matrix = x->ctemp;

	if (x&&in_matrix&&out_matrix&&buf_matrix) 	//If all pointers are valid...
	{
		in_savelock = (long) jit_object_method(in_matrix,_jit_sym_lock,1);		//Get save lock for input matrix
		out_savelock = (long) jit_object_method(out_matrix,_jit_sym_lock,1);	//Get save lock for output matrix
		buf_savelock = (long) jit_object_method(buf_matrix,_jit_sym_lock,1);
		temp_savelock = (long) jit_object_method(temp_matrix,_jit_sym_lock,1);
		
		jit_object_method(in_matrix,_jit_sym_getinfo,&in_minfo);				//Get input matrix info
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);				//Get output matrix info
		jit_object_method(buf_matrix,_jit_sym_getinfo,&buf_minfo);
		jit_object_method(temp_matrix,_jit_sym_getinfo,&temp_minfo);
		
		buf_minfo.dim[0] = in_minfo.dim[0] * in_minfo.dim[1] * (sizeof(Seg)) >> 2; 

		if(x->charmode == 0)
			out_minfo.type = _jit_sym_long;
		else if(x->charmode == 1)
		{
			out_minfo.type = _jit_sym_char;
			temp_minfo.dim[0] = in_minfo.dim[0];
			temp_minfo.dim[1] = in_minfo.dim[1];
			temp_minfo.type = _jit_sym_long;

			jit_object_method(temp_matrix,_jit_sym_setinfo,&temp_minfo);
			jit_object_method(temp_matrix,_jit_sym_getinfo,&temp_minfo);
			
			jit_object_method(temp_matrix,_jit_sym_clear);

			jit_object_method(temp_matrix,_jit_sym_getdata,&temp_bp);
			if (!temp_bp) { err=JIT_ERR_GENERIC; goto out;}
		}
		
		jit_object_method(buf_matrix,_jit_sym_setinfo,&buf_minfo);
		jit_object_method(out_matrix,_jit_sym_setinfo,&out_minfo);
		
		jit_object_method(out_matrix,_jit_sym_getinfo,&out_minfo);
		jit_object_method(buf_matrix,_jit_sym_getinfo,&buf_minfo);
		
		jit_object_method(in_matrix,_jit_sym_getdata,&in_bp);					//Get input matrix data pointer
		jit_object_method(out_matrix,_jit_sym_getdata,&out_bp);					//Get output matrix data pointer
		jit_object_method(buf_matrix,_jit_sym_getdata,&buf_bp);
		
		if (!in_bp) { err=JIT_ERR_GENERIC; goto out;}			//If either data pointer is invalid, exit and return generic error
		if (!out_bp) { err=JIT_ERR_GENERIC; goto out;}
		if (!buf_bp) { err=JIT_ERR_GENERIC; goto out;}
		
		//compatible types?
		if (in_minfo.type!=_jit_sym_char) //jit.cv.label only accepts char
		{ 
			err=JIT_ERR_MISMATCH_TYPE; 
			goto out;
		}		

		//compatible planes?
		if (in_minfo.planecount!=1)		//jit.cv.label only accepts 1-plane matrices type		
		{ 
			err=JIT_ERR_MISMATCH_PLANE; 
			goto out;
		}	
		
		//compatible dimensions?
		if ((in_minfo.dimcount!=2)||(out_minfo.dimcount!=2))				//jit.cv.label only accepts 2-dimension matrices as input and output type
		{
			err=JIT_ERR_MISMATCH_DIM; 
			goto out;
		}	

		//get dimensions/planecount
		dimcount   = out_minfo.dimcount;
		planecount = out_minfo.planecount;			
		for (i=0;i<dimcount;i++) 	
		{
			dim[i] = MIN(in_minfo.dim[i],out_minfo.dim[i]);
		}	
				
		//calculate
		jit_object_method(out_matrix,_jit_sym_clear); //First clear output matrix
		
		cv_jit_label_calculate(x, dimcount, dim, planecount, &in_minfo, in_bp, &out_minfo, out_bp, buf_bp, temp_bp, &temp_minfo);
		
	} else //If either pointer to input or output matrix are invalid...
	{ 
		return JIT_ERR_INVALID_PTR;
	}
	
out:
	jit_object_method(out_matrix,gensym("lock"),out_savelock);
	jit_object_method(in_matrix,gensym("lock"),in_savelock);
	jit_object_method(buf_matrix,gensym("lock"),buf_savelock);
	return err;
}

void cv_jit_label_calculate(t_cv_jit_label *x, long dimcount, long *dim, long planecount, t_jit_matrix_info *in_minfo, char *bip, t_jit_matrix_info *out_minfo, char *bop, char *st, char *tmp, t_jit_matrix_info *t_minfo)
{
	char	*in; 								//Pointers to matrix data 	
	char	*out;
	long	*out_l;
	char	*cTemp;
    int 	step,outstep,cstep;						//The size, in bytes of a single row of data
    int 	width,height;						//Width and height, in elements, of the matrices
    long 	i, j;								//For iteration 
    long	thresh;								//Smallest blob
    int		ndx;
    long*	equiv;
    unsigned int		count;
    long 	temp;
	Blob*	blobs;
    
    step    = in_minfo->dimstride[1]; //step now holds dimstride
	outstep = out_minfo->dimstride[1];
	cstep	= t_minfo->dimstride[1];

    width   = dim[0];
    height  = dim[1];
	equiv = x->equiv;
    
    thresh = MAX(0, x->threshold);
    
    in = bip;
    out = bop;
	cTemp = tmp;
	blobs = x->Blobs;
	blobs[0].index = 0;
	blobs[0].size = 0;
    
    ndx = 0;

    //Scan through image and look for new blobs
	if(out_minfo->type==_jit_sym_long)
	{
		for (i=0;i<height;i++)
		{	
    		for (j=0;(j<width)&&(ndx < 2048);j++)
    		{
    			if((((long *)out)[j]==0)&&(in[j]!=0))    //We found a new blob
    			{
    				ndx++;
					ndx = MIN(ndx, 2048);
					blobs[ndx].index=ndx;
					blobs[ndx].size = fillBlobLong(i, j, ndx, &j, dim, step, outstep, bip, bop, st);
    			}
	    	
    		}
    		in += step;
    		out += outstep;
		}
	}
	else if(out_minfo->type==_jit_sym_char)
	{
		for (i=0;i<height;i++)
		{	
    		for (j=0;(j<width)&&(ndx < 2048);j++)
    		{
    			if((((long *)cTemp)[j]==0)&&(in[j]!=0))    //We found a new blob
    			{
    				ndx++;
					ndx = MIN(ndx, 2048);
					blobs[ndx].index=ndx;
					blobs[ndx].size = fillBlobLong(i, j, ndx, &j, dim, step, cstep, bip, tmp, st);
    			}
	    	
    		}
    		in += step;
    		cTemp += cstep;
		}
	}

	if (x->charmode == 0) //Using long output
	{
		if (thresh > 0) //Threshold is greater than 0
		{
			switch(x->mode)
			{
			case 1:	//Label each blob with its mass
				out_l = (long*)bop;  //Convert data pointer
		    
   		 		for (i=0;i<height;i++)
    			{	
    				for (j=0;j<width;j++)
    				{
    					temp = out_l[j];
						if (blobs[temp].size > thresh)
							out_l[j] = blobs[temp].size;
    					else
    						out_l[j] = 0;
    				}
    				//(char *)out_l += outstep;
					out_l = (long *)((char *)out_l + outstep);
    			}
				break;

			case 0:
				count = 1;	
	    	
    			for(i=1;i<=ndx;i++)	//Scan through equiv array
    			{
    				//if(size[i]>thresh) //Size of the blob is greater than threshold
					if (blobs[i].size > thresh)
    				{
						blobs[i].index = count; 
    					count++;
    				}
    				else
    				{
    					blobs[i].index = 0;
    				}

    			}
	    		
				blobs[0].index = 0;
    			out_l = (long*)bop;
	    
   		 		for (i=0;i<height;i++)
    			{	
    				for (j=0;j<width;j++)
    				{
    					temp = out_l[j];
    					//out_l[j] = equiv[temp];
						out_l[j] = blobs[temp].index;
    				}
    				//(char *)out_l += outstep;
					out_l = (long *)((char *)out_l + outstep);
    			}
				break;
			}

		}

		else
		{
			if(x->mode == 1) //Label with mass
    		{
    			out_l = (long*)bop;
	    
   		 		for (i=0;i<height;i++)
    			{	
    				for (j=0;j<width;j++)
    				{
    					temp = out_l[j];
    					//out_l[j] = size[temp];
						out_l[j] = blobs[temp].size;
    				}
					//(char *)out_l += outstep;
					out_l = (long *)((char *)out_l + outstep);
    			}
    		}
		}
	}
	else if (x->charmode == 1) //Using char output
	{
		if (thresh > 0)
		{
			switch(x->mode)
			{
			case 1:	//Label each blob with its size rank
				
				out_l = (long*)tmp;  //Convert data pointer
				out = bop;
				
				if(ndx == 1)
				{
					equiv[0] = 0;
					equiv[1] = 1;
				}
				else
				{

					qsort(blobs+1,ndx,sizeof(Blob),compare);
					
					count = 1;	

					if(ndx<256)
					{
						for(i=1;i<=ndx;i++)
						{
							if(blobs[i].size > thresh)
							{
								equiv[blobs[i].index]= ndx-i+1;
							}
							else
							{
								equiv[blobs[i].index]= 0;
							}
						}
						equiv[0]=0;
					}
					else
					{
						for(i=1;i<=ndx;i++)
						{
							if(blobs[i].size > thresh)
							{
								equiv[blobs[i].index] = (ndx-i) > 255 ? 0 : (ndx-i+1);
							}
							else
							{
								equiv[blobs[i].index]= 0;
							}
						}
						equiv[0]=0;
					}
				}
				for (i=0;i<height;i++)
    			{	
    				for (j=0;j<width;j++)
    				{
						out[j] = equiv[out_l[j]];
    				}
    				//(char *)out_l += cstep;
					out_l = (long *)((char *)out_l + cstep);
					out += outstep;
    			}
				
   		 		
				break;

			case 0: //Return only 255 largest blobs
				count = 1;	

				for(i=1;i<=ndx;i++)	//Scan through equiv array
    			{
					if (blobs[i].size > thresh)
    				{
						blobs[i].index = count;
    					count++;
    				}
    				else
    				{
						blobs[i].index = 0;
    				}
    			}

	    		if (ndx < 256) //no need to sort
				{
					out_l = (long *)tmp;  //Convert data pointer
					out = bop;
			    
   		 			for (i=0;i<height;i++)
    				{	
    					for (j=0;j<width;j++)
    					{
    						out[j] = blobs[out_l[j]].index;
    					}
    					//(char *)out_l += cstep;
						out_l = (long *)((char *)out_l + cstep);
						out += outstep;
    				}
				}
				else  //We'll have to sort this out.
				{
					out_l = (long *)tmp;  //Convert data pointer
					out = bop;
			    
   		 			for (i=0;i<height;i++)
    				{	
    					for (j=0;j<width;j++)
    					{
							if (blobs[out_l[j]].index > 255)
								out[j] = 0;
							else
    							out[j] = blobs[out_l[j]].index;
    					}
    					//(char *)out_l += cstep;
						out_l = (long *)((char *)out_l + cstep);
						out += outstep;
    				}
					
				}
				break;
			}
		}
			
		else //threshold == 0
		{
			if(x->mode == 1) //Label with size index
    		{
    			out_l = (long*)tmp;  //Convert data pointer
				out = bop;

				if(ndx == 1)
				{
					equiv[0] = 0;
					equiv[1] = 1;
				}
				else
				{
					qsort(blobs+1,ndx,sizeof(Blob),compare);
					
					if(ndx<256)
					{
						for(i=1;i<=ndx;i++)
						{
							equiv[blobs[i].index]= ndx-i+1;
						}
						equiv[0]=0;
					}
					else
					{
						for(i=1;i<ndx;i++)
						{
							equiv[blobs[i].index] = (ndx-i) > 255 ? 0 : (ndx-i+1);
						}
						equiv[0]=0;
					}
				}
				for (i=0;i<height;i++)
    			{	
    				for (j=0;j<width;j++)
    				{
						out[j] = equiv[out_l[j]];
    				}
    				//(char *)out_l += cstep;
					out_l = (long *)((char *)out_l + cstep);
					out += outstep;
    			}
    		}
			else  //Label with index
			{
				if (ndx < 256) //no need to sort
				{
					out_l = (long *)tmp;  //Convert data pointer
					out = bop;
				
   		 			for (i=0;i<height;i++)
    				{	
    					for (j=0;j<width;j++)
    					{
    						out[j] = out_l[j];
    					}
    					//(char *)out_l += cstep;
						out_l = (long *)((char *)out_l + cstep);
						out += outstep;
    				}
				}
				else
				{
					out_l = (long *)tmp;  //Convert data pointer
					out = bop;
				
   		 			for (i=0;i<height;i++)
    				{	
    					for (j=0;j<width;j++)
    					{
							if (blobs[out_l[j]].index > 255)
								out[j] = 0;
							else
    							out[j] = blobs[out_l[j]].index;
    					}
    					//(char *)out_l += cstep;
						out_l = (long *)((char *)out_l + cstep);
						out += outstep;
    				}
					
				}
			}

		}
	}
}


long fillBlobLong(long row, long coll, long val, long *X, long *dim, long instep, long outstep, char *bip, char *bop, char *st)
{
	char	*Temp_in; 				//Pointers to matrix data 
	long	*Temp_out;	
    int 	seedx,seedy;						//The starting points for the algorithm
    int 	width,height;						//Width and height, in elements, of the matrices
    int 	StIn = 0;							//The number of new segments, used for "while" loop control
    int 	i, j;								//For itteration 
    int 	YC, L, R, PL, PR, flag;				//Arguments to PUSH and POP macros
    //int 	LB, RB;								//Left and right bounds (used in algorithm)
    int		MaxIt;
    Seg		*stack;
    long    size = 0;
	
	stack = (Seg*)st;
	
	width  = dim[0];
	height = dim[1];
	MaxIt = width * height >> 2;
	
	seedx = coll;
	seedy = row;
	
   	L = seedx;
   	R = seedx;
   	YC = seedy;
		
	Temp_in = bip + (instep*seedy);	//Temp_in pointer points to the first element of the starting row.
    //(char *)Temp_out = bop + (outstep*seedy);	//Same goes for Temp_out.
	Temp_out = (long *)(bop + (outstep*seedy));	//Same goes for Temp_out.
    	
    if (Temp_in[seedx]==0)			//If the starting pixel is OFF, do not do anything.
    	return 0;
		
	Temp_out[seedx] = val;		//Since the starting pixel is ON, set output value accordingly
	size++;
		
	//Check right of the starting point
	while((R < width - 1) && (Temp_in[R + 1] != 0)) //While input pixel is ON, and we're not at the end of the row...
    {
       	Temp_out[++R] = val;						//Set output value ON 
       	size++;
   	}
   	
   	*X = R;
   			
   	//Now, check to the left of the starting point
   	while(L && (Temp_in[L - 1] != 0))				//While input pixel is ON, and we're not at the start of the row...
    {
        Temp_out[--L] = val;						//Set output value ON
        size++;
    }
    		
    flag = (YC != height - 1) ? UP : DOWN;			//If the starting row is not the bottom row, go UP, else, go DOWN.
    		
    //Add one segment to the stack
    PUSH(YC, L, R, R + 1, R, flag); 	
    		
    		
    		
    //*******************************Big while loop******************************** 
    		  		
    while(StIn &&(StIn<MaxIt))		//While there are still items in the stack... 
    {
    	//Remove one segment to the stack, and retrieve its data
       	POP(YC, L, R, PL, PR, flag);	
       									
       	//if( ((unsigned) (YC - flag)) < height )	//If we're not already at the bottom...
		if(((YC - flag) < height)&&((YC - flag) >= 0))
       	{
          	Temp_in = bip + (YC - flag) * instep;		//Set the Temp_in pointer to the start of the next row
         		 											//(Direction opposite to where we are going (UP or DOWN?))
          	//(char *)Temp_out = bop + (YC - flag) * outstep; 	//And Temp_out accordingly
			Temp_out = (long *)(bop + (YC - flag) * outstep); 
          	
     		for(i = L; i < R + 1; i++)	//Start at the left edge and go to the right edge
           	{
         		if( Temp_in[i] != 0 && Temp_out[i] == 0 )	//If the pixel is ON, we've found a new segment!
                {
                   	j = i;
                    Temp_out[i] = val;	//Mark output pixel as ON
                    size++;
                    while(j && (Temp_in[j - 1] != 0))  //While we're not at the left edge of the row, and the pixel to the left in ON
                    {
                    	Temp_out[--j] = val;	//Mark that leftward neighbour ON, and take a step left
                    	size++;
                    }
                    //We're done looking left...
                    while((i < width - 1) && (Temp_in[i + 1] != 0)) //So, while we're not at the right edge and the pixel tothe right is ON
                    {
                    		Temp_out[++i] = val;	//Mark that neighbouring pixel ON, and move right
                    		size++;
                    }
                    //Since we have an extra pixel...
                    PUSH(YC - flag, j, i++, L, R, flag);  	
                }
            }
        }
        		
        Temp_in = bip + (YC + flag) * instep;		//Set the Temp_in pointer to the start of the next row
           		 										//(Below, if direction is UP, upward if it's DOWN)
        //(char *)Temp_out = bop + (YC + flag) * outstep;	//And Temp_out accordingly
		Temp_out = (long *)(bop + (YC + flag) * outstep);
        		
        for(i = L; i < PL; i++)		//Start at the left edge until the previous left edge (do nothing if prev. edge was right of the current edge)
        {
        	if(Temp_in[i] != 0 && Temp_out[i] == 0)	//If pixel is ON, we have another segment...
        	{
        		j = i;
        		Temp_out[i] = val; //Mark output pixel as ON
        		size++;
        		while(j && (Temp_in[j - 1] != 0)) //While we're not at the left edge of the row, and the pixel to the left in ON
        		{
        			Temp_out[--j] = val; //Mark that leftward neighbour ON, and take a step left
        			size++;
        		}
        		//We're done looking left...
        		while( (i < width - 1) && (Temp_in[i + 1] != 0) ) //So, while we're not at the right edge and the pixel tothe right is ON
        		{
        			Temp_out[++i] = val; //Mark that neighbouring pixel ON, and move right
        			size++;
        		}
        		PUSH( YC + flag, j, i++, L, R, -flag );		
        	}
        }
        		
        for(i = PR + 1; i < R + 1; i++) //Start at the previous right edge and move to current right edge. (Does nothing if current edge is right of previous.)
        {
        	if(Temp_in[i] != 0 && Temp_out[i] == 0) //If pixel is ON, we have another segment...
        	{
        		j = i;
        		Temp_out[i] = val; //Mark output pixel as ON
        		size++;
        		//Do as we did before...
        		while(j && (Temp_in[j - 1] != 0))
        		{
        			Temp_out[--j] = val;
        			size++;
        		}
        		while((i < width - 1) && (Temp_in[i + 1] != 0))
        		{
        			Temp_out[++i] = val;
        			size++;
        		}
        		PUSH( YC + flag, j, i++, L, R, -flag );
        	}
        }
    }
   					
	return size;	
	
}

t_cv_jit_label *cv_jit_label_new(void)
{
	t_cv_jit_label *x;
	void *m;
	t_jit_matrix_info info;
		
	if (x=(t_cv_jit_label *)jit_object_alloc(_cv_jit_label_class)) 
	{
			x->threshold = 0;
			x->mode = 0;
			x->charmode = 0;
			
			jit_matrix_info_default(&info);								//Fill info structure with default values
			info.type = _jit_sym_char;
			info.dimcount = 1;
			info.planecount = 1;
			m = jit_object_new(_jit_sym_jit_matrix, &info);				//Create a new matrix
			if(!m) error("could not allocate internal matrix!");
			jit_object_method(m,_jit_sym_clear);						//Clear data
			x->buf = m;												//Copy matrix pointer to jitter object

			jit_matrix_info_default(&info);								//Fill info structure with default values
			info.type = _jit_sym_long;
			info.dimcount = 2;
			info.planecount = 1;
			m = jit_object_new(_jit_sym_jit_matrix, &info);				//Create a new matrix
			if(!m) error("could not allocate internal matrix!");
			jit_object_method(m,_jit_sym_clear);						//Clear data
			x->ctemp = m;												//Copy matrix pointer to jitter object		
	} else 
	{
		x = NULL;
	}	
	return x;
}

void cv_jit_label_free(t_cv_jit_label *x)
{
	jit_object_free(x->buf); //Free matrix memory
	jit_object_free(x->ctemp);
}



int compare (const void * a, const void * b)
{
	//For use with qsort
	//<0	*elem1 goes before *elem2	
	//0		*elem1 == *elem2	
	//>0	*elem1 goes after *elem2

	Blob *A,*B;

	A = (Blob *)a;
	B = (Blob *)b;
	return A->size - B->size;
  //return ( *(int*)a - *(int*)b );
}

