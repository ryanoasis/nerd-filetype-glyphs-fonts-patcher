#!/usr/bin/env bash

FONT_VERSION=1.2.0
TMP_DIR=$(mktemp -d)

set -e

curl -LOf "https://github.com/zed-industries/zed-fonts/releases/download/${FONT_VERSION}/zed-mono-${FONT_VERSION}.zip" --output-dir "${TMP_DIR}"
unzip -d "${TMP_DIR}" "${TMP_DIR}/*.zip"

ls -alh "${TMP_DIR}"

typefaces=( "" "Extended" )

# weights=( regular italic oblique \
#     thin* extralight* light* medium* semibold* bold* extrabold* heavy* )

weights=( "" Regular italic oblique \
    light* medium* bold* extrabold* )

for face in "${typefaces[@]}"; do
    echo "Processing ${face} ..."
    dest=${face}
    if [ -z "${face}" ]; then
        dest=Normal
    fi
    mkdir -p "${dest}"
    for weight in "${weights[@]}"; do
        find "${TMP_DIR}" -iname "zed-mono-${face}${weight}.ttf" -exec mv "{}" "${dest}" \;
    done
done
