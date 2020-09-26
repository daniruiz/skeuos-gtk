PKGNAME = skeuos-gtk
MAINTAINER = Daniel Ruiz de Alegría <daniel@drasite.com>
PREFIX ?= /usr
THEMES ?= $(patsubst %/index.theme,%,$(wildcard */index.theme))

all:

build:
	$(MAKE) -C src build

install:
	mkdir -p $(DESTDIR)$(PREFIX)/share/themes
	cp -a $(THEMES) $(DESTDIR)$(PREFIX)/share/themes

uninstall:
	-rm -rf $(foreach theme,$(THEMES),$(DESTDIR)$(PREFIX)/share/themes/$(theme))

_get_version:
	$(eval VERSION ?= $(shell git show -s --format=%cd --date=format:%Y%m%d HEAD))
	@echo $(VERSION)

_get_tag:
	$(eval TAG := $(shell git describe --abbrev=0 --tags))
	@echo $(TAG)

clean:
	-make -C src clean

.PHONY: all build install uninstall _get_version _get_tag clean
