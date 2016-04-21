# About cv.jit Development

## Compiling cv.jit

You will find Visual Studio and Xcode projects in the "source/projects/Windows" and "source/projects/OSX" folders, respectively.

You should be able to build all externals at once using the "build solution" option in Visual Studio or by picking "build-all" as the target in Xcode.

The compiled externals should be found in the "externals" directory.

## About OpenCV

Some of the cv.jit externals depend on the OpenCV library. <http://sourceforge.net/projects/opencvlibrary/>

The necessary headers, as well as libraries for compiling cv.jit are provided. You can find them in the "source/OpenCVsupport" and "source/lib" folders.

cv.jit externals link statically to OpenCV. This decision was made because I wanted cv.jit externals to have no dependencies, at the cost of having bloated files. For this reason, those who wish to compile their own OpenCV libraries must be careful to compile them as .a (under OSX) and .lib (under Windows) static libraries.

There is a conflict between the Max and OpenCV includes as both contain definitions of the uchar type. The easiest way to solve this problem is to simply comment out the OpenCV typedef.

Under Windows, when OpenCV encounters an error it reports via a message box. This causes no problem but under the OSX implementation, the error message is printed to stderr, which does not show up in Max. Since this is followed by an exit command, the result is that Max will suddenly and silently quit when something goes wrong with OpenCV. This makes debugging particularly difficult. For this reason, I have changed the implementation of the error reporting functions. If you wish to build your own OpenCV libraries under OSX, use the file "source/OpenCVsupport/jitcxerror.cpp" instead of the standard "cxerror". OpenCV errors will now be reported to the Max window. However, this is only meant for debugging! If OpenCV complains, it is because there is something wrong with the program. Be sure to properly check your data before calling any OpenCV function. Again, there should never be any OpenCV error in a release external. 

## Compiling libcv

These instructions based on downloading version 2.4.12 from http://opencv.org/downloads.html

* `mkdir build64`
* `cd build64`
* `mkdir install`
* `cmake -DCMAKE_OSX_DEPLOYMENT_TARGET=10.7 -DCMAKE_OSX_SYSROOT=/Applications/Developer/MacOSX10.7.sdk -DCMAKE_OSX_ARCHITECTURES=x86_64 -DBUILD_SHARED_LIBS=NO -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=install -DWITH_FFMPEG=OFF -DWITH_OPENCL=OFF -DWITH_OPENNI=OFF -DCMAKE_CXX_FLAGS="-std=c++11 -stdlib=libc++ -Wno-narrowing" ..`
* `make -j8`
* `make install`
* `libtool -static install/lib/libopencv_*.a -o install/lib/libcv.a`
* `cd ..`

* `mkdir build32`
* `cd build32`
* `mkdir install`
* `cmake -DCMAKE_OSX_DEPLOYMENT_TARGET=10.7 -DCMAKE_OSX_SYSROOT=/Applications/Developer/MacOSX10.7.sdk -DCMAKE_OSX_ARCHITECTURES=i386 -DCMAKE_C_FLAGS=-m32 -DCMAKE_CXX_FLAGS=-m32 -DCMAKE_SHARED_LINKER_FLAGS=-m32 -DCMAKE_CXX_COMPILER_ARG1=-m32 -DCMAKE_C_COMPILER_ARG1=-m32 -DBUILD_SHARED_LIBS=NO -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=install -DWITH_FFMPEG=OFF -DWITH_OPENCL=OFF -DWITH_OPENNI=OFF -DCMAKE_CXX_FLAGS="-std=c++11 -stdlib=libc++ -Wno-narrowing" ..`
* `make -j8`
* `make install`
* `libtool -static install/lib/libopencv_*.a -o install/lib/libcv.a`
* `cd ..`

* `mkdir build`
* `cd build`
* `lipo -create ../build32/install/lib/libcv.a ../build64/install/lib/libcv.a -o libcv.a`


# cv.jit change log

## Version 1.8

* Support for 64-bit architectures
* Distributed as a Max package

## Version 1.7

cv.jit.blobs.moments: Fixed a problem where the order of the Hu invariants did not match that of those outputted by cv.jit.moments.

cv.jit.centroids: Outputs coordinates of (-1,-1) when the image is empty instead of NaN.


