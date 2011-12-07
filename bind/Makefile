# Makefile for bind9
#
# Copyright (C) 2007 Richard Kojedzinszky <krichy@tvnetwork.hu>
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

PKG := bind
PKG_VERSION := 9.8.1-P1
PKG_VERSION_SUFF :=
SRC_FILENAME = $(PKG)-$(PKG_VERSION).tar.gz
EXTRACTED_DIR = $(PKG)-$(PKG_VERSION)
DOWNLOAD_SITES = http://ftp.isc.org/isc/bind9/$(PKG_VERSION) \
		 $(CFLINUX_PACKAGES)

# where a compiled cflinux resides
CFLINUX_ROOT = ../../cflinux

all: build

include $(CFLINUX_ROOT)/cfpkg.mk

configure: patch $(CONFIGURED_STAMP)

$(CONFIGURED_STAMP):
	cd $(PKG_ROOT) && \
		$(UC_PATH) BUILD_CC=gcc ./configure \
		--host=$(TARGET_HOST) \
		--prefix=/usr/local \
		--localstatedir=/var/run/bind \
		--sysconfdir=/usr/local/etc/bind \
		--enable-shared \
		--enable-static \
		--with-libtool \
		--enable-epoll \
		--with-gost=no \
		--with-randomdev=/dev/random
	touch $(CONFIGURED_STAMP)

clean:
	-$(MAKE) -C $(PKG_ROOT) distclean
	rm -f $(BUILT_STAMP)
	rm -f $(CONFIGURED_STAMP)

build: configure $(BUILT_STAMP)

$(BUILT_STAMP):
	$(MAKE) -C $(PKG_ROOT) all $(UC_PATH)
	touch $(BUILT_STAMP)

install: build $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_ROOT) \
		install DESTDIR=$(PKG_INSTALL_DIR) $(UC_PATH)
	rm -rf $(PKG_INSTALL_DIR)/usr/local/include $(PKG_INSTALL_DIR)/usr/local/share $(PKG_INSTALL_DIR)/var
	find $(PKG_INSTALL_DIR)/usr/local/lib -name '*.la' -print0 | xargs -r0 rm
	find $(PKG_INSTALL_DIR)/usr/local/lib -name '*.a' -print0 | xargs -r0 rm
	-find $(PKG_INSTALL_DIR)/usr/local/{bin,sbin} -type f -print0 | xargs -r0 strip -s
	-find $(PKG_INSTALL_DIR)/usr/local/lib -name '*.so' -print0 | xargs -r0 strip -s

	install -m 750 -d $(PKG_INSTALL_DIR)/usr/local/etc/bind
	install -m 640 named.conf.sample db.root db.local db.0 db.127 db.255 $(PKG_INSTALL_DIR)/usr/local/etc/bind/

permissions: defaultperms

check:
	$(MAKE) -C $(PKG_ROOT) check $(UC_PATH)

.PHONY: configure clean build install
