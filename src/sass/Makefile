SCSS=sassc
THEMES_DIR=../../

.PHONY: build clean

build: $(patsubst %.scss, %.css, $(wildcard *.scss))

%.css: %.scss
	$(SCSS) $< > $@
	mkdir -p $(THEMES_DIR)$(basename $@)/gtk-3.0
	cp $@ $(THEMES_DIR)$(basename $@)/gtk-3.0/gtk.css
	$(if $(findstring -Light, $@), cp $(patsubst %-Light%, %-Dark%, $@) $(THEMES_DIR)$(basename $@)/gtk-3.0/gtk-dark.css,)

clean:
	-rm *.css
