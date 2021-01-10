# Config Platfom
if(WIN32)
    set(TOOL "C:/Program\ Files/LLVM")
    set(Filename_Extension  ".exe")
elseif(UNIX)
    if(DEFINED LLVM_VERSION)
        set(TOOL "/lib/llvm-${LLVM_VERSION}/")
    else()
        message(FATAL_ERROR "To Check /lib/llvm-[version] --> version info")
    endif()
else()

endif()

# LLVM archiver
set(CMAKE_AR                    "${TOOL}/bin/llvm-lib${Filename_Extension}")

# CXX compiler
set(CMAKE_CXX_COMPILER          "${TOOL}/bin/clang++${Filename_Extension}")

# LLVM archiver
set(CMAKE_CXX_COMPILER_AR       "${TOOL}/bin/llvm-ar${Filename_Extension}")

# Generate index for LLVM archive
set(CMAKE_CXX_COMPILER_RANLIB   "${TOOL}/bin/llvm-ranlib${Filename_Extension}")

# C compiler
set(CMAKE_C_COMPILER            "${TOOL}/bin/clang${Filename_Extension}")

# LLVM archiver
set(CMAKE_C_COMPILER_AR         "${TOOL}/bin/llvm-ar${Filename_Extension}")

# Generate index for LLVM archive
set(CMAKE_C_COMPILER_RANLIB     "${TOOL}/bin/llvm-ranlib${Filename_Extension}")

# Linker
set(CMAKE_LINKER                "${TOOL}/bin/lld-link${Filename_Extension}")

# RC compiler
set(CMAKE_RC_COMPILER           "${TOOL}/bin/llvm-rc${Filename_Extension}")

