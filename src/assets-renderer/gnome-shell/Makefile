include ../../Makefile.inc

THEMES_DIR=../../../

.PHONY: build clean

build: $(COLOR_VARIANTS)

$(COLOR_VARIANTS):
	mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$@-GNOME_40-$(VARIANT)/gnome-shell/assets/); \
	mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$@-GNOME_38+36-$(VARIANT)/gnome-shell/assets/); \
	mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$@-GNOME_40-$(VARIANT)-FullPanel/gnome-shell/assets/); \
	mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$@-GNOME_38+36-$(VARIANT)-FullPanel/gnome-shell/assets/); \
	cp assets/* $(THEMES_DIR)Skeuos-$@-GNOME_40-Light/gnome-shell/assets/
	sed 's/$(DEFAULT_THEME_COLOR)/$(COLOR_$@)/gi' -i $(THEMES_DIR)Skeuos-$@-GNOME_40-Light/gnome-shell/assets/*
	cp $(THEMES_DIR)Skeuos-$@-GNOME_40-Light/gnome-shell/assets/* $(THEMES_DIR)Skeuos-$@-GNOME_40-Dark/gnome-shell/assets/
	$(foreach VARIANT,Light Dark,\
	  cp $(THEMES_DIR)Skeuos-$@-GNOME_40-Light/gnome-shell/assets/* $(THEMES_DIR)Skeuos-$@-GNOME_40-$(VARIANT)-FullPanel/gnome-shell/assets/;)
	$(foreach VARIANT,Light Dark,\
	  cp $(THEMES_DIR)Skeuos-$@-GNOME_40-Light/gnome-shell/assets/* $(THEMES_DIR)Skeuos-$@-GNOME_38+36-$(VARIANT)/gnome-shell/assets/;)
	$(foreach VARIANT,Light Dark,\
	  cp $(THEMES_DIR)Skeuos-$@-GNOME_40-Light/gnome-shell/assets/* $(THEMES_DIR)Skeuos-$@-GNOME_38+36-$(VARIANT)-FullPanel/gnome-shell/assets/;)

clean:
