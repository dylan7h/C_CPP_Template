AUTO_CONF_DIR	:= include
DEFINES			:=

#============================================================
# Append #define Lists
#============================================================
define add_define
	$(eval DEFINES += $1=$2)
endef


#============================================================
# Make 'autoconf.h'
#============================================================
make_autoconf: mkdir
# Check if the file exists
	@IS_EXIST_DEF_FILE=$$(test -s $(DEF_DIR)/$(TARGET).def && echo -n y); 	\
	if [ "$${IS_EXIST_DEF_FILE}" != "y" ]; 									\
	then 																	\
		echo "$(DEFINES)" > $(DEF_DIR)/$(TARGET).def ; 						\
		IS_INVALIDATE_DEF=y ; 												\
	else 																	\
		DEFINES_FROM_FILE=$$(cat $(DEF_DIR)/$(TARGET).def) ; 				\
		if [ "$${DEFINES_FROM_FILE}" != "$(DEFINES)" ]; 					\
		then 																\
			IS_INVALIDATE_DEF=y ; 											\
		fi; 																\
	fi; 																	\
																			\
	if [ "$${IS_INVALIDATE_DEF}" = "y" ]; 									\
	then 																	\
		mkdir -p $(AUTO_CONF_DIR) ;											\
		rm -f $(AUTO_CONF_DIR)/autoconf.h;									\
		echo "#ifndef __AUTO_CONF_H__" > $(AUTO_CONF_DIR)/autoconf.h ;		\
		echo "#define __AUTO_CONF_H__" >> $(AUTO_CONF_DIR)/autoconf.h ;		\
		echo "#endif /* !__AUTO_CONF_H__ */" >> $(AUTO_CONF_DIR)/autoconf.h ;	\
	fi
