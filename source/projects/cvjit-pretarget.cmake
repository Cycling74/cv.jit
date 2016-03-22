cmake_minimum_required(VERSION 3.0)

string(REGEX REPLACE "(.*)/" "" THIS_FOLDER_NAME "${CMAKE_CURRENT_SOURCE_DIR}")
project(${THIS_FOLDER_NAME})

include(${CMAKE_CURRENT_SOURCE_DIR}/../../max-sdk-core/script/max-pretarget.cmake)


include_directories( 
	"${C74_INCLUDES}"
	${CMAKE_CURRENT_SOURCE_DIR}/../../include
	${CMAKE_CURRENT_SOURCE_DIR}/../../OpenCVsupport/opencv
	${CMAKE_CURRENT_SOURCE_DIR}/../../OpenCVsupport
)

if(APPLE)
	set(EXTRA_LIBS 
		${CMAKE_CURRENT_SOURCE_DIR}/../../lib/libcv.a
		${CMAKE_CURRENT_SOURCE_DIR}/../../lib/libz.a
	)
else()
endif()
