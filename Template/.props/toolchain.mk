#============================================================
# Set Toolchain
#============================================================
CROSS_COMPILE	:=

AS				:= llvm-as
CC				:= clang
CXX				:= clang++
AR				:= llvm-ar
LD				:= ld.lld
OD				:= llvm-objdump
OC				:= llvm-objcopy
NM				:= llvm-nm
STRIP			:= llvm-strip
READELF			:= llvm-readelf
