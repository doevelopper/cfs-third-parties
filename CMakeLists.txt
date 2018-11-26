
project (cfs-third-party C CXX)
cmake_minimum_required(VERSION 3.12 FATAL_ERROR)

include(TestBigEndian)
TEST_BIG_ENDIAN(IS_BIG_ENDIAN)

if(IS_BIG_ENDIAN)
    message(FATAL_ERROR "Big endian isn't supported !!!")
endif(IS_BIG_ENDIAN)

include(ProcessorCount)
ProcessorCount(NUMBER_OF_PROCESSORS)

#execute_process(COMMAND git submodule update --init -- external/foo
#                    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})

execute_process(
    COMMAND git submodule update --init --recursive
    WORKING_DIRECTORY
        ${CMAKE_CURRENT_SOURCE_DIR}
)

#add_subdirectory (src/main/cpp)
#add_subdirectory (src/test/cpp)
#add_subdirectory (src/it)




