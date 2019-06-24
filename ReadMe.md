# About cv.jit Development
[![Build Status](https://travis-ci.org/Cycling74/cv.jit.svg?branch=master)](https://travis-ci.org/Cycling74/cv.jit)
[![Build status](https://ci.appveyor.com/api/projects/status/mx8vgrk99v67ys8h?svg=true)](https://ci.appveyor.com/project/tap/cv-jit)

Mac CI Builds are [here](https://s3-us-west-2.amazonaws.com/cycling74-ci/index.html?prefix=cv.jit/).

## Compiling cv.jit

cv.jit now uses CMake to generate appropriate projects on macOS and Windows. After cloning or downloading the source files, create a "build" folder and call CMake from within. Note that by default, CMake generates 32-bit projects and so you must explicitely ask it to generate projects for 64-bit architectures.

On Windows, the following commands will generate a Visual Studio 2017 solution.

```
cd cv.jit;
mkdir build;
cd build;
cmake ../ -G "Visual Studio 15 2017 Win64"
```

You will now have appropriate Visual Studio projects and solution in the build folder.

## About OpenCV

Some of the cv.jit externals depend on the OpenCV library. <https://opencv.org/>

The necessary headers, as well as libraries for compiling cv.jit are provided. You can find them in the "source/include/opencv" and "source/lib/opencv" folders.

As of writing this text, the latest version of OpenCV is 4.1.0, and this version is provided with cv.jit. However, some externals in cv.jit are very old and require functionality that has since then been removed from OpenCV. Although it is far preferable to use the new C++ API, externals such as cv.jit.HSFlow must use the C API. Hence, two versions of OpenCV are provided: a current version and a legacy version that supports the C API. Currently these are versions 4.1.0 and 2.4.12.

If you generated your projects using CMake, you should not need to do anything to use OpenCV in a new external. Just adding the following line to your source is enough:

```
#include <opencv2/opencv.hpp> 
```

Alternatively, you can also link to the following file instead which will also provide you with utility functions to wrap Jitter matrices in OpenCV matrices.

```
#include "jitOpenCV.h"
```

If, for some reason, you need to use the legacy version of OpenCV, you should add the following line at the very top of you project's CMakeLists.txt:

```
set(LEGACY ON)
```

Look at source/projects/cv.jit.HSFlow/CMakeLists.txt for an example.

Instead of a custom build, cv.jit now uses standard binaries provided with OpenCV. <https://sourceforge.net/projects/opencvlibrary/files/>

cv.jit externals link statically to OpenCV. This decision was made because I wanted cv.jit externals to have no dependencies, at the cost of having bloated files. For this reason, those who wish to compile their own OpenCV libraries, or use existing binaries must be careful to compile them as .a (under OSX) and .lib (under Windows) static libraries.

The correct way to add a new version of OpenCV to cv.jit is to create folders named after the version number in the source/lib/opencv and source/include/opencv folders. For header files, just copy the opencv2 folder found inside the build folder of the OpenCV distribution. For libraries, copy the required static library files to a folder named "x64" (source/lib/opencv/\<version>/x64).

You will then need to update the OPENCV_VERSION_CURRENT or OPENCV_VERSION_LEGACY variables in the top CMakeLists.txt files.


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


