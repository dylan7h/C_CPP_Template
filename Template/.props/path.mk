#============================================================
# Path of Build Product
#============================================================
BUILD_DIR	:=	$(TOPDIR)/build
OBJ_DIR		:=	$(BUILD_DIR)/obj/$(TARGET)
DEF_DIR		:=	$(BUILD_DIR)/def
BIN_DIR		:=	$(BUILD_DIR)/bin
ELF_DIR		:=	$(BUILD_DIR)/elf
MAP_DIR		:=	$(BUILD_DIR)/map
ASM_DIR		:=	$(BUILD_DIR)/asm


#============================================================
# Path of Include directoies
#============================================================
INC_PATH	:=	include

#============================================================
# Path of Source lists
#============================================================
# Assembly
ASRC		:=

# C Source
CSRC		:= 	source/main.c

# C++ Source
CXXSRC		:=

#============================================================
# Path of Libraries
#============================================================
LIB_DIR		:=

#============================================================
# Name of Libraries
#============================================================
# System Lib
ifeq ($(OS),Windows_NT)
	LIB_NAME		:=	kernel32 user32 gdi32 winspool shell32 ole32 oleaut32 uuid comdlg32 advapi32 oldnames
endif

# User Lib
LIB_NAME	+=

#============================================================
# Convert Object & Denpendency file lists from Source Lists
# Add compiler option(-L, -l)
# (Must be Located at last line)
#============================================================
INCS		:=	$(addprefix -I , $(INC_PATH))
OBJS		:=	$(addprefix $(OBJ_DIR)/, $(ASRC:.s=.o))
OBJS		+=	$(addprefix $(OBJ_DIR)/, $(CSRC:.c=.o))
OBJS		+=	$(addprefix $(OBJ_DIR)/, $(CXXSRC:.cpp=.o))
DEPS		:=	$(addprefix $(DEF_DIR)/, $(ASRC:.s=.d))
DEPS		+=	$(addprefix $(DEF_DIR)/, $(CSRC:.c=.d))
DEPS		+=	$(addprefix $(DEF_DIR)/, $(CXXSRC:.cpp=.d))
LIB_DIR		:=	$(addprefix -L, $(LIB_DIR))
LIBS		:=	$(addprefix -l, $(LIB_NAME))
