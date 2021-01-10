# Config Building Architecture
if(${USE32bit})
    set(CMAKE_EXE_LINKER_FLAGS "-m32")
else()
    set(CMAKE_EXE_LINKER_FLAGS "-m64")
endif()

# Enable Warining Options
# https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html
set(CMAKE_C_FLAGS_INIT "-Wall")
set(CMAKE_CXX_FLAGS_INIT "-Wall")
