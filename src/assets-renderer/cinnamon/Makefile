include ../../Makefile.inc

THEMES_DIR=../../../themes/

.PHONY: build clean

build: $(COLOR_VARIANTS)

$(COLOR_VARIANTS):
	mkdir -p $(THEMES_DIR)Skeuos-$@-Light/cinnamon/assets/
	mkdir -p $(THEMES_DIR)Skeuos-$@-Dark/cinnamon/assets/
	cp assets/* $(THEMES_DIR)Skeuos-$@-Light/cinnamon/assets/
	sed 's/$(DEFAULT_THEME_COLOR)/$(COLOR_$@)/gi' -i $(THEMES_DIR)Skeuos-$@-Light/cinnamon/assets/*
	cp $(THEMES_DIR)Skeuos-$@-Light/cinnamon/assets/* $(THEMES_DIR)Skeuos-$@-Dark/cinnamon/assets/

clean:
