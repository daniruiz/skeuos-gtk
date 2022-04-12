SUBDIRS?=$(foreach SUBDIR,cinnamon gnome-shell gtk2 gtk3 metacity thumbnail xfwm4,assets-renderer/$(SUBDIR)) sass
THEMES_DIR=../themes

include Makefile.inc

.PHONY: build $(SUBDIRS) clean

build: $(SUBDIRS)
	$(MAKE) -C templates build
	# Remove variants that are not valid
	rm -rf $(foreach variant,$(UNWANTED_VARIANTS),$(THEMES_DIR)/Skeuos-$(variant)*)

$(SUBDIRS):
	$(MAKE) -C $@ build

clean:
	$(foreach SUBDIR,$(SUBDIRS),$(MAKE) -C $(SUBDIR) clean &&) true
