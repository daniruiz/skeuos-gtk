include ../Makefile.inc

THEMES_DIR=../../

.PHONY: build clean

#build: $(patsubst %.scss,%.css,$(wildcard *.scss))

#%.css: %.scss
#	$(SCSS) $< > $@
#	cat $(wildcard gtk-applications-css/**/*.css) >> $@
#	mkdir -p $(THEMES_DIR)$(basename $@)/gtk-3.0
#	cp $@ $(THEMES_DIR)$(basename $@)/gtk-3.0/gtk.css
#	$(if $(findstring -Dark, $@), \
#	  cp $@ $(THEMES_DIR)$(subst Dark,Light,$(basename $@))/gtk-3.0/gtk-dark.css,)

build:
	$(MAKE) $(TARGETS)
	$(MAKE) copy_css_files

copy_css_files:
	for COLOR in $(COLOR_VARIANTS); \
	do \
	  mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Skeuos-$$COLOR-$(VARIANT)/gtk-3.0/); \
	  cp gtk3-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light/gtk-3.0/gtk.css ; \
	  cp gtk3-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Light/gtk-3.0/gtk-dark.css ; \
	  cp gtk3-dark-$$COLOR.css $(THEMES_DIR)Skeuos-$$COLOR-Dark/gtk-3.0/gtk.css ; \
	done

define scss_to_css
%-$(1).css: %.scss
	sed -e '/$$$$selected_bg_color/c $$$$selected_bg_color: $$(COLOR_$(1));' \
	    -e '/$$$$selected_fg_color/c $$$$selected_fg_color: $$(TEXT_COLOR_$(1));' $$< \
	  | $(SCSS) > $$@
	cat $(wildcard gtk-applications-css/**/*.css) >> $$@

TARGETS += $$(patsubst %.scss,%-$(1).css,$$(wildcard *.scss))
endef

$(foreach COLOR_VARIANT,$(COLOR_VARIANTS),$(eval $(call scss_to_css,$(COLOR_VARIANT))))

clean:
	-rm *.css
