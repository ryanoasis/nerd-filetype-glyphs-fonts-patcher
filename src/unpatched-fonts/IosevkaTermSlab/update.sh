#!/usr/bin/env bash

FONT_VERSION=33.2.1
TMP_DIR=$(mktemp -d)

set -e

curl -LOf "https://github.com/be5invis/Iosevka/releases/download/v${FONT_VERSION}/PkgTTF-IosevkaTermSlab-${FONT_VERSION}.zip" --output-dir "${TMP_DIR}"
unzip -d "${TMP_DIR}" "${TMP_DIR}/*.zip"

rm "${TMP_DIR}/PkgTTF-IosevkaTermSlab-${FONT_VERSION}.zip" "${TMP_DIR}/IosevkaTermSlab-Extended"*

ls -alh "${TMP_DIR}"

typefaces=( "" )

# weights=( regular italic oblique \
#     thin* extralight* light* medium* semibold* bold* extrabold* heavy* )

weights=( Regular italic oblique \
	light* medium* bold* extrabold* )

for face in "${typefaces[@]}"; do
    echo "Processing ${face} ..."
    if [ -z "${face}" ]; then
        face=.
    else
        mkdir -p "${face}"
    fi
    for weight in "${weights[@]}"; do
        find "${TMP_DIR}" -iname "IosevkaTermSlab-${weight}.ttf" -exec mv "{}" . \;
    done
done
