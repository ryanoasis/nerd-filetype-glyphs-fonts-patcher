#!/usr/bin/env bash
# Nerd Fonts Version: 3.4.0
# Script Version: 1.0.0
#
# Search for a glyph by part of its name in all patchsets
# Usage: ./cheatsheet.sh divider

# Get script directory to set source and target dirs relative to it
sd="$( cd -- "$(dirname "${0}")" >/dev/null 2>&1 || exit ; pwd -P )"

# shellcheck disable=SC1091 # Do not pull in the sourced file
source "${sd}/lib/i_all.sh"

# Search the key on the declared variables
for glyph in ${!i_*}; do
  if [[ "${glyph}" == *"${1}"* ]]; then
    printf "%s\t%x\t%s\n" "${!glyph}" "'${!glyph}'" "${glyph}"
  fi
done
