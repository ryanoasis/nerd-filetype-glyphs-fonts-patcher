#!/usr/bin/env bash
# Install Nerd Fonts
__ScriptVersion="0.8"

# Default values for option variables:
quiet=false
mode="copy"
clean=false
dry=false
extension="otf"
variant="R"
installpath="user"

# Usage info
usage() {
  cat << EOF
Usage: ./install.sh [-q -v -h] [[--copy | --link] --clean | --list | --remove]
                    [--mono] [--windows] [--otf | --ttf]
                    [--install-to-user-path | --install-to-system-path ]
                    [FONT...]

General options:

  -q, --quiet                   Suppress output.
  -v, --version                 Print version number and exit.
  -h, --help                    Display this help and exit.

  -c, --copy                    Copy the font files [default].
  -l, --link                    Symlink the font files.
  -L, --list                    List the font files to be installed (dry run).

  -C, --clean                   Recreate the root Nerd Fonts target directory
                                (clean out all previous copies or symlinks).

  --remove                      Remove all Nerd Fonts (that have been installed
                                with this script).
                                Can be combined with -L for a dry run.

  -s, --mono                    Install single-width glyphs variants.
  -p, --use-proportional-glyphs Install proportional glyphs variants.

  -U, --install-to-user-path    Install fonts to users home font path [default].
  -S, --install-to-system-path  Install fonts to global system path for all users, requires root.

  -O, --otf                     Prefer OTF font files [default].
  -T, --ttf                     Prefer TTF font files.

                                (*) Feature will not work anymore
EOF
}

# Print version
version() {
  echo "Nerd Fonts installer -- Version $__ScriptVersion"
}

# Parse options
optspec=":qvhclLCspOTSU-:"
while getopts "$optspec" optchar; do
  case "${optchar}" in

    # Short options
    q) quiet=true;;
    v) version; exit 0;;
    h) usage; exit 0;;
    c) mode="copy";;
    l) mode="link";;
    L) dry=true
       [ "$mode" != "remove" ] && mode="list";;
    C) clean=true;;
    s) variant="M";;
    p) variant="P";;
    O) extension="otf";;
    T) extension="ttf";;
    S) installpath="system";;
    U) installpath="user";;

    -)
      case "${OPTARG}" in
        # Long options
        quiet) quiet=true;;
        version) version; exit 0;;
        help) usage; exit 0;;
        copy) mode="copy";;
        link) mode="link";;
        list) dry=true
              [ "$mode" != "remove" ] && mode="list";;
        remove) mode="remove";;
        clean) clean=true;;
        mono) variant="M";;
        use-proportional-glyphs) variant="P";;
        otf) extension="otf";;
        ttf) extension="ttf";;
        install-to-system-path) installpath="system";;
        install-to-user-path) installpath="user";;
        *)
          echo "Unknown option --${OPTARG}" >&2
          usage >&2;
          exit 1
          ;;
      esac;;

    *)
      echo "Unknown option -${OPTARG}" >&2
      usage >&2
      exit 1
      ;;

  esac
done
shift $((OPTIND-1))

version

# Set source and target directories, default: all fonts
nerdfonts_root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/patched-fonts"
nerdfonts_dirs=("$nerdfonts_root_dir")

# Accept font / directory names, to avoid installing all fonts
if [ -n "$*" ]; then
  nerdfonts_dirs=()
  for font in "${@}"; do
    if [ -n "$font" ]; then
      # Ensure that directory exists, and offer suggestions if not
      if [[ ! -d "$nerdfonts_root_dir/$font" ]]; then
        echo -e "Font $font doesn't exist. Options are: \\n"
        find "$nerdfonts_root_dir" -maxdepth 1 -type d \( \! -name "$(basename "$nerdfonts_root_dir")" \) -exec basename {} \;
        exit 255
      fi
      nerdfonts_dirs=( "${nerdfonts_dirs[@]}" "$nerdfonts_root_dir/$font" )
    fi
  done
fi


# Build an array of find filter predicates based on $variant
filter=()
if [[ $variant == M ]]; then
  filter=( -iname "*NerdFontMono*" )
elif [[ $variant == P ]]; then
  filter=( -iname "*NerdFontPropo*" )
