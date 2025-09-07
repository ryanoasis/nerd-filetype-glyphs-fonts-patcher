#!/usr/bin/env bash
# Nerd Fonts Version: 3.4.0
# Script Version: 1.1.1

# Run this script in your local bash:
# curl https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/bin/scripts/test-fonts.sh | bash
# Is possible to change the number of columns passing a number as the first parameter (default=16):
# ./test-fonts.sh 8

# Given an array of decimal numbers print all unicode codepoint.
function print-decimal-unicode-range() {
  local originalSequence=("$@")
  local counter=0
  # Use alternating colors to see which symbols extend out of the bounding
  # box.
  local bgColorBorder='\033[48;5;8m'
  local bgColorCode='\033[48;5;246m'
  local alternateBgColorCode='\033[48;5;240m'
  local bgColorChar='\033[48;5;66m'
  local alternateBgColorChar='\033[48;5;60m'
  local underline='\033[4m'
  local currentColorCode="${bgColorCode}"
  local currentColorChar="${bgColorChar}"
  local reset_color='\033[0m'
  local allChars=""
  local allCodes=""
  local wrapAt=16
  [[ "$wrappingValue" =~ ^[0-9]+$ ]] && [ "$wrappingValue" -gt 2 ] && wrapAt="$wrappingValue"
  local topLineStart="${bgColorBorder}╔═══"
  local topLineMiddle="═══╦═══"
  local topLineEnd="═══╗${reset_color}"
  local bottomLineStart="${bgColorBorder}╚═══"
  local bottomLineMiddle="═══╩═══"
  local bottomLineEnd="═══╝${reset_color}"
  local lineStart="${bgColorBorder}╠═══"
  local lineMiddle="═══╬═══"
  local lineEnd="═══╣${reset_color}"
  local bar="${bgColorBorder}║${reset_color}"
  local originalSequenceLength=${#originalSequence[@]}
  local leftoverSpaces=$((wrapAt - (originalSequenceLength % wrapAt)))

  # add fillers to array to maintain table:
  if [ "$leftoverSpaces" -lt "$wrapAt" ]; then
    for ((c = 1; c <= leftoverSpaces; c++)); do
      originalSequence+=(0)
    done
  fi

  local sequenceLength=${#originalSequence[@]}

  printf "%b" "$topLineStart"
  for ((c = 2; c <= wrapAt; c++)); do
    printf "%b" "$topLineMiddle"
  done
  printf "%b\\n" "$topLineEnd"

  for decimalCode in "${originalSequence[@]}"; do
    local hexCode
    hexCode=$(printf '%x' "${decimalCode}")
    local code="${hexCode}"
    local char="\\U${hexCode}"

    # fill in placeholder cells properly formatted:
    if [ "${char}" = "\\U0" ]; then
      char=" "
      code=""
    fi

    filler=""
    for ((c = ${#code}; c < 5; c++)); do
      filler=" ${filler}"
    done

    allCodes+="${currentColorCode}${filler}${underline}${code}${reset_color}${currentColorCode} ${reset_color}$bar"
    allChars+="${currentColorChar}  ${char}   ${reset_color}$bar"
    counter=$((counter + 1))
    count=$(( (count + 1) % wrapAt))

    if [[ $count -eq 0 ]]; then

      if [[ "${currentColorCode}" = "${alternateBgColorCode}" ]]; then
        currentColorCode="${bgColorCode}"
        currentColorChar="${bgColorChar}"
      else
        currentColorCode="${alternateBgColorCode}"
        currentColorChar="${alternateBgColorChar}"
      fi

      printf "%b%b%b" "$bar" "$allCodes" "$reset_color"
      printf "\\n"
      printf "%b%b%b" "$bar" "$allChars" "$reset_color"
      printf "\\n"

      if [ "$counter" != "$sequenceLength" ]; then
        printf "%b" "$lineStart"
        for ((c = 2; c <= wrapAt; c++)); do
          printf "%b" "$lineMiddle"
        done
        printf "%b\\n" "$lineEnd"
      fi

      allCodes=""
      allChars=""
    fi

  done

  printf "%b" "$bottomLineStart"
  for ((c = 2; c <= wrapAt; c++)); do
    printf "%b" "$bottomLineMiddle"
  done
  printf "%b\\n" "$bottomLineEnd"


}

function print-unicode-ranges() {
  echo ''

  local arr=("$@")
  local len=$#
  local combinedRanges=()

  for ((j=0; j<len; j+=2)); do
    local start="${arr[$j]}"
    local end="${arr[(($j+1))]}"
    local startDecimal=$((16#$start))
    local endDecimal=$((16#$end))

    # shellcheck disable=SC2207 # We DO WANT the output to be split
    combinedRanges+=($(seq "$startDecimal" "$endDecimal"))

  done

  print-decimal-unicode-range "${combinedRanges[@]}"

}

function test-fonts() {
  echo "Nerd Fonts - Pomicons"
  print-unicode-ranges e000 e00a
  echo; echo

  echo "Nerd Fonts - Powerline"
  print-unicode-ranges e0a0 e0a2 e0b0 e0b3
  echo; echo

  echo "Nerd Fonts - Powerline Extra"
  print-unicode-ranges e0a3 e0a3 e0b4 e0c8 e0cc e0d2 e0d4 e0d4 e0d6 e0d7
  echo; echo

  echo "Nerd Fonts - Symbols original"
  print-unicode-ranges e5fa e6b2
  echo; echo

  echo "Nerd Fonts - Devicons"
  print-unicode-ranges e700 e7c5
  echo; echo

  echo "Nerd Fonts - Font awesome"
  print-unicode-ranges f000 f2e0
  echo; echo

  echo "Nerd Fonts - Font awesome extension"
  print-unicode-ranges e200 e2a9
  echo; echo

  echo "Nerd Fonts - Octicons"
  print-unicode-ranges f400 f4a8 2665 2665 26A1 26A1 f27c f27c
  echo; echo

  echo "Nerd Fonts - Font Logos"
  print-unicode-ranges f300 f372
  echo; echo

  echo "Nerd Fonts - Font Power Symbols"
  print-unicode-ranges 23fb 23fe 2b58 2b58
  echo; echo

  echo "Nerd Fonts - Material Design Icons (first few)"
  print-unicode-ranges f0001 f0010
  echo; echo

  echo "Nerd Fonts - Weather Icons"
  print-unicode-ranges e300 e3eb
  echo; echo
}

wrappingValue="$1"

test-fonts
