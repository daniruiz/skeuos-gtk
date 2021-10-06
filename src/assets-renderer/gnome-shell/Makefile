include ../../Makefile.inc

THEMES_DIR=../../../themes/

.PHONY: build clean

build: $(COLOR_VARIANTS)

$(COLOR_VARIANTS):
	mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$@-$(VARIANT)-GNOME_40+41/gnome-shell/assets/); \
	mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$@-$(VARIANT)-GNOME_38+36/gnome-shell/assets/); \
	mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$@-$(VARIANT)-FullPanel-GNOME_40+41/gnome-shell/assets/); \
	mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$@-$(VARIANT)-FullPanel-GNOME_38+36/gnome-shell/assets/); \
	cp assets/* $(THEMES_DIR)Skeuos-$@-Light-GNOME_40+41/gnome-shell/assets/
	sed 's/$(DEFAULT_THEME_COLOR)/$(COLOR_$@)/gi' -i $(THEMES_DIR)Skeuos-$@-Light-GNOME_40+41/gnome-shell/assets/*
	cp $(THEMES_DIR)Skeuos-$@-Light-GNOME_40+41/gnome-shell/assets/* $(THEMES_DIR)Skeuos-$@-Dark-GNOME_40+41/gnome-shell/assets/
	$(foreach VARIANT,Light Dark,\
	  cp $(THEMES_DIR)Skeuos-$@-Light-GNOME_40+41/gnome-shell/assets/* $(THEMES_DIR)Skeuos-$@-$(VARIANT)-FullPanel-GNOME_40+41/gnome-shell/assets/;)
	$(foreach VARIANT,Light Dark,\
	  cp $(THEMES_DIR)Skeuos-$@-Light-GNOME_40+41/gnome-shell/assets/* $(THEMES_DIR)Skeuos-$@-$(VARIANT)-GNOME_38+36/gnome-shell/assets/;)
	$(foreach VARIANT,Light Dark,\
	  cp $(THEMES_DIR)Skeuos-$@-Light-GNOME_40+41/gnome-shell/assets/* $(THEMES_DIR)Skeuos-$@-$(VARIANT)-FullPanel-GNOME_38+36/gnome-shell/assets/;)

clean:
