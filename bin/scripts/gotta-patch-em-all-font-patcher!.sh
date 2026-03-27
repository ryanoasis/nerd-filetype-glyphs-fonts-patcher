#!/usr/bin/env bash
# Nerd Fonts Version: 3.4.0
# Script Version: 1.4.6
#
# You can supply options to the font-patcher via environment variable NERDFONTS
# That option will override the defaults (also defaults of THIS script).

# used for debugging
# set -x

LINE_PREFIX="# [Nerd Fonts] "

test "${BASH_VERSION%%[^0-9]*}" -ge 4 || {
  echo >&2 "$LINE_PREFIX A non-ancient version of Bash is needed (>= 4)"
  echo >&2 "# Bash version 4 has been released in 2009, so it's about time to update"
  echo >&2 "# (Most likely you are on MacOS; try Homebrew with \`brew install bash\`) ;-)"
  exit 1
}

# Check for Fontforge
type fontforge >/dev/null 2>&1 || {
  echo >&2 "$LINE_PREFIX FontForge must be installed before running this script."
  echo >&2 "# Please see installation instructions at"
  echo >&2 "# http://designwithfontforge.com/en-US/Installing_Fontforge.html"
  exit 1
}

# Get script directory to set source and target dirs relative to it
sd="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit ; pwd -P )"

repo_root_dir=$(dirname "$(dirname "${sd}")") # two levels up (i.e. ../../)
# Set source and target directories
last_font_root=""
unpatched_parent_dir="src/unpatched-fonts"
patched_parent_dir="patched-fonts"
timestamp_parent_dir=${patched_parent_dir}
source_fonts_dir="${repo_root_dir}/${unpatched_parent_dir}"
max_parallel_process=8

function activate_keeptime {
  type ttfdump >/dev/null 2>&1 || {
    echo >&2 "$LINE_PREFIX ttfdump must be installed for option --keeptime"
    exit 1
  }
  keeptime=TRUE
}

function activate_checkfont {
  patched_parent_dir="check-fonts"
}

function activate_info {
  info_only=TRUE
  echo "${LINE_PREFIX} 'Info Only' option given, only generating font info (not patching)"
}

function show_help {
  echo "Usage: $0 [OPTION] [FILTER]"
  echo
  echo "    OPTION:"
  echo "        -c, --checkfont     Create the font(s) in check-fonts/ instead"
  echo "        -t, --keeptime      Try to preserve timestamp of previously patched"
  echo "                            font in patched-fonts/ directory"
  echo "        -v, --verbose       Show more information when running"
  echo "        -i, --info          Rebuild JUST the readmes"
  echo "        -j, --jobs          Run up to 8 patch processes in parallel"
  echo "        -h, --help          Show this help"
  echo
  echo "    FILTER:"
  echo "        The filter argument to this script is a filter for the fonts to patch."
  echo "        The filter is a regex (glob "*" is expressed as "[^/]*", see \`man 7 glob\`)"
  echo "        All font files that start with that filter (and are ttf, otf, or sfd files) will"
  echo "        be processed only."
  echo "          Example ./gotta-patch-em-all-font-patcher\!.sh \"iosevka\""
  echo "          Process all font files that start with \"iosevka\""
  echo "        If the argument starts with a '/' all font files in a directory that matches"
  echo "        the filter are processed only."
  echo "          Example ./gotta-patch-em-all-font-patcher\!.sh \"/iosevka\""
  echo "          Process all font files that are in directory \"iosevka\""
}

function find_font_root {
  # e.g. /a/b/c/nerd-fonts/src/unpatched-fonts/Meslo
  sed -E "s|(${unpatched_parent_dir}/[^/]*).*|\1|" <<< "$1"
}

while getopts ":chijtv-:" option; do
  case "${option}" in
    c)
      activate_checkfont
      ;;
    h)
      show_help
      exit 0;;
    i)
      activate_info
      ;;
    j)
      parallel=TRUE
      ;;
    t)
      activate_keeptime
      ;;
    v)
      verbose=TRUE
      ;;
    -)
      case "${OPTARG}" in
        checkfont)
          activate_checkfont
          ;;
        help)
          show_help
          exit 0;;
        info)
          activate_info
          ;;
        jobs)
          parallel=TRUE
          ;;
        keeptime)
          activate_keeptime
          ;;
        verbose)
          verbose=TRUE
          ;;
        *)
          echo >&2 "Option '--${OPTARG}' unknown"
          exit 1;;
      esac;;
    *)
      echo >&2 "Option '-${OPTARG}' unknown"
      exit 1;;
  esac
