cmake_minimum_required(VERSION 3.0)

string(REGEX REPLACE "(.*)/" "" THIS_FOLDER_NAME "${CMAKE_CURRENT_SOURCE_DIR}")
project(${THIS_FOLDER_NAME})

include(${CMAKE_CURRENT_SOURCE_DIR}/../../max-api/script/max-pretarget.cmake)

# Set preprocessor macros
if (LEGACY) 
	add_compile_definitions(CVJIT_LEGACY)
endif()

# Set header directories
if (LEGACY) 
	include_directories( 
		"${C74_INCLUDES}"
		${CMAKE_CURRENT_SOURCE_DIR}/../../include/
		${CMAKE_CURRENT_SOURCE_DIR}/../../include/opencv/${OPENCV_VERSION_LEGACY}/
		${CMAKE_CURRENT_SOURCE_DIR}/../../include/opencv/${OPENCV_VERSION_LEGACY}/opencv/
	)
else ()
	include_directories( 
		"${C74_INCLUDES}"
		${CMAKE_CURRENT_SOURCE_DIR}/../../include/
		${CMAKE_CURRENT_SOURCE_DIR}/../../include/opencv/${OPENCV_VERSION_CURRENT}/
	)
endif()

# Set extra libraries
if(APPLE)
	set(STATIC_LIB_EXT a)
elseif(WIN32)
	set(STATIC_LIB_EXT lib)
endif()

set(LIB_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../lib)
if (LEGACY)
	set(OPENCV_LIB_DIR opencv/${OPENCV_VERSION_LEGACY}/x64)
	string(REPLACE "." "" OPENCV_LIB_SUFFIX "${OPENCV_VERSION_LEGACY}")

	set(EXTRA_LIBS
		optimized ${LIB_DIR}/${OPENCV_LIB_DIR}/opencv_core${OPENCV_LIB_SUFFIX}.${STATIC_LIB_EXT}
		debug ${LIB_DIR}/${OPENCV_LIB_DIR}/opencv_core${OPENCV_LIB_SUFFIX}d.${STATIC_LIB_EXT}
		optimized ${LIB_DIR}/${OPENCV_LIB_DIR}/opencv_features2d${OPENCV_LIB_SUFFIX}.${STATIC_LIB_EXT}
		debug ${LIB_DIR}/${OPENCV_LIB_DIR}/opencv_features2d${OPENCV_LIB_SUFFIX}d.${STATIC_LIB_EXT}
		optimized ${LIB_DIR}/${OPENCV_LIB_DIR}/opencv_imgproc${OPENCV_LIB_SUFFIX}.${STATIC_LIB_EXT}
		debug ${LIB_DIR}/${OPENCV_LIB_DIR}/opencv_imgproc${OPENCV_LIB_SUFFIX}d.${STATIC_LIB_EXT}
		optimized ${LIB_DIR}/${OPENCV_LIB_DIR}/opencv_calib3d${OPENCV_LIB_SUFFIX}.${STATIC_LIB_EXT}
		debug ${LIB_DIR}/${OPENCV_LIB_DIR}/opencv_calib3d${OPENCV_LIB_SUFFIX}d.${STATIC_LIB_EXT}
		optimized ${LIB_DIR}/${OPENCV_LIB_DIR}/opencv_video${OPENCV_LIB_SUFFIX}.${STATIC_LIB_EXT}
		optimized ${LIB_DIR}/${OPENCV_LIB_DIR}/opencv_legacy${OPENCV_LIB_SUFFIX}.${STATIC_LIB_EXT}
		debug ${LIB_DIR}/${OPENCV_LIB_DIR}/opencv_legacy${OPENCV_LIB_SUFFIX}d.${STATIC_LIB_EXT}

		optimized ${LIB_DIR}/zlib/x64/zlibstatic.${STATIC_LIB_EXT}
		debug ${LIB_DIR}/zlib/x64/zlibstaticd.${STATIC_LIB_EXT}
	)
else()
	set(OPENCV_LIB_DIR opencv/${OPENCV_VERSION_CURRENT}/x64)
	string(REPLACE "." "" OPENCV_LIB_SUFFIX "${OPENCV_VERSION_CURRENT}")

	set(EXTRA_LIBS
		optimized ${LIB_DIR}/${OPENCV_LIB_DIR}/opencv_world${OPENCV_LIB_SUFFIX}.${STATIC_LIB_EXT}
		debug ${LIB_DIR}/${OPENCV_LIB_DIR}/opencv_world${OPENCV_LIB_SUFFIX}d.${STATIC_LIB_EXT}

		optimized ${LIB_DIR}/zlib/x64/zlibstatic.${STATIC_LIB_EXT}
		debug ${LIB_DIR}/zlib/x64/zlibstaticd.${STATIC_LIB_EXT}
	)	
endif()
