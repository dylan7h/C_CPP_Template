macro(load_config)

#====================================
# Build Environment
#====================================
set_cpp_version(17)


#====================================
# Define Macro Lists
#====================================
add_symbol("TEST_SYMBOL1")
add_symbol("TEST_SYMBOL2")
add_symbol("TEST_SYMBOL3")
add_symbol("TEST_SYMBOL4")
add_symbol("TEST_" "234")

#====================================
# Library Root Path
#====================================
# add_lib_root()


#====================================
# Library Lists
#====================================
# add_lib()


#====================================
# Include Path
#====================================
add_inc("Include")


#====================================
# Source Lists
#====================================
add_src("Source/main.cpp")

endmacro()
