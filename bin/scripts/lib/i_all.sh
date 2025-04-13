#!/usr/bin/env bash
# Nerd Fonts Version: 3.3.0
# Script Version 1.3.0

# Usually this is called without argument. If the first argument
# is 'include-old-material' the old material design icons will be
# included. This is needed for the cheat sheet.

sets=('cod' 'dev' 'extra' 'fae' 'fa' 'iec' 'logos' 'oct' 'ple' 'pom' 'seti' 'weather' 'md')
base=$(dirname "${BASH_SOURCE[0]:-$0}")

if [ "$1" = "include-old-material" ]; then
	sets+=('material')
fi

for set in "${sets[@]}"; do
	i="${base}/i_${set}.sh"
	dups=$(grep ' i_' "$i" | sed 's/.* i_//;s/=.*//' | sort | uniq -D | wc -l)
	if [ "$dups" -gt 0 ]; then
		echo "Found duplicate glyph names in ${i}"
		grep ' i_' "$i" | sed 's/.* i_//;s/=.*//' | sort | uniq -D
		exit 1
	fi
	# shellcheck disable=SC1090 # We check the sources individually
	test -f "$i" -a -r "$i" && source "$i"
done
unset i
