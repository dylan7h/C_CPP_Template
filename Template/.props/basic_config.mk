#============================================================
# Include 'function.mk'
#============================================================
include $(CURDIR)/.props/function.mk


#============================================================
# Set Configurations
#============================================================


# Build Mode( debug | release )
BUILD_MODE			:=	debug

# Display Build Log( 0 | 1 )
BUILD_VERBOSE		:=	0

# C Standard Version
C_STANDARD_VER		:= 	gnu89
CXX_STANDARD_VER	:= 	c++14

# Instruction Set(32 | 64)
INSTRUCTION_SET		:=	64


#============================================================
# Set Compile & Link Options by Configurations
#============================================================
COMMON_FLAGS		:= -m$(INSTRUCTION_SET) -W -Wall -pedantic-errors -MMD -MP
CFLAGS				:= $(COMMON_FLAGS) -std=$(C_STANDARD_VER) 
CXXFLAGS			:= $(COMMON_FLAGS) -std=$(CXX_STANDARD_VER)
LDFLAGS				:= 


# Type Of Build
ifeq ($(BUILD_MODE), debug)
	CFLAGS			+= -g
	CXXFLAGS		+= -g
	LDFLAGS			+= -g

$(call add_define,DEBUG)
$(call add_define,_DEBUG)
else ifeq ($(BUILD_MODE), release)
	CFLAGS			+= -O2
	CXXFLAGS		+= -O2
	LDFLAGS			+= -O2 -static
else
	#error "Invalid BUILD_MODE"
endif


# Display Build Logs
ifeq ($(BUILD_VERBOSE), 0)
	V				:=	@
endif


# Dependency Of OS Platform
ifeq ($(OS),Windows_NT)
	FILE_EXT		:=	exe
else
	FILE_EXT		:=	elf
endif
