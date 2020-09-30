include ../Makefile.inc

THEMES_DIR=../../
THEMES=$(patsubst $(THEMES_DIR)%/index.theme,%,$(wildcard $(THEMES_DIR)*/index.theme))

GTKRC_TEMPLATE=gtkrc-light
GTKRC_DARK_TEMPLATE=gtkrc-dark
THEME_INDEX_TEMPLATE=index.theme

.PHONY: build $(THEMES) $(COLOR_VARIANTS) clean

build: $(THEMES) $(COLOR_VARIANTS)

$(THEMES):
	sed -e 's/Name=/Name=$@/' \
	  -e 's/Comment=/Comment=$@ theme"/' \
	  -e 's/GtkTheme=/GtkTheme=$@/' \
	  -e 's/MetacityTheme=/MetacityTheme=$@/' \
	  $(THEME_INDEX_TEMPLATE) > $(THEMES_DIR)$@/index.theme

$(COLOR_VARIANTS):
	sed -e 's/$(DEFAULT_THEME_COLOR)/$(COLOR_$@)/gi' \
	  -e 's/selected_fg_color:/selected_fg_color: $(TEXT_COLOR_$@)/' \
	  $(GTKRC_TEMPLATE) > $(THEMES_DIR)Skeuos-$@-Light/gtk-2.0/gtkrc
	sed -e 's/$(DEFAULT_THEME_COLOR)/$(COLOR_$@)/gi' \
	  -e 's/selected_fg_color:/selected_fg_color: $(TEXT_COLOR_$@)/' \
	  $(GTKRC_DARK_TEMPLATE) > $(THEMES_DIR)Skeuos-$@-Dark/gtk-2.0/gtkrc
