include ../../Makefile.inc

SRC_FILE=assets.svg

SRC_FILE_DARK=assets-dark.svg

ASSETS=$(shell xargs < assets.txt)
THEMES_DIR=../../../

.PHONY: build $(COLOR_VARIANTS) clean

build: $(COLOR_VARIANTS)

$(COLOR_VARIANTS):
	$(eval CURRENT_ASSET=assets-$@.svg)
	$(eval CURRENT_ASSET_DARK=assets-$@-dark.svg)
	sed 's/$(DEFAULT_THEME_COLOR)/$(COLOR_$@)/gi' $(SRC_FILE) > $(CURRENT_ASSET)
	sed 's/$(DEFAULT_THEME_COLOR)/$(COLOR_$@)/gi' $(SRC_FILE_DARK) > $(CURRENT_ASSET_DARK)
	for src_file in $(CURRENT_ASSET) $(CURRENT_ASSET_DARK); \
	do \
		variant=$$(basename $${src_file%.svg}) ; \
		mkdir -p $$variant $$variant@1.5 $$variant@2 ; \
		for i in $(ASSETS) ; \
		do \
			echo ; \
			echo Rendering $$variant/$$i.png ; \
			$(INKSCAPE) --export-id=$$i \
			            --export-id-only \
			            --export-png=$$variant/$$i.png $$src_file > /dev/null 2>&1 \
			&& $(OPTIPNG) $$variant/$$i.png ; \
			echo ; \
			echo Rendering $$variant@1.5/$$i.png ; \
			$(INKSCAPE) --export-id=$$i \
			            --export-dpi=138 \
			            --export-id-only \
			            --export-png=$$variant@1.5/$$i.png $$src_file > /dev/null 2>&1  \
			&& $(OPTIPNG) $$variant@1.5/$$i.png ; \
			echo ; \
			echo Rendering $$variant@2/$$i.png ; \
			$(INKSCAPE) --export-id=$$i \
			            --export-dpi=192 \
			            --export-id-only \
			            --export-png=$$variant@2/$$i.png $$src_file > /dev/null 2>&1  \
			&& $(OPTIPNG) $$variant@2/$$i.png ; \
		done ; \
	done
	mkdir -p $(THEMES_DIR)Skeuos-$@-Light-XFWM/xfwm4/
	mkdir -p $(THEMES_DIR)Skeuos-$@-Dark-XFWM/xfwm4/
	mkdir -p $(THEMES_DIR)Skeuos-$@-Light-XFWM-HiDPI/xfwm4/
	mkdir -p $(THEMES_DIR)Skeuos-$@-Dark-XFWM-HiDPI/xfwm4/
	mkdir -p $(THEMES_DIR)Skeuos-$@-Light-XFWM-xHiDPI/xfwm4/
	mkdir -p $(THEMES_DIR)Skeuos-$@-Dark-XFWM-xHiDPI/xfwm4/
	cp assets-$@/* $(THEMES_DIR)Skeuos-$@-Light-XFWM/xfwm4/
	cp assets-$@-dark/* $(THEMES_DIR)Skeuos-$@-Dark-XFWM/xfwm4/
	cp assets-$@@1.5/* $(THEMES_DIR)Skeuos-$@-Light-XFWM-HiDPI/xfwm4/
	cp assets-$@-dark@1.5/* $(THEMES_DIR)Skeuos-$@-Dark-XFWM-HiDPI/xfwm4/
	cp assets-$@@2/* $(THEMES_DIR)Skeuos-$@-Light-XFWM-xHiDPI/xfwm4/
	cp assets-$@-dark@2/* $(THEMES_DIR)Skeuos-$@-Dark-XFWM-xHiDPI/xfwm4/

clean:
	-rm -r $(foreach COLOR_VARIANT, $(COLOR_VARIANTS), \
	  assets-$(COLOR_VARIANT)/ \
	  assets-$(COLOR_VARIANT)-dark/ \
	  assets-$(COLOR_VARIANT)@1.5/ \
	  assets-$(COLOR_VARIANT)-dark@1.5/ \
	  assets-$(COLOR_VARIANT)@2/ \
	  assets-$(COLOR_VARIANT)-dark@2/ \
	  assets-$(COLOR_VARIANT).svg \
	  assets-$(COLOR_VARIANT)-dark.svg)
