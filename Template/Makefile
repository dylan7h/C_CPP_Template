#============================================================
# Target Name
#============================================================
TARGET_DIR	:=	$(CURDIR)
TARGET		:=	$(notdir $(CURDIR))


#============================================================
# Include Build Environments
#============================================================
include $(CURDIR)/.props/path.mk
include $(CURDIR)/.props/toolchain.mk
include $(CURDIR)/.props/basic_config.mk


#============================================================
# Default Make Target
#============================================================
all: mkdir make_autoconf $(ASM_DIR)/$(TARGET).asm
	

#============================================================
# Clean Target
#============================================================
clean:
	@printf "%-10s Product of $(TARGET)\n" "RM"
	$(V)rm -rf $(OBJ_DIR)/*
	$(V)rm -rf $(DEF_DIR)/*
	$(V)rm -rf $(ELF_DIR)/$(TARGET).$(FILE_EXT)
	$(V)rm -rf $(MAP_DIR)/$(TARGET).map
	$(V)rm -rf $(ASM_DIR)/$(TARGET).asm

#============================================================
# Run Target
#============================================================
run: all
	$(ELF_DIR)/$(TARGET).$(FILE_EXT)


#============================================================
# Link Object files --> Make ELF File
#============================================================
$(ELF_DIR)/$(TARGET).$(FILE_EXT): $(OBJS)
	@printf "%-10s $@\n" "LD"
	$(V)$(CXX) -o $@ $(OBJS) $(LIB_DIR) $(LIBS) -Wl,-Map=$(MAP_DIR)/$(TARGET).map $(LDFLAGS)


#============================================================
# Extract Assembly File
#============================================================
$(ASM_DIR)/$(TARGET).asm: $(ELF_DIR)/$(TARGET).$(FILE_EXT)
	@printf "%-10s $@\n" "OD"
	$(V)$(OD) -d $< > $@


#============================================================
# Make Directories
#============================================================
mkdir:
	@echo check build directoies...
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(OBJ_DIR)
	@mkdir -p $(DEF_DIR)
	@mkdir -p $(ELF_DIR)
	@mkdir -p $(MAP_DIR)
	@mkdir -p $(ASM_DIR)


#============================================================
# Compile Source files
#============================================================
# From *.s files
$(OBJ_DIR)/%.o:	%.s
	@mkdir -p $(dir $@)
	@printf "%-10s $<\n" "AS"
	$(V)$(CC) $(INCS) $(CFLAGS) -c $< -o $@ 

# From *.c files
$(OBJ_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	@printf "%-10s $<\n" "CC"
	$(V)$(CC) $(INCS) $(CFLAGS) -c $< -o $@

# From *.cpp files
$(OBJ_DIR)/%.o: %.cpp
	@mkdir -p $(dir $@)
	@printf "%-10s $<\n" "CXX"
	$(V)$(CXX) $(INCS) $(CXXFLAGS) -c $< -o $@


#============================================================
# Make 'autoconf.h'
#============================================================
make_autoconf:
# Check if the file exists
	@IS_EXIST_DEF_FILE=$$(test -s $(DEF_DIR)/$(TARGET).def && echo -n y); 							\
	if [ "$${IS_EXIST_DEF_FILE}" != "y" ]; 															\
	then 																							\
		echo "$(DEFINES)" > $(DEF_DIR)/$(TARGET).def; 												\
		IS_INVALIDATE_DEF=y; 																		\
	else 																							\
		DEFINES_FROM_FILE=$$(cat $(DEF_DIR)/$(TARGET).def); 										\
		if [ "$${DEFINES_FROM_FILE}" != "$(DEFINES)" ]; 											\
		then 																						\
			IS_INVALIDATE_DEF=y; 																	\
		fi; 																						\
	fi; 																							\
																									\
	if [ "$${IS_INVALIDATE_DEF}" = "y" ]; 															\
	then 																							\
		echo "Generating 'autodonfig.h'...";														\
		mkdir -p $(AUTO_CONF_DIR);																	\
		rm -f $(AUTO_CONF_DIR)/autoconf.h;															\
		echo "#ifndef __AUTO_CONF_H__" > $(AUTO_CONF_DIR)/autoconf.h;								\
		echo "#define __AUTO_CONF_H__\n" >> $(AUTO_CONF_DIR)/autoconf.h;							\
		for ITEM in $(DEFINES); 																	\
		do 																							\
			DEFINE_SYMBOL=$${ITEM%%=*}; 															\
			DEFINE_VALUE=$${ITEM##*=}; 																\
			echo "#ifndef $${DEFINE_SYMBOL}" >> $(AUTO_CONF_DIR)/autoconf.h;						\
			if [ -z $${DEFINE_VALUE} ];														 		\
			then 																					\
				echo "#define $${DEFINE_SYMBOL}" >> $(AUTO_CONF_DIR)/autoconf.h;					\
			else																					\
				echo "#define $${DEFINE_SYMBOL} ($${DEFINE_VALUE})" >> $(AUTO_CONF_DIR)/autoconf.h;	\
			fi;																						\
			echo "#endif /* !$${DEFINE_SYMBOL} */\n" >> $(AUTO_CONF_DIR)/autoconf.h;				\
		done; 																						\
		echo "#endif /* !__AUTO_CONF_H__ */" >> $(AUTO_CONF_DIR)/autoconf.h;						\
		echo "Generating is done!";																	\
	fi


#============================================================
# Debug Information
#============================================================
info:
	$(info INCS     : $(INCS))
	$(info LDS      : $(LDS))
	$(info ASRC     : $(ASRC))
	$(info CSRC     : $(CSRC))
	$(info OBJS     : $(OBJS))
	$(info DEPS     : $(DEPS))
	$(info LIB_DIR  : $(LIB_DIR))
	$(info LIBS     : $(LIBS))
	$(info AFLAGS   : $(AFLAGS))
	$(info CFLAGS   : $(CFLAGS))
	$(info LDFLAGS  : $(LDFLAGS))

