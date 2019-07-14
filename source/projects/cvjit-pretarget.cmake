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
	set(OPENCV_RELEASE_LIBS ${OPENCV_LEGACY_RELEASE_LIBS} ${OPENCV_LEGACY_3RD_PARTY_RELEASE_LIBS})
	set(OPENCV_DEBUG_LIBS ${OPENCV_LEGACY_DEBUG_LIBS} ${OPENCV_LEGACY_3RD_PARTY_DEBUG_LIBS})
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
