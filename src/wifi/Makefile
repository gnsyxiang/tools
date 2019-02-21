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

include ../../configs/com-var-def.mk
include ../../configs/com-ruler-def.mk

HOSTAPD_NEW_RELEASE := hostapd-2.6
HOSTAPD_FTP_PATH 	:= http://w1.fi/releases

WPA_NEW_RELEASE 	:= wpa_supplicant-2.6
WPA_FTP_PATH 		:= http://w1.fi/releases

LIBNL_NEW_RELEASE 	:= libnl-3.2.25
LIBNL_FTP_PATH   	:= http://www.infradead.org/~tgr/libnl/files

OPENSSL_NEW_RELEASE := openssl-1.0.2n
OPENSSL_FTP_PATH  	:= https://www.openssl.org/source/old/1.0.2

#################################################################
#all: prepare $(LIBNL_NEW_RELEASE) $(HOSTAPD_NEW_RELEASE) $(WPA_NEW_RELEASE)
all: prepare $(OPENSSL_NEW_RELEASE) $(HOSTAPD_NEW_RELEASE) $(WPA_NEW_RELEASE)

prepare:
	$(MAKE1) clean
	$(MKDIR) $(BUILD_DIR) $(INSTALL_DIR)

$(HOSTAPD_NEW_RELEASE): $(HOSTAPD_NEW_RELEASE)-src
#$(HOSTAPD_NEW_RELEASE): $(HOSTAPD_NEW_RELEASE)-src $(HOSTAPD_NEW_RELEASE)-make

$(HOSTAPD_NEW_RELEASE)-make:
	$(MKDIR) $(BUILD_DIR)/$(@:-make=)
	cd $(BUILD_DIR)/$(@:-make=) \
		&& $(ROOT)/$(@:-make=)/configure --host=$(HOST) --prefix=$(PREFIX) CC=$(CC) --enable-shared --disable-python \
		&& $(MAKE) && make install \
		&& $(STRIP) --strip-unneeded $(INSTALL_DIR)/lib/libasound.so.2.0.0

$(HOSTAPD_NEW_RELEASE)-src:
ifneq ($(HOSTAPD_NEW_RELEASE), $(wildcard $(HOSTAPD_NEW_RELEASE)))
	$(WGET) $(HOSTAPD_FTP_PATH)/$(@:-src=).tar.gz
	$(TAR_GZ) $(@:-src=).tar.gz
	$(RM) $(@:-src=).tar.gz
endif

##### wpa_supplicant
$(WPA_NEW_RELEASE): $(WPA_NEW_RELEASE)-src

$(WPA_NEW_RELEASE)-src:
ifneq ($(WPA_NEW_RELEASE), $(wildcard $(WPA_NEW_RELEASE)))
	$(WGET) $(WPA_FTP_PATH)/$(@:-src=).tar.gz
	$(TAR_GZ) $(@:-src=).tar.gz
	$(RM) $(@:-src=).tar.gz
endif

##### libnl
$(LIBNL_NEW_RELEASE): $(LIBNL_NEW_RELEASE)-src $(LIBNL_NEW_RELEASE)-make

$(LIBNL_NEW_RELEASE)-make:
	$(MKDIR) $(BUILD_DIR)/$(@:-make=)
	cd $(BUILD_DIR)/$(@:-make=) \
		&& $(ROOT)/$(@:-make=)/configure --host=$(HOST) --prefix=$(PREFIX) CC=$(CC) \
		&& $(MAKE) && make install

$(LIBNL_NEW_RELEASE)-src:
ifneq ($(LIBNL_NEW_RELEASE), $(wildcard $(LIBNL_NEW_RELEASE)))
	$(WGET) $(LIBNL_FTP_PATH)/$(@:-src=).tar.gz
	$(TAR_GZ) $(@:-src=).tar.gz
	$(RM) $(@:-src=).tar.gz
endif

##### openssl
$(OPENSSL_NEW_RELEASE): $(OPENSSL_NEW_RELEASE)-src $(OPENSSL_NEW_RELEASE)-make

$(OPENSSL_NEW_RELEASE)-make:
	$(MKDIR) $(BUILD_DIR)/$(@:-make=)
	cd $(BUILD_DIR)/$(@:-make=) \
		&& export CC=$(CC) export PLATFORM=mips \
		&& $(ROOT)/$(@:-make=)/config --prefix=$(PREFIX) \
		&& $(MAKE) && make install

$(OPENSSL_NEW_RELEASE)-src:
ifneq ($(OPENSSL_NEW_RELEASE), $(wildcard $(OPENSSL_NEW_RELEASE)))
	$(WGET) $(OPENSSL_FTP_PATH)/$(@:-src=).tar.gz
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
	$(RM) $(WPA_NEW_RELEASE) $(HOSTAPD_NEW_RELEASE)

.PHONY: all clean distclean

