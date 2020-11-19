cmake_minimum_required(VERSION 3.0)

string(REGEX REPLACE "(.*)/" "" THIS_FOLDER_NAME "${CMAKE_CURRENT_SOURCE_DIR}")
project(${THIS_FOLDER_NAME})

message("Generating ${THIS_FOLDER_NAME}")

include(${CMAKE_CURRENT_SOURCE_DIR}/../../max-api/script/max-pretarget.cmake)

if (APPLE)
	# max-pretarget sets it to x86_64;i386 but i386 is not supported anymore
	set(CMAKE_OSX_ARCHITECTURES x86_64)
	set(CMAKE_OSX_DEPLOYMENT_TARGET 10.12)
endif ()

# max-pretarget.cmake defines the output directory to the externals folder.
# However, this can cause temporary files to also be written to this directory.
# To keep things clean, we set a different output directory and copy only the
# executables to externals.
set(CVJIT_INSTALL_DIRECTORY ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/bin")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG "${CMAKE_LIBRARY_OUTPUT_DIRECTORY}")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE "${CMAKE_LIBRARY_OUTPUT_DIRECTORY}")

# Set preprocessor macros
if (LEGACY) 
	add_compile_definitions(CVJIT_LEGACY)
endif()

# Specify runtime library
if (WIN32)
	if (${STATIC_RUNTIME})
		set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} /MT")
		set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /MTd")
	else()
		set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} /MD")
		set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /MDd")
	endif()
endif()

# Set header directories

## Common directories
include_directories( 
	"${C74_INCLUDES}"
	"${CMAKE_CURRENT_SOURCE_DIR}/../../include/"
)

## OpenCV includes
if (LEGACY) 
	include_directories("${OPENCV2_INSTALL_DIR}/include" "${OPENCV2_INSTALL_DIR}/include/opencv")
else ()
	include_directories("${OPENCV4_INSTALL_DIR}/include" "${OPENCV4_INSTALL_DIR}/include/opencv4")
endif()

# Set extra libraries

## Common libraries

## OpenCV libraries
if (LEGACY)
	if (WIN32)
		file(GLOB_RECURSE OPENCV_LIBS "${OPENCV2_INSTALL_DIR}/x64/*.lib")
	elseif(APPLE)
		file(GLOB OPENCV_LIBS "${OPENCV2_INSTALL_DIR}/lib/*.a")
	endif()
else()
	if (WIN32)
		file(GLOB_RECURSE OPENCV_LIBS "${OPENCV4_INSTALL_DIR}/x64/*.lib")
	elseif(APPLE) 
		file(GLOB OPENCV_LIBS "${OPENCV4_INSTALL_DIR}/lib/*.a")
		list(REMOVE_ITEM OPENCV_LIBS "${OPENCV4_INSTALL_DIR}/lib/libittnotify.a")
	endif()
endif()

set (EXTRA_LIBS ${EXTRA_LIBS} ${OPENCV_LIBS})

# Other libraries and Frameworks
if (APPLE)
	find_library(ACCELERATE_FRAMEWORK Accelerate)
	find_library(OPENCL_FRAMEWORK OpenCL)
	find_package(ZLIB)
	set (EXTRA_LIBS ${EXTRA_LIBS} ${ACCELERATE_FRAMEWORK} ${OPENCL_FRAMEWORK} ${ZLIB_LIBRARIES})
endif()

