/*
cv.dilate
	

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

/*This is the OSX implementation of the Dilate object.*/


#include "cv.dilate.h"

const unsigned char Dilate::_kernel8U [9] = {255,0,255,0,0,0,255,0,255};
const float Dilate::_kernel32F [9] = {1,0,1,0,0,0,1,0,1};

Dilate::Dilate()
{
	_input.data = NULL;
	_input.width = 0;
	_input.rowBytes = 0;
	_inType = 0;
	_inPlanes = 0;
	
	_output.data = NULL;
	_output.width = 0;
	_output.rowBytes = 0;
	_outType = 0;
	_outPlanes = 0;
	
	_buffer = 0;
	_bufferBytes = 0;
}

Dilate::~Dilate()
{
	if(_buffer) delete []_buffer;
}

void Dilate::setInput(void *data, int width, int height, int planes, int stride, int type)
{
	_input.data = data;
	_input.width = width;
	_input.height = height;
	_input.rowBytes = stride;
	_inPlanes = planes;
	_inType = type;
}

void Dilate::setOutput(void *data, int width, int height, int planes, int stride, int type)
{
	_output.data = data;
	_output.width = width;
	_output.height = height;
	_output.rowBytes = stride;
	_outPlanes = planes;
	_outType = type;
}

void Dilate::dilate()
{
	long bytes = 0;
	vImage_Error err = 0;
	
	//Check pointers
	if(!_input.data)
	{
		CV_REPORT_ERROR("cv.jit.dilate: Invalid input data.");
		return;
	}
	if(!_output.data)
	{
		CV_REPORT_ERROR("cv.jit.dilate: Invalid output data.");
		return;
	}
	//Check data type
	if(_inType != _outType)
	{
		CV_REPORT_ERROR("cv.jit.dilate: Input and output types mismatched.");
		return;
	}
	if((_inType != CVJIT_TYPE_8U)&&(_inType != CVJIT_TYPE_32F))
	{
		CV_REPORT_ERROR("cv.jit.dilate: Invalid type: only 8-bit integer and 32-bit float are supported.");
		return;
	}
	//Check dimensions
	if((_input.width != _output.width)||(_input.height != _output.height))
	{
		CV_REPORT_ERROR("cv.jit.dilate: Input and output dimensions mismatched.");
		return;
	}
	if((_input.width < 1)||(_input.height < 1))
	{
		CV_REPORT_ERROR("cv.jit.dilate: One dimension is less than 1 pixel.");
		return;
	}
	//Check planes
	if(_inPlanes != _outPlanes)
	{
		CV_REPORT_ERROR("cv.jit.dilate: Input and output planes mismatched.");
		return;
	}
	if((_inPlanes != 1)&&(_inPlanes != 4))
	{
		CV_REPORT_ERROR("cv.jit.dilate: Invalid planecount: only greyscale and ARGB data are supported.");
		return;
	}
	
	//Process
	if(_inPlanes == 4)
	{
		if(_inType == CVJIT_TYPE_8U)
		{
			if(_mode < 1)
			{
				bytes = vImageMax_ARGB8888(&_input, &_output, _buffer, 0, 0, 3, 3, kvImageGetTempBufferSize);
				if(bytes != _bufferBytes)
				{
					if(_buffer) delete []_buffer; _buffer = 0;
					_buffer = new char [bytes];
					_bufferBytes = bytes;
					
				}
				err = vImageMax_ARGB8888(&_input, &_output, _buffer, 0, 0, 3, 3, kvImageLeaveAlphaUnchanged);
			}
			else
			{
				err = vImageDilate_ARGB8888 (&_input, &_output, 0, 0, _kernel8U, 3, 3, kvImageLeaveAlphaUnchanged);
			}

		}
		else
		{
			if(_mode < 1)
			{
				bytes = vImageMax_ARGBFFFF(&_input, &_output, _buffer, 0, 0, 3, 3, kvImageGetTempBufferSize);
				if(bytes != _bufferBytes)
				{
					if(_buffer) delete []_buffer; _buffer = 0;
					_buffer = new char [bytes];
					_bufferBytes = bytes;
					
				}	
				err = vImageMax_ARGBFFFF(&_input, &_output, _buffer, 0, 0, 3, 3, kvImageLeaveAlphaUnchanged);
			}
			else
			{
				err = vImageDilate_ARGBFFFF (&_input, &_output, 0, 0, _kernel32F, 3, 3, kvImageLeaveAlphaUnchanged);
			}
		}
	}
	else if(_inPlanes == 1)
	{
		if(_inType == CVJIT_TYPE_8U)
		{
			if(_mode < 1)
			{
				bytes = vImageMax_Planar8(&_input, &_output, _buffer, 0, 0, 3, 3, kvImageGetTempBufferSize);
				if(bytes != _bufferBytes)
				{
					if(_buffer) delete []_buffer; _buffer = 0;
					_buffer = new char [bytes];
					_bufferBytes = bytes;
					
				}
				err = vImageMax_Planar8(&_input, &_output, _buffer, 0, 0, 3, 3, NULL);
			}
			else
			{
				err = vImageDilate_Planar8 (&_input, &_output, 0, 0, _kernel8U, 3, 3, NULL);
			}
		}
		else
		{
			if(_mode < 1)
			{
				bytes = vImageMax_PlanarF(&_input, &_output, _buffer, 0, 0, 3, 3, kvImageGetTempBufferSize);
				if(bytes != _bufferBytes)
				{
					if(_buffer) delete []_buffer; _buffer = 0;
					_buffer = new char [bytes];
					_bufferBytes = bytes;
					
				}
				err = vImageMax_PlanarF(&_input, &_output, _buffer, 0, 0, 3, 3, NULL);
			}
			else
			{
				err = vImageDilate_PlanarF (&_input, &_output, 0, 0, _kernel32F, 3, 3, NULL);
			}
		}
	}
	
	if(err != kvImageNoError)
	{
		CV_REPORT_ERROR("cv.jit.dilate: Error while processing data. Code: %d", err);
	}
}