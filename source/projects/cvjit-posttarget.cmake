
TARGET_LINK_LIBRARIES( ${PROJECT_NAME} ${EXTRA_LIBS} )

set(C74_CXX_STANDARD 98)
include(${CMAKE_CURRENT_SOURCE_DIR}/../../max-api/script/max-posttarget.cmake)

