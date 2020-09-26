#!/bin/sh

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RESET='\033[0m'

while read file;
do
	echo
	echo -e " $GREEN[ * ]$RESET Downloading file $file"
	wget https://gitlab.gnome.org/GNOME/libhandy/-/raw/master/src/themes/$file --timestamping --quiet
done <<- EOF
	_definitions.scss
	_shared-base.scss
	_Adwaita-base.scss
	_fallback-base.scss
EOF
echo

ln -rsfv ../upstream/_drawing.scss
