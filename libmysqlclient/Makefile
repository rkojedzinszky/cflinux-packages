# Makefile for libmysqlclient
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

PKG := libmysqlclient
PKG_VERSION := 4.0.27
PKG_VERSION_SUFF :=
SRC_FILENAME = mysql-$(PKG_VERSION).tar.gz
EXTRACTED_DIR = mysql-$(PKG_VERSION)
DOWNLOAD_SITES = http://downloads.mysql.com/archives/mysql-4.0 \
		 $(CFLINUX_SOURCES)

# where a compiled cflinux resides
CFLINUX_ROOT = ../../cflinux

all: build

include $(CFLINUX_ROOT)/cfpkg.mk

configure: patch $(CONFIGURED_STAMP)

$(CONFIGURED_STAMP):
	cd $(PKG_ROOT) && \
		$(UC_PATH) ./configure \
		--prefix=/usr/local \
		--without-server \
		--disable-largefile \
		--with-named-curses-libs
	touch $(CONFIGURED_STAMP)

clean:
	-$(MAKE) -C $(PKG_ROOT) distclean
	rm -f $(BUILT_STAMP)
	rm -f $(CONFIGURED_STAMP)

build: configure $(BUILT_STAMP)

$(BUILT_STAMP):
	$(MAKE) -C $(PKG_ROOT) all SUBDIRS=libmysql $(UC_PATH)
	touch $(BUILT_STAMP)

install: build check $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_ROOT)/libmysql pkglibdir=/usr/local/lib install-strip DESTDIR=$(PKG_INSTALL_DIR)
	rm -f $(PKG_INSTALL_DIR)/usr/local/lib/libmysqlclient.*a

permissions: defaultperms

check:
#	$(MAKE) -C $(PKG_ROOT) check $(UC_PATH)

.PHONY: configure clean build install
