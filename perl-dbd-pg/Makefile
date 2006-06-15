# Makefile for perl-dbd-pg
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

PKG := perl-dbd-pg
PKG_VERSION := 1.49
PKG_VERSION_SUFF :=
SRC_FILENAME = DBD-Pg-$(PKG_VERSION).tar.gz
EXTRACTED_DIR = DBD-Pg-$(PKG_VERSION)
DEPENDS := perl-dbi
DOWNLOAD_SITES = \
	http://search.cpan.org/CPAN/authors/id/D/DB/DBDPG

# where a compiled cflinux resides
CFLINUX_ROOT = ../../cflinux

# perl directory
PERL_ROOT ?= ../perl

PERL_SRC := $(shell pwd)/$(PERL_ROOT)/build/perl
DBI_DIR = $(CFPKG_DIR)/../perl-dbi/build/perl-dbi
PERL_ENV = PERL5LIB=$(PERL_SRC)/lib:$(DBI_DIR)/blib/lib:$(DBI_DIR)/blib/arch

all: build

include $(CFLINUX_ROOT)/cfpkg.mk

configure: $(CONFIGURED_STAMP)

$(CONFIGURED_STAMP): patch
	cd $(PKG_ROOT) && $(PERL_ENV) \
		POSTGRES_HOME=$(UC_ROOT) \
		$(PERL_SRC)/perl Makefile.PL \
		PERL_SRC=$(PERL_SRC)
	touch $@

clean:

build: configure
	$(MAKE) -C $(PKG_ROOT) all $(UC_PATH) $(PERL_ENV)

install: build
	$(MAKE) -C $(PKG_ROOT) pure_site_install DESTDIR=$(PKG_INSTALL_DIR) $(PERL_ENV)
	rm -rf $(PKG_INSTALL_DIR)/usr/local/man

permissions: defaultperms

.PHONY: configure clean build install
