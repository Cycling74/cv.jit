# About cv.jit Development

## Installing OpenCV

Some of the cv.jit externals depend on the OpenCV library. <https://opencv.org/>

As of writing this text, the latest version of OpenCV is 4.1.0. However, some externals in cv.jit are very old and require functionality that has since then been removed from OpenCV. Although it is preferable to use the new C++ API, externals such as cv.jit.HSFlow must use the C API. Hence, you will need to install both OpenCV 4 and OpenCV 2.

### macOS

The easiest way to install OpenCV on macOS is with [Homebrew](https://brew.sh). Unfortunately, we can't use this distribution for cv.jit: opencv@2 doesn't provide the needed static libraries and opencv@4 is built with TBB support, which we don't want. Nevertheless, installing opencv through Homebrew is an easy way of getting all the needed dependencies.

```
brew install opencv@4
```

Here we will install opencv2 and opencv4 separately. It is also possible to use a single install and use Git to switch between branches.

First, grab the sources from Github:

```
git clone -b 2.4 https://github.com/opencv/opencv.git opencv2
```

Now, create a "build" directory for Cmake:

```
cd opencv2
mkdir build
cd build
```

We then use ccmake to configure:

```
ccmake ../
```

First, press the C key to configure. A list of variables should be displayed. We now need to change one very important setting. Make sure advanced mode is toggled **ON** by pressing the T key. Then look for the **BUILD_SHARED_LIBS** variable and change it to **OFF**. Make sure that **WITH_TBB** is **OFF**. Also, you may want to set **WITH_FFMEG** to **OFF** as we don't need it and it may cause problems during build.

You should also change the install location by setting the **CMAKE_INSTALL_PREFIX** variable. You can install anywhere but "/usr/local/opencv2" should be fine.

Once this is done, press the C key again, until the option to generate appears (G key).

We're now ready to build:

```
make
```

The we install:

```
sudo make install
```

The necessary libraries should now be in the "/usr/local/opencv2/lib" directory, or elsewhere if you used a different **CMAKE_INSTALL_PREFIX**.

Before we install OpenCV 4, we must download the opencv_contrib module, which is distributed separately.

```
git clone https://github.com/opencv/opencv_contrib.git
```

Now, we repeat the process for OpenCV 4. 

```
git clone -b master https://github.com/opencv/opencv.git opencv4
cd opencv4
mkdir build
cd build
ccmake ../
```

As above, make sure that **BUILD_SHARED_LIBS** and **WITH_TBB** are **OFF**. Also, set **WITH_ITT** to **OFF**. If you do not have the IPP libraries, set **WITH_IPP** to **OFF**. Set **CMAKE_INSTALL_PREFIX** to "/usr/local/opencv4" or wherever you wish to install. You must also tell CMake where you installed the opencv_contrib module with the **OPENCV_EXTRA_MODULES_PATH** variable. (For example: "/Users/me/Documents/dev/opencv_contrib/modules").

While in ccmake, look for variables with names that start with **BUILD_opencv_cuda**, like **BUILD_opencv_cudaarithm** and turn them all **OFF**.

Run configure again, and after generating projects, build and install:

```
make
sudo make install
```

You should now have all the necessary OpenCV libraries to compile cv.jit.


### Windows

On Windows, we also need to compile our own versions of OpenCV. For OpenCV 2, we shouldn't need to install any dependencies. 

In your favourite shell, run the following commands:

```
git clone -b 2.4 https://github.com/opencv/opencv.git opencv2
mkdir opencv2/build
```

Launch the CMake GUI app, and set the source code directory to where you installed OpenCV 2, and the build directory to the directory we just made in the line above.

We then run configure for the first time. In the generator option, chose the latest version of Visual Studio installed on your machine.

You must then **explicitely set the platform to "x64"**. Lastly, in the optional toolset field, enter "host=x64". You can then press "Finish".

In the list of variables that are shown, you should **uncheck** the following options:

- **BUILD_SHARED_LIBS**
- **WITH_CUDA**
- **WITH_TBB**

Change or make a note of the **CMAKE_INSTALL_PREFIX** variable; this is where OpenCV will be installed. Run configure again and generate the project.

Open the project in Visual Studio, set the configuration to Release and build the ALL_BUILD target. Once the build is complete build the INSTALL target.

We then repeat more or less the same process for OpenCV 4, with a few differences.

First clone and make a build directory:

```
git clone -b master https://github.com/opencv/opencv.git openc4
mkdir opencv4/build
```

In CMake GUI, update the source and build directory and run configure. Be careful to use the same settings as for OpenCV 2.

**Uncheck** the following options:

- **BUILD_SHARED_LIBS**
- **WITH_CUDA**
- **WITH_TBB**

Set **OPENCV_EXTRA_MODULES_PATH** to the location of the "modules" directory inside the opencv_contrib directory. Here also, change or make a note of the **CMAKE_INSTALL_PREFIX** variable.

Run configure again until there are no more variables highlighted in red, and the press generate. Open the project in Visual Studio. Set the configuration to Release, and build the ALL_BUILD target, followed by the INSTALL target.


## Compiling cv.jit

cv.jit now uses CMake to generate appropriate projects on macOS and Windows. 

Download cv.jit source:

```
git clone git@github.com:jmpelletier/cv.jit.git
```

Run CMake, making sure generate an Xcode project instead of makefiles:

```
cd cv.jit
mkdir build
cd build
```

On macOS, use the ccmake utility:

```
ccmake -G Xcode ../
```

On Windows, use the CMake GUI app, and set the source and build directories. On Windows, the first time you run configure, chose the latest version of Visual Studio installed on your machine. You must then **explicitely set the platform to "x64"**. Lastly, in the optional toolset field, enter "host=x64". You can then press "Finish".


After running CMake configuration, you will be able to edit a few variables. The important ones are:

- **COPY_DIR**: Set this to the directory where you wish the external binaries to be copied. For instance, "/Users/me/Documents/Max 8/packages/Max 8/cv.jit/externals" on macOS or "C:\Users\me\Documents\Max 8\packages\cv.jit\externals".
- **OPENCV2_INSTALL_DIR**: Where you installed OpenCV 2. This is the same path you gave for **CMAKE_INSTALL_PREFIX** when building OpenCV.
- **OPENCV4_INSTALL_DIR**: Same, but for OpenCV 4.

Run configure once again, and then generate.

Once you open the project in Xcode or Visual Studio, select the ALL_BUILD target to build all externals, or just select individual targets.


# cv.jit change log

## Version 2.0.2
* cv.jit.findcontours
* fix cv.jit.learn write message

## Version 2.0
2021-03-07
* Several bug fixes
* help file and launcher patch updates

## Version 1.9
2020-03-19

### New Externals
- cv.jit.blur 
- cv.jit.face.landmarks 
- cv.jit.kalman 
- cv.jit.keypoints 
- cv.jit.keypoints.match 
- cv.jit.noise 
- cv.jit.unproject 

### New Abstractions
- cv.jit.face.landmarks.draw
- cv.jit.face.parts
- cv.jit.face.rigidpoints
- cv.jit.iter
- cv.jit.keypoints.draw
- cv.jit.lowpass
- cv.jit.notempty

### New Helpfiles to old Abstractions
- cv.jit.opticalflow (Old helpfile was somehow missing from distribution...)
- cv.jit.touches (Very useful abstraction was somehow undocumented...) 

### Changes to Existing Externals
- cv.jit.faces, cv.jit.faces.draw: Now support "normalize" attribute for normalized coordinates.
- cv.jit.opticalflow: Fixed crash when using block matching

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


