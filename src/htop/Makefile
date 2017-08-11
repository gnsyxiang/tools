# ===============================================================
# Filename: Makefile
# -------------------------------
# Copyright(C),
# Author: zhenquan.qiu
# Version: V1.0.0
# Last modified: 10/08 2017 23:55
# Description:
#
# Change Log:
# NO.	Author		    Date		Modified
# 00	zhenquan.qiu	10/08 2017
# ===============================================================
ROOT := $(shell pwd)

DEPEND_LIB      := ncurses
TARGET          := htop

BUILD_DIR 		:= $(ROOT)/build
INSTALL 		:= $(ROOT)/install

BUILD_NCURSES   := $(BUILD_DIR)/$(DEPEND_LIB)
BUILD_HTOP      := $(BUILD_DIR)/$(TARGET)

PREFIX       	:= $(INSTALL)/$(TARGET)

BUILD 			:= x86_64-linux-gnu
TARGET_SYSTEM   := x1800

ifeq ($(TARGET_SYSTEM), x1800)
	MIPS_GCC 	:= /home/uos/office/ingenic/gcc/mips-gcc520-32bit/bin/mips-linux-gnu-
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


all: clean ncurses ncurses-install htop htop-install
	@echo "------------------------------------"
	@echo "compile successful ..."
	@echo "------------------------------------"

clean:
	@rm -rf $(BUILD_DIR)
	@rm -rf $(INSTALL)

#------------------------------------
# ncurses
#------------------------------------
ncurses: ncurses-config
	cd $(BUILD_NCURSES) && make -j $(PARALLEL_JOBS)

ncurses-config:
	@mkdir -p $(BUILD_NCURSES)
	cd $(BUILD_NCURSES) && \
	../../ncurses/configure \
		--prefix=$(PREFIX)  \
		--build=$(BUILD) \
        --host=$(HOST) \
        --without-cxx \
        --without-cxx-binding \
        --without-ada \
        --without-manpages \
        --without-progs \
        --without-tests \
        --with-shared

ncurses-install:
	@mkdir -p $(PREFIX)
	cd $(BUILD_NCURSES) && make install


#------------------------------------
# htop
#------------------------------------
htop: htop-config
	cd $(BUILD_HTOP) && make -j $(PARALLEL_JOBS)

htop-config:
	@mkdir -p $(BUILD_HTOP)
	cd ./htop && ./autogen.sh
	cd $(BUILD_HTOP) && \
	../../htop/configure \
		--prefix=$(PREFIX) \
		--build=$(BUILD) \
        --host=$(HOST) \
        --disable-unicode \
        LDFLAGS=-L$(PREFIX)/lib \
        CPPFLAGS=-I$(PREFIX)/include

htop-install:
	@mkdir -p $(PREFIX)
	cd $(BUILD_HTOP) && make install

debug:
	echo $(PARALLEL_JOBS)


