PKGNAME = skeuos-gtk
MAINTAINER = Daniel Ruiz de Alegría <daniel@drasite.com>
PREFIX ?= /usr
THEMES ?= $(patsubst %/index.theme,%,$(wildcard */index.theme))
COLOR_VARIANTS = Blue Green Red Yellow Black Brown Cyan Grey Magenta Orange Teal Violet

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

dist: _get_version
	variants="Light Dark"; \
	count=1; \
	for color_variant in $(COLOR_VARIANTS); \
	do \
		for variant in $$variants; \
		do \
			count_pretty=$$(echo "0$${count}" | tail -c 3); \
			tar -c "Skeuos-$${color_variant}-$${variant}"* | \
				xz -z - > "$${count_pretty}-Skeuos-$${color_variant}-$${variant}_$(VERSION).tar.xz"; \
			count=$$((count+1)); \
		done; \
	done; \

release: _get_version
	$(MAKE) generate_changelog VERSION=$(VERSION)
	git tag -f $(VERSION)
	git push origin --tags
	$(MAKE) dist

generate_changelog: _get_version _get_tag
	git checkout $(TAG) CHANGELOG
	mv CHANGELOG CHANGELOG.old
	echo [$(VERSION)] > CHANGELOG
	printf "%s\n\n" "$$(git log --pretty=format:' * %s' $(TAG)..HEAD)" >> CHANGELOG
	cat CHANGELOG.old >> CHANGELOG
	rm CHANGELOG.old
	$$EDITOR CHANGELOG
	git commit CHANGELOG -m "Update CHANGELOG version $(VERSION)"
	git push origin HEAD

clean:
	-make -C src clean

.PHONY: all build install uninstall _get_version _get_tag clean
