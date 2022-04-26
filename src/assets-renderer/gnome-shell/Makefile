include ../../Makefile.inc

THEMES_DIR=../../../themes/
THEME_VERSIONS=42 40+41 38+36
BASE_THEME_VERSION=$(word 1,$(THEME_VERSIONS))

.PHONY: build clean

build: $(COLOR_VARIANTS)

$(COLOR_VARIANTS):
	mkdir -p $(THEMES_DIR)Skeuos-$@-Light-GNOME_$(BASE_THEME_VERSION)/gnome-shell/assets/
	cp assets/* $(THEMES_DIR)Skeuos-$@-Light-GNOME_$(BASE_THEME_VERSION)/gnome-shell/assets/
	sed 's/$(DEFAULT_THEME_COLOR)/$(COLOR_$@)/gi' -i $(THEMES_DIR)Skeuos-$@-Light-GNOME_$(BASE_THEME_VERSION)/gnome-shell/assets/*
	$(foreach VERSION,$(THEME_VERSIONS),\
	  $(foreach VARIANT,Light Dark,\
	    $(foreach PANEL_VARIANT,- -FullPanel-,\
	      mkdir -p $(THEMES_DIR)Skeuos-$@-$(VARIANT)$(PANEL_VARIANT)GNOME_$(VERSION)/gnome-shell/assets/;\
	      cp $(THEMES_DIR)Skeuos-$@-Light-GNOME_$(BASE_THEME_VERSION)/gnome-shell/assets/* $(THEMES_DIR)Skeuos-$@-$(VARIANT)$(PANEL_VARIANT)GNOME_$(VERSION)/gnome-shell/assets/;)))

clean:
