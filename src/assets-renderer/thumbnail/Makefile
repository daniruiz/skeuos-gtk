include ../../Makefile.inc

THEMES_DIR=../../../themes/

TEMPLATE_SELECTED_COLOR=\#c21953

.PHONY: build $(COLOR_VARIANTS)

build: $(COLOR_VARIANTS)

$(COLOR_VARIANTS):
	for variant in Light Dark; \
	do \
		mkdir -p $(THEMES_DIR)Skeuos-$@-$$variant/gtk-3.0/ ; \
		mkdir -p $(THEMES_DIR)Skeuos-$@-$$variant/metacity-1/ ; \
		sed -e 's/$(DEFAULT_THEME_COLOR)/$(COLOR_$@)/gi' \
		    -e 's/$(TEMPLATE_SELECTED_COLOR)/$(TEXT_COLOR_$@)/gi' \
		    gtk3-$$variant.svg \
		| $(INKSCAPE) --pipe --export-filename=$(THEMES_DIR)Skeuos-$@-$$variant/gtk-3.0/thumbnail.png > /dev/null 2>&1 ; \
		sed -e 's/$(DEFAULT_THEME_COLOR)/$(COLOR_$@)/gi' \
		    -e 's/$(TEMPLATE_SELECTED_COLOR)/$(TEXT_COLOR_$@)/gi' \
		    metacity-$$variant.svg \
		| $(INKSCAPE) --pipe --export-filename=$(THEMES_DIR)Skeuos-$@-$$variant/metacity-1/thumbnail.png > /dev/null 2>&1 ; \
	done
