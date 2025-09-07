#!/usr/bin/env bash
# Nerd Fonts Version: 3.4.0
# Script Version: 1.0.1
# Create one sample of each font

set -e

# Get script directory to set source and target dirs relative to it
sd="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

outputdir="${sd}/../../temp"
unpatched="${sd}/../../src/unpatched-fonts"

function get_config_patch_flags {
    local dir=$1
    unset config_patch_flags
    if [ -f "${unpatched}/${dir}/config.cfg" ]; then
        # shellcheck disable=SC1090 # Do not pull in the sourced file
        source "${unpatched}/${dir}/config.cfg"
        return
    fi
    dir=$(dirname "$dir")
    if [ -f "${unpatched}/${dir}/config.cfg" ]; then
        # shellcheck disable=SC1090 # Do not pull in the sourced file
        source "${unpatched}/${dir}/config.cfg"
        return
    fi
    dir=$(dirname "$dir")
    if [ -f "${unpatched}/${dir}/config.cfg" ]; then
        # shellcheck disable=SC1090 # Do not pull in the sourced file
        source "${unpatched}/${dir}/config.cfg"
        return
    fi
}

font_files=( \
    '3270/Regular/3270-Regular.ttf' \
    'Agave/Agave-Regular.ttf' \
    'AnonymousPro/Regular/Anonymous Pro.ttf' \
    'Arimo/Regular/Arimo-Regular.ttf' \
    'AurulentSansMono/AurulentSansMono-Regular.otf' \
    'BigBlueTerminal/BigBlue_TerminalPlus.ttf' \
    'BitstreamVeraSansMono/Regular/VeraMono.ttf' \
    'CascadiaCode/CascadiaCode-Regular-vtt.ttf' \
    'CodeNewRoman/Regular/Code New Roman-Regular.otf' \
    'ComicShannsMono/ComicShannsMono-Regular.otf' \
    'Cousine/Regular/Cousine-Regular.ttf' \
    'DaddyTimeMono/DaddyTimeMono.otf' \
    'DejaVuSansMono/Regular/DejaVuSansMono.ttf' \
    'DroidSansMono/Droid Sans Mono for Powerline.otf' \
    'FantasqueSansMono/Regular/FantasqueSansMono-Regular.ttf' \
    'FiraCode/Regular/FiraCode-Regular.ttf' \
    'FiraMono/Regular/FiraMono-Regular.otf' \
    'Gohu/14/gohufont-14.ttf' \
    'Go-Mono/Regular/Go-Mono.ttf' \
    'Hack/Regular/Hack-Regular.ttf' \
    'Hasklig/Regular/Hasklig-Regular.otf' \
    'HeavyData/heavy_data.ttf' \
    'Hermit/Regular/Hermit-Regular.otf' \
    'iA-Writer/Mono/Regular/iAWriterMonoS-Regular.ttf' \
    'IBMPlexMono/Mono/IBMPlexMono-Regular.ttf' \
    'Inconsolata/Inconsolata-Regular.ttf' \
    'InconsolataGo/Regular/InconsolataGo-Regular.ttf' \
    'InconsolataLGC/Regular/Inconsolata-LGC.ttf' \
    'Iosevka/Regular/iosevka-regular.ttf' \
    'IosevkaTerm/Regular/iosevka-term-regular.ttf' \
    'JetBrainsMono/Ligatures/Regular/JetBrainsMono-Regular.ttf' \
    'Lekton/Regular/Lekton-Regular.ttf' \
    'LiberationMono/LiberationMono-Regular.ttf' \
    'Lilex/Regular/Lilex-Regular.ttf' \
    'Meslo/M/Regular/Meslo LG M Regular for Powerline.ttf' \
    'Monofur/Regular/Monofur for Powerline.ttf' \
    'Monoid/Regular/Monoid-Regular.ttf' \
    'Mononoki/Regular/mononoki-Regular.ttf' \
    'MPlus/M_Plus_1_code/MPLUS1Code-Regular.ttf' \
    'NerdFontsSymbolsOnly/NerdFontsSymbolsNerdFontBlank.sfd' \
    'Noto/Sans-Mono/NotoSansMono-Regular.ttf' \
    'OpenDyslexic/Regular/OpenDyslexic-Regular.otf' \
    'Overpass/Mono/Regular/overpass-mono-regular.otf' \
    'ProFont/profontiix/ProFontIIx.ttf' \
    'ProggyClean/Regular/ProggyClean.ttf' \
    'RobotoMono/Regular/RobotoMono-Regular.ttf' \
    'ShareTechMono/ShareTechMono-Regular.ttf' \
    'SourceCodePro/Regular/SourceCodePro-Regular.ttf' \
    'SpaceMono/Regular/SpaceMono-Regular.ttf' \
    'Terminus/Regular/TerminusTTF-4.49.2.ttf' \
    'Tinos/Regular/Tinos-Regular.ttf' \
    'Ubuntu/Regular/Ubuntu-R.ttf' \
    'UbuntuMono/Regular/UbuntuMono-R.ttf' \
    'VictorMono/Regular/VictorMono-Regular.ttf' \
)

if [ ! -d "${outputdir}" ]; then
    mkdir -p "${outputdir}"
fi

for f in "${font_files[@]}"; do
    echo
    echo ">>------------------------[ $f ]------------------------>>"
    dir=$(dirname "${f}")
    get_config_patch_flags "${dir}"
    # shellcheck disable=SC2154 # We get the flags from the sourced file
    echo ">>   config.cfg: ${config_patch_flags}"
    # shellcheck disable=SC2086 # Not double quote some variables to get multiple parameters out of them
    fontforge ../../font-patcher --powerline --debug 2 -out "${outputdir}" $config_patch_flags ${NERDFONTS} "${unpatched}/${f}" 2>/dev/null || true
done
