include ../../Makefile.inc

SRC_FILE=assets.svg
ASSETS_DIR=assets

SRC_FILE_DARK=assets-dark.svg
ASSETS_DIR_DARK=assets-dark

# https://en.wikipedia.org/wiki/Hexspeak
# It's still a color 🤷‍
TEMPLATE_SELECTED_COLOR=\#DEADBEEF

MENU_TOOLBAR_DIR=menubar-toolbar

ASSETS=$(shell xargs < assets.txt)
MENU_ASSETS=$(shell xargs < menu_assets.txt)
DARK_MENU_EXTRA_ASSETS=button button-hover button-active button-insensitive
THEMES_DIR=../../../

include ../../Makefile.inc

.PHONY: build $(COLOR_VARIANTS) clean

build: $(COLOR_VARIANTS)

$(COLOR_VARIANTS):
	$(eval CURRENT_ASSETS_DIR=$(ASSETS_DIR)-$@/)
	$(eval CURRENT_ASSETS_DIR_DARK=$(ASSETS_DIR_DARK)-$@/)
	$(eval CURRENT_MENU_TOOLBAR_DIR=$(MENU_TOOLBAR_DIR)-$@/)
	mkdir -p $(CURRENT_ASSETS_DIR) $(CURRENT_ASSETS_DIR_DARK) $(CURRENT_MENU_TOOLBAR_DIR)
	sed -e 's/$(DEFAULT_THEME_COLOR)/$(COLOR_$@)/gi' \
	  -e 's/$(TEMPLATE_SELECTED_COLOR)/$(TEXT_COLOR_$@)/' \
	  $(SRC_FILE) > assets-$@.svg
	sed -e 's/$(DEFAULT_THEME_COLOR)/$(COLOR_$@)/gi' \
	  -e 's/$(TEMPLATE_SELECTED_COLOR)/$(TEXT_COLOR_$@)/' \
	  $(SRC_FILE_DARK) > assets-$@-dark.svg
	for i in $(ASSETS) $(MENU_ASSETS) ; \
	do \
		echo ; \
		echo Rendering $(CURRENT_ASSETS_DIR)$$i.png ; \
		$(INKSCAPE) --export-id=$$i \
		          --export-id-only \
		          --export-png=$(CURRENT_ASSETS_DIR)$$i.png assets-$@.svg > /dev/null 2>&1 \
		&& $(OPTIPNG) $(CURRENT_ASSETS_DIR)$$i.png ; \
		echo ; \
		echo Rendering $(CURRENT_ASSETS_DIR_DARK)$$i.png ; \
		$(INKSCAPE) --export-id=$$i \
		          --export-id-only \
		          --export-png=$(CURRENT_ASSETS_DIR_DARK)$$i.png assets-$@-dark.svg > /dev/null 2>&1 \
		&& $(OPTIPNG) $(CURRENT_ASSETS_DIR_DARK)$$i.png ; \
	done
	$(foreach ASSET, $(MENU_ASSETS), \
	  cp $(CURRENT_ASSETS_DIR)$(ASSET).png $(CURRENT_MENU_TOOLBAR_DIR)$(ASSET).png && \
	  cp $(CURRENT_ASSETS_DIR_DARK)$(ASSET).png $(CURRENT_MENU_TOOLBAR_DIR)$(ASSET)-dark.png &&) true
	$(foreach ASSET, $(DARK_MENU_EXTRA_ASSETS), \
	  cp $(CURRENT_ASSETS_DIR_DARK)$(ASSET).png $(CURRENT_MENU_TOOLBAR_DIR)$(ASSET).png &&) true
	mkdir -p $(THEMES_DIR)Skeuos-$@-Light/gtk-2.0/assets/
	cp $(CURRENT_ASSETS_DIR)* $(THEMES_DIR)Skeuos-$@-Light/gtk-2.0/assets/
	mkdir -p $(THEMES_DIR)Skeuos-$@-Light/gtk-2.0/menubar-toolbar/
	cp $(CURRENT_MENU_TOOLBAR_DIR)* $(THEMES_DIR)Skeuos-$@-Light/gtk-2.0/menubar-toolbar/
	mkdir -p $(THEMES_DIR)Skeuos-$@-Dark/gtk-2.0/assets/
	cp $(CURRENT_ASSETS_DIR_DARK)* $(THEMES_DIR)Skeuos-$@-Dark/gtk-2.0/assets/
	mkdir -p $(THEMES_DIR)Skeuos-$@-Dark/gtk-2.0/menubar-toolbar/
	cp $(CURRENT_MENU_TOOLBAR_DIR)* $(THEMES_DIR)Skeuos-$@-Dark/gtk-2.0/menubar-toolbar/

clean:
	-rm -r $(foreach COLOR_VARIANT, $(COLOR_VARIANTS), \
	  $(ASSETS_DIR)-$(COLOR_VARIANT) \
	  $(ASSETS_DIR_DARK)-$(COLOR_VARIANT) \
	  $(MENU_TOOLBAR_DIR)-$(COLOR_VARIANT) \
	  assets-$(COLOR_VARIANT).svg \
	  assets-$(COLOR_VARIANT)-dark.svg)
