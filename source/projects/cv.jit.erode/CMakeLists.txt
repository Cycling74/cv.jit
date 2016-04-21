cmake_minimum_required(VERSION 3.0)

string(REGEX REPLACE "(.*)/" "" THIS_FOLDER_NAME "${CMAKE_CURRENT_SOURCE_DIR}")
project(${THIS_FOLDER_NAME})

include(${CMAKE_CURRENT_SOURCE_DIR}/../../max-api/script/max-pretarget.cmake)


include_directories( 
	"${C74_INCLUDES}"
	${CMAKE_CURRENT_SOURCE_DIR}
	${CMAKE_CURRENT_SOURCE_DIR}/../../include
	${CMAKE_CURRENT_SOURCE_DIR}/../../OpenCVsupport/opencv
	${CMAKE_CURRENT_SOURCE_DIR}/../../OpenCVsupport
)

if(APPLE)
	set(PLATFORM_CODE 
		${PROJECT_NAME}.cpp
		${CMAKE_CURRENT_SOURCE_DIR}/OSX/cv.erode.cpp 
		${CMAKE_CURRENT_SOURCE_DIR}/../../lib/libcv.a
		${PROJECT_NAME}.cpp
	)
	FIND_LIBRARY(ACCELERATE_LIBRARY Accelerate)
	MARK_AS_ADVANCED (ACCELERATE_LIBRARY)
	SET(EXTRA_LIBS ${ACCELERATE_LIBRARY})
else()
	set(PLATFORM_CODE ${CMAKE_CURRENT_SOURCE_DIR}/Windows/cv.jit.erode.cpp)
endif()

add_library( 
	${PROJECT_NAME} 
	MODULE
	max.${PROJECT_NAME}.cpp
	${PLATFORM_CODE}
)
TARGET_LINK_LIBRARIES( ${PROJECT_NAME} ${EXTRA_LIBS} )


include(${CMAKE_CURRENT_SOURCE_DIR}/../../max-api/script/max-posttarget.cmake)