## Version 1.6
2008-02-27

CHANGES TO OLD OBJECTS

All externals are now compiled as universal binaries under Mac OS. This means that there is no need to use separate versions for PPC and Intel machines.

	cv.jit.centroids: rewritten so that it can be used in js. Also, the external now supports any data type.
	cv.jit.dilate/ cv.jit.erode: Under Mac OS, these externals now use Core Image functionality which can in the best of cases improve performance by an order of magnitude. 
	cv.jit.faces: Added an attribute called “nfaces” that returns the number of detected faces. This can be useful for detecting when there are no faces in the image, as the external returns a dummy matrix in this case.
	cv.jit.features: Added a new attribute called “precision”, which when set to 1 tells the external to calculate features with sub-pixel accuracy.
	cv.jit.track: The maximum number of points that can be tracked at once used to be set to 255 but can now be arbitrarily large. Note however that very large number of tracking points will result in very slow performance.
	cv.jit.label: Fixed a bug that caused "mode 1" operation to not label correctly when "charmode" was set to 1.

NEW EXTERNALS
	cv.jit.resize: This external uses bi-cubic interpolation to resize an imcomming matrix. This yields a higher-quality image than using jit.matrix with a lower resolution.
	cv.jit.shift: Implements the MeanShift and CAMShift algorithms for tracking greyscale and binary blobs.
	cv.jit.shift.draw: Drawing utility for cv.jit.shift.

## Version 1.5
2006-10-03


CHANGES TO OLD OBJECTS

	cv.jit.moments: output now accessible from js.
	cv.jit.mean: now accurately computes mean even for char data, no need to convert to float before processing.
	cv.jit.track: output now only has 1-dimension, instead of having a dummy second dimension of 1.
	cv.jit.orientation: changed algorithm, now correctly outputs only values between 0. and pi..
	cv.jit.elongation: changed algorithm, gives better results.
	cv.jit.open, cv.jit.close: now properly filter out "done" message from patcherargs.

	The pdf manual is no longer updated, but every external and abstraction now has its own help file.


NEW EXTERNALS

	cv.jit.blobs.* : this series of externals performs a number of analysis function on individual blobs (connected components) labeld by cv.jit.label.

	cv.jit.blobs.bounds: finds bounding box for each blob.
	cv.jit.blobs.centroids: finds centroids and mass for each blob.
	cv.jit.blobs.direction: estimates the direction each blob points to.
	cv.jit.blobs.elongation: measures each blob's elongation (thinness).
	cv.jit.blobs.moments: calculate moments of inertia, Hu invariants, centroids and mass for each blob.
	cv.jit.blobs.orientation: finds the main axis for each blob.
	cv.jit.blobs.recon: estimates the statistical distance between each blob and a trained model.
	cv.jit.blobs.sort: assigns blobs labels that do not easily change from frame to frame.

	cv.jit.canny: extract edges.
	cv.jit.faces: finds human faces. (Not available for pre-Jitter 1.6 version on Mac.)
	cv.jit.features: finds high-contrast, easy-to-track areas.
	cv.jit.hough: computes Hough space from edges.
	cv.jit.learn: perform pattern recognition.
	cv.jit.lines: find straight lines.
	cv.jit.ravg: compute the running average over time. (Essentially duplicates jit.slide but gives more accurate output with char input.)


NEW ABSTRACTIONS

	The .draw series: several abstractions are provided for simply overlaying data on an input image.

	cv.jit.blobs.bounds.draw
	cv.jit.blobs.centroids.draw
	cv.jit.blobs.direction.draw
	cv.jit.blobs.elongation.draw
	cv.jit.blobs.orient.draw (For use with cv.jit.blobs.orientation.)
	cv.jit.centroids.draw
	cv.jit.faces.draw
	cv.jit.features.draw
	cv.jit.lines.draw
	cv.jit.track.draw (Replaces cv.jit.trackpoint.)
	
	cv.jit.blobs.color/cv.jit.blobs.colour: assign random colours to cv.jit.label's output (previously only a sub-patcher).
	cv.jit.direction: finds the direction the image leans/points to.
	cv.jit.features2track: initialize cv.jit.track to pixels for likely to "stick".
	cv.jit.hough2lines: extract lines from Hough space computed by cv.jit.hough.


