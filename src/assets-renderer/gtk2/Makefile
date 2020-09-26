INKSCAPE=/usr/bin/inkscape
OPTIPNG=/usr/bin/optipng

SRC_FILE=assets.svg
ASSETS_DIR=assets

SRC_FILE_DARK=assets-dark.svg
ASSETS_DIR_DARK=assets-dark

MENU_TOOLBAR_DIR=menubar-toolbar

INDEX=assets.txt
THEMES_DIR=../../../

.PHONY: build clean

build: $(SRC_FILE) $(SRC_FILE_DARK)
	mkdir -p $(ASSETS_DIR) $(ASSETS_DIR_DARK) $(MENU_TOOLBAR_DIR)
	for i in $$(xargs < $(INDEX)) ; \
	do \
		echo ; \
		echo Rendering $(ASSETS_DIR)/$$i.png ; \
		$(INKSCAPE) --export-id=$$i \
		          --export-id-only \
		          --export-png=$(ASSETS_DIR)/$$i.png $(SRC_FILE) > /dev/null 2>&1 \
		&& $(OPTIPNG) -o7 --quiet $(ASSETS_DIR)/$$i.png ; \
		echo ; \
		echo Rendering $(ASSETS_DIR_DARK)/$$i.png ; \
		$(INKSCAPE) --export-id=$$i \
		          --export-id-only \
		          --export-png=$(ASSETS_DIR_DARK)/$$i.png $(SRC_FILE_DARK) > /dev/null 2>&1 \
		&& $(OPTIPNG) -o7 --quiet $(ASSETS_DIR_DARK)/$$i.png ; \
	done
	cp $(ASSETS_DIR)/entry-toolbar.png $(MENU_TOOLBAR_DIR)/entry-toolbar.png
	cp $(ASSETS_DIR)/entry-active-toolbar.png $(MENU_TOOLBAR_DIR)/entry-active-toolbar.png
	cp $(ASSETS_DIR)/entry-disabled-toolbar.png $(MENU_TOOLBAR_DIR)/entry-disabled-toolbar.png
	cp $(ASSETS_DIR)/menubar.png $(MENU_TOOLBAR_DIR)/menubar.png
	cp $(ASSETS_DIR)/menubar_button.png $(MENU_TOOLBAR_DIR)/menubar_button.png
	cp $(ASSETS_DIR_DARK)/button.png $(MENU_TOOLBAR_DIR)/button.png
	cp $(ASSETS_DIR_DARK)/button-hover.png $(MENU_TOOLBAR_DIR)/button-hover.png
	cp $(ASSETS_DIR_DARK)/button-active.png $(MENU_TOOLBAR_DIR)/button-active.png
	cp $(ASSETS_DIR_DARK)/button-insensitive.png $(MENU_TOOLBAR_DIR)/button-insensitive.png
	cp $(ASSETS_DIR_DARK)/entry-toolbar.png $(MENU_TOOLBAR_DIR)/entry-toolbar-dark.png
	cp $(ASSETS_DIR_DARK)/entry-active-toolbar.png $(MENU_TOOLBAR_DIR)/entry-active-toolbar-dark.png
	cp $(ASSETS_DIR_DARK)/entry-disabled-toolbar.png $(MENU_TOOLBAR_DIR)/entry-disabled-toolbar-dark.png
	cp $(ASSETS_DIR_DARK)/menubar.png $(MENU_TOOLBAR_DIR)/menubar-dark.png
	cp $(ASSETS_DIR_DARK)/menubar_button.png $(MENU_TOOLBAR_DIR)/menubar_button-dark.png
	mkdir -p $(THEMES_DIR)/Skeuos-Light/gtk-2.0/assets/
	cp assets/* $(THEMES_DIR)/Skeuos-Light/gtk-2.0/assets/
	mkdir -p $(THEMES_DIR)/Skeuos-Light/gtk-2.0/menubar-toolbar/
	cp menubar-toolbar/* $(THEMES_DIR)/Skeuos-Light/gtk-2.0/menubar-toolbar/
	mkdir -p $(THEMES_DIR)/Skeuos-Dark/gtk-2.0/assets/
	cp assets-dark/* $(THEMES_DIR)/Skeuos-Dark/gtk-2.0/assets/
	mkdir -p $(THEMES_DIR)/Skeuos-Dark/gtk-2.0/menubar-toolbar/
	cp menubar-toolbar/* $(THEMES_DIR)/Skeuos-Dark/gtk-2.0/menubar-toolbar/
	
clean:
	-rm -r $(ASSETS_DIR) $(ASSETS_DIR_DARK) $(MENU_TOOLBAR_DIR)
