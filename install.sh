#!/usr/bin/env bash
# Install Nerd Fonts
__ScriptVersion="1.0"

# This script must run with bash 3
# In fact it is checked against `checkbashisms` and no bashisms are
# used, except (because the workarounds are too involved):
#
# - read -d option
# - $'\0' to supply a nullbyte to read -d
#
# Note that `find` on MacOS does not know `-printf` and cp/ln have no `-T` or `-t`

# Default values for option variables:
quiet=false
mode="copy"
clean=false
dry=false
extension1="otf"
extension2="ttf"
variant="R"
installpath="user"

# Usage info
usage() {
  cat << EOF
Usage: ./install.sh [-q -v -h] [[--copy | --link] --clean | --list | --remove]
                    [--mono] [--use-proportional-glyphs] [--otf | --ttf]
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
EOF
}

# Print version
version() {
  echo "Nerd Fonts installer -- Version $__ScriptVersion"
  echo "                     -- Bash ${BASH_VERSION}"
  echo
  echo "Deprecated tool: Will not work to get newer fonts as they are not inside the repo anymore."
}

# Parse options
optspec=":qvhclLCspOTUS-:"
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
    O) extension1="otf"; extension2="ttf";;
    T) extension1="ttf"; extension2="otf";;
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
        otf) extension1="otf"; extension2="ttf";;
        ttf) extension1="ttf"; extension2="otf";;
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
sd="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit ; pwd -P )"
nerdfonts_root_dir="${sd}/patched-fonts"

# Accept font / directory names, to avoid installing all fonts
if [ -n "$*" ]; then
  nerdfonts_dirs=
  for font in "${@}"; do
    if [ -n "$font" ]; then
      # Ensure that directory exists, and offer suggestions if not
      if [ ! -d "$nerdfonts_root_dir/$font" ]; then
        echo "Font $font doesn't exist. Options are:"
        echo
        find "$nerdfonts_root_dir" -mindepth 1 -maxdepth 1 -type d -exec basename "{}" \; | sort
        exit 255
      fi
      nerdfonts_dirs="${nerdfonts_dirs}${font}/"
    fi
  done
else
  nerdfonts_dirs=$(find "${nerdfonts_root_dir}" -mindepth 1 -maxdepth 1 -type d -print0 | sed "s|${nerdfonts_root_dir}/||g" | tr '\0' '/')
fi
# nerdfonts_dirs contains a '/' separated list of directories directly
# under nerdfonts_root_dir to look at (it needs to end in '/')

# Which Nerd Font variant
if [ "$variant" = "M" ]; then
  find_filter="-name '*NerdFontMono*'"
elif [ "$variant" = "P" ]; then
  find_filter="-name '*NerdFontPropo*'"
else
  find_filter="-not -name '*NerdFontMono*' -and -not -name '*NerdFontPropo*' -and -name '*NerdFont*'"
fi

collect_files() {
  # Find all the font files, return \0 separated list
  echo "${nerdfonts_dirs}" | while IFS= read -d / -r dir; do
    if [ -n "$(echo "${find_filter}" | xargs -- find "${nerdfonts_root_dir}/${dir}" -iname "*.${extension1}" -type f)" ]; then
      echo "${find_filter} -print0" | xargs -- find "${nerdfonts_root_dir}/${dir}" -iname "*.${extension1}" -type f
    else
      echo "${find_filter} -print0" | xargs -- find "${nerdfonts_root_dir}/${dir}" -iname "*.${extension2}" -type f
    fi
  done
}

# Get target root directory
if [ "$(uname)" = "Darwin" ]; then
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

if [ "system" = "$installpath" ]; then
  font_dir="${sys_font_dir}"
else
  font_dir="${usr_font_dir}"
fi

if [ -z "$(collect_files | tr -d '\0')" ]; then
  echo "Did not find any fonts to install"
  exit 1
fi

prepare_dirs() {
  if [ "$clean" = true ]; then
    [ "$quiet" = false ] && rm -rfv "$font_dir"
    [ "$quiet" = true ] && rm -rf "$font_dir"
  fi
  [ "$quiet" = false ] && mkdir -pv "$font_dir"
  [ "$quiet" = true ] && mkdir -p "$font_dir"
}

#
# Take the desired action
#
case $mode in

  list)
    collect_files | while IFS= read -d $'\0' -r file; do
      file=$(basename "$file")
      echo "$font_dir/${file#"$nerdfonts_root_dir"/}"
    done
    exit 0
    ;;

  copy)
    prepare_dirs
    [ "$quiet" = false ] && (collect_files | xargs --null "-I{}" -- cp -fv "{}" "$font_dir")
    [ "$quiet" = true ] && (collect_files | xargs --null "-I{}" -- cp -f "{}" "$font_dir")
    ;;
  link)
    prepare_dirs
    [ "$quiet" = false ] && (collect_files | xargs --null "-I{}" -- ln -sfv "{}" "$font_dir")
    [ "$quiet" = true ] && (collect_files | xargs --null "-I{}" -- ln -sf "{}" "$font_dir")
    ;;

  remove)
    if [ "true" = "$dry" ]; then
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
if [ -n "$(command -v fc-cache)" ]; then
  if [ "true" = "$dry" ]; then
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
