# Makefile for perl
#
# Copyright (C) 2004 Richard Kojedzinszky <krichy@tvnetwork.hu>
# All rights reserved.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

PKG := openssl
PKG_VERSION := 0.9.7i

# where a compiled cflinux resides
CFLINUX_ROOT = ../../cflinux

all:

include $(CFLINUX_ROOT)/cfpkg.mk

PKG_ROOT := $(CFLINUX_ROOT)/build/openssl
BUILT_STAMP := $(PKG_ROOT)/apps/.openssl.built

configure:

build: $(BUILT_STAMP)

$(BUILT_STAMP):
	$(MAKE) -C $(PKG_ROOT)/apps SHARED_LIBS=y openssl $(UC_PATH) \
		CFLAG=
	touch $(BUILT_STAMP)

install: build $(PKG_INSTALL_DIR)
	-mkdir -p $(PKG_INSTALL_DIR)/usr/local/bin
	$(INSTALL_BIN) $(PKG_ROOT)/apps/openssl $(PKG_INSTALL_DIR)/usr/local/bin/

.PHONY: configure clean build install
