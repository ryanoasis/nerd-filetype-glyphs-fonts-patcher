#!/usr/bin/env bash
# Nerd Fonts Version: 3.4.0
# Script Version: 1.3.1

# Give any parameter to allow some glyphs to be 2 'cells' wide.
# This might or might not be how they are currently handled while patching

text1='Testing'
text2='Nerd Fonts'

leftSymbolsCodes=('E0B0' 'E0B4' 'E0B8' 'E0BC' 'E0C0' 'E0C4' 'E0C6' 'E0C8' 'E0CC' 'E0CD' 'E0CE' 'E0CF' 'E0D0' 'E0D1' 'E0D2' 'E0D6')
leftSymbols=('' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '')
rightSymbolsCodes=('E0B2' 'E0B6' 'E0BA' 'E0BE' 'E0C2' 'E0C5' 'E0C7' 'E0CA' 'E0CC' 'E0CD' 'E0CE' 'E0CF' 'E0D0' 'E0D1' 'E0D4' 'E0D7')
rightSymbols=('' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '')
isWide=(0 0 0 0 1 1 1 1 1 1 1 1 1 1 0 0)

colorReset='\033[0m'
#colorBgWhite='\033[107m'
#colorBgLightBlue='\033[104m'
colorBgYellow='\033[103m'
colorBgBlack='\033[40m'
colorBg1='\033[100m'
colorBg2=$colorBgBlack
colorBg3=$colorBgYellow

#colorFgLightBlue='\033[94m'
colorFgLightGray='\033[90m'
#colorFgLightYellow='\033[93m'
colorFgBlack='\033[30m'
colorFg1=$colorFgBlack
colorFg2=$colorFgLightGray
colorBgDefault='\033[49m'

echo -e "$colorReset Nerd Fonts :: Testing Powerline Symbol size and alignment$colorBg3\\n$colorReset"

for i in "${!leftSymbolsCodes[@]}"; do
	pad=' '
	pad2=' '
	symbol=${leftSymbols[$i]}
	symbol2=${rightSymbols[$i]}
	code="${leftSymbolsCodes[$i]}"
	code2="${rightSymbolsCodes[$i]}"

	if [ "${isWide[$i]}" -ge 1 ] && [ $# -ge 1 ]; then
		symbol="${symbol} "
		symbol2="${symbol2} "
		pad=
		pad2=
	fi
	if [ "$code" = "$code2" ]; then
		symbol2=${rightSymbols[0]}
		code2='None'
		pad2=' '
	fi

	echo -e "$colorBg1$colorFg1$text1 $code $colorFg2$colorBg2$symbol$pad $text2 $pad$colorFg1$colorBgDefault$symbol -- $colorFg1$colorBgDefault$symbol2$colorFg2$colorBg2$pad2 $text2 $pad2$symbol2$colorBg1$colorFg1 $code2 $colorReset$colorBg3\\n$colorReset"

done

viSymbolsCodes=('E0A0' 'E0A1' 'E0A2' 'E0A3')
viSymbols=('' '' '' '')

line=
for i in "${!viSymbolsCodes[@]}"; do
	symbol=${viSymbols[$i]}
	code="${viSymbolsCodes[$i]}"
	line="$line$colorBg1$colorFg1$text1 $code $colorFg1$colorBgDefault$symbol"
done
line="$line$colorBg1$colorFg1$text2$colorReset$colorBg3\\n$colorReset"
echo -e "$line"
