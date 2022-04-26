include ../Makefile.inc

THEMES_DIR=../../themes/

.PHONY: build clean

build: clean
	$(MAKE) $(TARGETS)
	for COLOR in $(COLOR_VARIANTS); \
	do \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-$(VARIANT)/gtk-3.0/); \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-$(VARIANT)/gtk-4.0/); \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-$(VARIANT)/cinnamon/); \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-$(VARIANT)-GNOME_42/gnome-shell/); \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-$(VARIANT)-GNOME_40+41/gnome-shell/); \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-$(VARIANT)-GNOME_38+36/gnome-shell/); \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-$(VARIANT)-FullPanel-GNOME_42/gnome-shell/); \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-$(VARIANT)-FullPanel-GNOME_40+41/gnome-shell/); \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-$(VARIANT)-FullPanel-GNOME_38+36/gnome-shell/); \
	  cp gtk3-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light/gtk-3.0/gtk.css ; \
	  cp gtk3-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light/gtk-3.0/gtk-dark.css ; \
	  cp gtk3-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Dark/gtk-3.0/gtk.css ; \
	  ln -sf gtk.css $(THEMES_DIR)Skeuos-$$COLOR-Dark/gtk-3.0/gtk-dark.css ; \
	  cp gtk4-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light/gtk-4.0/gtk.css ; \
	  cp gtk4-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light/gtk-4.0/gtk-dark.css ; \
	  cp gtk4-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Dark/gtk-4.0/gtk.css ; \
	  ln -sf gtk.css $(THEMES_DIR)Skeuos-$$COLOR-Dark/gtk-4.0/gtk-dark.css ; \
	  cp cinnamon-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light/cinnamon/cinnamon.css ; \
	  cp cinnamon-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Dark/cinnamon/cinnamon.css ; \
	  cp gnome-shell-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light-GNOME_42/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Dark-GNOME_42/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-fullpanel-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light-FullPanel-GNOME_42/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-fullpanel-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Dark-FullPanel-GNOME_42/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-40-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light-GNOME_40+41/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-40-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Dark-GNOME_40+41/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-40-fullpanel-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light-FullPanel-GNOME_40+41/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-40-fullpanel-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Dark-FullPanel-GNOME_40+41/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-38-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light-GNOME_38+36/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-38-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Dark-GNOME_38+36/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-38-fullpanel-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light-FullPanel-GNOME_38+36/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-38-fullpanel-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Dark-FullPanel-GNOME_38+36/gnome-shell/gnome-shell.css ; \
	done

define scss_to_css
%-$(1).css: %.scss
	sed -e '/$$$$selected_bg_color/c $$$$selected_bg_color: $$(COLOR_$(1));' \
	    -e '/$$$$selected_fg_color/c $$$$selected_fg_color: $$(TEXT_COLOR_$(1));' $$< \
	  | $(SCSS) > $$@
	$$(if $$(findstring gtk, $$@), \
	  cat $(wildcard gtk-applications-css/**/*.css) >> $$@)

TARGETS += $$(patsubst %.scss,%-$(1).css,$$(wildcard *.scss))
endef

$(foreach COLOR_VARIANT,$(COLOR_VARIANTS),$(eval $(call scss_to_css,$(COLOR_VARIANT))))

clean:
	-rm *.css
