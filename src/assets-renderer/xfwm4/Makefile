INKSCAPE=/usr/bin/inkscape
OPTIPNG=/usr/bin/optipng

ASSETS=assets*.svg
INDEX=assets.txt
THEMES_DIR=../../../

.PHONY: build clean

build: $(ASSETS)
	for src_file in $(ASSETS); \
	do \
		variant=$$(basename $${src_file%.svg}) ; \
		mkdir -p $$variant $$variant@1.5 $$variant@2 ; \
		for i in $$(xargs < $(INDEX)) ; \
		do \
			echo ; \
			echo Rendering $$variant/$$i.png ; \
			$(INKSCAPE) --export-id=$$i \
			            --export-id-only \
			            --export-png=$$variant/$$i.png $$src_file > /dev/null 2>&1 \
			&& $(OPTIPNG) -o7 --quiet $$variant/$$i.png ; \
			echo ; \
			echo Rendering $$variant@1.5/$$i.png ; \
			$(INKSCAPE) --export-id=$$i \
			            --export-dpi=138 \
			            --export-id-only \
			            --export-png=$$variant@1.5/$$i.png $$src_file > /dev/null 2>&1  \
			&& $(OPTIPNG) -o7 --quiet $$variant@1.5/$$i.png ; \
			echo ; \
			echo Rendering $$variant@2/$$i.png ; \
			$(INKSCAPE) --export-id=$$i \
			            --export-dpi=192 \
			            --export-id-only \
			            --export-png=$$variant@2/$$i.png $$src_file > /dev/null 2>&1  \
			&& $(OPTIPNG) -o7 --quiet $$variant@2/$$i.png ; \
		done ; \
	done
	cp assets/* $(THEMES_DIR)/Skeuos-Light/xfwm4/
	cp assets-dark/* $(THEMES_DIR)/Skeuos-Dark/xfwm4/
	cp assets@1.5/* $(THEMES_DIR)/Skeuos-Light-HiDPI/xfwm4/
	cp assets-dark@1.5/* $(THEMES_DIR)/Skeuos-Dark-HiDPI/xfwm4/
	cp assets@2/* $(THEMES_DIR)/Skeuos-Light-xHiDPI/xfwm4/
	cp assets-dark@2/* $(THEMES_DIR)/Skeuos-Dark-xHiDPI/xfwm4/

clean:
	-rm -r assets assets@1.5 assets@2 assets-dark assets-dark@1.5 assets-dark@2
