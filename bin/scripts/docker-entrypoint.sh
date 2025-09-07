#!/bin/sh

set -e

args=""

# check all args for --out or -o
while [ "$#" -gt 0 ]; do
	if [ "$1" = "-out" ] || [ "$1" = "--outputdir" ];then
		# move past the option
		shift
		# and the value if there is one
		case "$1" in
			-*) continue ;;
			*) shift $(( $# > 0 ? 1 : 0 )) ;;
		esac
		continue
	fi
	args="$args $1"
	shift
done

if [ -z "$PN" ]; then
	PN=0
fi

printf "Running with options:\n%s\nParallelism %s\n" "$args" "$PN"

# shellcheck disable=SC2086
find /in -type f \
	\( -iname '*.otf' -o -iname '*.ttf' -o -iname '*.woff' -o -iname '*.eot' -o -iname '*.ttc' \) \
	-print0 \
	| parallel --verbose --null "--jobs=${PN}" fontforge -script /nerd/font-patcher -out /out $args {}

if [ -f font-patcher-log.txt ]; then
	cp -f font-patcher-log.txt /out
fi

exit 0
