include ../Makefile.inc

THEMES_DIR=../../themes/
GTK_THEMES=$(patsubst $(THEMES_DIR)%,%,$(wildcard $(THEMES_DIR)Skeuos*))
IGNORE=$(patsubst $(THEMES_DIR)%,%,$(wildcard $(THEMES_DIR)Skeuos-*XFWM*) $(wildcard $(THEMES_DIR)Skeuos-*GNOME*))
GTK_THEMES:=$(filter-out $(IGNORE),$(GTK_THEMES))


GTKRC_TEMPLATE=gtkrc-light
GTKRC_DARK_TEMPLATE=gtkrc-dark
THEME_INDEX_TEMPLATE=index.theme
STATIC_TEMPLATE_DIR=static/

.PHONY: build $(GTK_THEMES) $(COLOR_VARIANTS) clean

build: $(GTK_THEMES) $(COLOR_VARIANTS)

$(GTK_THEMES):
	sed -e 's/Name=/Name=$@/' \
	    -e 's/Comment=/Comment=$@ theme"/' \
	    -e 's/GtkTheme=/GtkTheme=$@/' \
	    -e 's/MetacityTheme=/MetacityTheme=$@/' \
	    -e 's/IconTheme=/IconTheme='$$(echo $@ | sed 's/Skeuos/Flat-Remix/')/ \
	    $(THEME_INDEX_TEMPLATE) > $(THEMES_DIR)$@/index.theme
	cp -r $(STATIC_TEMPLATE_DIR)* $(THEMES_DIR)$@

$(COLOR_VARIANTS):
	# GTK2
	-sed -e 's/$(DEFAULT_THEME_COLOR)/$(COLOR_$@)/gi' \
	    -e 's/selected_fg_color:/selected_fg_color: $(TEXT_COLOR_$@)/' \
	    $(GTKRC_TEMPLATE) > $(THEMES_DIR)Skeuos-$@-Light/gtk-2.0/gtkrc
	-sed -e 's/$(DEFAULT_THEME_COLOR)/$(COLOR_$@)/gi' \
	    -e 's/selected_fg_color:/selected_fg_color: $(TEXT_COLOR_$@)/' \
	    $(GTKRC_DARK_TEMPLATE) > $(THEMES_DIR)Skeuos-$@-Dark/gtk-2.0/gtkrc
	# XFWM4
	-cp themerc-light $(THEMES_DIR)Skeuos-$@-Light-XFWM/xfwm4/themerc
	-cp themerc-light-HiDPI $(THEMES_DIR)Skeuos-$@-Light-XFWM-HiDPI/xfwm4/themerc
	-cp themerc-dark $(THEMES_DIR)Skeuos-$@-Dark-XFWM/xfwm4/themerc
	-cp themerc-dark-HiDPI $(THEMES_DIR)Skeuos-$@-Dark-XFWM-HiDPI/xfwm4/themerc
	# Metacity
	-cp metacity-theme-1-light.xml $(THEMES_DIR)Skeuos-$@-Light/metacity-1/metacity-theme-1.xml
	-cp metacity-theme-1-dark.xml $(THEMES_DIR)Skeuos-$@-Dark/metacity-1/metacity-theme-1.xml
	-ln -rsvf $(THEMES_DIR)Skeuos-$@-Light/metacity-1/metacity-theme-1.xml $(THEMES_DIR)Skeuos-$@-Light/metacity-1/metacity-theme-2.xml
	-ln -rsvf $(THEMES_DIR)Skeuos-$@-Light/metacity-1/metacity-theme-1.xml $(THEMES_DIR)Skeuos-$@-Light/metacity-1/metacity-theme-3.xml
	-ln -rsvf $(THEMES_DIR)Skeuos-$@-Dark/metacity-1/metacity-theme-1.xml $(THEMES_DIR)Skeuos-$@-Dark/metacity-1/metacity-theme-2.xml
	-ln -rsvf $(THEMES_DIR)Skeuos-$@-Dark/metacity-1/metacity-theme-1.xml $(THEMES_DIR)Skeuos-$@-Dark/metacity-1/metacity-theme-3.xml
