AUTO_CONF_DIR	:= include
DEFINES			:=

#============================================================
# Append #define Lists
#============================================================
define add_define
	$(eval DEFINES += $1=$2)
endef
