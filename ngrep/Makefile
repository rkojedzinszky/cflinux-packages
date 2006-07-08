# Makefile for ngrep
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

PKG := ngrep
PKG_VERSION := 1.44
PKG_VERSION_SUFF :=
SRC_FILENAME = $(PKG)-$(PKG_VERSION)-1.tar.bz2
EXTRACTED_DIR = $(PKG)-$(PKG_VERSION)
DOWNLOAD_SITES = \
	http://heanet.dl.sourceforge.net/sourceforge/ngrep \
	http://optusnet.dl.sourceforge.net/sourceforge/ngrep \
	http://superb-east.dl.sourceforge.net/sourceforge/ngrep \
	http://nchc.dl.sourceforge.net/sourceforge/ngrep \
	$(CFLINUX_SOURCES)

# where a compiled cflinux resides
CFLINUX_ROOT = ../../cflinux

all: build

include $(CFLINUX_ROOT)/cfpkg.mk

configure: patch $(CONFIGURED_STAMP)

$(CONFIGURED_STAMP):
	cd $(PKG_ROOT) && \
		$(UC_PATH) ./configure --prefix=/usr/local \
		--with-pcap-includes=$(TOP_DIR)/build/libpcap
	touch $(CONFIGURED_STAMP)

clean:
	-$(MAKE) -C $(PKG_ROOT) distclean
	rm -f $(BUILT_STAMP)
	rm -f $(CONFIGURED_STAMP)

build: configure $(BUILT_STAMP)

$(BUILT_STAMP):
	$(MAKE) -C $(PKG_ROOT) all $(UC_PATH)
	touch $(BUILT_STAMP)

install: build check $(PKG_INSTALL_DIR)
	$(INSTALL) -d -m 755 $(PKG_INSTALL_DIR)/usr/local/sbin
	$(INSTALL_BIN) $(PKG_ROOT)/ngrep $(PKG_INSTALL_DIR)/usr/local/sbin/

permissions: defaultperms

check:
#	$(MAKE) -C $(PKG_ROOT) check $(UC_PATH)

.PHONY: configure clean build install
