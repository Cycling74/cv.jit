cmake_minimum_required(VERSION 3.0)

project(cvjit)

# Find out if we are building 64 or 32 externals
if (CMAKE_SIZEOF_VOID_P EQUAL 8)
	SET(CVJIT_ARCH "x64")
elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
	SET(CVJIT_ARCH "x86")
endif()

# Project settings
# Change those settings, if needed, to match your environment
set (COPY_DIR 
	"${CMAKE_CURRENT_SOURCE_DIR}/externals" 
	CACHE PATH 
	"The directory to which the externals will be copied after build.")


if (APPLE)
	# This is where we expect the OpenCV libraries to be installed.
	set(DEFAULT_INSTALL_DIR "/usr/local")
else()
	set(DEFAULT_INSTALL_DIR "/usr/local")
endif()

set (OPENCV4_INSTALL_DIR "${DEFAULT_INSTALL_DIR}/opencv4" CACHE PATH "The install location of OpenCV 4")
set (OPENCV2_INSTALL_DIR "${DEFAULT_INSTALL_DIR}/opencv2" CACHE PATH "The install location of OpenCV 2")

# set (OPENCV_LATEST_LIB_DIR
# 	""
# 	CACHE PATH
# 	"The location where OpenCV 4 static libraries (.lib / .a) were installed."
# )

# set (OPENCV_LEGACY_LIB_DIR
# 	""
# 	CACHE PATH
# 	"The location where OpenCV 2 static libraries (.lib / .a) were installed."
# )

# set (OPENCV_LATEST_INCLUDE_DIR
# 	""
# 	CACHE PATH
# 	"The location where OpenCV 4 headers were installed."
# )

# set (OPENCV_LEGACY_INCLUDE_DIR
# 	""
# 	CACHE PATH
# 	"The location where OpenCV 2 headers were installed."
# )

# Make sure that the OpenCV paths have been specified. Ideally we should use find_package
# instead.
# if (("${OPENCV_LATEST_LIB_DIR}" STREQUAL "") OR
# 	("${OPENCV_LEGACY_LIB_DIR}" STREQUAL "") OR
# 	("${OPENCV_LATEST_INCLUDE_DIR}" STREQUAL "") OR
# 	("${OPENCV_LEGACY_INCLUDE_DIR}" STREQUAL ""))
# 	message(FATAL_ERROR "OpenCV paths were not specified. Set the following variables: OPENCV_LATEST_LIB_DIR, OPENCV_LEGACY_LIB_DIR, OPENCV_LATEST_INCLUDE_DIR, and OPENCV_LEGACY_INCLUDE_DIR.")

# endif()

if (WIN32)
	set (STATIC_RUNTIME 
	TRUE
	CACHE BOOL
	"Do we link statically to the runtime library? On windows, this sets the /MT or /MD compiler flags")
endif()

# Max API cmake files use the WIN64 variable, which is not standard.
# Define it here if needed to avoid linker issues.
if (WIN32 AND NOT WIN64)
	SET(WIN64 ON)
endif()

# Fetch the correct verion of the max-api
message(STATUS "Updating Git Submodules")
execute_process(
	COMMAND git submodule update --init --recursive
	WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
)

# Important, make sure to set the OpenCV versions we use!
if (NOT OPENCV_VERSION_CURRENT)
	SET(OPENCV_VERSION_CURRENT "4.1.0")
endif()

if (NOT OPENCV_VERSION_LEGACY)
	SET(OPENCV_VERSION_LEGACY "2.4.12")
endif()


# Misc setup and subroutines
include(${CMAKE_CURRENT_SOURCE_DIR}/source/max-api/script/max-package.cmake)

# Setup some useful variables
if(APPLE)
	set(STATIC_LIB_EXT a)
elseif(WIN32)
	set(STATIC_LIB_EXT lib)
endif()

# Make a list of required libraries
# set (OPENCV_NODEBUG_LIBS 
# 	"ade"
# 	"ippicvmt"
# )

# set (OPENCV_LIBS
# 	"opencv_world*"
# 	"ippiw"
# 	"zlib"
# 	"ittnotify"
# )

# Find the libraries
# foreach(LIB ${OPENCV_NODEBUG_LIBS})
# 	set(OPENCV_LATEST_RELEASE_LIBS ${OPENCV_LATEST_RELEASE_LIBS} "${OPENCV_LATEST_LIB_DIR}/${LIB}.${STATIC_LIB_EXT}")
# 	set(OPENCV_LATEST_DEBUG_LIBS ${OPENCV_LATEST_DEBUG_LIBS} "${OPENCV_LATEST_LIB_DIR}/${LIB}.${STATIC_LIB_EXT}")
# endforeach()

# foreach(LIB ${OPENCV_LIBS})
# 	## Look for debug file
# 	file(GLOB ALL_LIB "${OPENCV_LATEST_LIB_DIR}/${LIB}.${STATIC_LIB_EXT}")
# 	file(GLOB DEBUG_LIB "${OPENCV_LATEST_LIB_DIR}/${LIB}d.${STATIC_LIB_EXT}")
# 	list(REMOVE_ITEM ALL_LIB ${DEBUG_LIB})
# 	set(OPENCV_LATEST_RELEASE_LIBS ${OPENCV_LATEST_RELEASE_LIBS} ${ALL_LIB})
# 	set(OPENCV_LATEST_DEBUG_LIBS ${OPENCV_LATEST_DEBUG_LIBS} ${DEBUG_LIB})
# endforeach()

# Generate a project for every folder in the "source/projects" folder
SUBDIRLIST(PROJECT_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/source/projects)
foreach (project_dir ${PROJECT_DIRS})
	if (EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/source/projects/${project_dir}/CMakeLists.txt")
		message("Generating: ${project_dir}")
		add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/source/projects/${project_dir})
	endif ()
endforeach ()
