#!/usr/bin/env bash

# This script downloads release using `FONT_VERSION` variable
# and updates font files.
# It is designed to be ran from the ./src/unpatched-fonts/MartianMono dir.

FONT_VERSION=1.1.0
TMP_DIR=$(mktemp -d)

set -e

curl -LOf "https://github.com/evilmartians/mono/releases/download/v${FONT_VERSION}/martian-mono-${FONT_VERSION}-ttf.zip" --output-dir "${TMP_DIR}"
unzip -d "${TMP_DIR}" "${TMP_DIR}/*.zip"
ls -alh "${TMP_DIR}"

# Do some reconstruction on the names to be able to parse the name with the font-patcher...
# This is not needed for usual fonts.

# typefaces=(Cn Nr Std sWd) # Condensed Narrow Standard SemiWide
typefaces1=(Cn Std)
typefaces2=(Condensed '')

# weights=(Th xLt Lt Rg Md Bd xBd) # Thin ExtraLight Light Regular Medium Bold ExtraBold
weights1=(Rg Md Bd)
weights2=(Regular Medium Bold)

i=0
for face in "${typefaces1[@]}"; do
    echo "Processing ${face} ..."
    mkdir -p "${face}"
    j=0
    for weight in "${weights1[@]}"; do
        find "${TMP_DIR}" -name "MartianMono-${face}${weight}.ttf" -exec mv "{}" "${face}/MartianMono-${typefaces2[$i]}${weights2[$j]}.ttf" \;
        j=$((j + 1))
    done
    i=$((i + 1))
done
