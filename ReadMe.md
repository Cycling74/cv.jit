# About cv.jit Development

## Compiling cv.jit

After cloning the Git repository, you will need to cd into the directory and update submodules to get the Max SDK. For example:

    cd cv.jit
    git submodule update --init

You will find Visual Studio and Xcode projects in the "source/projects/Windows" and "source/projects/OSX" folders, respectively.

You should be able to build all externals at once using the "build solution" option in Visual Studio or by picking "build-all" as the target in Xcode.

The compiled externals should be found in the "externals" directory.

## About OpenCV

Some of the cv.jit externals depend on the OpenCV library. <http://sourceforge.net/projects/opencvlibrary/>

The necessary headers, as well as libraries for compiling cv.jit are provided. You can find them in the "source/OpenCVsupport" and "source/lib" folders.

cv.jit externals link statically to OpenCV. This decision was made because I wanted cv.jit externals to have no dependencies, at the cost of having bloated files. For this reason, those who wish to compile their own OpenCV libraries must be careful to compile them as .a (under OSX) and .lib (under Windows) static libraries.

There is a conflict between the Max and OpenCV includes as both contain definitions of the uchar type. The easiest way to solve this problem is to simply comment out the OpenCV typedef.

Under Windows, when OpenCV encounters an error it reports via a message box. This causes no problem but under the OSX implementation, the error message is printed to stderr, which does not show up in Max. Since this is followed by an exit command, the result is that Max will suddenly and silently quit when something goes wrong with OpenCV. This makes debugging particularly difficult. For this reason, I have changed the implementation of the error reporting functions. If you wish to build your own OpenCV libraries under OSX, use the file "source/OpenCVsupport/jitcxerror.cpp" instead of the standard "cxerror". OpenCV errors will now be reported to the Max window. However, this is only meant for debugging! If OpenCV complains, it is because there is something wrong with the program. Be sure to properly check your data before calling any OpenCV function. Again, there should never be any OpenCV error in a release external. 
