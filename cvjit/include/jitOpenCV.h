/*
jitOpenCV.h
	

Copyright 2008, Jean-Marc Pelletier
jmp@iamas.ac.jp

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



/*This is simply a utility function for converting a Jitter matrix into a CvMat.*/


#include <cv.h>
#include <jit.common.h>

void cvJitter2CvMat(void *jitMat, CvMat *mat);



void cvJitter2CvMat(void *jitMat, CvMat *mat)
{
	t_jit_matrix_info info;
	char *data;
	int type = 0;

	if((!jitMat)||(!mat))
	{
		error("Error converting Jitter matrix: invalid pointer.");
		return;
	}

	jit_object_method(jitMat,_jit_sym_getinfo,&info);

	if(info.dimcount != 2)
	{
		error("Error converting Jitter matrix: invalid dimension count.");
		return;
	}

	if(info.type == _jit_sym_char)
	{
		type = CV_MAKETYPE(CV_8U,info.planecount);
	}
	else if(info.type == _jit_sym_long)
	{
		type = CV_MAKETYPE(CV_32S,info.planecount);
	}
	else if(info.type == _jit_sym_float32)
	{
		type = CV_MAKETYPE(CV_32F,info.planecount);
	}
	else if(info.type == _jit_sym_float64)
	{
		type = CV_MAKETYPE(CV_64F,info.planecount);
	}

	jit_object_method(jitMat,_jit_sym_getdata,&data);

	cvInitMatHeader( mat, info.dim[1], info.dim[0], type, data, info.dimstride[1] );
	
}
