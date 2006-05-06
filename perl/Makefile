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

PKG := perl
PKG_VERSION := 5.8.8
PKG_VERSION_SUFF :=
SRC_FILENAME = $(PKG)-$(PKG_VERSION).tar.gz
EXTRACTED_DIR = $(PKG)-$(PKG_VERSION)
DOWNLOAD_SITES = http://www.perl.com/CPAN/src/		# look at \
							# the ending \
							# dash

# where a compiled cflinux resides
CFLINUX_ROOT = ../../cflinux

all: build

include $(CFLINUX_ROOT)/cfpkg.mk

configure: patch $(CONFIGURED_STAMP)

$(CONFIGURED_STAMP):
	(cd $(PKG_ROOT) && rm -f config.sh Policy.sh && \
	 UC_ROOT=$(UC_ROOT) $(UC_PATH) sh Configure -de \
	 -Darchname=i386-linux \
	 -Uuselargefiles \
	 -Ui_shadow \
	 -Dd_dosuid \
	 -Di_db \
	 -Duseposix \
	 -Dlibc=$(UC_ROOT)/lib/libc.a \
	 -Ulocincpth= \
	 -Uloclibpth= \
	 -Dglibpth="$(UC_ROOT)/lib" )

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
		install.perl STRIPFLAGS=-s DESTDIR=$(PKG_INSTALL_DIR)

permissions: defaultperms

.PHONY: configure clean build install
