include ../../Makefile.inc

ASSETS=$(shell xargs < assets.txt)
THEMES_DIR=../../../

.PHONY: build $(COLOR_VARIANTS) clean

build: $(COLOR_VARIANTS)

$(COLOR_VARIANTS):
	for variant in Light Dark ; \
	do \
		mkdir -p $(THEMES_DIR)Skeuos-$@-$$variant-XFWM/xfwm4/ ; \
		mkdir -p $(THEMES_DIR)Skeuos-$@-$$variant-XFWM-HiDPI/xfwm4/ ; \
		mkdir -p $(THEMES_DIR)Skeuos-$@-$$variant-XFWM-xHiDPI/xfwm4/ ; \
		sed 's/$(DEFAULT_THEME_COLOR)/$(COLOR_$@)/gi' Assets-$$variant.svg > __Assets-$$variant-$@.svg ; \
		for asset in $(ASSETS) ; \
		do \
			echo ; \
			echo Rendering $$asset.png $@ ; \
			$(INKSCAPE) --export-id=$$asset \
			            --export-id-only \
			            --export-png=$(THEMES_DIR)Skeuos-$@-$$variant-XFWM/xfwm4/$$asset.png \
			            __Assets-$$variant-$@.svg > /dev/null 2>&1 \
			&& $(OPTIPNG) $(THEMES_DIR)Skeuos-$@-$$variant-XFWM/xfwm4/$$asset.png ; \
			echo ; \
			echo Rendering $$asset.png $@ @1.5; \
			$(INKSCAPE) --export-id=$$asset \
			            --export-dpi=138 \
			            --export-id-only \
			            --export-png=$(THEMES_DIR)Skeuos-$@-$$variant-XFWM-HiDPI/xfwm4/$$asset.png \
			            __Assets-$$variant-$@.svg > /dev/null 2>&1 \
			&& $(OPTIPNG) $(THEMES_DIR)Skeuos-$@-$$variant-XFWM-HiDPI/xfwm4/$$asset.png ; \
			echo ; \
			echo Rendering $$asset.png $@ @2 ; \
			$(INKSCAPE) --export-id=$$asset \
			            --export-dpi=192 \
			            --export-id-only \
			            --export-png=$(THEMES_DIR)Skeuos-$@-$$variant-XFWM-xHiDPI/xfwm4/$$asset.png \
			            __Assets-$$variant-$@.svg > /dev/null 2>&1 \
			&& $(OPTIPNG) $(THEMES_DIR)Skeuos-$@-$$variant-XFWM-xHiDPI/xfwm4/$$asset.png ; \
		done ; \
	done

clean:
	-rm __*
