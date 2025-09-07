#!/usr/bin/env bash
# Nerd Fonts Version: 3.4.0
# calls the necessary scripts in the necessary order to prepare for a release
#
# This is not used for production

#set -x
LINE_PREFIX="# [Nerd Fonts] "

if [ ! $# -eq 1 ]
  then
    echo "$LINE_PREFIX No release version given, must give semver release versionin format: #.#.#, e.g. 1.1.0"
fi

release=$1

./version-bump.sh "$release"
./gotta-patch-em-all-font-patcher!.sh
./generate-fontconfig.sh
./generate-casks.sh
./archive-fonts.sh
#./upload-archives.sh # better done as a separate step (via gh action)
./generate-css.sh
./generate-webfonts.sh

exit

