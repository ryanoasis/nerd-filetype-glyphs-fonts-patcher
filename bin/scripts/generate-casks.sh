#!/usr/bin/env bash
# Nerd Fonts Version: 3.4.0
# Script Version: 2.3.0
#
# Iterates over all [*] archived fonts
# to generate ruby cask files for homebrew-fonts (https://github.com/Homebrew/homebrew-cask)
# * Needs the zip archives in archives/ (i.e. run `./archive-fonts.sh` first)
#
# Uses the current release version (including drafts) of the repo.
# You can specify a different version with the --setversion parameter.
# A leading 'v' from the version is removed.
# Must be the first parameter.
#
# [1] Accepts one parameter, a pattern which fonts to examine, if not given defaults
# to "*" which is all fonts.
#
# Example runs
#   generate-casks.sh Hasklig
#   generate-casks.sh --setversion 2.2.0
#   generate-casks.sh Hasklig
#   generate-casks.sh --setversion 2.2.0 Hasklig

# set -x
set -e

version="3.4.0"
homepage="https://github.com/ryanoasis/nerd-fonts"
downloadarchive="https://github.com/ryanoasis/nerd-fonts/releases/download/v#{version}/"
LINE_PREFIX="# [Nerd Fonts] "
scripts_root_dir="$(cd "$(dirname "$0")" && pwd)"
archivedir=$(realpath "${scripts_root_dir}/../../archives")

