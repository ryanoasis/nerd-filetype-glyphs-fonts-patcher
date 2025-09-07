#!/usr/bin/env python3
# coding=utf8
# Nerd Fonts Version: 3.4.0
# Script Version: 1.3.0

# Example Usage:
# ./generate-glyph-info-from-set.py --font ../../src/glyphs/materialdesignicons-webfont.ttf --start f001 --end f847 --offset 4ff --prefix mdi
# ./generate-glyph-info-from-set.py --font ../../src/glyphs/materialdesign/*.ttf --start f0001 --end f1af0 --offset 0 --prefix md
# ./generate-glyph-info-from-set.py --font ../../src/glyphs/weathericons-regular-webfont.ttf --start f000 --end f0eb --negoffset d00 --prefix weather --nogaps

version = "3.4.0"

import sys
import re
import os
import argparse
from argparse import RawTextHelpFormatter
import errno
import subprocess
import fontforge

parser = argparse.ArgumentParser(description='Nerd Fonts Glyph Info Generator: displays code point and glyph names from given set\n\n* Website: https://www.nerdfonts.com\n* Version: ' + version + '\n* Development Website: https://github.com/ryanoasis/nerd-fonts\n* Changelog: https://github.com/ryanoasis/nerd-fonts/blob/-/changelog.md', formatter_class=RawTextHelpFormatter)
parser.add_argument('-start', '--start', type=str, nargs='?', dest='symbolFontStart', help='The starting unicode hex codepoint')
parser.add_argument('-end', '--end', type=str, nargs='?', dest='symbolFontEnd', help='The ending unicode hex codepoint')
parser.add_argument('-offset', '--offset', type=str, nargs='?', dest='symbolOffset', help='The amount (in hex) to offset the range by for the source font')
parser.add_argument('-negoffset', '--negoffset', type=str, nargs='?', dest='negSymbolOffset', help='The amount (in hex) to negative offset the range by for the source font')
parser.add_argument('-prefix', '--prefix', type=str, nargs='?', dest='prefix', help='The prefix to use for the shell variables and css names')
parser.add_argument('-nogaps', '--nogaps', action='store_true', dest='nogaps', help='Generates the codepoints in a continous codepoints with the given range (no empties/gaps)')
parser.add_argument('-font', '--font', type=str, nargs='?', dest='filepath', help='The file path to the font file to open')
args = parser.parse_args()

print(args.symbolFontStart, args.symbolFontEnd)

symbolFont = fontforge.open(args.filepath)

args.symbolFontStart = int(args.symbolFontStart, 16)
args.symbolFontEnd = int(args.symbolFontEnd, 16)
ctr = 0

if args.negSymbolOffset:
  args.negSymbolOffset = int(args.negSymbolOffset, 16)
  sign = '-'
  offset = args.negSymbolOffset
elif args.symbolOffset:
  args.symbolOffset = int(args.symbolOffset, 16)
  sign = ''
  offset = args.symbolOffset

signedOffset = int(sign+'0x'+format(offset, 'X'), 16)
hexPosition = args.symbolFontStart + signedOffset

allNames = set()
suppressedEntries = []
symbolFont.encoding = 'UnicodeFull'
for index in range(args.symbolFontStart, args.symbolFontEnd + 1):
  if not index in symbolFont:
    continue
  sym_glyph = symbolFont[index]
  code = sym_glyph.unicode
  name = sym_glyph.glyphname
  sh_name = 'i_{}_{}'.format(args.prefix, name.replace('-', '_'))

  if args.nogaps:
    char = chr(hexPosition)
  else:
    char = chr(code + signedOffset)

  entryString = 'i=\'{}\' {}=$i'.format(char, sh_name)

  if index != code:
    suppressedEntries.append(entryString + ' (not main)')
  elif name not in allNames:
    print(entryString)
  else:
    suppressedEntries.append(entryString + ' (double)')

  ctr += 1
  hexPosition += 1
  allNames.add(name)

print('Done, generated {} glyphs'.format(ctr))

if len(suppressedEntries) > 0:
  print('FOLLOGING ENTRIES SUPPRESSED to prevent double names:')
  print('\n'.join(suppressedEntries))
