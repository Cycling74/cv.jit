cmake_minimum_required(VERSION 3.0)

# Make sure we are generating 64-bit projects.
if (NOT CMAKE_SIZEOF_VOID_P EQUAL 8)
	message(FATAL_ERROR "This version of cv.jit can only be built on 64-bit architectures. Make sure you set the proper generator when calling CMake.")
endif()

# Max API cmake files use the WIN64 variable, which is not standard.
# Define it here if needed to avoid linker issues.
if (WIN32 AND NOT WIN64)
	SET(WIN64 ON)
endif()

# Fetch the correct verion of the max-api
message(STATUS "Updating Git Submodules")
execute_process(
	COMMAND				git submodule update --init --recursive
	WORKING_DIRECTORY	"${CMAKE_CURRENT_SOURCE_DIR}"
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


# Generate a project for every folder in the "source/projects" folder
SUBDIRLIST(PROJECT_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/source/projects)
foreach (project_dir ${PROJECT_DIRS})
	if (EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/source/projects/${project_dir}/CMakeLists.txt")
		message("Generating: ${project_dir}")
		add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/source/projects/${project_dir})
	endif ()
endforeach ()
