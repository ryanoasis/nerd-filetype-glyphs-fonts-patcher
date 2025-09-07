#!/usr/bin/env bash

FONT_VERSION=1.200
TMP_DIR=$(mktemp -d)

set -e

curl -LOf "https://github.com/githubnext/monaspace/releases/download/v${FONT_VERSION}/monaspace-v${FONT_VERSION}.zip" --output-dir "${TMP_DIR}"
unzip -d "${TMP_DIR}" "${TMP_DIR}/*.zip"
ls -alh "${TMP_DIR}"

# In order of increasing atomic mass:
typefaces=(Neon Argon Krypton Xenon Radon)

weights=(ExtraLight ExtraLightItalic Light LightItalic Regular Italic Bold BoldItalic Medium MediumItalic)

for face in "${typefaces[@]}"; do
    echo "Processing ${face} ..."
    mkdir -p "${face}"
    for weight in "${weights[@]}"; do
        find "${TMP_DIR}" -name "Monaspace${face}-${weight}.otf" -exec mv "{}" "${face}" \;
    done
done
