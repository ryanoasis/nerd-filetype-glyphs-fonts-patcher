#!/usr/bin/env bash
# Nerd Fonts Version: 3.4.0
# Script Version: 1.1.0
#
# A more conceise version of the Powerline test, designed to show
# the dreaded 'faint vertical lines' phenomenon from LCD antialiasing

function some_output {
    printf "\
%s                                                         \n\
Under \ue0b2%s lap %s\ue0b0 and \ue0b6%s top %s\ue0b4 mop   \ue0b2\ue0d6 \ue0d7\ue0b0     \n\
%sOver \ue0b2%s lap %s\ue0b0 and \ue0b6%s top %s\ue0b4 mop trop lop klop\n\
                                      \n" \
"${1}" "${2}" "${1}" "${2}" "${1}" \
"${1}" "${2}" "${1}" "${2}" "${1}"
}

COL_A=$(printf '\033[48;5;51m\033[38;5;200m')
COL_B=$(printf '\033[48;5;200m\033[38;5;51m')
COL_C=$(printf '\033[48;5;238m\033[38;5;253m')
COL_D=$(printf '\033[48;5;253m\033[38;5;238m')

some_output "${COL_A}" "${COL_B}"
some_output "${COL_C}" "${COL_D}"
