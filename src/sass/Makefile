SCSS=sassc
THEMES_DIR=../../

.PHONY: install clean

build:
	for scss in *.scss ; \
	do \
		echo ; \
		echo Generating $${scss%.scss}.css ; \
		$(SCSS) $$scss > $${scss%.scss}.css ; \
	done
	
	mkdir -p $(THEMES_DIR)/Skeuos-Light/gtk-3.0/applications
	mkdir -p $(THEMES_DIR)/Skeuos-Dark/gtk-3.0/applications
	
	cp -r gtk-sass/applications/* $(THEMES_DIR)/Skeuos-Light/gtk-3.0/applications
	cp -r gtk-sass/applications/* $(THEMES_DIR)/Skeuos-Dark/gtk-3.0/applications
	
	find $(THEMES_DIR)/Skeuos-*/gtk-3.0/applications \
			! \( -type d -or -name "*.css" -or -name "*.scss" \) \
			-exec rm {} \;
	
	cp gtk.css $(THEMES_DIR)/Skeuos-Light/gtk-3.0/gtk.css
	cp gtk-dark.css $(THEMES_DIR)/Skeuos-Light/gtk-3.0/gtk-dark.css
	cp gtk-dark.css $(THEMES_DIR)/Skeuos-Dark/gtk-3.0/gtk.css

clean:
	-rm *.css
