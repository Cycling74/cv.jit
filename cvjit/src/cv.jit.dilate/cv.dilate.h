/*
cv.jit.dilate.h
	

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


#if defined(__MACH__) && defined(__APPLE__)
#include <Accelerate/Accelerate.h>
#define Image vImage_Buffer
#else
typedef struct{
	unsigned char *data;
	int width;
	int height;
	int stride;
	int type;
	int channels;
}Image;
#endif


#include "cvjit.h"

#define CVJIT_MODE_BIN 0
#define CVJIT_MODE_GREY 1

class Dilate
{
private:
	int _mode;
	Image _input;
	Image _output;
	int _inType;
	int _outType;
	int _inPlanes;
	int _outPlanes;
	
	char *_buffer;
	long _bufferBytes;
	
	static const unsigned char _kernel8U [9];
	static const float _kernel32F [9];
public:
	Dilate();
	~Dilate();
	void setInput(void *data, int width, int height, int planes, int stride, int type);
	void setOutput(void *data, int width, int height, int planes, int stride, int type);
	void setMode(int mode){_mode = mode;};
	void dilate();
};