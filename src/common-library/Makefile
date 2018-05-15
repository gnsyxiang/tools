# ===============================================================
# 
# Release under GPLv2.
# 
# @file    Makefile
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    15/05 2018 14:08
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        15/05 2018      create the file
# 
#     last modified: 15/05 2018 14:08
# ===============================================================


#GCC_PATH 	:= ~/office/xiaomi/gcc/toolchain-sunxi-musl/toolchain/bin/
#GCC_NAME 	:= arm-openwrt-linux-

GCC_PATH 	:= ~/office/ingenic/gcc/mips-gcc520-32bit/bin
GCC_NAME 	:= mips-linux-gnu-

CROSS_TOOL 	:= $(GCC_PATH)/$(GCC_NAME)
CC 	 		:= $(CROSS_TOOL)gcc
CXX 		:= $(CROSS_TOOL)g++
STRIP  		:= $(CROSS_TOOL)strip


# zlib
ZLIB_DIR 	:= zlib
ZLIB_INFO 	:= download zlib src
ZLIB_NEW_RELEASE 	:= v1.2.9
ZLIB_GIT_PATH 	 	:= https://github.com/madler/zlib.git

# libffi
LIBFFI_DIR 	:= libffi
LIBFFI_INFO := download libffi src
LIBFFI_NEW_RELEASE 	:= v3.2.1
LIBFFI_GIT_PATH   	:= https://github.com/libffi/libffi.git


# 
ECHO 	:= echo
RM 		:= rm -rf
MKDIR 	:= mkdir -p

BUILD 	:= build
INSTALL := install






#all: $(ZLIB_DIR) $(LIBFFI_DIR)
all: prepare $(ZLIB_DIR)

prepare:
	$(MKDIR) $(BUILD) $(INSTALL)
	$(MKDIR) $(BUILD)/$(ZLIB_DIR)

# zlib
$(ZLIB_DIR): $(ZLIB_DIR)-src $(ZLIB_DIR)-configure $(ZLIB_DIR)-make

$(ZLIB_DIR)-make:
	cd $(BUILD)/$(ZLIB_DIR) \
		&& export CC=$(CC) \
		&& export CXX=$(CXX) \
		&& ../../zlib/configure --prefix=../../$(INSTALL) \
		&& make \
		&& make install
	
$(ZLIB_DIR)-configure:

$(ZLIB_DIR)-src:
	$(ECHO) $(ZLIB_INFO)
	git clone $(ZLIB_GIT_PATH)
	cd $(ZLIB_DIR) && git co -b dev $(ZLIB_NEW_RELEASE)

# libffi
$(LIBFFI_DIR):
	$(ECHO) $(LIBFFI_INFO)
	git clone $(LIBFFI_GIT_PATH)
	cd $(LIBFFI_DIR) && git co -b dev $(LIBFFI_NEW_RELEASE)

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
	$(RM) $(BUILD) $(INSTALL)

distclean: clean
	$(RM) $(ZLIB_DIR) $(LIBFFI_DIR)

.PHONY: all clean distclean

