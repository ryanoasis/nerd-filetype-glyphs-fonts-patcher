#!/usr/bin/env bash
# Nerd Fonts Version: 3.4.0
# Script Version: 1.2.3
# Create font previews.
# All fonts need to be installed (or no preview is generated)
# Files should end up in the gh-pages branch

set -e
ver=$(inkscape --version)
echo "Check generator version: $ver"

output_dir="../../assets/img/previews/"
template_svg="lib/template-font-preview.svg"
template2_svg="lib/template-font-preview2.svg"

main() {
  mkdir -p "$output_dir"

  for i in $(jq '.fonts | keys | .[]' lib/fonts.json); do
    patchedName=$(jq -r ".fonts[$i].patchedName" lib/fonts.json);
    imagePreviewFont=$(jq -r ".fonts[$i].imagePreviewFont" lib/fonts.json);
    if [ "$imagePreviewFont" != "$patchedName Nerd Font" ] && [ "$imagePreviewFont" != "$patchedName NF" ]; then
      echo "[mismatch] (Fam vs name)  $imagePreviewFont <=> $patchedName"
    fi
    if [ -z "$imagePreviewFont" ]; then
      echo "[Skipping]   $patchedName"
      continue
    fi

    if fc-list -q "${imagePreviewFont}:charset=41" ; then
      generate_preview "$imagePreviewFont" "$patchedName Nerd Font"
    elif fc-list -q "${imagePreviewFont}" ; then
      generate_preview_symbols "$imagePreviewFont" "$patchedName Nerd Font"
    else
      echo "[Missing]    $imagePreviewFont"
    fi
  done

}

generate_preview() {
  font=$1
  fontText=$2
  echo "[Generating] $font"
  sed -e "s/000000/ffffff/" -e "s/sans-serif/${font}/" -e "s/Font Name/${fontText}/" <"$template_svg" >"${output_dir}${font}.svg"
  inkscape "${output_dir}${font}.svg" --actions="select-all; object-to-path; vacuum-defs; fit-canvas-to-selection; export-filename:${output_dir}${font}.svg; export-do"
  # svgo "${output_dir}${font}.svg"
}

generate_preview_symbols() {
  font=$1
  fontText=$2
  echo "[Gen. Symb.] $font"
  sed -e "s/000000/ffffff/" -e "40,80s/sans-serif/${font}/" -e "s/Font Name/${fontText}/" <"$template2_svg" >"${output_dir}${font}.svg"
  inkscape "${output_dir}${font}.svg" --actions="select-all; object-to-path; vacuum-defs; fit-canvas-to-selection; export-filename:${output_dir}${font}.svg; export-do"
  # svgo "${output_dir}${font}.svg"
}

######
# For the two following helpers you need to enable THIS first:
#
# This is not 100% correct because the config.cfg is not evaluated
if false; then
  cd ../../src/unpatched-fonts
  image_font_files=( )
  while IFS= read -d $'\n' -r f; do
    dir=$(dirname "${f}")
    # fontforge ~/git/nerd-fonts/font-patcher ~/git/nerd-fonts/src/unpatched-fonts/"${f}" -c --debug 3
    dest=${dir}/$(fontforge ../../font-patcher --dry "${f}" --debug 2 2>/dev/null | grep 'DEBUG: =====> Filename' | sed "s/[^']*'//;s/'.*//")
    echo "Found font filename: $dest"
    image_font_files+=( "${dest}" )
  done < <(jq -r '.fonts | .[] | ."imagePreviewFontSource"' ../../bin/scripts/lib/fonts.json)
  cd -
fi

# Enable this to get a list of instruction to install all the needed fonts
#
# for f in "${image_font_files[@]}"; do
#   echo "cp '../../patched-fonts/$f' ~/.local/share/fonts"
# done
# exit

# Enable this to get a list of Family names
#
# for f in "${image_font_files[@]}"; do
#   fc-query "../../patched-fonts/$f" '-f %{family}\n' || true
# done
# exit

main "$@"; exit
