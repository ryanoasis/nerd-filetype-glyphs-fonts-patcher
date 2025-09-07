#!/usr/bin/env bash
# Nerd Fonts Version: 3.4.0
# Script Version: 1.0.1

set -e

# Do not optimize files that are smaller than
size_limit=0

# Do not optimize files, where the new size is more than X% of current size
size_ratio_max=80

function get_size {
    du -b "$1" | sed 's/\([0-9]\)[^0-9].*$/\1/'
}

echo
echo "Checking for SVG simplifications"

if [ "$1" != "doit" ]; then
    dry="dry"
else
    dry=""
fi

if [ -n "${dry}" ]; then
    echo "  This is a dry run: no actual modifications are performed"
    echo "  Specify 'doit' as parameter to actually optimize the svgs"
else
    echo "  Files might be MODIFIED by this run ('doit' specified)"
fi

svg_dir="../../src/svgs"

symbols=()
while IFS= read -d $'\0' -r file ; do
    symbols=("${symbols[@]}" "$file")
done < <(find "${svg_dir}" -name "*.svg" -print0)
echo "Found ${#symbols[@]} svgs in ${svg_dir}"

count=0
for s in "${symbols[@]}"; do
    inkscape "$s" "--actions=select-all;object-simplify-path;export-filename:temp.svg;export-do;quit-inkscape" 2>/dev/null
    old_size=$(get_size "$s")
    new_size=$(get_size "temp.svg")
    if [ "${old_size}" -lt "${size_limit}" ]; then
        continue
    fi
    ratio=$(dc -e "${new_size} 100 * ${old_size} / p")
    if [ "${ratio}" -lt "${size_ratio_max}" ]; then
        echo "Simplification for $(basename "${s}") (${old_size} -> ${new_size}) ${ratio}%"
	count=$(dc -e "${count} 1 + p")
        if [ -z "${dry}" ]; then
            mv temp.svg "${s}"
        fi
    fi
done
echo "Found ${count} svgs to simplify"
rm temp.svg
