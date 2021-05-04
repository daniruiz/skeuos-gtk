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
	-for src_file in $(CURRENT_ASSET) $(CURRENT_ASSET_DARK); \
	do \
		variant=$$(basename $${src_file%.svg}) ; \
		mkdir -p $$variant ; \
		for i in $(ASSETS) ; \
		do \
			echo ; \
			echo Rendering $$variant/$$i.svg ; \
			$(INKSCAPE) --export-id=$$i \
			            --export-id-only \
			            --export-filename=$$variant/$$i.svg $$src_file > /dev/null 2>&1 \
			&& $(OPTIPNG) $$variant/$$i.svg ; \
		done ; \
	done
	mkdir -p $(THEMES_DIR)Skeuos-$@-Light/metacity-1/
	mkdir -p $(THEMES_DIR)Skeuos-$@-Dark/metacity-1/
	cp assets-$@/* $(THEMES_DIR)Skeuos-$@-Light/metacity-1/
	cp assets-$@-dark/* $(THEMES_DIR)Skeuos-$@-Dark/metacity-1/

clean:
	-rm -r $(foreach COLOR_VARIANT, $(COLOR_VARIANTS), \
	  assets-$(COLOR_VARIANT)/ \
	  assets-$(COLOR_VARIANT)-dark/ \
	  assets-$(COLOR_VARIANT).svg \
	  assets-$(COLOR_VARIANT)-dark.svg)
