# ===============================================================
# Filename: Makefile
# -------------------------------
# Copyright(C),
# Author: zhenquan.qiu
# Version: V1.0.0
# Last modified: 06/11 2017 23:01
# Description:
#
# Change Log:
# NO.	Author		    Date		Modified
# 00	zhenquan.qiu	06/11 2017
# ===============================================================
ROOT := $(shell pwd)

OBJ_DIR ?= objs
SRC_DIR ?= src

TARGET ?= cunit-code

#--------
#
#--------
Q := @
RM 		:= $(Q)rm -rf
ECHO 	:= $(Q)echo
MKDIR 	:= $(Q)mkdir -p
LN 		:= $(Q)ln -s
CP 		:= $(Q)cp -ar
MSG_LD 	:= LD

# --------
# compiler
# --------
# TARGET_SYSTEM   := x1800

ifeq ($(TARGET_SYSTEM), x1800)
	GCC_PATH := ~/office/ingenic/gcc/mips-gcc520-32bit/bin
	GCC_NAME := mips-linux-gnu-
else
endif

# CROSS_TOOL := $(GCC_PATH)/$(GCC_NAME)

AR 	    := $(Q)$(CROSS_TOOL)ar
AS 	    := $(Q)$(CROSS_TOOL)as
LD 	    := $(Q)$(CROSS_TOOL)ld
NM 	    := $(Q)$(CROSS_TOOL)nm
CC 	    := $(Q)$(CROSS_TOOL)gcc
GCC     := $(Q)$(CROSS_TOOL)gcc
CPP     := $(Q)$(CROSS_TOOL)cpp
CXX     := $(Q)$(CROSS_TOOL)g++
FC      := $(Q)$(CROSS_TOOL)gfortran
F77     := $(Q)$(CROSS_TOOL)gfortran
RANLIB  := $(Q)$(CROSS_TOOL)ranlib
READELF := $(Q)$(CROSS_TOOL)readelf
STRIP   := $(Q)$(CROSS_TOOL)strip
OBJCOPY := $(Q)$(CROSS_TOOL)objcopy
OBJDUMP := $(Q)$(CROSS_TOOL)objdump

PARALLEL_JOBS=`getconf _NPROCESSORS_ONLN`
# ---------------
# Compile options
# ---------------

DEBUG_CONTROL := debug

ifeq ($(DEBUG_CONTROL)X, debugX)
	C_DBG := -g
else
	C_DBG := -O2
endif
C_INC := -I. -I../install/cunit-code/include

CFLAGS := $(C_INC) $(C_DBG)

#
# link options
#
LD_LIBS := -lcunit
LD_PATH := -L../install/cunit-code/lib

LDFLAGS := $(LD_PATH) $(LD_LIBS)
# -------
# c files
# -------
SRC_C := $(wildcard $(SRC_DIR)/*/*.c)
OBJ_C := $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC_C))
DEP_C := $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.d, $(SRC_C))
DEPS  ?= $(DEP_C)
OBJS  ?= $(OBJ_C)

all: $(TARGET)

debug:
	$(ECHO) $(OBJ_C)

$(TARGET): $(OBJS)
	$(ECHO) $(MSG_LD) $<
	$(CC) $(OBJS) $(LDFLAGS) -o $@
#
# make *.c
#
$(OBJ_C): $(OBJ_DIR)/%.o : $(SRC_DIR)/%.c
	$(MKDIR) $(dir $@)
	$(ECHO) $(MSG_CC) $<
	$(CC) -c $(CFLAGS) $< -o $@

$(DEP_C): $(OBJ_DIR)/%.d : $(SRC_DIR)/%.c
	$(MKDIR) $(dir $@);
	$(CC) -MM $(CFLAGS) -MT $(@:%.d=%.o) $< >$@

sinclude $(DEPS)

clean:
	$(RM) $(OBJS)
	$(RM) $(DEPS)
	$(RM) $(TARGET)

index-clean:
	$(RM) *.out
	$(RM) tags

index: index-clean
	$(ECHO) generate index
	$(Q)ctags -R
	$(Q)cscope -Rbkq

distclean: clean index-clean
	$(RM) $(OBJ_DIR)
	$(RM) $(LIB_DIR)


.PHONY: all clean distclean debug

