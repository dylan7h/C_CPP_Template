#============================================================
# Set Configurations
#============================================================
# File Extension
FILE_EXT		:=	elf

# Build Mode( debug | release )
BUILD_MODE		:=	debug

# Display Build Log( 0 | 1 )
BUILD_VERBOSE	:=	0

# C Standard Version
C_STANDARD_VER		:= 	99
CXX_STANDARD_VER	:= 	17

# Instruction Set(32 | 64)
INSTRUCTION_SET	:=	64

#============================================================
# Set Compile & Link Options by Configurations
#============================================================
CFLAGS			:= -m$(INSTRUCTION_SET) -std=c$(C_STANDARD_VER) -Wall -pedantic
CXXFLAGS		:= -m$(INSTRUCTION_SET) -std=c++$(CXX_STANDARD_VER) -Wall -pedantic
LDFLAGS			:= -static

ifeq ($(BUILD_MODE), debug)
	CFLAGS		+= -g
	CXXFLAGS	+= -g
	LDFLAGS		+= -g
else ifeq ($(BUILD_MODE), release)
	CFLAGS		+= -O2
	CXXFLAGS	+= -O2
	LDFLAGS		+= -O2
else
	#error "Invalid BUILD_MODE"
endif

ifeq ($(BUILD_VERBOSE), 0)
	V			:=	@
endif
