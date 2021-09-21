include ../../Makefile.inc

ASSETS=$(shell xargs < assets.txt)
THEMES_DIR=../../../themes/

.PHONY: build $(COLOR_VARIANTS) clean

build: $(COLOR_VARIANTS)

$(COLOR_VARIANTS):
	for variant in Light Dark ; \
	do \
		mkdir -p $(THEMES_DIR)Skeuos-$@-$$variant/metacity-1/ ; \
		sed 's/$(DEFAULT_THEME_COLOR)/$(COLOR_$@)/gi' Assets-$$variant.svg > __Assets-$$variant-$@.svg ; \
		for asset in $(ASSETS) ; \
		do \
			echo ; \
			echo Rendering $$asset.svg $@ ; \
			$(INKSCAPE) --export-id=$$asset \
				        --export-id-only \
				        --export-filename=$(THEMES_DIR)Skeuos-$@-$$variant/metacity-1/$$asset.svg \
				        __Assets-$$variant-$@.svg > /dev/null 2>&1; \
		done ; \
	done

clean:
	-rm __*
