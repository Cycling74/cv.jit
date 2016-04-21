# cv.jit copyright notice

All externals, abstractions and help files by Jean-Marc Pelletier <jmp@iamas.ac.jp> 2003-2008 except:

* `cv.jit.hough` by Christopher P. Baker <bakercp@umn.edu> and Mateusz Herczka 2004
* `cv.jit.extrema` by Christopher P. Baker and Mateusz Herczka 2004, with modifications by Jean-Marc Pelletier 2006
* `cv.jit.hough2lines` by Christopher P. Baker, Mateusz Herczka and Jean-Marc Pelletier 2006

Haar cascades used by `cv.jit.faces`, originally distributed with OpenCV, created by Rainer Lienhart.



## Terms

cv.jit is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

cv.jit is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with cv.jit.  If not, see <http://www.gnu.org/licenses/>.


Practically, the terms of the LGPL allow you to use cv.jit externals within Max patches, stand-alones and plug-ins without having to release them also under the LGPL.

## OpenCV

Some of the externals depend on the OpenCV library. The OpenCV license stipulates that any distribution of OpenCV, in source or binary form must contain the license below. This means that if you wish to distribute a patch, stand-alone or plug-in that uses any of the following externals, you must also provide a copy of the OpenCV license.

cv.jit externals that use the OpenCV library:

* cv.jit.blobs.recon
* cv.jit.canny
* cv.jit.faces
* cv.jit.features
* cv.jit.Hsflow
* cv.jit.learn
* cv.jit.lines
* cv.jit.Lkflow
* cv.jit.resize
* cv.jit.shift
* cv.jit.snake
* cv.jit.track

The text of the OpenCV license:

IMPORTANT: READ BEFORE DOWNLOADING, COPYING, INSTALLING OR USING.

By downloading, copying, installing or using the software you agree to this license.
If you do not agree to this license, do not download, install,
copy or use the software.


                        Intel License Agreement
                For Open Source Computer Vision Library

Copyright (C) 2000, Intel Corporation, all rights reserved.
Third party copyrights are property of their respective owners.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

   * Redistribution's of source code must retain the above copyright notice,
     this list of conditions and the following disclaimer.

   * Redistribution's in binary form must reproduce the above copyright notice,
     this list of conditions and the following disclaimer in the documentation
     and/or other materials provided with the distribution.

   * The name of Intel Corporation may not be used to endorse or promote products
     derived from this software without specific prior written permission.

This software is provided by the copyright holders and contributors "as is" and
any express or implied warranties, including, but not limited to, the implied
warranties of merchantability and fitness for a particular purpose are disclaimed.
In no event shall the Intel Corporation or contributors be liable for any direct,
indirect, incidental, special, exemplary, or consequential damages
(including, but not limited to, procurement of substitute goods or services;
loss of use, data, or profits; or business interruption) however caused
and on any theory of liability, whether in contract, strict liability,
or tort (including negligence or otherwise) arising in any way out of
the use of this software, even if advised of the possibility of such damage.