done
shift $((OPTIND-1))

if [ $# -gt 1 ]
then
  echo >&2 "Unknown parameter(s): $2 ..."
  exit 1
fi

# Build find command with optional filter
# Construct find command by placing parentheses directly in the find call rather than in the array
# This ensures parentheses are correctly interpreted by find as grouping operators
if [ $# -eq 1 ]
then
  filter_arg="$1"
  if [[ "${filter_arg:0:1}" == "/" ]]
  then
    # Directory filter: match fonts in directories containing the filter
    filter_dir="${filter_arg#/}"  # Remove leading /
    # For directory filter, -ipath must be outside the parentheses grouping
    find_cmd_args=(-iname "*.ttf" -o -iname "*.otf" -o -iname "*.sfd")
    find_path_filter="-ipath"
    find_path_filter_with_pattern=(-ipath "*${filter_dir}/*")
    echo "$LINE_PREFIX Filter given, limiting search and patch to pathname pattern '$filter_arg'"
  else
    # Filename filter: match fonts with filter in filename
    find_cmd_args=(-iname "*${filter_arg}*.ttf" -o -iname "*${filter_arg}*.otf" -o -iname "*${filter_arg}*.sfd")
    find_path_filter=""
    find_path_filter_with_pattern=()
    echo "$LINE_PREFIX Filter given, limiting search and patch to filename pattern '$filter_arg'"
  fi
else
  # No filter
  find_cmd_args=(-iname "*.ttf" -o -iname "*.otf" -o -iname "*.sfd")
  find_path_filter=""
  find_path_filter_with_pattern=()
fi

# correct way to output find results into an array (when files have space chars, etc)
# source: https://stackoverflow.com/questions/8213328/bash-script-find-output-to-array
# Use -iname instead of -iregex for better macOS compatibility
# Place parentheses directly in the find command to ensure they're interpreted as grouping operators
# This avoids issues with parentheses in arrays by constructing the find command explicitly
source_fonts=()
if [ -n "$find_path_filter" ]; then
    # Directory filter: -ipath must be outside the parentheses grouping
  # -type f must be outside parentheses to apply to all conditions
  # Disable glob expansion to prevent shell from expanding wildcard patterns in find_cmd_args
  while IFS= read -d $'\0' -r file ; do
    source_fonts=("${source_fonts[@]}" "$file")
  done < <(set -f; find "$source_fonts_dir" "${find_path_filter_with_pattern[@]}" "(" "${find_cmd_args[@]}" ")" -type f -print0)
else
  # Filename filter or no filter: group conditions with parentheses
  # -type f must be outside parentheses to apply to all -iname conditions
  # Disable glob expansion to prevent shell from expanding wildcard patterns in find_cmd_args
  while IFS= read -d $'\0' -r file ; do
    source_fonts=("${source_fonts[@]}" "$file")
  done < <(set -f; find "$source_fonts_dir" "(" "${find_cmd_args[@]}" ")" -type f -print0)
fi

# print total number of source fonts found
echo "$LINE_PREFIX Total source fonts found: ${#source_fonts[*]}"

# Use one date-time for ALL fonts and for creation and modification date in the font file
if [ -z "${SOURCE_DATE_EPOCH}" ]
then
  SOURCE_DATE_EPOCH=$(date +%s)
  export SOURCE_DATE_EPOCH
fi
# Detect GNU vs BSD date implementations reliably
if date -R "--date=@${SOURCE_DATE_EPOCH}" >/dev/null 2>&1; then
  # GNU date (Linux and others)
  release_timestamp=$(date -R "--date=@${SOURCE_DATE_EPOCH}" 2>/dev/null)
elif date -r "${SOURCE_DATE_EPOCH}" "+%a, %d %b %Y %H:%M:%S %z" >/dev/null 2>&1; then
  # BSD date (macOS) - uses -r with epoch seconds
  release_timestamp=$(date -r "${SOURCE_DATE_EPOCH}" "+%a, %d %b %Y %H:%M:%S %z")
else
  echo >&2 "$LINE_PREFIX Invalid release timestamp SOURCE_DATE_EPOCH: ${SOURCE_DATE_EPOCH}"
  exit 2
fi
echo "$LINE_PREFIX Release timestamp is ${release_timestamp}"

function patch_font {
  local f=$1; shift
  local i=$1; shift
  local purge=$1; shift

  # Try to copy the release date from the 'original' patch
  if [ -n "${keeptime}" ]
  then
    # take everything before the last slash (/) to start building the full path
    local ts_font_dir="${f%/*}/"
    local ts_font_dir="${ts_font_dir/$unpatched_parent_dir/$timestamp_parent_dir}"
    local one_font
    one_font=$(find "${ts_font_dir}" -name '*.[ot]tf' | head -n 1)
    if [ -n "${one_font}" ]
    then
      orig_font_date=$(ttfdump -t head "${one_font}" | \
        grep -E '[^a-z]modified:.*0x' | sed 's/.*x//' | tr 'a-f' 'A-F')
      SOURCE_DATE_EPOCH=$(dc -e "16i ${orig_font_date} Ai 86400 24107 * - p")
      # Adjust timestamp using the same GNU/BSD date detection logic
      if date --version >/dev/null 2>&1; then
        # GNU date
        adjusted_timestamp=$(date -R "--date=@${SOURCE_DATE_EPOCH}" 2>/dev/null) || {
          echo >&2 "$LINE_PREFIX Invalid adjusted timestamp SOURCE_DATE_EPOCH calculated from font metadata: ${SOURCE_DATE_EPOCH}"
          exit 2
        }
      elif date -r "${SOURCE_DATE_EPOCH}" "+%a, %d %b %Y %H:%M:%S %z" >/dev/null 2>&1; then
        # BSD date
        adjusted_timestamp=$(date -r "${SOURCE_DATE_EPOCH}" "+%a, %d %b %Y %H:%M:%S %z") || {
          echo >&2 "$LINE_PREFIX Invalid adjusted timestamp SOURCE_DATE_EPOCH calculated from font metadata: ${SOURCE_DATE_EPOCH}"
          exit 2
        }
      else
        echo >&2 "$LINE_PREFIX Unable to convert adjusted timestamp SOURCE_DATE_EPOCH: ${SOURCE_DATE_EPOCH} (no compatible date command found)"
        exit 2
      fi
      echo "$LINE_PREFIX Release timestamp adjusted to ${adjusted_timestamp}"
    fi
  fi

  # take everything before the last slash (/) to start building the full path
  local patched_font_dir="${f%/*}/"
  # find replace unpatched parent dir with patched parent dir:
  local patched_font_dir="${patched_font_dir/$unpatched_parent_dir/$patched_parent_dir}"

  [[ -d "$patched_font_dir" ]] || mkdir -p "$patched_font_dir"
  if [ -n "${purge}" ]
  then
    if [ -n "${verbose}" ]
    then
      echo "Purging patched font dir ${patched_font_dir}"
    fi
    rm -- "${patched_font_dir}"/*
  fi

  config_parent_dir=$( cd "$( dirname "$f" )" && cd ".." && pwd)
  config_dir=$( cd "$( dirname "$f" )" && pwd)

  # find the font config file:
  if [ -f "$config_dir/config.cfg" ]
  then
    font_config="--configfile=$config_dir/config.cfg"
  elif [ -f "$config_parent_dir/config.cfg" ]
  then
    font_config="--configfile=$config_parent_dir/config.cfg"
  elif [ -f "$(find_font_root "$config_parent_dir")/config.cfg" ]
  then
    font_config="--configfile=$(find_font_root "$config_parent_dir")/config.cfg"
  else
    # We need to give some argument because empty arguments will break the patcher call
    font_config="-q"
  fi

  cd "$repo_root_dir" || {
    echo >&2 "# Could not find project parent directory"
    exit 3
  }
  # Add logfile always (but can be overridden by config.cfg and env var NERDFONTS)
  # Use absolute path to allow fontforge being an AppImage (used in CI)
  PWD=$(pwd)
  # Create "Nerd Font"
  if [ -n "${verbose}" ]
  then
    echo "fontforge -quiet -script \"${PWD}/font-patcher\" --debug 1 \"$f\" -q \"${font_config}\" -c --no-progressbars --outputdir \"${patched_font_dir}\" ${NERDFONTS}"
  fi
  # shellcheck disable=SC2086 # We want splitting for the unquoted variables to get multiple options out of them
  { OUT=$(fontforge -quiet -script "${PWD}/font-patcher" --debug 1 "$f" -q "${font_config}" -c --no-progressbars \
                    --outputdir "${patched_font_dir}" ${NERDFONTS} 2>&1 1>&3 3>&- ); } 3>&1
  # shellcheck disable=SC2181 # Checking the code directly is very unreadable here, as we execute a whole block
  if [ $? -ne 0 ]; then printf "%s\nPatcher run aborted!\n\n" "$OUT"; fi
  # Create "Nerd Font Mono"
  if [ -n "${verbose}" ]
  then
    echo "fontforge -quiet -script \"${PWD}/font-patcher\" --debug 1 \"$f\" -q -s \"${font_config}\" -c --no-progressbars --outputdir \"${patched_font_dir}\" ${NERDFONTS}"
  fi
  # shellcheck disable=SC2086 # We want splitting for the unquoted variables to get multiple options out of them
  { OUT=$(fontforge -quiet -script "${PWD}/font-patcher" --debug 1 "$f" -q -s "${font_config}" -c --no-progressbars \
                    --outputdir "${patched_font_dir}" ${NERDFONTS} 2>&1 1>&3 3>&- ); } 3>&1
  # shellcheck disable=SC2181 # Checking the code directly is very unreadable here, as we execute a whole block
  if [ $? -ne 0 ]; then printf "%s\nPatcher run aborted!\n\n" "$OUT"; fi
  # Create "Nerd Font Propo"
  if [ -n "${verbose}" ]
  then
    echo "fontforge -quiet -script \"${PWD}/font-patcher\" --debug 1 \"$f\" -q --variable \"${font_config}\" -c --no-progressbars --outputdir \"${patched_font_dir}\" ${NERDFONTS}"
  fi
  # shellcheck disable=SC2086 # We want splitting for the unquoted variables to get multiple options out of them
  { OUT=$(fontforge -quiet -script "${PWD}/font-patcher" --debug 1 "$f" -q --variable "${font_config}" -c --no-progressbars \
                    --outputdir "${patched_font_dir}" ${NERDFONTS} 2>&1 1>&3 3>&- ); } 3>&1
  # shellcheck disable=SC2181 # Checking the code directly is very unreadable here, as we execute a whole block
  if [ $? -ne 0 ]; then printf "%s\nPatcher run aborted!\n\n" "$OUT"; fi

  # wait for this group of background processes to finish to avoid forking too many processes
  # that can add up quickly with the number of combinations
  #wait

}

# Generates font information: readmes, combinations, licenses, and variation counts
# $1 = fontdir path
# $2 = font file name (used for metadata)
function generate_info {
  local f=$1; shift
  local font_file=$1; shift

  # take everything before the last slash (/) to start building the full path
  local patched_font_dir="${f%/*}/"
  # find replace unpatched parent dir with patched parent dir:
  local patched_font_dir="${patched_font_dir/$unpatched_parent_dir/$patched_parent_dir}"

  echo "$LINE_PREFIX Generating info for '$font_file':"

  [[ -d "$patched_font_dir" ]] || mkdir -p "$patched_font_dir"

  local font_root
  font_root=$(echo "$patched_font_dir" | sed "s|.*$patched_parent_dir/||;s|/.*||")
  # if first time with this font then re-build parent dir readme, else skip:
  if [ "$last_font_root" != "$font_root" ]
  then
    echo "$LINE_PREFIX --- Calling standardize-and-complete-readmes for $font_root"
    "${sd}/standardize-and-complete-readmes.sh" "$font_root" "$patched_parent_dir"
    echo "$LINE_PREFIX ---"
    last_font_root=$font_root
  fi

  # Copy 'all' license files found in the complete font`s source tree
  # into the destination. This will overwrite all same-names files
  # so make sure all licenses of one fontface are identical
  echo "$LINE_PREFIX * Copying license files"
  current_dir=$(dirname "$f")
  copy_license "$(find_font_root "$current_dir")" "$patched_font_dir"
}


# Copy any license file to the patched font directory
# $1 = fontdir source path
# $2 = fontdir destination path
function copy_license {
  local src=$1
  local dest=$2
  local license_file=""

  while IFS= read -d $'\0' -r license_file ; do
    [[ -d "$dest" ]] || mkdir -p "$dest"
    cp "$license_file" -t "$dest"
  done < <(find "$src" -iregex ".*\(licen[cs]e\|ofl\).*" -type f -print0)

  # To check which files will or will not be copied and make sure all relevant
  # licences do match
  # find src/unpatched-fonts -not -iname "*.[ot]tf" -type f -not -name 'README.md' -not -name 'config.cfg' -iregex ".*\(licen[cs]e\|ofl\).*"
  # find src/unpatched-fonts -not -iname "*.[ot]tf" -type f -not -name 'README.md' -not -name 'config.cfg' -not -iregex ".*\(licen[cs]e\|ofl\).*"
}

if [ ! "$info_only" ]
then
  # Iterate through source fonts
  for i in "${!source_fonts[@]}"
  do
    purge_destination=""
    current_source_dir=$(dirname "${source_fonts[$i]}")
    if [ "${current_source_dir}" != "${last_source_dir}" ]
    then
      # If we are going to patch ALL font files from a certain source directory
      # the destination directory is purged (all font files therein deleted)
      # to follow font naming changed. We can not do this if we patch only
      # some of the source font files in that directory.
      last_source_dir=${current_source_dir}
      # Count fonts matching the filter criteria in this directory
      if [ -n "${filter_arg:-}" ]
      then
        if [[ "${filter_arg:0:1}" == "/" ]]
        then
          # Directory filter: count fonts matching the -ipath pattern "*${filter_dir}/*"
          # Verify that fonts are in the current directory AND match the filter_dir pattern
          filter_dir="${filter_arg#/}"  # Remove leading /
          num_to_patch=0
          for font_path in "${source_fonts[@]}"; do
            # Check that font is in current directory AND path contains the filter_dir pattern
            if [[ "$(dirname "$font_path")" == "$current_source_dir" ]] && \
               [[ "$font_path" == *"${filter_dir}"* ]]; then
              ((num_to_patch++))
            fi
          done
        else
          # Filename filter: count fonts that start with the filter
          num_to_patch=$(find "${current_source_dir}" "(" -iname "${filter_arg}*.ttf" -o -iname "${filter_arg}*.otf" -o -iname "${filter_arg}*.sfd" ")" -type f | wc -l)
        fi
      else
        # No filter: count all fonts in directory
        num_to_patch=$(find "${current_source_dir}" "(" -iname "*.ttf" -o -iname "*.otf" -o -iname "*.sfd" ")" -type f | wc -l)
      fi
      # Always count all fonts in directory for comparison
      num_existing=$(find "${current_source_dir}" "(" -iname "*.ttf" -o -iname "*.otf" -o -iname "*.sfd" ")" -type f | wc -l)
      if [ "${num_to_patch}" -eq "${num_existing}" ]
      then
        purge_destination="TRUE"
      fi
    fi
    echo "$LINE_PREFIX Processing font $((i+1))/${#source_fonts[@]}"
    if [ -n "${parallel}" ]
    then
      patch_font "${source_fonts[$i]}" "$i" "$purge_destination" 2>/dev/null &
    else
      patch_font "${source_fonts[$i]}" "$i" "$purge_destination" 2>/dev/null
    fi


    # un-comment to test this script (patch 1 font)
    #break

    # wait for this set of bg commands to finish: dont do too many at once!
    # if we spawn a background process for each set of fonts it will
    # end up using too many system resources
    # however we want to run a certain number in parallel to decrease
    # the amount of time patching all the fonts will take
    # for now set a 'wait' for each X set of processes:
    if [[ $(((i + 1) % max_parallel_process)) == 0 ]];
    then
      wait
    fi
  done
  # wait for all bg commands to finish
  wait
fi

# update information in separate iteration (to avoid issues with bg processes and the counts):
# Iterate through source fonts
for i in "${!source_fonts[@]}"
do
  # only output after last slash (/):
  path=${source_fonts[$i]}
  font_file=${path##*/}
  generate_info "$path" "$font_file" 2>/dev/null
done
