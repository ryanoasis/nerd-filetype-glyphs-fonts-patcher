#!/usr/bin/env bash
# Nerd Fonts Version: 3.4.0
# Script Version: 1.0.3
# bump version number for release in scripts (bash and python)
# does not do semver format checking
# this obviously is not perfect but works good enough for now (YAGNI)
# todo take some ideas from: https://github.com/fsaintjacques/semver-tool

#set -x
LINE_PREFIX="# [Nerd Fonts] "

if [ ! $# -eq 1 ]
  then
    echo "$LINE_PREFIX No release version given, must give semver release version in format: #.#.#, e.g. 1.1.0"
fi

release=$1

echo "$LINE_PREFIX Bump version to $release"

function patch_file {
    echo "patching $1"
    sed -i -E "s/^(# Nerd Fonts Version: )[0-9]+\.[0-9]+\.[0-9]+.*/\1$release/" "$1"
    sed -i -E "s/^(version *= *\")[0-9]+\.[0-9]+\.[0-9]+.*(\") *$/\1$release\2/" "$1"
}

while IFS= read -r file; do
    patch_file "$file"
done < <(find ../.. -name "*.sh" -o -name "*.py" -o -name "font-patcher" -type f)
