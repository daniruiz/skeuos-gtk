include ../Makefile.inc

THEMES_DIR=../../

.PHONY: build clean

build: clean
	$(MAKE) $(TARGETS)
	for COLOR in $(COLOR_VARIANTS); \
	do \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-$(VARIANT)/gtk-3.0/); \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-$(VARIANT)/gtk-4.0/); \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-$(VARIANT)/cinnamon/); \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-GNOME_40-$(VARIANT)/gnome-shell/); \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-GNOME_38+36-$(VARIANT)/gnome-shell/); \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-GNOME_40-$(VARIANT)-FullPanel/gnome-shell/); \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-GNOME_38+36-$(VARIANT)-FullPanel/gnome-shell/); \
	  cp gtk3-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light/gtk-3.0/gtk.css ; \
	  cp gtk3-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light/gtk-3.0/gtk-dark.css ; \
	  cp gtk3-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Dark/gtk-3.0/gtk.css ; \
	  cp gtk4-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light/gtk-4.0/gtk.css ; \
	  cp gtk4-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light/gtk-4.0/gtk-dark.css ; \
	  cp gtk4-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Dark/gtk-4.0/gtk.css ; \
	  cp cinnamon-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light/cinnamon/cinnamon.css ; \
	  cp cinnamon-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Dark/cinnamon/cinnamon.css ; \
	  cp gnome-shell-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-GNOME_40-Light/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-GNOME_40-Dark/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-fullpanel-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-GNOME_40-Light-FullPanel/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-fullpanel-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-GNOME_40-Dark-FullPanel/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-38-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-GNOME_38+36-Light/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-38-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-GNOME_38+36-Dark/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-38-fullpanel-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-GNOME_38+36-Light-FullPanel/gnome-shell/gnome-shell.css ; \
	  cp gnome-shell-38-fullpanel-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-GNOME_38+36-Dark-FullPanel/gnome-shell/gnome-shell.css ; \
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
