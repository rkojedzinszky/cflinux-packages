# Makefile for djbdns
#
# Copyright (C) 2006 Richard Kojedzinszky <krichy@tvnetwork.hu>
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

PKG := djbdns
PKG_VERSION := 1.05
PKG_VERSION_SUFF := p1
SRC_FILENAME = $(PKG)-$(PKG_VERSION).tar.gz
EXTRACTED_DIR = $(PKG)-$(PKG_VERSION)
DOWNLOAD_SITES = http://cr.yp.to/djbdns \
	$(CFLINUX_SOURCES)

# where a compiled cflinux resides
CFLINUX_ROOT = ../../cflinux

all: build

include $(CFLINUX_ROOT)/cfpkg.mk

configure: patch $(CONFIGURED_STAMP)

$(CONFIGURED_STAMP):
	touch $(CONFIGURED_STAMP)

clean:
	-$(MAKE) -C $(PKG_ROOT) distclean
	rm -f $(BUILT_STAMP)
	rm -f $(CONFIGURED_STAMP)

build: configure $(BUILT_STAMP)

$(BUILT_STAMP):
	$(MAKE) -C $(PKG_ROOT) $(UC_PATH)
	touch $(BUILT_STAMP)

install: build check $(PKG_INSTALL_DIR)
	$(INSTALL) -d -m 755 $(PKG_INSTALL_DIR)/usr/local/
	$(INSTALL) -d -m 755 $(PKG_INSTALL_DIR)/usr/local/etc/
	$(MAKE) -C $(PKG_ROOT) setup PREFIX=$(PKG_INSTALL_DIR)

permissions: defaultperms

check:
#	$(MAKE) -C $(PKG_ROOT) check $(UC_PATH)

.PHONY: configure clean build install
