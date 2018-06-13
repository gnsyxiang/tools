# ===============================================================
# 
# Release under GPLv2.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    13/06 2018 16:49
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        13/06 2018      create the file
# 
#     last modified: 13/06 2018 16:49
# ===============================================================

include ../../configs/com-var-def.mk
include ../../configs/com-ruler-def.mk

GDB_NEW_RELEASE 	:= gdb-7.12
GDB_FTP_PATH 		:= http://ftp.gnu.org/gnu/gdb

#################################################################
all: prepare $(GDB_NEW_RELEASE)

prepare:
	$(MAKE1) clean
	$(MKDIR) $(BUILD_DIR) $(INSTALL_DIR)

$(GDB_NEW_RELEASE): $(GDB_NEW_RELEASE)-src $(GDB_NEW_RELEASE)-make

$(GDB_NEW_RELEASE)-make:
	$(MKDIR) $(BUILD_DIR)/$(@:-make=)
	cd $(BUILD_DIR)/$(@:-make=) \
		&& $(ROOT)/$(@:-make=)/configure --host=$(BUILD) --prefix=$(PREFIX) \
		&& $(MAKE) && make install
	cd $(BUILD_DIR)/$(@:-make=) \
		&& $(ROOT)/$(@:-make=)/gdb/gdbserver/configure --host=$(HOST) --prefix=$(PREFIX) CC=$(CC) --program-prefix=$(PROGRAM_PREFIX) \
		&& $(MAKE) && make install

$(GDB_NEW_RELEASE)-src:
	$(ECHO) $(DOWNLOAD_INFO)
ifneq ($(GDB_NEW_RELEASE), $(wildcard $(GDB_NEW_RELEASE)))
	$(WGET) $(GDB_FTP_PATH)/$(@:-src=).tar.gz
	$(TAR_GZ) $(@:-src=).tar.gz
	$(RM) $(@:-src=).tar.gz
endif

#################################################
err_no_targets:
	@echo "error: use \"targets = your_target\" to specify your target to make!"
	exit 1

ifeq ($(V),1)
slient_targets=err_no_targets
endif

.SILENT: $(slient_targets)
#################################################

clean:
	$(RM) $(BUILD_DIR) $(INSTALL_DIR)

distclean: clean
	$(RM) $(GDB_NEW_RELEASE)

.PHONY: all clean distclean