else
  filter=(
    -not -iname "*NerdFontMono*" -a \
    -not -iname "*NerdFontPropo*" -a \
    -iname "*NerdFont*"
  )
fi

# Find all the font files and store in array
mapfile -d '' files < <(
  find "${nerdfonts_dirs[@]}" \
    -iname '*.[ot]tf' \
    "${filter[@]}" \
    -type f -print0
)
 
#
# Remove duplicates (i.e. when both otf and ttf version present)
#

# Get list of file names without extensions
files_dedup=( "${files[@]}" )
for i in "${!files_dedup[@]}"; do
  files_dedup[i]="${files_dedup[$i]%.*}"
done

# Remove duplicates
for i in "${!files_dedup[@]}"; do
  for j in "${!files_dedup[@]}"; do
    [ "$i" = "$j" ] && continue
    if [ "${files_dedup[$i]}" = "${files_dedup[$j]}" ]; then
      ext="${files[$i]##*.}"
      # Only remove if the extension is the one we don’t want
      if [ "$ext" != "$extension" ]; then
        unset "${files[$i]}"
      fi
    fi
  done
done

# Get target root directory
if [[ $(uname) == 'Darwin' ]]; then
  # MacOS
  sys_share_dir="/Library"
  usr_share_dir="$HOME/Library"
  font_subdir="Fonts"
else
  # Linux
  sys_share_dir="/usr/local/share"
  usr_share_dir="$HOME/.local/share"
  font_subdir="fonts"
fi
if [ -n "${XDG_DATA_HOME}" ]; then
  usr_share_dir="${XDG_DATA_HOME}"
fi
sys_font_dir="${sys_share_dir}/${font_subdir}/NerdFonts"
usr_font_dir="${usr_share_dir}/${font_subdir}/NerdFonts"

if [[ "system" == "$installpath" ]]; then
  font_dir="${sys_font_dir}"
else
  font_dir="${usr_font_dir}"
fi

if [ "${#files[@]}" -eq 0 ]; then
  echo "Did not find any fonts to install"
  exit 1
fi

#
# Take the desired action
#
case $mode in

  list)
    for file in "${files[@]}"; do
      file=$(basename "$file")
      echo "$font_dir/${file#"$nerdfonts_root_dir"/}"
    done
    exit 0
    ;;

  copy | link)
    if [ "$clean" = true ]; then
      [ "$quiet" = false ] && rm -rfv "$font_dir"
      [ "$quiet" = true ] && rm -rf "$font_dir"
    fi
    [ "$quiet" = false ] && mkdir -pv "$font_dir"
    [ "$quiet" = true ] && mkdir -p "$font_dir"
    case $mode in
      copy)
        [ "$quiet" = false ] && cp -fv "${files[@]}" "$font_dir"
        [ "$quiet" = true ] && cp -f "${files[@]}" "$font_dir"
        ;;
      link)
        [ "$quiet" = false ] && ln -sfv "${files[@]}" "$font_dir"
        [ "$quiet" = true ] && ln -sf "${files[@]}" "$font_dir"
        ;;
    esac;;

  remove)
    if [[ "true" == "$dry" ]]; then
      echo "Dry run. Would issue these commands:"
      [ "$quiet" = false ] && echo rm -rfv "$sys_font_dir" "$usr_font_dir"
      [ "$quiet" = true ] && echo rm -rf "$sys_font_dir" "$usr_font_dir"
    else
      [ "$quiet" = false ] && rm -rfv "$sys_font_dir" "$usr_font_dir"
      [ "$quiet" = true ] && rm -rf "$sys_font_dir" "$usr_font_dir"
    fi
    font_dir="$sys_font_dir $usr_font_dir"
    ;;

esac

# Reset font cache on Linux
if [[ -n $(command -v fc-cache) ]]; then
  if [[ "true" == "$dry" ]]; then
    [ "$quiet" = false ] && echo fc-cache -vf "$font_dir"
    [ "$quiet" = true ] && echo fc-cache -f "$font_dir"
  else
    [ "$quiet" = false ] && fc-cache -vf "$font_dir"
    [ "$quiet" = true ] && fc-cache -f "$font_dir"
  fi
  case $? in
    [0-1])
      # Catch fc-cache returning 1 on a success
      exit 0
      ;;
    *)
      exit $?
      ;;
  esac
fi
