#!/usr/bin/env bash
# Nerd Fonts Version: 3.4.0
# Script Version: 2.0.1
#
# Fetches the current release files.
# It fetches the latest release, not release candidate.
# Or fetches the specified release's files.
#
# The second parameter specifies the beginning of the artifact
# name that shall be fetched. If unspecified all artifacts will
# be fetched.
#
# Example runs
#   fetch-archives
#   fetch-archives v2.2.2
#   fetch-archives v2.2.2 Heavy
#   fetch-archives latest HeavyDat
#   fetch-archives v3.1.0 'Ara.*zip'   (just fetch the zip archive)

set -e

LINE_PREFIX="# [Nerd Fonts] "
scripts_root_dir="$(cd "$(dirname "$0")" && pwd)"
outputdir=$(realpath "${scripts_root_dir}/../../archives")

if [ $# -ge 1 ]; then
    versiontag=$1
else
    versiontag="latest"
fi

if [ "${versiontag}" != "latest" ]; then
    echo "${LINE_PREFIX} Fetching release archives with version tag '${versiontag}'"
    releasedata=$(curl -Lf "https://api.github.com/repos/ryanoasis/nerd-fonts/releases")
    num=$(jq ".[] | select(.tag_name == \"${versiontag}\") | .assets | length" <<< "${releasedata}")
    if [ -z "${num}" ]; then
        echo "${LINE_PREFIX} Release tag ${versiontag} unknown"
        exit 1
    fi
    files=()
    while IFS='' read -r file; do
        files+=("$file")
    done < <(jq -r ".[] | select(.tag_name == \"${versiontag}\") | .assets[].name | @sh" <<< "${releasedata}")
else
    echo "${LINE_PREFIX} Fetching latest release archives"
    releasedata=$(curl -Lf "https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest")
    versiontag=$(jq -r ".tag_name" <<< "${releasedata}")
    num=$(jq ".assets | length" <<< "${releasedata}")
    files=()
    while IFS='' read -r file; do
        files+=("$file")
    done < <(jq -r ".assets[].name | @sh" <<< "${releasedata}")
fi

echo "${LINE_PREFIX} Found ${num} artifacts"

if [ $# -ge 2 ]; then
    pattern=${2// /\\ }
    echo "${LINE_PREFIX} Limiting archive to regex '${pattern}'"
else
    pattern=""
    echo "${LINE_PREFIX} No limiting pattern given"
fi
if [ $# -gt 2 ]; then
    echo "${LINE_PREFIX} Too many parameters, exiting"
    exit 2
fi

for assetname in "${files[@]}"; do
    assetname=${assetname:1:-1}
    if [[ ! "${assetname}" =~ ${pattern} ]]; then
        continue
    fi
    echo >&2 "${LINE_PREFIX} Fetching ${versiontag}/${assetname}"
    mkdir -p "${outputdir}"
    touch "${outputdir}/_Release_${versiontag}"
    curl --fail -Lo "${outputdir}/${assetname}" "https://github.com/ryanoasis/nerd-fonts/releases/download/${versiontag}/${assetname}" \
        || echo "   => error fetching"
done
