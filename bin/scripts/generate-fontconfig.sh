#!/usr/bin/env bash
# Nerd Fonts Version: 3.4.0
# Script Version: 1.0.2
# Iterates over all patched fonts directories
# to generate a fontconfig based on the Nerd Fonts Symbols font
# that contains only the glyphs

#set -x

parent_dir="$(pwd)/../../"
unpatched_parent_dir="../../src/unpatched-fonts/"
to="$parent_dir/10-nerd-font-symbols.conf"
symbolfont="Symbols Nerd Font"
LINE_PREFIX="# [Nerd Fonts] "
families=()

cd $unpatched_parent_dir || {
  echo >&2 "$LINE_PREFIX Could not find patched fonts directory"
  exit 1
}

# clear output file (needed for multiple runs or updates):
true > "$to" 2> /dev/null

# add to the file
{
  printf '<?xml version="1.0"?>'
  printf '\n<!DOCTYPE fontconfig SYSTEM "fonts.dtd">'
  printf '\n<fontconfig>'
} >> "$to"


echo "$LINE_PREFIX Generating fontconfig for: monospace"

# ad hoc add 'monospace' font family
{
  printf '\n  <alias>'
  printf '\n    <family>monospace</family>'
  printf '\n    <prefer><family>%s</family></prefer>' "$symbolfont"
  printf '\n  </alias>'
} >> "$to"

#find ./Hack -maxdepth 0 -type d | # uncomment to test 1 font
find . -mindepth 1 -maxdepth 1 -type d | LC_ALL=C sort | # uncomment to get all fonts
while read -r filename
do

	searchdir=$filename

	FONTS=()
	while IFS= read -d $'\0' -r file ; do
	  FONTS=("${FONTS[@]}" "$file")
	# limit to first variation of family (folder)
  done < <(find "$searchdir" -type f -iname '*.[ot]tf' -print0 | LC_ALL=C sort -z)
  #done

  for font in "${FONTS[@]}"; do
    familyname=$(fc-query --format='%{family}' "${font}")
    found=0
    for e in "${families[@]}"; do
      if [ "$e" = "$familyname" ]; then
        found=1
        break
      fi
    done
    if [ $found -eq 0 ]; then
      # family array doesn't contain the font yet
      # so let's add it
      families+=("$familyname")
      # echo "adding $familyname";

      echo "$LINE_PREFIX Generating fontconfig for: $familyname"

      # add to the file
      {
        printf '\n  <alias>'
        printf '\n    <family>%s</family>' "$familyname"
        printf '\n    <prefer><family>%s</family></prefer>' "$symbolfont"
        printf '\n  </alias>'
      } >> "$to"

    # else
      # echo "no need to add $familyname";
    fi
  done

done

# add to the file
{
  printf "\\n</fontconfig>\\n"
} >> "$to"

