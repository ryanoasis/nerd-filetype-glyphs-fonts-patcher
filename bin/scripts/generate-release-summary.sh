#!/usr/bin/env bash

sd="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." >/dev/null 2>&1 || exit && pwd -P)"
archivedir=${sd}/../../archives
url=https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.0/

all=$(find "${archivedir}" -name '*.zip' | sed 's/\.zip$//;s/.*\///' | sort)

echo "## Release archives"
echo "You can select between \`zip\` or \`tar.xz\`. The later are far smaller (about 1/10). Please leave feedback in #1233 if you use the \`xz\` version."
echo
echo "[FontPatcher here](${url}FontPatcher.zip) only as \`zip\`."
echo
echo "Because the artifacts list is now even longer, here listed next to each other (open details, sizes are approximate):"
echo
echo "<details>"
echo
echo "| Font |   |   |"
echo "|------|---|---|"


for font in $all; do
	# shellcheck disable=SC2012 # The human readable size is all we want
	zsize=$(LC_ALL=C ls -hs "${archivedir}/${font}.zip" | sed 's/ .*//')
	# shellcheck disable=SC2012 # The human readable size is all we want
	xsize=$(LC_ALL=C ls -hs "${archivedir}/${font}.tar.xz" | sed 's/ .*//')
	echo "| ${font} | [Zip archive (${zsize})](${url}${font}.zip) | [XZ archive (${xsize})](${url}${font}.tar.xz) |"
done

echo
echo "</details>"
