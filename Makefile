# Makefile for tumbleweed-cli

INSTALL = install
INSTALL_PROGRAM = $(INSTALL)

PREFIX = /usr
VERSION="build-$(shell date +%F)"

all:
	@ echo "Nothing to compile. Use: install"


install:
	$(INSTALL) -d $(DESTDIR)$(PREFIX)/bin
	$(INSTALL_PROGRAM) tumbleweed $(DESTDIR)$(PREFIX)/bin/
	sed -i 's/VERSION=".*"/VERSION=$(VERSION)/' \
	  $(DESTDIR)$(PREFIX)/bin/tumbleweed
