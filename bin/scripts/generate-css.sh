#!/usr/bin/env bash
# Nerd Fonts Version: 3.4.0
# Script Version: 1.3.0
# Generates CSS file for the font and cheat sheet code

# shellcheck disable=SC1091 # Do not pull in the sourced file
source ./lib/i_all.sh include-old-material

output_css_file="../../css/nerd-fonts-generated.css"
output_css_min_file="../../css/nerd-fonts-generated.min.css"
output_css_min_rem_file="../../css/nerd-fonts-generated-removed.min.css"
header_css_file="./data/css-header.txt"
header_css_min_file="./data/css-min-header.txt"
header_css_min_rem_file="./data/css-min-removed-header.txt"
output_json_file="../../glyphnames.json"

if [ ! -d "../../temp" ]; then
  mkdir "../../temp"
fi
output_cheat_sheet_file="../../temp/2017-01-04-icon-cheat-sheet.md"
cheat_sheet_head_file="./data/cheatsheet-head.txt"
cheat_sheet_foot_file="./data/cheatsheet-foot.txt"

LINE_PREFIX="# [Nerd Fonts] "
version="3.4.0"

# clear files
true > "$output_css_file" 2> /dev/null
true > "$output_css_min_file" 2> /dev/null
true > "$output_css_min_rem_file" 2> /dev/null
true > "$output_cheat_sheet_file" 2> /dev/null
true > "$output_json_file" 2> /dev/null

# describe how the classes were established
{
  printf "/*\\n"
  printf " *%s Website: https://www.nerdfonts.com\\n" "$LINE_PREFIX"
  printf " *%s Development Website: https://github.com/ryanoasis/nerd-fonts\\n" "$LINE_PREFIX"
  printf " *%s Version: %s\\n" "$LINE_PREFIX" "$version"
  printf " *%s The following is generated from the build script\\n" "$LINE_PREFIX"
  printf " */\\n"
} | tee "$output_css_min_file" | tee "$output_css_min_rem_file" >> "$output_css_file"

# add top section of CSS
{
  printf "\\n"
  cat "$header_css_file"
} >> "$output_css_file"
tr -d '\n' < "$header_css_min_file" >> "$output_css_min_file"
tr -d '\n' < "$header_css_min_rem_file" >> "$output_css_min_rem_file"

cat "$cheat_sheet_head_file" > "$output_cheat_sheet_file"

# add top section of json
{
  printf "{\"METADATA\":{"
  printf "\"website\":\"https://www.nerdfonts.com\","
  printf "\"development-website\":\"https://github.com/ryanoasis/nerd-fonts\","
  printf "\"version\":\"%s\"," "$version"
  printf "\"date\":\"%s\"" "$(date -u --rfc-3339=seconds)"
  printf "}"
} >> "$output_json_file"

echo;

# shellcheck disable=SC2154 # we know the '$i' is from the sourced file
for var in "${!i@}"; do
  # trim 'i_' prefix
  glyph_name=${var#*_}
  # replace _ with -
  glyph_name=${glyph_name/_/-}
  glyph_char=${!var}

  #echo "$var=${!var}"

  #echo "$glyph_name"
  #echo "$glyph_char"
  #printf "%x" "'$glyph_char'"

  if [[ "$glyph_name" != mdi-* ]]; then
    # generate css rules
    {
      printf ".nf-%s:before {" "$glyph_name"
      printf "\\n"
      printf "  content: \"\\%x\";" "'$glyph_char'"
      printf "\\n"
      printf "}"
      printf "\\n"
    } >> "$output_css_file"

    # generate css min rules
    {
      printf ".nf-%s:before{content:\"\\%x\"}" "$glyph_name" "'$glyph_char'"
    } >> "$output_css_min_file"

    # generate json entry
    {
      printf ",\"%s\":{\"char\":\"%s\",\"code\":\"%x\"}" "$glyph_name" "$glyph_char" "'$glyph_char'"
    } >> "$output_json_file"

  else
    # generate css min rules for removed glyphs
    {
      printf ".nfold-%s:before{content:\"\\%x\"}" "$glyph_name" "'$glyph_char'"
    } >> "$output_css_min_rem_file"
  fi

  # generate HTML cheat sheet
  {
    if [[ "$glyph_name" = mdi-* ]]; then
      namespace="nfold"
    else
      namespace="nf"
    fi
    printf "  \"%s-%s\": \"%x\",\\n" "$namespace" "$glyph_name" "'$glyph_char'"
  } >> "$output_cheat_sheet_file"

done

cat "$cheat_sheet_foot_file" >> "$output_cheat_sheet_file"
printf "}\n" >> "$output_json_file"

printf "%s\n" "Generated CSS, json, and Cheat Sheet HTML"
printf "%s\n" "$output_css_file"
printf "%s\n" "$output_css_min_file                 [needs to also go into gh-pages:_includes/css/]"
printf "%s\n" "$output_css_min_rem_file         [needs to only go into gh-pages:_includes/css/]"
printf "%s\n" "$output_cheat_sheet_file              [needs to only go into gh-pages:_posts/]"
printf "%s\n" "$output_json_file"
