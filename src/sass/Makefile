include ../Makefile.inc

THEMES_DIR=../../

.PHONY: build clean

build: $(patsubst %.scss, %.css, $(wildcard *.scss))

%.css: %.scss
	$(SCSS) $< > $@
	cat $(wildcard gtk-applications-css/**/*.css) >> $@
	mkdir -p $(THEMES_DIR)$(basename $@)/gtk-3.0
	cp $@ $(THEMES_DIR)$(basename $@)/gtk-3.0/gtk.css
	$(if $(findstring -Dark, $@), \
	  cp $@ $(THEMES_DIR)$(subst Dark,Light,$(basename $@))/gtk-3.0/gtk-dark.css,)

clean:
	-rm *.css
