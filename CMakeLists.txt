cmake_minimum_required(VERSION 3.15)

include(CMake/rule.cmake)

project(
    # Project Name
    ${EXTERNAL_INPUT_PROJECT_NAME}
    # Version Info
    VERSION 0.0.1
    # Description
    DESCRIPTION "C++ Study"
    # Language
    LANGUAGES CXX
)

# Auto Searching Source File Lists
FILE(GLOB_RECURSE SOURCE_FILES Source/*.s Source/*.S Source/*.c Source/*.cc Source/*.cxx Source/*.cpp Source/*.hpp)

# Define Macro Lists
list(APPEND DEFINE_LISTS )

# Include Path
list(APPEND INCLUDE_PATH Include)

# Executale Target 
add_executable(${PROJECT_NAME} ${SOURCE_FILES})

# Register Include Path 
target_include_directories(${PROJECT_NAME} PUBLIC ${INCLUDE_PATH})

# Register Pre Define Macros
target_compile_definitions(${PROJECT_NAME} PUBLIC ${DEFINE_LISTS})

# Display Source Lists
message(STATUS "===================== Source Lists =====================")
foreach(var ${SOURCE_FILES})
    message(STATUS ${var})
endforeach()
message(STATUS "========================================================")