if [ $# -ge 1 ]; then
    if [ "$1" = "--setversion" ]; then
        if [ $# -lt 2 ]; then
            echo >&2 "$LINE_PREFIX Missing argument for --setversion"
            exit 1
        fi
        version=$2
        shift; shift
        if [ "${version:0:1}" = "v" ]; then
            version="${version:1}"
        fi
    fi
fi

cd "${archivedir}" || {
    echo >&2 "$LINE_PREFIX Could not find archives directory"
    exit 1
}

function clear_file {
    local outputfile=$1
    # clear output file (needed for multiple runs or updates):
    true > "$outputfile" 2> /dev/null
}

function write_header {
    local outputfile=$1
    local caskname=$2

    {
        printf "cask \"%s\" do\\n" "$caskname"
        printf "  version \"%s\"\\n" "$version"
        printf "  sha256 \"%s\"\\n\\n" "$sha256sum"
        printf "  url \"%s%s.zip\"\\n" "$downloadarchive" "$basename"
    } >> "$outputfile"
}

# Query all Family names of a font individually and return the first
# we found that has "Nerd" in it. We need this because some fonts have
# broken Family names.
function find_nerdish_family {
    local fontfile=$1
    local idx=0
    while :; do
        local fn=$(fc-query --format="%{family[${idx}]}" "${fontfile}")
        if [ -z "$fn" ]; then
            return
        fi
        if [[ "${fn}" == *Nerd* ]] || [[ "${fn}" == *NF* ]]; then
            echo "${fn}"
            return
        fi
        idx=$((idx + 1))
    done
}

# Return the longest common starting part of two strings
# This is the stem, the basic base name of the fonts
function find_common_stem {
    local first=$1
    local second=$2
    for i in $(seq ${#first} -1 1); do
        if [ "${first:0:$i}" == "${second:0:$i}" ]; then
            echo "${first:0:$i}"
            return
        fi
    done
}

# Check if an element already exists in an array
function contains {
    local what=$1
    shift
    for e; do
        if [ "${e}" = "${what}" ]; then
            return 0
        fi
    done
    return 1
}

function write_body {
    local unpatchedname=$1
    local outputfile=$2
    shift; shift;
    local fonts=("$@")

    if [ "${fonts[0]}" ]; then
        local longest=-1
        # Find longest filename for pretty printing
        for i in "${!fonts[@]}"; do
            local basename=$(basename "${fonts[$i]}")
            if [ ${#basename} -gt "$longest" ]; then
                longest=${#basename}
            fi
        done
        # Find familyname of non Mono variant (well, rather shortest because we can contain multiple families)
        local familyname=$(find_nerdish_family "${fonts[0]}")
        for i in "${!fonts[@]}"; do
            local fn=$(find_nerdish_family "${fonts[$i]}")
            familyname=$(find_common_stem "${fn}" "${familyname}")
        done
        if [ -z "${familyname}" ]; then
            echo >&2 "${LINE_PREFIX} Can not determine family name"
            exit 2
        fi
        # Family names differ in front of "Nerd Font" (stem is short)
        if [[ "${familyname}" != *Nerd* ]]; then
            familyname="${familyname} Nerd Font families"
        fi
        familyname="$(tr "[:lower:]" "[:upper:]" <<< "${familyname:0:1}")${familyname:1}"
        # Process font files
        local all_individual_fonts=( )
        local warned=0
        for i in "${!fonts[@]}"; do
            local individualfont=$(basename "${fonts[$i]}")
            local individualdir=$(dirname "${fonts[$i]}")

	    if [ "$(dirname "${individualdir}")" = "." ]; then
                individualdir=""
            else
                if [ ${warned} -eq 0 ]; then
                    echo "$LINE_PREFIX WARNING: Non-flat directory structure in archive! We might have problems..."
                    warned=1
                fi
                # Remove leftmost directory (on Linux), the base directory of the zip file
                individualdir=$(sed -E 's!/+!/!;s!^([^/]*/)|(/[^/]+/?)|([^/]*$)!!' <<< "${individualdir}")/
            fi

            if [ "$i" == 0 ]; then
                {
                    printf "  name \"%s (%s)\"\\n" "$familyname" "$unpatchedname"
                    printf "  homepage \"%s\"" "$homepage"
                    printf "\\n\\n"
                    printf "  livecheck do\\n"
                    printf "    url :url\\n"
                    printf "    strategy :github_latest\\n"
                    printf "  end\\n\\n"
                } >> "$outputfile"
            fi

            # When we have a 'deep' directory structure there can be multiple files with the same name
            # (in different subdirectories). We can not install two files with the same name, that does
            # not make sense. Someone has to choose which alternative is wanted.
            # Here we just take the first one.
            # This is only occuring at the moment with GohuFont.
            # shellcheck disable=SC2091 # Evaluate on array
            $(contains "$individualfont" "${all_individual_fonts[@]}") && {
                printf "      SKIPPING:     %-${longest}s  %s\\n" "${individualfont}" "${individualdir}/"
                continue
            }
            all_individual_fonts+=("$individualfont")

            printf "  font \"%s\"\\n" "${individualdir}${individualfont}" >> "${outputfile}"
            printf "                    %-${longest}s  %s\\n" "${individualfont}" "${individualdir}/"

        done
    else
        echo "$LINE_PREFIX Did not find TTF or OTF"
    fi
}

function write_footer {
    local outputfile=$1

    {
        printf "\\n  # No zap stanza required\\n"
        printf "end\\n"
    } >> "$outputfile"
}

pattern="$1.*"
if [ "$pattern" = "" ]; then
    pattern=".*"
fi

find . -maxdepth 1 -mindepth 1 -type f -iregex "\./$pattern" -regex ".*\.zip" | LC_ALL=C sort |
while read -r filename; do

    basename=$(basename "$filename" .zip)
    if [ ! -f "../archives/${basename}.zip" ]; then
        echo "${LINE_PREFIX} No archive for: ${basename}, skipping..."
        continue
    fi
    sha256sum=$(sha256sum "../archives/${basename}.zip" | head -c 64)
    searchdir=$filename

    originalname=$(jq -r ".fonts[] | select(.folderName == \"${basename}\") | .unpatchedName" "${scripts_root_dir}/lib/fonts.json" | head -n 1)
    caskbasename=$(jq -r ".fonts[] | select(.folderName == \"${basename}\") | .caskName" "${scripts_root_dir}/lib/fonts.json" | head -n 1)
    if [ -z "$originalname" ]; then
        echo "${LINE_PREFIX} Can not find ${basename} in fonts.json, skipping..."
        continue
    fi

    rm -Rf "${basename}"
    echo "$LINE_PREFIX Unpacking $basename"
    unzip -q "${basename}" -d "${basename}"
    searchdir=${basename}

    FONTS=()
    while IFS= read -d $'\0' -r file; do
        FONTS=("${FONTS[@]}" "$file")
    done < <(find "$searchdir" -type f -iname '*.[ot]tf' -print0 | LC_ALL=C sort -z)

    echo "$LINE_PREFIX Generating cask for: $basename"

    caskname="font-${caskbasename}-nerd-font"
    outputdir="${PWD}/../casks/${caskname:0:6}"
    [[ -d "$outputdir" ]] || mkdir -p "$outputdir"
    to="${outputdir}/${caskname}.rb"

    clear_file "$to"
    write_header "$to" "$caskname"
    write_body "$originalname" "$to" "${FONTS[@]}"
    write_footer "$to"

    rm -Rf "${basename}"

    echo "## Created casks: $(realpath "${to}")"
done
