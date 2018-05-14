
project (cfs-edac C CXX)
cmake_minimum_required(VERSION 3.10 FATAL_ERROR)

set(${PROJECT_NAME}_MAJOR_VERSION       "1")
set(${PROJECT_NAME}_MINOR_VERSION       "0")
set(${PROJECT_NAME}_MICRO_VERSION       "0")
set(${PROJECT_NAME}_PATCH_VERSION       "-")
set(${PROJECT_NAME}_PATCH_LEVEL         "0")
set(${PROJECT_NAME}_REVISION_VERSION    "0")
set(${PROJECT_NAME}_VERSION "${${PROJECT_NAME}_MAJOR_VERSION}.${${PROJECT_NAME}_MINOR_VERSION}.${${PROJECT_NAME}_PATCH_LEVEL}")

set("BUILD_SHARED_LIBS" OFF CACHE INTERNAL "If enabled, shared libs will be built by default, otherwise static libs")

add_definitions(-DRELEASE_LEVEL="SNAPSHOOT") # SNAPSHOOT ,ALPHA , BETA , CANDIDATE , FINAL.

list(APPEND CMAKE_MODULE_PATH
    "${CMAKE_SOURCE_DIR}/src/main/resources/macros"
    "${CMAKE_SOURCE_DIR}/src/main/resources/cmakeModule"
)

include(TestBigEndian)
TEST_BIG_ENDIAN(IS_BIG_ENDIAN)

if(IS_BIG_ENDIAN)
    message(FATAL_ERROR "Big endian isn't supported !!!")
endif(IS_BIG_ENDIAN)

include(ProcessorCount)
ProcessorCount(N)

include(Rules)

add_subdirectory (src/main/cpp)
#add_subdirectory (src/test/cpp)
#add_subdirectory (src/it)




