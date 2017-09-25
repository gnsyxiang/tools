# ===============================================================
# Filename: Makefile
# -------------------------------
# Copyright(C),
# Author: zhenquan.qiu
# Version: V1.0.0
# Last modified: 25/09 2017 17:29
# Description:
#
# Change Log:
# NO.	Author		    Date		Modified
# 00	zhenquan.qiu	25/09 2017
# ===============================================================
ROOT := $(shell pwd)

TARGET          := doxygen

BUILD_DIR 		:= $(ROOT)/build
INSTALL 		:= $(ROOT)/install
SRC_DIR         := $(ROOT)/$(TARGET)

BUILD_HTOP      := $(BUILD_DIR)/$(TARGET)

PREFIX       	:= $(INSTALL)/$(TARGET)

BUILD 			:= x86_64-linux-gnu
# TARGET_SYSTEM   := x1800

ifeq ($(TARGET_SYSTEM), x1800)
	MIPS_GCC 	:= /home/uso/Desktop/mips-gcc520-32bit/bin/mips-linux-gnu-
	HOST        := mips-linux-gnu
else
	HOST 		:= $(BUILD)
endif

export AR 	   := $(MIPS_GCC)ar
export AS 	   := $(MIPS_GCC)as
export LD 	   := $(MIPS_GCC)ld
export NM 	   := $(MIPS_GCC)nm
export CC 	   := $(MIPS_GCC)gcc
export GCC     := $(MIPS_GCC)gcc
export CPP     := $(MIPS_GCC)cpp
export CXX     := $(MIPS_GCC)g++
export FC      := $(MIPS_GCC)gfortran
export F77     := $(MIPS_GCC)gfortran
export RANLIB  := $(MIPS_GCC)ranlib
export READELF := $(MIPS_GCC)readelf
export STRIP   := $(MIPS_GCC)strip
export OBJCOPY := $(MIPS_GCC)objcopy
export OBJDUMP := $(MIPS_GCC)objdump

PARALLEL_JOBS=`getconf _NPROCESSORS_ONLN`


all: clean doxygen doxygen-install
	@echo "------------------------------------"
	@echo "compile successful ..."
	@echo "------------------------------------"

clean:
	@rm -rf $(TARGET)
	@rm -rf $(BUILD_DIR)
	@rm -rf $(INSTALL)

#------------------------------------
# doxygen
#------------------------------------
doxygen: doxygen-config
	cd $(BUILD_HTOP) && make -j $(PARALLEL_JOBS)

doxygen-config: doxygen-src-download
	@mkdir -p $(BUILD_HTOP)
	cd $(TARGET) && git checkout -b Release_1_8_13 Release_1_8_13
	cd $(BUILD_HTOP) && \
		cmake -G "Unix Makefiles" $(SRC_DIR) -DCMAKE_INSTALL_PREFIX=$(INSTALL)

doxygen-src-download:
	@echo "--------------------"
	@echo "download the doxygen"
	@echo "--------------------"
	git clone https://github.com/doxygen/doxygen.git

doxygen-install:
	@mkdir -p $(PREFIX)
	cd $(BUILD_HTOP) && make install

debug:
	echo $(PARALLEL_JOBS)


