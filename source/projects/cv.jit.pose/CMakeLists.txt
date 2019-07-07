include(${CMAKE_CURRENT_SOURCE_DIR}/../cvjit-pretarget.cmake)

# This external depends on OpenPose. Make sure we have the 
# required files.]

set (OPEN_POSE_LIB_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../lib/openpose/x64/)
set (OPEN_POSE_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../lib/openpose/x64/)

if (EXISTS ${OPEN_POSE_LIB_DIR}openpose.${STATIC_LIB_EXT} AND 
	EXISTS ${OPEN_POSE_LIB_DIR}openposed.${STATIC_LIB_EXT} AND
	EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/../../include/openpose)
	
	unset(PROJECT_SOURCES)
	if (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/max.${PROJECT_NAME}.cpp)
		set(PROJECT_SOURCES ${PROJECT_SOURCES} max.${PROJECT_NAME}.cpp)
	endif()

	if (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_NAME}.cpp)
		set(PROJECT_SOURCES ${PROJECT_SOURCES} ${PROJECT_NAME}.cpp)
	endif()

	# Add extra dependencies to OpenPose
	include_directories( 
		${CMAKE_CURRENT_SOURCE_DIR}/../../include/openpose/
	)

	set(EXTRA_LIBS ${EXTRA_LIBS} 
		optimized ${OPEN_POSE_LIB_DIR}openpose.${STATIC_LIB_EXT}
		debug ${OPEN_POSE_LIB_DIR}openposed.${STATIC_LIB_EXT}
	)

	# Done, generate target
	add_library( 
		${PROJECT_NAME} 
		MODULE
		${PROJECT_SOURCES}
	)

	include(${CMAKE_CURRENT_SOURCE_DIR}/../cvjit-posttarget.cmake)

else()
	message(WARNING "cv.jit.poses project was not generated: Couldn't find OpenPose files. \nPlease make sure you have copied libraries and headers to the correct location.")
endif()

