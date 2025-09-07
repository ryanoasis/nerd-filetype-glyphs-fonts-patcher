#!/usr/bin/env bash

FONT_VERSION=33.2.1
TMP_DIR=$(mktemp -d)

set -ex

curl -LOf "https://github.com/be5invis/Iosevka/releases/download/v${FONT_VERSION}/PkgTTF-IosevkaTerm-${FONT_VERSION}.zip" --output-dir "${TMP_DIR}"
unzip -d "${TMP_DIR}" "${TMP_DIR}/*.zip"

rm "${TMP_DIR}/PkgTTF-IosevkaTerm-${FONT_VERSION}.zip" "${TMP_DIR}/IosevkaTerm-Extended"*

ls -alh "${TMP_DIR}"

mv "${TMP_DIR}/"* .
