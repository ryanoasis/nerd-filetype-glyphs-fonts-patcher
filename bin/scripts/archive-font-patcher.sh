#!/usr/bin/env bash
# Nerd Fonts Version: 3.4.0
# Script Version: 1.2.0
# Archives the font patcher script and the required source files
# If some (any) argument is given this is though of as intermediate version
# used for debugging
# set -x

# LINE_PREFIX="# [Nerd Fonts]"
scripts_root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/"
parent_dir="${PWD}/../../"
outputdir=$scripts_root_dir../../archives

mkdir -p "$outputdir"

# create a mini readme with basic info on Nerd Fonts project
touch "$outputdir/readme.md"
mini_readme="$outputdir/readme.md"
cat "$parent_dir/src/archive-font-patcher-readme.md" >> "$mini_readme"
if [ $# -ge 1 ]; then
  echo "Intermediate version, adding git version"
  echo -e "\n## Version\nThis archive is created from\n" >> "$mini_readme"
  git log --pretty=medium --no-decorate --no-abbrev -n 1 HEAD | sed 's/^/        /' >> "$mini_readme"
fi

# clear out the directory zips
find "${outputdir:?}" -name "FontPatcher.zip" -type f -delete

cd -- "$scripts_root_dir/../../" || exit 1
find "src/glyphs" | zip -9 "$outputdir/FontPatcher" -@
find "bin/scripts/braille" -name "Braille.py" | zip -9 "$outputdir/FontPatcher" -@
find "bin/scripts/name_parser" -name "Fontname*.py" | zip -9 "$outputdir/FontPatcher" -@
find "glyphnames.json" | zip -9 "$outputdir/FontPatcher" -@
find "font-patcher" | zip -9 "$outputdir/FontPatcher" -@

# add mini readme file
zip -9 "$outputdir/FontPatcher" -rj "$mini_readme" -q
rm -f "$mini_readme"

# @TODO check zip status
# zipStatus=$?

# if [ "$zipStatus" != "0" ]
# then
#   echo "$LINE_PREFIX error, font-patcher archive not created"
#   exit 1
# else
#   echo "$LINE_PREFIX font-patcher archive created successfully"
# fi;
