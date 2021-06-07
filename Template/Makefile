#============================================================
# Target Name
#============================================================
TARGET_DIR	:=	$(CURDIR)
TARGET		:=	$(notdir $(CURDIR))


#============================================================
# Include Build Environments
#============================================================
include $(CURDIR)/.props/toolchain.mk
include $(CURDIR)/.props/config.mk
include $(CURDIR)/.props/path.mk


#============================================================
# Default Make Target
#============================================================
all: $(ASM_DIR)/$(TARGET).asm
	

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
$(ELF_DIR)/$(TARGET).$(FILE_EXT): mkdir $(DEPS) $(OBJS)
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
# Make dependency files
#============================================================
# From *.s files
$(DEF_DIR)/%.d: %.s
	@mkdir -p $(dir $@)
	$(V)$(CC) $(INCS) $(CFLAGS) -M $< > $@

# From *.c files
$(DEF_DIR)/%.d: %.c
	@mkdir -p $(dir $@)
	$(V)$(CC) $(INCS) $(CFLAGS) -M $< > $@

# From *.cpp files
$(DEF_DIR)/%.d: %.cpp
	@mkdir -p $(dir $@)
	$(V)$(CXX) $(INCS) $(CXXFLAGS) -M $< > $@

#============================================================
# Compile Source files
#============================================================
# From *.s files
$(OBJ_DIR)/%.o:	%.s
	@mkdir -p $(dir $@)
	@printf "%-10s $<\n" "AS"
	$(V)$(CC) $(INCS) $(CFLAGS) -c $< -o $@ -MMD -MF $(DEF_DIR)/$*.d

# From *.c files
$(OBJ_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	@printf "%-10s $<\n" "CC"
	$(V)$(CC) $(INCS) $(CFLAGS) -c $< -o $@ -MMD -MF $(DEF_DIR)/$*.d

# From *.cpp files
$(OBJ_DIR)/%.o: %.cpp
	@mkdir -p $(dir $@)
	@printf "%-10s $<\n" "CXX"
	$(V)$(CXX) $(INCS) $(CXXFLAGS) -c $< -o $@ -MMD -MF $(DEF_DIR)/$*.d


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
