#!/bin/bash
set -euo pipefail

#nb: must be bash to support shopt globstar
shopt -s globstar

#ANSI Escape Codes for colors to increase contrast of errors
RED="\033[0;31m"
GREEN="\033[0;32m"
BLUE="\033[0;34m"
NC="\033[0m" # No Color

st=0

if git grep -P "\r\n"; then
    echo "ERROR: CRLF line endings detected. Please stop using the webeditor, and fix it using a desktop Git client."
	st = 1
fi;
if grep -El '^\".+\" = \(.+\)' _maps/_mod_juicy/**/*.dmm;	then
    echo "ERROR: Non-TGM formatted map detected. Please convert it using Map Merger!"
    st=1
fi;
if grep -P '^\ttag = \"icon' _maps/_mod_juicy/**/*.dmm;	then
    echo "ERROR: tag vars from icon state generation detected in maps, please remove them."
    st=1
fi;
if grep -P 'step_[xy]' _maps/_mod_juicy/**/*.dmm;	then
    echo "ERROR: step_x/step_y variables detected in maps, please remove them."
    st=1
fi;
if grep -P 'pixel_[^xy]' _maps/_mod_juicy/**/*.dmm;	then
    echo "ERROR: incorrect pixel offset variables detected in maps, please remove them."
    st=1
fi;
# echo "Checking for cable varedits"
# if grep -P '/obj/structure/cable(/\w+)+\{' _maps/_mod_juicy/**/*.dmm;	then
#     echo "ERROR: vareditted cables detected, please remove them."
#     st=1
# fi;
# if grep -P '\td[1-2] =' _maps/_mod_juicy/**/*.dmm;	then
#     echo "ERROR: d1/d2 cable variables detected in maps, please remove them."
#     st=1
# fi;
echo "Checking for stacked cables"
if grep -P '"\w+" = \(\n([^)]+\n)*/obj/structure/cable,\n([^)]+\n)*/obj/structure/cable,\n([^)]+\n)*/area/.+\)' _maps/_mod_juicy/**/*.dmm;	then
    echo "found multiple cables on the same tile, please remove them."
    st=1
fi;
if grep -P '^/area/.+[\{]' _maps/_mod_juicy/**/*.dmm;	then
    echo "ERROR: Vareditted /area path use detected in maps, please replace with proper paths."
    st=1
fi;
if grep -P '\W\/turf\s*[,\){]' _maps/_mod_juicy/**/*.dmm; then
    echo "ERROR: base /turf path use detected in maps, please replace with proper paths."
    st=1
fi;
if grep -P '^/*var/' code/**/*.dm; then
    echo "ERROR: Unmanaged global var use detected in code, please use the helpers."
    st=1
fi;
# echo "Checking for space indentation"
# if grep -P '(^ {2})|(^ [^ * ])|(^    +)' code/**/*.dm; then
#     echo "space indentation detected"
#     st=1
# fi;
# echo "Checking for mixed indentation"
# if grep -P '^\t+ [^ *]' code/**/*.dm; then
#     echo "mixed <tab><space> indentation detected"
#     st=1
# fi;
nl='
'
nl=$'\n'
while read f; do
    t=$(tail -c2 "$f"; printf x); r1="${nl}$"; r2="${nl}${r1}"
    if [[ ! ${t%x} =~ $r1 ]]; then
        echo "file $f is missing a trailing newline"
        st=1
    fi;
done < <(find . -type f -name '*.dm')
# if grep -P '^/[\w/]\S+\(.*(var/|, ?var/.*).*\)' code/**/*.dm; then
#     echo "changed files contains proc argument starting with 'var'"
#     st=1
# fi;
if grep -i 'centcomm' code/**/*.dm; then
    echo "ERROR: Misspelling(s) of CENTCOM detected in code, please remove the extra M(s)."
    st=1
fi;
if grep -i 'centcomm' _maps/_mod_juicy/**/*.dmm; then
    echo "ERROR: Misspelling(s) of CENTCOM detected in maps, please remove the extra M(s)."
    st=1
fi;
if grep -ni 'nanotransen' code/**/*.dm; then
    echo "Misspelling(s) of nanotrasen detected in code, please remove the extra N(s)."
    st=1
fi;
if grep -ni 'nanotransen' _maps/_mod_juicy/**/*.dmm; then
    echo "Misspelling(s) of nanotrasen detected in maps, please remove the extra N(s)."
    st=1
fi;
if ls _maps/_mod_juicy/*.json | grep -P "[A-Z]"; then
    echo "Uppercase in a map json detected, these must be all lowercase."
    st=1
fi;
if grep -i '/obj/effect/mapping_helpers/custom_icon' _maps/_mod_juicy/**/*.dmm; then
    echo "Custom icon helper found. Please include dmis as standard assets instead for built-in maps."
    st=1
fi;
if grep -n '.Find()' code/**/*.dm; then
    echo "Empty Find() found. Please try to figure out what was meant to be found."
	st=1
fi;
for json in _maps/_mod_juicy/*.json
do
    map_path=$(jq -r '.map_path' $json)
    while read map_file; do
        filename="_maps/_mod_juicy/$map_path/$map_file"
        if [ ! -f $filename ]
        then
            echo "found invalid file reference to $filename in _maps/_mod_juicy/$json"
            st=1
        fi
    done < <(jq -r '[.map_file] | flatten | .[]' $json)
done

# Check for non-515 compatable .proc/ syntax
if grep -P --exclude='__byond_version_compat.dm' '\.proc/' code/**/*.dm modular_citadel/code/**/* modular_sand/code/**/* modular_splurt/code/**/* modular_bluemoon/code/**/*; then
    echo
    echo -e "${RED}ERROR: Outdated proc reference use detected in code, please use proc reference helpers.${NC}"
    st=1
fi;

# I'm not even sure we're meant to be setting this variable on dmms anyways, make sure it's at least an area please.
if grep -P 'areastring = "\/[^area]' _maps/_mod_juicy/**/*.dmm; then
    echo
    echo -e "${RED}ERROR: Bad areastring path variable for this APC, please set the areastring correctly.${NC}"
    st=1
fi;

if [ $st = 0 ]; then
    echo
    echo -e "${GREEN}No errors found using grep!${NC}"
fi;
if [ $st = 1 ]; then
    echo
    echo -e "${RED}Errors found, please fix them and try again.${NC}"
fi;

exit $st
