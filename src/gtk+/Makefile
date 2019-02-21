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

# scale the maximum concurrency with the number of CPUs.
# # An additional job is used in order to keep processors busy
# # If the number of processors is not available, assume one.
PARALLEL_JOBS 	:= $(shell echo $$((1 + `getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1`)))

HOSTMAKE  		:= $(shell which make || echo make)
MAKE1  			:= $(HOSTMAKE) -j1
MAKE 			:= $(HOSTMAKE) -j$(PARALLEL_JOBS)

BUILD 			:= x86_64-linux-gnu
TARGET_SYSTEM   := x1800

ifeq ($(TARGET_SYSTEM), x1800)
	GCC_PATH 	:= /home/uos/office/ingenic/gcc/mips-gcc520-32bit/bin
	GCC_NAME 	:= mips-linux-gnu-

	HOST        := mips-linux-gnu
else
	HOST 		:= $(BUILD)
endif

CROSS_TOOL 	:= $(GCC_PATH)/$(GCC_NAME)
CC 	 		:= $(CROSS_TOOL)gcc
CXX 		:= $(CROSS_TOOL)g++
STRIP  		:= $(CROSS_TOOL)strip

# 
ECHO 	:= echo
RM 		:= rm -rf
MKDIR 	:= mkdir -p
DOWNLOAD_INFO := download src

ROOT 		:= $(shell pwd)
BUILD_DIR 	:= $(ROOT)/build
INSTALL_DIR := $(ROOT)/install

PREFIX  	:= $(INSTALL_DIR)
PKGCONFIG 	:= $(PREFIX)/lib/pkgconfig

# glib info
GLIB_DIR 	:= glib
GLIB_NEW_RELEASE 	:= 2.54.3
GLIB_GIT_PATH 	 	:= https://github.com/GNOME/glib.git

LIBFFI_DIR 	:= libffi
LIBFFI_NEW_RELEASE 	:= v3.2.1
LIBFFI_GIT_PATH   	:= https://github.com/libffi/libffi.git

UTIL_LINUX_DIR := util-linux
UTIL_LINUX_RELEASE 	:= v2.27.1
UTIL_LINUX_GIT_PATH := https://github.com/karelzak/util-linux.git

NCURSES_DIR := ncurses
NCURSES_RELEASE 	:= 
NCURSES_GIT_PATH 	:= https://github.com/mirror/ncurses.git

#all: prepare $(LIBFFI_DIR) $(UTIL_LINUX_DIR) $(GLIB_DIR)
all: prepare 



prepare:
	$(MKDIR) $(BUILD_DIR) $(INSTALL_DIR)

$(UTIL_LINUX_DIR): $(UTIL_LINUX_DIR)-make

$(UTIL_LINUX_DIR)-src:
	$(ECHO) $(DOWNLOAD_INFO)
ifneq ($(UTIL_LINUX_DIR), $(wildcard $(UTIL_LINUX_DIR)))
	git clone $(UTIL_LINUX_GIT_PATH)
	cd $(@:-src=) && git co -b dev $(UTIL_LINUX_RELEASE)
endif

$(UTIL_LINUX_DIR)-make:
	$(MKDIR) $(BUILD_DIR)/$(@:-make=)
ifneq ($(UTIL_LINUX_DIR)/configure, $(wildcard $(UTIL_LINUX_DIR)/configure))
	cd $(@:-make=) && ./autogen.sh
endif
	cd $(BUILD_DIR)/$(@:-make=) \
		&& $(ROOT)/$(@:-make=)/configure --host=$(HOST) --prefix=$(PREFIX) CC=$(CC) \
		&& $(MAKE) && make install

#$(GLIB_DIR): $(GLIB_DIR)-src
$(GLIB_DIR): $(GLIB_DIR)-src $(GLIB_DIR)-make

$(GLIB_DIR)-src:
	$(ECHO) $(DOWNLOAD_INFO)
ifneq ($(GLIB_DIR), $(wildcard $(GLIB_DIR)))
	git clone $(GLIB_GIT_PATH)
	cd $(@:-src=) && git co -b dev $(GLIB_NEW_RELEASE)
endif

COM_LIB_DIR 	:= ../common-library/install

LIBFFI_CFLAGS 	:= '-I$(INSTALL_DIR)/include' 
LIBFFI_LIBS  	:= '-lffi -L$(INSTALL_DIR)/lib' 
ZLIB_CFLAGS 	:= '-I$(COM_LIB_DIR)/include'
ZLIB_LIBS 		:= '-lz -L$(COM_LIB_DIR)/lib'

$(GLIB_DIR)-make:
	$(MKDIR) $(BUILD_DIR)/$(@:-make=)
ifneq ($(GLIB_DIR)/configure, $(wildcard $(GLIB_DIR)/configure))
	cd $(@:-make=) && ./autogen.sh
endif
	cd $(BUILD_DIR)/$(@:-make=) \
		&& $(ROOT)/$(@:-make=)/configure --host=$(HOST) --prefix=$(PREFIX) PKG_CONFIG_PATH=$(PKGCONFIG) CC=$(CC) CXX=$(CXX) \
		   LIBFFI_CFLAGS=$(LIBFFI_CFLAGS) LIBFFI_LIBS=$(LIBFFI_LIBS) ZLIB_CFLAGS=$(ZLIB_CFLAGS) ZLIB_LIBS=$(ZLIB_LIBS) \
		   glib_cv_stack_grows=no glib_cv_uscore=yes ac_cv_func_posix_getpwuid_r=yes ac_cv_func_posix_getgrgid_r=yes \
		&& $(MAKE) && make install

##########################################################################
#
# libffi: libffi用于高级语言之间的相互调用。
#         1, 由于函数指针，参数类型，参数个数，参数的值都可以在运行时指定，
#            所以在脚本语言调用c里面用的比较多，比如python 的ctypes；
#         2, 也可以调用不同abi(应用程序二进制接口)编译的程序
#
##########################################################################
$(LIBFFI_DIR): $(LIBFFI_DIR)-src $(LIBFFI_DIR)-make

$(LIBFFI_DIR)-src:
	$(ECHO) $(DOWNLOAD_INFO)
ifneq ($(LIBFFI_DIR), $(wildcard $(LIBFFI_DIR)))
	git clone $(LIBFFI_GIT_PATH)
	cd $(@:-src=) && git co -b dev $(LIBFFI_NEW_RELEASE)
endif

$(LIBFFI_DIR)-make:
	$(MKDIR) $(BUILD_DIR)/$(@:-make=)
ifneq ($(LIBFFI_DIR)/configure, $(wildcard $(LIBFFI_DIR)/configure))
	cd $(@:-make=) && ./autogen.sh
endif
	cd $(BUILD_DIR)/$(@:-make=) \
		&& $(ROOT)/$(@:-make=)/configure --host=$(HOST) --prefix=$(PREFIX) CC=$(CC) CXX=$(CXX) \
		&& $(MAKE) && make install

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
	$(RM) $(GLIB_DIR) $(LIBFFI_DIR)

.PHONY: all clean distclean

