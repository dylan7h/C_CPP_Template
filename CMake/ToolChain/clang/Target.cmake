#===========================================================
# Type        : Macro
# Name        : add_src
# Description : add source path
# Parameter
#   - src_path : source path
#===========================================================
macro(add_src src_path)
    list(APPEND ${PROJECT_NAME}_SRC_FILE ${src_path})
endmacro()


#===========================================================
# Type        : Macro
# Name        : add_inc
# Description : add include path
# Parameter
#   - inc_path : include path
#===========================================================
macro(add_inc inc_path)
    list(APPEND ${PROJECT_NAME}_INC_PATH ${inc_path})
endmacro()


#===========================================================
# Type        : Macro
# Name        : add_lib_root
# Description : add library root path
# Parameter
#   - lib_file : library root path
#===========================================================
macro(add_lib_root lib_root)
    list(APPEND ${PROJECT_NAME}_LIB_ROOT ${lib_root})
endmacro()

#===========================================================
# Type        : Macro
# Name        : add_lib
# Description : add library file
# Parameter
#   - src_path : library file
#===========================================================
macro(add_lib lib_file)
    list(APPEND ${PROJECT_NAME}_LIB_FILE ${lib_file})
endmacro()


#===========================================================
# Type        : Macro
# Name        : set_cpp_version
# Description : set C++ standard version
# Parameter
#   - version : C++ standard version
#===========================================================
macro(set_cpp_version version)
    set(${PROJECT_NAME}_CPP_STANDARD_VERSION ${version})
endmacro()


#===========================================================
# Type        : Macro
# Name        : set_c_version
# Description : set C standard version
# Parameter
#   - version : C standard version
#===========================================================
macro(set_c_version version)
    set(${PROJECT_NAME}_C_STANDARD_VERSION ${version})
endmacro()


#===========================================================
# Type        : Macro
# Name        : show_var
# Description : show value of variable
# Parameter
#   - var_name : to show label name
#   - variable : name of variable
#===========================================================
macro(show_var label variable)
    message(STATUS "===============================================")
    message(STATUS "[ ${label} ]")
    foreach(var ${variable})
        message(STATUS ${var})
    endforeach()
    message(STATUS "===============================================\n")
endmacro()


#===========================================================
# Type        : function
# Name        : build_exec
# Description : build executable target
# Parameter
#   - N/A
#===========================================================
function(build_exec)
    show_var("${PROJECT_NAME} - SRC" "${${PROJECT_NAME}_SRC_FILE}")
    show_var("${PROJECT_NAME} - INC" "${${PROJECT_NAME}_INC_PATH}")

    # Executable Target Definitions
    add_executable(${PROJECT_NAME} ${${PROJECT_NAME}_SRC_FILE})

    # Set Target Include Paths
    target_include_directories(${PROJECT_NAME} PRIVATE ${${PROJECT_NAME}_INC_PATH})

    # Set Target Macro Symbols
    target_compile_definitions(${PROJECT_NAME} PRIVATE ${${PROJECT_NAME}_DEFINE_SYMBOL})

    # Set Target Link Library Location
    target_link_directories(${PROJECT_NAME} PRIVATE ${${PROJECT_NAME}_LIB_ROOT})

    # Set Target Link Library
    target_link_libraries(${PROJECT_NAME} ${${PROJECT_NAME}_LIB_FILE})

    # Set Language Standard Version
    if(${CPP_STANDARD})
        set_target_properties(${PROJECT_NAME} PROPERTIES CXX_STANDARD ${${PROJECT_NAME}_CPP_STANDARD_VERSION} CXX_STANDARD_REQUIRED ON)
    endif()
    
    if(${C_STANDARD})
        set_target_properties(${PROJECT_NAME} PROPERTIES C_STANDARD ${${PROJECT_NAME}_C_STANDARD_VERSION} C_STANDARD_REQUIRED ON)
    endif()
endfunction()


#===========================================================
# Type        : function
# Name        : build_lib
# Description : build library target
# Parameter
#   - N/A
#===========================================================
function(build_lib)
    show_var("${PROJECT_NAME} - SRC" "${PROJECT_NAME}_SRC_FILE")
    show_var("${PROJECT_NAME} - INC" "${PROJECT_NAME}_INC_PATH")

    # Library Target Definitions
    add_library(${PROJECT_NAME} ${${PROJECT_NAME}_SRC_FILE}})

    # Set Target Include Paths
    target_include_directories(${PROJECT_NAME} PRIVATE ${${PROJECT_NAME}_INC_PATH})

    # Set Target Macro Symbols
    target_compile_definitions(${PROJECT_NAME} PRIVATE ${${PROJECT_NAME}_DEFINE_SYMBOL})

    # Set Language Standard Version
    if(${CPP_STANDARD})
        set_target_properties(${PROJECT_NAME} PROPERTIES CXX_STANDARD ${${PROJECT_NAME}_CPP_STANDARD_VERSION} CXX_STANDARD_REQUIRED ON)
    endif()
    
    if(${C_STANDARD})
        set_target_properties(${PROJECT_NAME} PROPERTIES C_STANDARD ${${PROJECT_NAME}_C_STANDARD_VERSION} C_STANDARD_REQUIRED ON)
    endif()
endfunction()
