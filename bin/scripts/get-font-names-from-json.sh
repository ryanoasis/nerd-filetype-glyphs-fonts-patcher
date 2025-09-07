#!/usr/bin/env bash
# Nerd Fonts Version: 3.4.0
# Script Version: 1.1.0
# Gets all the font folder names to build the matrix for the github actions

# used for debugging
# set -x

main() {
  # for testing a small subset (useful to prove out significant changes w/o all font overhead):
  # jq '.fonts | .[] | .folderName' lib/fonts-small-subset.json | jq -sc
  # add all the fonts to the matrix:
  jq '.fonts | .[] | .folderName' lib/fonts.json | jq -sc
}

main; exit
