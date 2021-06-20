#============================================================
# Include 'function.mk'
#============================================================
include $(CURDIR)/.props/function.mk


#============================================================
# Set Configurations
#============================================================
# Build Type( exe | lib )
BUILD_TYPE			:= 	exe

# Build Type( static | shared )
LIB_TYPE			:= 	static

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
ARFLAGS				:=


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
	EXE_EXT			:=	exe
	STATIC_LIB_EXT	:= 	lib
	SHARED_LIB_EXT	:= 	dll
else
	EXE_EXT			:=	elf
	STATIC_LIB_EXT	:= 	a
	SHARED_LIB_EXT	:= 	so
endif



# Set Build Type
ifeq ($(BUILD_TYPE),exe)
	FILE_EXT		:=	$(EXE_EXT)
else
	TARGET_PREFIX	:=	lib

ifeq ($(LIB_TYPE),static)
	FILE_EXT		:=	$(STATIC_LIB_EXT)
	ARFLAGS			+=	rcs
else
	FILE_EXT		:=	$(SHARED_LIB_EXT)
	CFLAGS			+= 	-fPIC
	CXXFLAGS		+=	-fPIC
	ARFLAGS			+=	-shared
endif

endif
