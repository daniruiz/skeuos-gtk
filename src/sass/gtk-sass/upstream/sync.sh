#!/bin/sh

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RESET='\033[0m'

VERSION=3.24.23

echo
echo -e " $YELLOW[ i ]$RESET Upstream version $VERSION"
echo

while read file;
do
	echo
	echo -e " $GREEN[ * ]$RESET Downloading file $file"
	wget https://gitlab.gnome.org/GNOME/gtk/raw/$VERSION/gtk/theme/Adwaita/$file --timestamping --quiet

	if [ -f $file.patch ]
	then
		echo -e " $YELLOW[ ~ ]$RESET Apply patch"
		patch $file $file.patch --quiet
	fi
done <<- EOF
	_colors.scss
	_common.scss
	_drawing.scss
	_colors-public.scss
EOF

