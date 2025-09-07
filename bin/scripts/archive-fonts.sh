#!/usr/bin/env bash
# Nerd Fonts Version: 3.4.0
# Script Version: 1.2.0
# Iterates over all patched fonts directories
# to generate release archives of the patched font(s)
# Set RELEASE_VERSION to attribute a specific release
#
# Example run with pattern matching:
# ./archive-fonts heavydata
# Example with same font names for different paths
# ./archive-fonts gohu

set -e

LINE_PREFIX="# [Nerd Fonts] "
root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." >/dev/null 2>&1 || exit && pwd -P)"
outputdir=${root_dir}/archives
if [ -n "${RELEASE_VERSION}" ]; then
    release_txt="the Nerd Fonts release v${RELEASE_VERSION}"
else
    echo "${LINE_PREFIX} Do not have release version information, using generic readme"
    release_txt="a Nerd Fonts release"
fi

mkdir -p "$outputdir"

cd "${root_dir}/patched-fonts/" || {
    echo >&2 "$LINE_PREFIX Could not find patched fonts directory"
    exit 1
}

# limit archiving to given pattern (first script param) or entire root folder if no param given:
if [ $# -eq 1 ]; then
    pattern=$1
    search_pattern=$1
    echo "$LINE_PREFIX Limiting archive to pattern '$pattern'"
else
    pattern=".*"
    search_pattern=""
    echo "$LINE_PREFIX No limiting pattern given, will search entire folder"
fi

# clear out the directory
find "${outputdir:?}" -maxdepth 1 \( -name "${search_pattern}.zip" -o -name "${search_pattern}.tar.xz" \) -type f -delete

find . -maxdepth 1 -iregex "\./$pattern" -type d | sort |
while read -r filename; do
    basename=$(basename "$filename")
    searchdir=$filename
    if [[ "${basename}" =~ SymbolsOnly ]]; then
        fontconfig="TRUE"
    else
        fontconfig=
    fi

    [[ -d "$outputdir" ]] || mkdir -p "$outputdir"

    rm -f "${outputdir}/${basename}.tar"
    expected=$(find "${searchdir}" -iname "*.[ot]tf" -exec echo "+" \; | wc -l)
    if [ "${expected}" -eq 0 ]; then
        echo "${LINE_PREFIX} There seem to be no font files in ${basename}! Aborting!"
        exit 1
    fi
    echo "${LINE_PREFIX} Packing ${basename}.tar.xz (${expected} fonts)"
    # This finds all files, uniq on the filename (ignoring path):
    # shellcheck disable=SC2156 # It's hard enough with injection
    while IFS= read -d $'\0' -r descriptor; do
        path=${descriptor//|*/}
        file=${descriptor//*|/}
        if [ "$file" = "README.md" ]; then
            {
                echo "# Nerd Fonts"
                echo
                echo "This is an archived font from ${release_txt}."
                echo
                echo "For more information see:"
                echo "* https://github.com/ryanoasis/nerd-fonts/"
                echo "* https://github.com/ryanoasis/nerd-fonts/releases/latest/"
                echo
            } > "${outputdir}/${file}"
            cat "${path}/${file}" >> "${outputdir}/${file}"
            continue
        fi
        if grep -qi '.[ot]tf' <<< "${file}" ; then
            expected=$((expected - 1))
        fi
        # Need to cd to the file because we want to archive 'flat' (without subdirs):
        (cd "$path" && tar rf "$outputdir/$basename.tar" --no-recursion "$file")
    done < <(find "${searchdir}" -type f -exec bash -c 'printf "%s\000" "{}" | sed "s!\(.*\)/!\1|!"' \; | sort -z -u '-t|' -k2,2 | sort -z)

    if [ "$expected" -ne 0 ]; then
        # Should never happen, but who knows
        echo "${LINE_PREFIX} Did not pack expected number of font files! Likely same font names for different paths."
        exit 1
    fi
    (cd "${outputdir}" && tar rf "${outputdir}/${basename}.tar" "README.md")
    if [ -n "$fontconfig" ]; then
        echo "${LINE_PREFIX} Adding fontconfig"
        (cd "${root_dir}" && tar rf "${outputdir}/${basename}.tar" "10-nerd-font-symbols.conf")
    fi;
    xz -f -9 -T0 "${outputdir}/${basename}.tar"

    # ZIP stuff:
    # add font files:
    # -ic (ignore case not working)
    echo "${LINE_PREFIX} Packing ${basename}.zip"
    zip -9 "$outputdir/$basename" -rj "$searchdir" -i '*.[ot]tf' -i '*.[OT]TF' -q
    zipStatus=$?
    if [ "$zipStatus" != "0" ]; then
        echo "$LINE_PREFIX Could not create archive with the path junked (-j option) - likely same font names for different paths, zip status: $zipStatus"
        echo "$LINE_PREFIX Retrying with full path"
        # add font files and license files as full paths:
        zip -9 "$outputdir/$basename" -r "$searchdir" -i '*.[ot]tf' -i '*.[OT]TF' -i '*[Ll]icen[sc]e*' -i '*LICEN[SC]E*' -i 'OFL*' -i 'ofl*' -q
    else
        # we can copy the font files without full paths but not necessarily the license files:
        # add license files separately:
        # zip -9 "$outputdir/$basename" -rj "$searchdir" -i '*license*' -i '*LICENSE*'
        # work around to copy duplicate license files (only the last duplicate found)
        # so we don't have to copy entire paths and can still use the junk option (-j)
        find "$searchdir" -type f -iname "*licen[sc]e*" -o -iname 'ofl*' | awk -F/ '{a[$NF]=$0}END{for(i in a)print a[i]}' | zip -9 -j "$outputdir/$basename" -@
    fi;

    # add readme file
    (cd "${outputdir}" && zip -9 "$outputdir/$basename" -j "README.md" -q)
    # add fontconfig file (only needed for NerdFontsSymbolsOnly)
    if [ -n "$fontconfig" ]; then
        (cd "${root_dir}" && zip -9 "$outputdir/$basename" -j "10-nerd-font-symbols.conf" -q)
    fi;
    rm -f "${outputdir}/README.md"
done

ls -al "$outputdir"
