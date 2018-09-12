# Makefile for tumbleweed-cli

INSTALL = install
INSTALL_PROGRAM = $(INSTALL)

PREFIX = /usr
SYSCONFIG = /etc
VERSION="build-$(shell date +%F)"

all:
	@ echo "Nothing to compile. Use: install"


install:
	$(INSTALL) -d $(DESTDIR)$(PREFIX)/bin
	$(INSTALL_PROGRAM) tumbleweed $(DESTDIR)$(PREFIX)/bin/
	sed -i 's/VERSION=".*"/VERSION=$(VERSION)/' \
	  $(DESTDIR)$(PREFIX)/bin/tumbleweed

	$(INSTALL) -d $(DESTDIR)$(SYSCONFIG)/bash_completion.d
	$(INSTALL) tumbleweed-completion.bash $(DESTDIR)$(SYSCONFIG)/bash_completion.d
