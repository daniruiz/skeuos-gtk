#!/bin/sh

RED='\033[1;31m'
BLUE='\033[1;36m'
GREEN='\033[1;32m'
ORANGE='\033[1;33m'
UNDERLINE='\033[3;4m'
RESET='\033[0m'

printf $BLUE
printf '     ___________                               \n'; sleep 0.1
printf '    /   _____/  | __ ____  __ __  ____  ______ \n'; sleep 0.1
printf '    \_____  \|  |/ // __ \|  |  \/  _ \/  ___/ \n'; sleep 0.1
printf '    /        \    <\  ___/|  |  (  <_> )___ \  \n'; sleep 0.1
printf '   /_______  /__|_ \\___  >____/ \____/____  > \n'; sleep 0.1
printf '           \/     \/    \/                 \/  \n'; sleep 0.1
printf '                                               \n'; sleep 0.1
printf $RESET

if [ $# -lt 3 ]
then
  printf "    ${GREEN}Usage:${RESET} ${UNDERLINE}$0${RESET} ${ORANGE}<VARIANT_NAME> <HIGHLIGHT_HEX_COLOR> <HIGHLIGHT_TEXT_HEX_COLOR>${RESET}\n"
  printf "                                                                                                                                  \n"
  printf "        ${GREEN}Example:${RESET} ${UNDERLINE}$0${RESET} ${ORANGE}FOOBAR '#123456' '#987654'${RESET}                               \n"
  EXIT=1
fi

command -v make     > /dev/null \
  || { printf "   ${RED} !! YOU NEED TO INSTALL ${RESET}make\n"; EXIT=1; }
command -v inkscape > /dev/null \
  || { printf "   ${RED} !! YOU NEED TO INSTALL ${RESET}inkscape\n"; EXIT=1; }
command -v sassc > /dev/null \
  || { printf "   ${RED} !! YOU NEED TO INSTALL ${RESET}sassc\n"; EXIT=1; }

command -v optipng > /dev/null \
  || printf "   ${ORANGE} !! OPTIONALLY INSTALL optipng for assets minification${RESET}"

[ -z $EXIT ] || exit 1


sleep 1

eval export COLOR_VARIANTS=$1
eval export COLOR_$COLOR_VARIANTS=$2
eval export TEXT_COLOR_$COLOR_VARIANTS=$3

rm -rf themes/*
make -j build
