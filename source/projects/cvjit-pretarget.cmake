cmake_minimum_required(VERSION 3.0)

string(REGEX REPLACE "(.*)/" "" THIS_FOLDER_NAME "${CMAKE_CURRENT_SOURCE_DIR}")
project(${THIS_FOLDER_NAME})

message("Generating ${THIS_FOLDER_NAME}")

include(${CMAKE_CURRENT_SOURCE_DIR}/../../max-api/script/max-pretarget.cmake)

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
	include_directories(${OPENCV_LEGACY_INCLUDE_DIR})
else ()
	include_directories(${OPENCV_LATEST_INCLUDE_DIR})
endif()

# Set extra libraries

## Common libraries

## OpenCV libraries
if (LEGACY)
	# set(OPENCV_RELEASE_LIBS ${OPENCV_LEGACY_RELEASE_LIBS} ${OPENCV_LEGACY_3RD_PARTY_RELEASE_LIBS})
	# set(OPENCV_DEBUG_LIBS ${OPENCV_LEGACY_DEBUG_LIBS} ${OPENCV_LEGACY_3RD_PARTY_DEBUG_LIBS})
	if (WIN32)
		set(OPENCV_RELEASE_LIBS
			"${OPENCV_LEGACY_LIB_DIR}/IlmImf.lib"
			"${OPENCV_LEGACY_LIB_DIR}/libjasper.lib"
			"${OPENCV_LEGACY_LIB_DIR}/libjpeg.lib"
			"${OPENCV_LEGACY_LIB_DIR}/libpng.lib"
			"${OPENCV_LEGACY_LIB_DIR}/libtiff.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_calib3d2412.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_contrib2412.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_core2412.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_features2d2412.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_flann2412.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_gpu2412.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_highgui2412.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_imgproc2412.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_legacy2412.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_ml2412.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_nonfree2412.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_objdetect2412.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_ocl2412.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_photo2412.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_stitching2412.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_superres2412.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_ts2412.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_video2412.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_videostab2412.lib"
			"${OPENCV_LEGACY_LIB_DIR}/zlib.lib"
		)

		set(OPENCV_DEBUG_LIBS
			"${OPENCV_LEGACY_LIB_DIR}/IlmImfd.lib"
			"${OPENCV_LEGACY_LIB_DIR}/libjasperd.lib"
			"${OPENCV_LEGACY_LIB_DIR}/libjpegd.lib"
			"${OPENCV_LEGACY_LIB_DIR}/libpngd.lib"
			"${OPENCV_LEGACY_LIB_DIR}/libtiffd.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_calib3d2412d.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_contrib2412d.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_core2412d.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_features2d2412d.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_flann2412d.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_gpu2412d.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_highgui2412d.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_imgproc2412d.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_legacy2412d.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_ml2412d.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_nonfree2412d.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_objdetect2412d.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_ocl2412d.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_photo2412d.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_stitching2412d.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_superres2412d.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_ts2412d.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_video2412d.lib"
			"${OPENCV_LEGACY_LIB_DIR}/opencv_videostab2412d.lib"
			"${OPENCV_LEGACY_LIB_DIR}/zlibd.lib"
		)
	endif()
else()
	set(OPENCV_RELEASE_LIBS ${OPENCV_LATEST_RELEASE_LIBS})
	set(OPENCV_DEBUG_LIBS ${OPENCV_LATEST_DEBUG_LIBS})
endif()

foreach(OPENCV_LIB ${OPENCV_DEBUG_LIBS})
	set (EXTRA_LIBS ${EXTRA_LIBS} debug ${OPENCV_LIB})
endforeach()

foreach(OPENCV_LIB ${OPENCV_RELEASE_LIBS})
	set (EXTRA_LIBS ${EXTRA_LIBS} optimized ${OPENCV_LIB})
endforeach()
