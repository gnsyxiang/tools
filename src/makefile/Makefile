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

#
Q := @
RM 		:= $(Q)rm -rf
ECHO 	:= $(Q)echo
MKDIR 	:= $(Q)mkdir -p
LN 		:= $(Q)ln -s
CP 		:= $(Q)cp -ar
MSG_LD 	:= LD

#
# compiler
#
GCC_PATH := ~/Desktop/mips-gcc520-32bit/bin
GCC_NAME := mips-linux-gnu-

# CROSS_TOOL := $(GCC_PATH)/$(GCC_NAME)

CC := $(Q)$(CROSS_TOOL)gcc

#
# Compile options
#
C_DBG := -g
C_NODBG := -O2
C_INC := -I. -I../install/cunit-code/include

CFLAGS := $(C_INC)

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

