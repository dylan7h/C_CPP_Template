#
if(WIN32)
    set(TOOL "C:/Program\ Files/LLVM")
elseif(UNIX)
    if(DEFINED LLVM_VERSION)
        set(TOOL "/lib/llvm-${LLVM_VERSION}/")
    else()
        message(FATAL_ERROR "To Check /lib/llvm-[version] --> version info")
    endif()
else()

endif()

# LLVM archiver
set(CMAKE_AR                    "${TOOL}/bin/llvm-lib.exe")

# CXX compiler
set(CMAKE_CXX_COMPILER          "${TOOL}/bin/clang++.exe")

# LLVM archiver
set(CMAKE_CXX_COMPILER_AR       "${TOOL}/bin/llvm-ar.exe")

# Generate index for LLVM archive
set(CMAKE_CXX_COMPILER_RANLIB   "${TOOL}/bin/llvm-ranlib.exe")

# C compiler
set(CMAKE_C_COMPILER            "${TOOL}/bin/clang.exe")

# LLVM archiver
set(CMAKE_C_COMPILER_AR         "${TOOL}/bin/llvm-ar.exe")

# Generate index for LLVM archive
set(CMAKE_C_COMPILER_RANLIB     "${TOOL}/bin/llvm-ranlib.exe")

# Linker
set(CMAKE_LINKER                "${TOOL}/bin/lld-link.exe")

# RC compiler
set(CMAKE_RC_COMPILER           "${TOOL}/bin/llvm-rc.exe")

