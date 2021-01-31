cmake_minimum_required(VERSION 3.15)

include(CMake/rule.cmake)

project(
    # Project Name
    "DirectStorageRW"
    # Version Info
    VERSION 0.0.1
    # Description
    DESCRIPTION "C++ Study"
)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/Binary)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/Binary)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/Binary)

add_subdirectory(App)
