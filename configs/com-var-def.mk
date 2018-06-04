# ===============================================================
# 
# Release under GPLv2.
# 
# @file    common.mk
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    25/05 2018 15:48
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        25/05 2018      create the file
# 
#     last modified: 25/05 2018 15:48
# ===============================================================

# scale the maximum concurrency with the number of CPUs.
# # # An additional job is used in order to keep processors busy
# # # If the number of processors is not available, assume one.
PARALLEL_JOBS 	:= $(shell echo $$((1 + `getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1`)))

HOSTMAKE  		:= $(shell which make || echo make)
MAKE1  			:= $(HOSTMAKE) -j1
MAKE 			:= $(HOSTMAKE) -j1

# ------------------
# output information
# ------------------
MSG_CC 	?= CC
MSG_LD 	?= LD
MSG_LIB ?= LIB_COPY
MSG_INC ?= INC_COPY

# ----------------
# cmd redefinition
# ----------------
RM 		:= rm -rf
ECHO 	:= echo
MKDIR 	:= mkdir -p
LN 		:= ln -s
CP 		:= cp -ar
WGET   	:= wget
TAR 	:= tar

ADB_SHELL := adb shell
ADB_PUSH  := adb push

# ----------
# output dir
# ----------
OBJ_DIR ?= objs
LIB_DIR ?= lib
INC_DIR ?= include
SRC_DIR ?= src
TST_DIR ?= test
DEM_DIR ?= demo

BUILD 		:= x86_64-linux-gnu

ROOT 		:= $(shell pwd)
BUILD_DIR 	:= $(ROOT)/build
INSTALL_DIR := $(ROOT)/install

PREFIX  := $(INSTALL_DIR)

# --------
# compiler
# --------
CFLAGS 		:=
LIB_CFLAGS 	:=

#SYSTEM_32_64 	?= -m32

TARGET_SYSTEM   := x1800
#TARGET_SYSTEM   := xiaomi

#HOOK 		:= -DUSR_HOOK

ifeq ($(TARGET_SYSTEM), x1800)
	GCC_PATH 	:= /home/uos/office/ingenic/gcc/mips-gcc520-32bit/bin
	GCC_NAME 	:= mips-linux-gnu-
	HOST        := mips-linux-gnu

	CROSS_TOOL 	:= $(GCC_PATH)/$(GCC_NAME)

	DEVICE_TEST_PATH 	 	:= /usr/data/xia/base-lib
else
	ifeq ($(TARGET_SYSTEM), xiaomi)
		GCC_PATH 	:= /home/uos/office/xiaomi/gcc/toolchain-sunxi-musl/toolchain/bin
		GCC_NAME 	:= arm-openwrt-linux-
		HOST        := arm-linux

		CROSS_TOOL 	:= $(GCC_PATH)/$(GCC_NAME)
		CFLAGS 		+= -DNO_backtrace

		DEVICE_TEST_PATH 	 	:= /data/xia/base-lib
	else
		HOST 		:= $(BUILD)
	endif
endif

CFLAGS 	+= -Wno-error=missing-braces

CC 	 	:= $(CROSS_TOOL)gcc
CXX 	:= $(CROSS_TOOL)g++
STRIP  	:= $(CROSS_TOOL)strip

