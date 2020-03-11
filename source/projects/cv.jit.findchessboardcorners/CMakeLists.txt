set(LEGACY ON)
include(${CMAKE_CURRENT_SOURCE_DIR}/../cvjit-pretarget.cmake)

unset(PROJECT_SOURCES)
if (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/max.${PROJECT_NAME}.cpp)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} max.${PROJECT_NAME}.cpp)
endif()

if (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/${PROJECT_NAME}.cpp)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${PROJECT_NAME}.cpp)
endif()

add_library( 
	${PROJECT_NAME} 
	MODULE
	${PROJECT_SOURCES}
)

include(${CMAKE_CURRENT_SOURCE_DIR}/../cvjit-posttarget.cmake)
