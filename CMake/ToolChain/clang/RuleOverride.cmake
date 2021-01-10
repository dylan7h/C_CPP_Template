# Config Building Architecture
if(${USE32bit})
    set(CMAKE_EXE_LINKER_FLAGS "-m32")
else()
    set(CMAKE_EXE_LINKER_FLAGS "-m64")
endif()
