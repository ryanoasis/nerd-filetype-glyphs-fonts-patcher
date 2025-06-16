#!/usr/bin/env python
# coding=utf8
# Nerd Fonts Version: 3.4.0
# Script version is further down

from __future__ import absolute_import, print_function, unicode_literals

# Change the script version when you edit this script:
script_version = "4.20.5"

version = "3.4.0"
projectName = "Nerd Fonts"
projectNameAbbreviation = "NF"
projectNameSingular = projectName[:-1]

import sys
import re
import os
import argparse
from argparse import RawTextHelpFormatter
import errno
import subprocess
import json
from enum import Enum
import logging
try:
    import configparser
except ImportError:
    sys.exit(projectName + ": configparser module is probably not installed. Try `pip install configparser` or equivalent")
try:
    import psMat
    import fontforge
except ImportError:
    sys.exit(
        projectName + (
            ": FontForge module could not be loaded. Try installing fontforge python bindings "
            "[e.g. on Linux Debian or Ubuntu: `sudo apt install fontforge python3-fontforge`]"
        )
    )

sys.path.insert(0, os.path.join(os.path.abspath(os.path.dirname(sys.argv[0])), 'bin', 'scripts', 'name_parser'))
try:
    from FontnameParser import FontnameParser
    from FontnameTools import FontnameTools
    FontnameParserOK = True
except ImportError:
    FontnameParserOK = False

class TableHEADWriter:
    """ Access to the HEAD table without external dependencies """
    def getlong(self, pos = None):
        """ Get four bytes from the font file as integer number """
        if pos:
            self.goto(pos)
        return (ord(self.f.read(1)) << 24) + (ord(self.f.read(1)) << 16) + (ord(self.f.read(1)) << 8) + ord(self.f.read(1))

    def getshort(self, pos = None):
        """ Get two bytes from the font file as integer number """
        if pos:
            self.goto(pos)
        return (ord(self.f.read(1)) << 8) + ord(self.f.read(1))

    def putlong(self, num, pos = None):
        """ Put number as four bytes into font file """
        if pos:
            self.goto(pos)
        self.f.write(bytearray([(num >> 24) & 0xFF, (num >> 16) & 0xFF ,(num >> 8) & 0xFF, num & 0xFF]))
        self.modified = True

    def putshort(self, num, pos = None):
        """ Put number as two bytes into font file """
        if pos:
            self.goto(pos)
        self.f.write(bytearray([(num >> 8) & 0xFF, num & 0xFF]))
        self.modified = True

    def calc_checksum(self, start, end, checksum = 0):
        """ Calculate a font table checksum, optionally ignoring another embedded checksum value (for table 'head') """
        self.f.seek(start)
        for i in range(start, end - 4, 4):
            checksum += self.getlong()
            checksum &= 0xFFFFFFFF
        i += 4
        extra = 0
        for j in range(4):
            extra = extra << 8
            if i + j <= end:
                extra += ord(self.f.read(1))
        checksum = (checksum + extra) & 0xFFFFFFFF
        return checksum

    def find_table(self, tablenames, idx):
        """ Search all tables for one of the tables in tablenames and store its metadata """
        # Use font with index idx if this is a font collection file
        self.f.seek(0, 0)
        tag = self.f.read(4)
        if tag == b'ttcf':
            self.f.seek(2*2, 1)
            self.num_fonts = self.getlong()
            if (idx >= self.num_fonts):
                raise Exception('Trying to access subfont index {} but have only {} fonts'.format(idx, num_fonts))
            for _ in range(idx + 1):
                offset = self.getlong()
            self.f.seek(offset, 0)
        elif idx != 0:
            raise Exception('Trying to access subfont but file is no collection')
        else:
            self.f.seek(0, 0)
            self.num_fonts = 1

        self.f.seek(4, 1)
        numtables = self.getshort()
        self.f.seek(3*2, 1)

        for i in range(numtables):
            tab_name = self.f.read(4)
            self.tab_check_offset = self.f.tell()
            self.tab_check = self.getlong()
            self.tab_offset = self.getlong()
            self.tab_length = self.getlong()
            if tab_name in tablenames:
                return True
        return False

    def find_head_table(self, idx):
        """ Search all tables for the HEAD table and store its metadata """
        # Use font with index idx if this is a font collection file
        found = self.find_table([ b'head' ], idx)
        if not found:
            raise Exception('No HEAD table found in font idx {}'.format(idx))


    def goto(self, where):
        """ Go to a named location in the file or to the specified index """
        if isinstance(where, str):
            positions = {'checksumAdjustment': 2+2+4,
                         'flags': 2+2+4+4+4,
                         'lowestRecPPEM': 2+2+4+4+4+2+2+8+8+2+2+2+2+2,
                         'avgWidth': 2,
                }
            where = self.tab_offset + positions[where]
        self.f.seek(where)


    def calc_full_checksum(self, check = False):
        """ Calculate the whole file's checksum """
        self.f.seek(0, 2)
        self.end = self.f.tell()
        full_check = self.calc_checksum(0, self.end, (-self.checksum_adj) & 0xFFFFFFFF)
        if check and (0xB1B0AFBA - full_check) & 0xFFFFFFFF != self.checksum_adj:
            sys.exit("Checksum of whole font is bad")
        return full_check

    def calc_table_checksum(self, check = False):
        tab_check_new = self.calc_checksum(self.tab_offset, self.tab_offset + self.tab_length - 1, (-self.checksum_adj) & 0xFFFFFFFF)
        if check and tab_check_new != self.tab_check:
            sys.exit("Checksum of 'head' in font is bad")
        return tab_check_new

    def reset_table_checksum(self):
        new_check = self.calc_table_checksum()
        self.putlong(new_check, self.tab_check_offset)

    def reset_full_checksum(self):
        new_adj = (0xB1B0AFBA - self.calc_full_checksum()) & 0xFFFFFFFF
        self.putlong(new_adj, 'checksumAdjustment')

    def close(self):
        self.f.close()


    def __init__(self, filename):
        self.modified = False
        self.f = open(filename, 'r+b')

        self.find_head_table(0)

        self.flags = self.getshort('flags')
        self.lowppem = self.getshort('lowestRecPPEM')
        self.checksum_adj = self.getlong('checksumAdjustment')

def check_panose_monospaced(font):
    """ Check if the font's Panose flags say it is monospaced """
    # https://forum.high-logic.com/postedfiles/Panose.pdf
    panose = list(font.os2_panose)
    if panose[0] < 2 or panose[0] > 5:
        return -1 # invalid Panose info
    panose_mono = ((panose[0] == 2 and panose[3] == 9) or
                   (panose[0] == 3 and panose[3] == 3))
    return 1 if panose_mono else 0

def panose_check_to_text(value, panose = False):
    """ Convert value from check_panose_monospaced() to human readable string """
    if value == 0:
        return "Panose says \"not monospaced\""
    if value == 1:
        return "Panose says \"monospaced\""
    return "Panose is invalid" + (" ({})".format(list(panose)) if panose else "")

def panose_proportion_to_text(value):
    """ Interpret a Panose proportion value (4th value) for family 2 (latin text) """
    proportion = {
            0: "Any", 1: "No Fit", 2: "Old Style", 3: "Modern", 4: "Even Width",
            5: "Extended", 6: "Condensed", 7: "Very Extended", 8: "Very Condensed",
            9: "Monospaced" }
    return proportion.get(value, "??? {}".format(value))

def is_monospaced(font):
    """ Check if a font is probably monospaced """
    # Some fonts lie (or have not any Panose flag set), spot check monospaced:
    width = -1
    width_mono = True
    for glyph in [ 0x49, 0x4D, 0x57, 0x61, 0x69, 0x6d, 0x2E ]: # wide and slim glyphs 'I', 'M', 'W', 'a', 'i', 'm', '.'
        if not glyph in font:
            # A 'strange' font, believe Panose
            return (check_panose_monospaced(font) == 1, None)
        # print(" -> {} {}".format(glyph, font[glyph].width))
        if width < 0:
            width = font[glyph].width
            continue
        if font[glyph].width != width:
            # Exception for fonts like Code New Roman Regular or Hermit Light/Bold:
            # Allow small 'i' and dot to be smaller than normal
            # I believe the source fonts are buggy
            if glyph in [ 0x69, 0x2E ]:
                if width > font[glyph].width:
                    continue
                (xmin, _, xmax, _) = font[glyph].boundingBox()
                if width > xmax - xmin:
                    continue
            width_mono = False
            break
    # We believe our own check more then Panose ;-D
    return (width_mono, None if width_mono else glyph)

def force_panose_monospaced(font):
    """ Forces the Panose flag to monospaced if they are unset or halfway ok already """
    # For some Windows applications (e.g. 'cmd'), they seem to honour the Panose table
    # https://forum.high-logic.com/postedfiles/Panose.pdf
    panose = list(font.os2_panose)
    if panose[0] == 0: # 0 (1st value) = family kind; 0 = any (default)
        panose[0] = 2 # make kind latin text and display
        logger.info("Setting Panose 'Family Kind' to 'Latin Text and Display' (was 'Any')")
        font.os2_panose = tuple(panose)
    if panose[0] == 2 and panose[3] != 9:
        logger.info("Setting Panose 'Proportion' to 'Monospaced' (was '%s')", panose_proportion_to_text(panose[3]))
        panose[3] = 9 # 3 (4th value) = proportion; 9 = monospaced
        font.os2_panose = tuple(panose)

def get_advance_width(font, extended, minimum):
    """ Get the maximum/minimum advance width in the extended(?) range """
    width = 0
    if not extended:
        r = range(0x021, 0x07e)
    else:
        r = range(0x07f, 0x17f)
    for glyph in r:
        if not glyph in font:
            continue
        if glyph in range(0x7F, 0xBF):
            continue # ignore special characters like '1/4' etc
        if width == 0:
            width = font[glyph].width
            continue
        if not minimum and width < font[glyph].width:
            width = font[glyph].width
        elif minimum and width > font[glyph].width:
            width = font[glyph].width
    return width

def report_advance_widths(font):
    return "Advance widths (base/extended): {} - {} / {} - {}".format(
        get_advance_width(font, False, True), get_advance_width(font, False, False),
        get_advance_width(font, True, True), get_advance_width(font, True, False))

def get_btb_metrics(font):
    """ Get the baseline to baseline distance for all three metrics """
    hhea_height = font.hhea_ascent - font.hhea_descent
    typo_height = font.os2_typoascent - font.os2_typodescent
    win_height = font.os2_winascent + font.os2_windescent
    win_gap = max(0, font.hhea_linegap - win_height + hhea_height)
    hhea_btb = hhea_height + font.hhea_linegap
    typo_btb = typo_height + font.os2_typolinegap
    win_btb = win_height + win_gap
    return (hhea_btb, typo_btb, win_btb, win_gap)

def get_metrics_names():
    """ Helper to get the line metrics names consistent """
    return ['HHEA','TYPO','WIN']

def get_old_average_x_width(font):
    """ Determine xAvgCharWidth of the OS/2 table """
    # Fontforge can not create fonts with old (i.e. prior to OS/2 version 3)
    # table values, but some very old applications do need them sometimes
    # https://learn.microsoft.com/en-us/typography/opentype/spec/os2#xavgcharwidth
    s = 0
    weights = {
        'a': 64, 'b': 14, 'c': 27, 'd': 35, 'e': 100, 'f': 20, 'g': 14, 'h': 42, 'i': 63,
        'j': 3, 'k': 6, 'l': 35, 'm': 20, 'n': 56, 'o': 56, 'p': 17, 'q': 4, 'r': 49,
        's': 56, 't': 71, 'u': 31, 'v': 10, 'w': 18, 'x': 3, 'y': 18, 'z': 2, 32: 166,
    }
    for g in weights:
        if g not in font:
            logger.critical("Can not determine ancient style xAvgCharWidth")
            sys.exit(1)
        s += font[g].width * weights[g]
    return int(s / 1000)

def create_filename(fonts):
    """ Determine filename from font object(s) """
    # Only consider the standard (i.e. English-US) names
    sfnt = { k: v for l, k, v in fonts[0].sfnt_names if l == 'English (US)' }
    sfnt_pfam = sfnt.get('Preferred Family', sfnt['Family'])
    sfnt_psubfam = sfnt.get('Preferred Styles', sfnt['SubFamily'])
    if len(fonts) > 1:
        return sfnt_pfam
    if len(sfnt_psubfam) > 0:
        sfnt_psubfam = '-' + sfnt_psubfam
    return (sfnt_pfam + sfnt_psubfam).replace(' ', '')

def fetch_glyphnames():
    """ Read the glyphname database and put it into a dictionary """
    try:
        glyphnamefile = os.path.abspath(os.path.join(os.path.dirname(sys.argv[0]), 'glyphnames.json'))
        with open(glyphnamefile, 'rb') as f:
            namelist = json.load(f)
            return { int(v['code'], 16): k for k, v in namelist.items() if 'code' in v }
    except Exception as error:
        logger.warning("Can not read glyphnames file (%s)", repr(error))
        return {}

class font_patcher:
    def __init__(self, args, conf):
        self.args = args  # class 'argparse.Namespace'
        self.sym_font_args = []
        self.config = conf  # class 'configparser.ConfigParser'
        self.sourceFont = None  # class 'fontforge.font'
        self.patch_set = None  # class 'list'
        self.font_dim = None  # class 'dict'
        self.font_extrawide = False
        self.source_monospaced = None # Later True or False
        self.symbolsonly = False # Are we generating the SymbolsOnly font?
        self.onlybitmaps = 0
        self.essential = set()
        self.xavgwidth = [] # list of ints
        self.glyphnames = fetch_glyphnames()

    def patch(self, font):
        self.sourceFont = font
        self.setup_version()
        self.assert_monospace()
        self.remove_ligatures()
        self.manipulate_hints()
        self.get_essential_references()
        self.get_sourcefont_dimensions()
        self.setup_patch_set()
        self.improve_line_dimensions()
        self.sourceFont.encoding = 'UnicodeFull'  # Update the font encoding to ensure that the Unicode glyphs are available
        self.onlybitmaps = self.sourceFont.onlybitmaps  # Fetch this property before adding outlines. NOTE self.onlybitmaps initialized and never used

        if self.args.forcemono:
            # Force width to be equal on all glyphs to ensure the font is considered monospaced on Windows.
            # This needs to be done on all characters, as some information seems to be lost from the original font file.
            self.set_sourcefont_glyph_widths()

        # For very wide (almost square or wider) fonts we do not want to generate 2 cell wide Powerline glyphs
        if self.font_dim['height'] * 1.8 < self.font_dim['width'] * 2:
            logger.warning("Very wide and short font, disabling 2 cell Powerline glyphs")
            self.font_extrawide = True

        # Prevent opening and closing the fontforge font. Makes things faster when patching
        # multiple ranges using the same symbol font.
        PreviousSymbolFilename = ""
        symfont = None

        if not os.path.isdir(self.args.glyphdir):
            logger.critical("Can not find symbol glyph directory %s "
                "(probably you need to download the src/glyphs/ directory?)", self.args.glyphdir)
            sys.exit(1)

        if self.args.dry_run:
            return

        for patch in self.patch_set:
            if patch['Enabled']:
                if PreviousSymbolFilename != patch['Filename']:
                    # We have a new symbol font, so close the previous one if it exists
                    if symfont:
                        symfont.close()
                        symfont = None
                    symfont_file = os.path.join(self.args.glyphdir, patch['Filename'])
                    if not os.path.isfile(symfont_file):
                        logger.critical("Can not find symbol source for '%s' (i.e. %s)",
                            patch['Name'], symfont_file)
                        sys.exit(1)
                    if not os.access(symfont_file, os.R_OK):
                        logger.critical("Can not open symbol source for '%s' (i.e. %s)",
                            patch['Name'], symfont_file)
                        sys.exit(1)
                    symfont = fontforge.open(symfont_file)
                    symfont.encoding = 'UnicodeFull'

                    # Match the symbol font size to the source font size
                    symfont.em = self.sourceFont.em
                    PreviousSymbolFilename = patch['Filename']

                # If patch table doesn't include a source start, re-use the symbol font values
                SrcStart = patch['SrcStart']
                if not SrcStart:
                    SrcStart = patch['SymStart']
                self.copy_glyphs(SrcStart, symfont, patch['SymStart'], patch['SymEnd'], patch['Exact'], patch['ScaleRules'], patch['Name'], patch['Attributes'])

        if symfont:
            symfont.close()

        # The grave accent and fontforge:
        # If the type is 'auto' fontforge changes it to 'mark' on export.
        # We can not prevent this. So set it to 'baseglyph' instead, as
        # that resembles the most common expectations.
        # This is not needed with fontforge March 2022 Release anymore.
        if "grave" in self.sourceFont:
            self.sourceFont["grave"].glyphclass="baseglyph"


    def generate(self, sourceFonts):
        sourceFont = sourceFonts[0]
        # the `PfEd-comments` flag is required for Fontforge to save '.comment' and '.fontlog'.
        if int(fontforge.version()) >= 20201107:
            gen_flags = (str('opentype'), str('PfEd-comments'), str('no-FFTM-table'))
        else:
            gen_flags = (str('opentype'), str('PfEd-comments'))
        if len(sourceFonts) > 1:
            layer = None
            # use first non-background layer
            for l in sourceFont.layers:
                if not sourceFont.layers[l].is_background:
                    layer = l
                    break
            outfile = os.path.normpath(os.path.join(
                sanitize_filename(self.args.outputdir, True),
                sanitize_filename(create_filename(sourceFonts)) + ".ttc"))
            sourceFonts[0].generateTtc(outfile, sourceFonts[1:], flags=gen_flags, layer=layer)
            message = "   Generated {} fonts\n   \\===> '{}'".format(len(sourceFonts), outfile)
        else:
            fontname = create_filename(sourceFonts)
            if not fontname:
                fontname = sourceFont.cidfontname
            outfile = os.path.normpath(os.path.join(
                sanitize_filename(self.args.outputdir, True),
                sanitize_filename(fontname) + self.args.extension))
            bitmaps = str()
            if len(sourceFont.bitmapSizes):
                logger.debug("Preserving bitmaps %s", repr(sourceFont.bitmapSizes))
                bitmaps = str('otf') # otf/ttf, both is bf_ttf
            if self.args.dry_run:
                logger.debug("=====> Filename '%s'", outfile)
                return
            sourceFont.generate(outfile, bitmap_type=bitmaps, flags=gen_flags)
            message = "   {}\n   \\===> '{}'".format(sourceFont.fullname, outfile)

        # Adjust flags that can not be changed via fontforge
        if re.search(r'\.[ot]tf$', self.args.font, re.IGNORECASE) and re.search(r'\.[ot]tf$', outfile, re.IGNORECASE):
            if not os.path.isfile(outfile) or os.path.getsize(outfile) < 1:
                logger.critical("Something went wrong and Fontforge did not generate the new font - look for messages above")
                sys.exit(1)
            try:
                source_font = TableHEADWriter(self.args.font)
                dest_font = TableHEADWriter(outfile)
                for idx in range(source_font.num_fonts):
                    logger.debug("Tweaking %d/%d", idx + 1, source_font.num_fonts)
                    xwidth_s = ''
                    xwidth = self.xavgwidth[idx] if len(self.xavgwidth) > idx else None
                    if isinstance(xwidth, int):
                        if isinstance(xwidth, bool) and xwidth:
                            source_font.find_table([b'OS/2'], idx)
                            xwidth = source_font.getshort('avgWidth')
                            xwidth_s = ' (copied from source)'
                        dest_font.find_table([b'OS/2'], idx)
                        d_xwidth = dest_font.getshort('avgWidth')
                        if d_xwidth != xwidth:
                            logger.debug("Changing xAvgCharWidth from %d to %d%s", d_xwidth, xwidth, xwidth_s)
                            dest_font.putshort(xwidth, 'avgWidth')
                            dest_font.reset_table_checksum()
                    source_font.find_head_table(idx)
                    dest_font.find_head_table(idx)
                    if source_font.flags & 0x08 == 0 and dest_font.flags & 0x08 != 0:
                        logger.debug("Changing flags from 0x%X to 0x%X", dest_font.flags, dest_font.flags & ~0x08)
                        dest_font.putshort(dest_font.flags & ~0x08, 'flags') # clear 'ppem_to_int'
                    if source_font.lowppem != dest_font.lowppem:
                        logger.debug("Changing lowestRecPPEM from %d to %d", dest_font.lowppem, source_font.lowppem)
                        dest_font.putshort(source_font.lowppem, 'lowestRecPPEM')
                    if dest_font.modified:
                        dest_font.reset_table_checksum()
                if dest_font.modified:
                    dest_font.reset_full_checksum()
            except Exception as error:
                logger.error("Can not handle font flags (%s)", repr(error))
            finally:
                try:
                    source_font.close()
                    dest_font.close()
                except:
                    pass
        if self.args.is_variable:
            logger.critical("Source font is a variable open type font (VF) and the patch results will most likely not be what you want")
        print(message)

        if self.args.postprocess:
            subprocess.call([self.args.postprocess, outfile])
            print("\n")
            logger.info("Post Processed: %s", outfile)


    def setup_name_backup(self, font):
        """ Store the original font names to be able to rename the font multiple times """
        font.persistent = {
            "fontname": font.fontname,
            "fullname": font.fullname,
            "familyname": font.familyname,
        }


    def setup_font_names(self, font):
        font.fontname = font.persistent["fontname"]
        if isinstance(font.persistent["fullname"], str):
            font.fullname = font.persistent["fullname"]
        if isinstance(font.persistent["familyname"], str):
            font.familyname = font.persistent["familyname"]
        verboseAdditionalFontNameSuffix = ""
        additionalFontNameSuffix = ""
        if not self.args.complete:
            # NOTE not all symbol fonts have appended their suffix here
            if self.args.fontawesome:
                additionalFontNameSuffix += " A"
                verboseAdditionalFontNameSuffix += " Plus Font Awesome"
            if self.args.fontawesomeextension:
                additionalFontNameSuffix += " AE"
                verboseAdditionalFontNameSuffix += " Plus Font Awesome Extension"
            if self.args.octicons:
                additionalFontNameSuffix += " O"
                verboseAdditionalFontNameSuffix += " Plus Octicons"
            if self.args.powersymbols:
                additionalFontNameSuffix += " PS"
                verboseAdditionalFontNameSuffix += " Plus Power Symbols"
            if self.args.codicons:
                additionalFontNameSuffix += " C"
                verboseAdditionalFontNameSuffix += " Plus Codicons"
            if self.args.pomicons:
                additionalFontNameSuffix += " P"
                verboseAdditionalFontNameSuffix += " Plus Pomicons"
            if self.args.fontlogos:
                additionalFontNameSuffix += " L"
                verboseAdditionalFontNameSuffix += " Plus Font Logos"
            if self.args.material:
                additionalFontNameSuffix += " MDI"
                verboseAdditionalFontNameSuffix += " Plus Material Design Icons"
            if self.args.weather:
                additionalFontNameSuffix += " WEA"
                verboseAdditionalFontNameSuffix += " Plus Weather Icons"

        # add mono signifier to beginning of name suffix
        if self.args.single:
            variant_abbrev = "M"
            variant_full = " Mono"
        elif self.args.nonmono and not self.symbolsonly:
            variant_abbrev = "P"
            variant_full = " Propo"
        else:
            variant_abbrev = ""
            variant_full = ""

        ps_suffix = projectNameAbbreviation + variant_abbrev + additionalFontNameSuffix

        # add 'Nerd Font' to beginning of name suffix
        verboseAdditionalFontNameSuffix = " " + projectNameSingular + variant_full + verboseAdditionalFontNameSuffix
        additionalFontNameSuffix = " " + projectNameSingular + variant_full + additionalFontNameSuffix

        if FontnameParserOK and self.args.makegroups > 0:
            user_supplied_name = False # User supplied names are kept unchanged
            if not isinstance(self.args.force_name, str):
                use_fullname = isinstance(font.fullname, str) # Usually the fullname is better to parse
                # Use fullname if it is 'equal' to the fontname
                if font.fullname:
                    use_fullname |= font.fontname.lower() == FontnameTools.postscript_char_filter(font.fullname).lower()
                # Use fullname for any of these source fonts (that are impossible to disentangle from the fontname, we need the blanks)
                for hit in [ 'Meslo' ]:
                    use_fullname |= font.fontname.lower().startswith(hit.lower())
                parser_name = font.fullname if use_fullname else font.fontname
                # Gohu fontnames hide the weight, but the file names are ok...
                if parser_name.startswith('Gohu'):
                    parser_name = os.path.splitext(os.path.basename(self.args.font))[0]
            else:
                if self.args.force_name == 'full':
                    parser_name = font.fullname
                elif self.args.force_name == 'postscript':
                    parser_name = font.fontname
                elif self.args.force_name == 'filename':
                    parser_name = os.path.basename(font.path).split('.')[0]
                else:
                    parser_name = self.args.force_name
                    user_supplied_name = True
                if not isinstance(parser_name, str) or len(parser_name) < 1:
                    logger.critical("Specified --name not usable because the name will be empty")
                    sys.exit(2)
            n = FontnameParser(parser_name, logger)
            if not n.parse_ok:
                logger.warning("Have only minimal naming information, check resulting name. Maybe specify --makegroups 0")
            n.drop_for_powerline()
            n.enable_short_families(not user_supplied_name, self.args.makegroups in [ 2, 3, 5, 6, ], self.args.makegroups in [ 3, 6, ])
            if not n.set_expect_no_italic(self.args.noitalic):
                logger.critical("Detected 'Italic' slant but --has-no-italic specified")
                sys.exit(1)

            # All the following stuff is ignored in makegroups-mode

        # basically split the font name around the dash "-" to get the fontname and the style (e.g. Bold)
        # this does not seem very reliable so only use the style here as a fallback if the font does not
        # have an internal style defined (in sfnt_names)
        # using '([^-]*?)' to get the item before the first dash "-"
        # using '([^-]*(?!.*-))' to get the item after the last dash "-"
        fontname, fallbackStyle = re.match("^([^-]*).*?([^-]*(?!.*-))$", font.fontname).groups()

        # dont trust 'font.familyname'
        familyname = fontname

        # fullname (filename) can always use long/verbose font name, even in windows
        if font.fullname != None:
            fullname = font.fullname + verboseAdditionalFontNameSuffix
        else:
            fullname = font.cidfontname + verboseAdditionalFontNameSuffix

        fontname = fontname + additionalFontNameSuffix.replace(" ", "")

        # let us try to get the 'style' from the font info in sfnt_names and fallback to the
        # parse fontname if it fails:
        try:
            # search tuple:
            subFamilyTupleIndex = [x[1] for x in font.sfnt_names].index("SubFamily")

            # String ID is at the second index in the Tuple lists
            sfntNamesStringIDIndex = 2

            # now we have the correct item:
            subFamily = font.sfnt_names[subFamilyTupleIndex][sfntNamesStringIDIndex]
        except IndexError:
            sys.stderr.write("{}: Could not find 'SubFamily' for given font, falling back to parsed fontname\n".format(projectName))
            subFamily = fallbackStyle

        # some fonts have inaccurate 'SubFamily', if it is Regular let us trust the filename more:
        if subFamily == "Regular" and len(fallbackStyle):
            subFamily = fallbackStyle

        # This is meant to cover the case where the SubFamily is "Italic" and the filename is *-BoldItalic.
        if  len(subFamily) < len(fallbackStyle):
            subFamily = fallbackStyle

        if len(subFamily) == 0:
            subFamily = "Regular"

        familyname += " " + projectNameSingular + variant_full

        # Don't truncate the subfamily to keep fontname unique.  MacOS treats fonts with
        # the same name as the same font, even if subFamily is different. Make sure to
        # keep the resulting fontname (PostScript name) valid by removing spaces.
        fontname += '-' + subFamily.replace(' ', '')

        # rename font
        #
        # comply with SIL Open Font License (OFL)
        reservedFontNameReplacements = {
            'source'         : 'sauce',
            'Source'         : 'Sauce',
            'Bitstream Vera Sans Mono' : 'Bitstrom Wera',
            'BitstreamVeraSansMono' : 'BitstromWera',
            'bitstream vera sans mono' : 'bitstrom wera',
            'bitstreamverasansmono' : 'bitstromwera',
            'hermit'         : 'hurmit',
            'Hermit'         : 'Hurmit',
            'hasklig'        : 'hasklug',
            'Hasklig'        : 'Hasklug',
            'Share'          : 'Shure',
            'share'          : 'shure',
            'IBMPlex'        : 'Blex',
            'ibmplex'        : 'blex',
            'IBM-Plex'       : 'Blex',
            'IBM Plex'       : 'Blex',
            'terminus'       : 'terminess',
            'Terminus'       : 'Terminess',
            'liberation'     : 'literation',
            'Liberation'     : 'Literation',
            'iAWriter'       : 'iMWriting',
            'iA Writer'      : 'iM Writing',
            'iA-Writer'      : 'iM-Writing',
            'Anka/Coder'     : 'AnaConder',
            'anka/coder'     : 'anaconder',
            'Cascadia Code'  : 'Caskaydia Cove',
            'cascadia code'  : 'caskaydia cove',
            'CascadiaCode'   : 'CaskaydiaCove',
            'cascadiacode'   : 'caskaydiacove',
            'Cascadia Mono'  : 'Caskaydia Mono',
            'cascadia mono'  : 'caskaydia mono',
            'CascadiaMono'   : 'CaskaydiaMono',
            'cascadiamono'   : 'caskaydiamono',
            'Fira Mono'      : 'Fura Mono',
            'Fira Sans'      : 'Fura Sans',
            'FiraMono'       : 'FuraMono',
            'FiraSans'       : 'FuraSans',
            'fira mono'      : 'fura mono',
            'fira sans'      : 'fura sans',
            'firamono'       : 'furamono',
            'firasans'       : 'furasans',
            'IntelOneMono'   : 'IntoneMono',
            'IntelOne Mono'  : 'Intone Mono',
            'Intel One Mono' : 'Intone Mono',
        }

        # remove overly verbose font names
        # particularly regarding Powerline sourced Fonts (https://github.com/powerline/fonts)
        additionalFontNameReplacements = {
            'for Powerline': '',
            'ForPowerline': ''
        }

        additionalFontNameReplacements2 = {
            'Powerline': ''
        }

        projectInfo = (
            "Patched with '" + projectName + " Patcher' (https://github.com/ryanoasis/nerd-fonts)\n\n"
            "* Website: https://www.nerdfonts.com\n"
            "* Version: " + version + "\n"
            "* Development Website: https://github.com/ryanoasis/nerd-fonts\n"
            "* Changelog: https://github.com/ryanoasis/nerd-fonts/blob/-/changelog.md"
        )

        familyname = replace_font_name(familyname, reservedFontNameReplacements)
        fullname   = replace_font_name(fullname,   reservedFontNameReplacements)
        fontname   = replace_font_name(fontname,   reservedFontNameReplacements)
        familyname = replace_font_name(familyname, additionalFontNameReplacements)
        fullname   = replace_font_name(fullname,   additionalFontNameReplacements)
        fontname   = replace_font_name(fontname,   additionalFontNameReplacements)
        familyname = replace_font_name(familyname, additionalFontNameReplacements2)
        fullname   = replace_font_name(fullname,   additionalFontNameReplacements2)
        fontname   = replace_font_name(fontname,   additionalFontNameReplacements2)

        if self.args.makegroups < 0:
            logger.warning("Renaming disabled! Make sure to comply with font license, esp RFN clause!")
        elif not (FontnameParserOK and self.args.makegroups > 0):
            # replace any extra whitespace characters:
            font.familyname = " ".join(familyname.split())
            font.fullname   = " ".join(fullname.split())
            font.fontname   = " ".join(fontname.split())

            font.appendSFNTName(str('English (US)'), str('Preferred Family'), font.familyname)
            font.appendSFNTName(str('English (US)'), str('Family'), font.familyname)
            font.appendSFNTName(str('English (US)'), str('Compatible Full'), font.fullname)
            font.appendSFNTName(str('English (US)'), str('SubFamily'), subFamily)
        else:
            # Add Nerd Font suffix unless user specifically asked for some excplicit name via --name
            if not user_supplied_name:
                short_family = projectNameAbbreviation + variant_abbrev if self.args.makegroups >= 4 else projectNameSingular + variant_full
                # inject_suffix(family, ps_fontname, short_family)
                n.inject_suffix(verboseAdditionalFontNameSuffix, ps_suffix, short_family)
            n.rename_font(font)

        font.comment = projectInfo
        font.fontlog = projectInfo


    def setup_version(self):
        """ Add the Nerd Font version to the original version """
        # print("Version was {}".format(sourceFont.version))
        if self.sourceFont.version != None:
            self.sourceFont.version += ";" + projectName + " " + version
        else:
            self.sourceFont.version = str(self.sourceFont.cidversion) + ";" + projectName + " " + version
        self.sourceFont.sfntRevision = None # Auto-set (refreshed) by fontforge
        self.sourceFont.appendSFNTName(str('English (US)'), str('Version'), "Version " + self.sourceFont.version)
        # The Version SFNT name is later reused by the NameParser for UniqueID
        # print("Version now is {}".format(sourceFont.version))


    def remove_ligatures(self):
        # let's deal with ligatures (mostly for monospaced fonts)
        # Usually removes 'fi' ligs that end up being only one cell wide, and 'ldot'
        if self.args.removeligatures:
            logger.info("Removing ligatures from configfile `Subtables` section")
            if 'Subtables' not in self.config:
                logger.warning("No ligature data (config file missing?)")
                return
            ligature_subtables = json.loads(self.config.get('Subtables', 'ligatures', fallback='[]'))
            for subtable in ligature_subtables:
                logger.debug("Removing subtable: %s", subtable)
                try:
                    self.sourceFont.removeLookupSubtable(subtable)
                    logger.debug("Successfully removed subtable: %s", subtable)
                except Exception:
                    logger.error("Failed to remove subtable: %s", subtable)


    def manipulate_hints(self):
        """ Redo the hinting on some problematic glyphs """
        if 'Hinting' not in self.config:
            return
        redo = json.loads(self.config.get('Hinting', 're_hint', fallback='[]'))
        if not len(redo):
            return
        logger.debug("Working on {} rehinting rules (this may create a lot of fontforge warnings)".format(len(redo)))
        count = 0
        for gname in self.sourceFont:
            for regex in redo:
                if re.fullmatch(regex, gname):
                    glyph = self.sourceFont[gname]
                    glyph.autoHint()
                    glyph.autoInstr()
                    count += 1
                    break
        logger.info("Rehinted {} glyphs".format(count))

    def assert_monospace(self):
        # Check if the sourcefont is monospaced
        width_mono, offending_char = is_monospaced(self.sourceFont)
        self.source_monospaced = width_mono
        if self.args.nonmono:
            return
        panose_mono = check_panose_monospaced(self.sourceFont)
        logger.debug("Monospace check: %s; glyph-width-mono %s",
            panose_check_to_text(panose_mono, self.sourceFont.os2_panose), repr(width_mono))
        # The following is in fact "width_mono != panose_mono", but only if panose_mono is not 'unknown'
        if (width_mono and panose_mono == 0) or (not width_mono and panose_mono == 1):
            logger.warning("Monospaced check: Panose assumed to be wrong")
            logger.warning("Monospaced check: %s and %s",
                report_advance_widths(self.sourceFont),
                panose_check_to_text(panose_mono, self.sourceFont.os2_panose))
        if self.args.forcemono and not width_mono:
            logger.warning("Sourcefont is not monospaced - forcing to monospace not advisable, "
                "results might be useless%s",
                " - offending char: {:X}".format(offending_char) if offending_char is not None else "")
            if self.args.forcemono <= 1:
                logger.critical("Font will not be patched! Give --mono (or -s) twice to force patching")
                sys.exit(1)
        if width_mono:
            force_panose_monospaced(self.sourceFont)


    def setup_patch_set(self):
        """ Creates list of dicts to with instructions on copying glyphs from each symbol font into self.sourceFont """

        box_enabled = self.source_monospaced and not self.symbolsonly # Box glyph only for monospaced and not for Symbols Only
        box_keep = False
        if box_enabled or self.args.forcebox:
            self.sourceFont.selection.select(("ranges",), 0x2500, 0x259f)
            box_glyphs_target = len(list(self.sourceFont.selection))
            box_glyphs_current = len(list(self.sourceFont.selection.byGlyphs))
            if box_glyphs_target > box_glyphs_current or self.args.forcebox:
                # Sourcefont does not have all of these glyphs, do not mix sets (overwrite existing)
                if box_glyphs_current > 0:
                    logger.debug("%d/%d box drawing glyphs will be replaced",
                        box_glyphs_current, box_glyphs_target)
                box_enabled = True
            else:
                # Sourcefont does have all of these glyphs
                # box_keep = True # just scale do not copy (need to scale to fit new cell size)
                box_enabled = False # Cowardly not scaling existing glyphs, although the code would allow this

        # Stretch 'xz' or 'pa' (preserve aspect ratio)
        # Supported params: overlap | careful | xy-ratio | dont_copy | ypadding
        # Overlap value is used horizontally but vertically limited to 0.01
        # Careful does not overwrite/modify existing glyphs
        # The xy-ratio limits the x-scale for a given y-scale to make the ratio <= this value (to prevent over-wide glyphs)
        # '1' means occupu 1 cell (default for 'xy')
        # '2' means occupy 2 cells (default for 'pa')
        # '!' means do the 'pa' scaling even with non mono fonts (else it just scales down, never up)
        # '^' means that scaling shall fill the whole cell and not only the icon-cap-height (for mono fonts, other always use the whole cell)
        # Dont_copy does not overwrite existing glyphs but rescales the preexisting ones
        #
        # Be careful, stretch may not change within a ScaleRule!

        SYM_ATTR_DEFAULT = {
            'default': {'align': 'c', 'valign': 'c', 'stretch': 'pa', 'params': {}}
        }
        SYM_ATTR_POWERLINE = {
            'default': {'align': 'c', 'valign': 'c', 'stretch': '^pa', 'params': {}},

            # Arrow tips
            0xe0b0: {'align': 'l', 'valign': 'c', 'stretch': '^xy', 'params': {'overlap': 0.06, 'xy-ratio': 0.7}},
            0xe0b1: {'align': 'l', 'valign': 'c', 'stretch': '^xy', 'params': {'xy-ratio': 0.7}},
            0xe0b2: {'align': 'r', 'valign': 'c', 'stretch': '^xy', 'params': {'overlap': 0.06, 'xy-ratio': 0.7}},
            0xe0b3: {'align': 'r', 'valign': 'c', 'stretch': '^xy', 'params': {'xy-ratio': 0.7}},

            # Inverse arrow tips
            0xe0d6: {'align': 'l', 'valign': 'c', 'stretch': '^xy', 'params': {'overlap': 0.05, 'xy-ratio': 0.7}},
            0xe0d7: {'align': 'r', 'valign': 'c', 'stretch': '^xy', 'params': {'overlap': 0.05, 'xy-ratio': 0.7}},

            # Rounded arcs
            0xe0b4: {'align': 'l', 'valign': 'c', 'stretch': '^xy', 'params': {'overlap': 0.06, 'xy-ratio': 0.59}},
            0xe0b5: {'align': 'l', 'valign': 'c', 'stretch': '^xy', 'params': {'xy-ratio': 0.5}},
            0xe0b6: {'align': 'r', 'valign': 'c', 'stretch': '^xy', 'params': {'overlap': 0.06, 'xy-ratio': 0.59}},
            0xe0b7: {'align': 'r', 'valign': 'c', 'stretch': '^xy', 'params': {'xy-ratio': 0.5}},

            # Bottom Triangles
            0xe0b8: {'align': 'l', 'valign': 'c', 'stretch': '^xy', 'params': {'overlap': 0.05}},
            0xe0b9: {'align': 'l', 'valign': 'c', 'stretch': '^xy', 'params': {}},
            0xe0ba: {'align': 'r', 'valign': 'c', 'stretch': '^xy', 'params': {'overlap': 0.05}},
            0xe0bb: {'align': 'r', 'valign': 'c', 'stretch': '^xy', 'params': {}},

            # Top Triangles
            0xe0bc: {'align': 'l', 'valign': 'c', 'stretch': '^xy', 'params': {'overlap': 0.05}},
            0xe0bd: {'align': 'l', 'valign': 'c', 'stretch': '^xy', 'params': {}},
            0xe0be: {'align': 'r', 'valign': 'c', 'stretch': '^xy', 'params': {'overlap': 0.05}},
            0xe0bf: {'align': 'r', 'valign': 'c', 'stretch': '^xy', 'params': {}},

            # Flames
            0xe0c0: {'align': 'l', 'valign': 'c', 'stretch': '^xy2', 'params': {'overlap': 0.05}},
            0xe0c1: {'align': 'l', 'valign': 'c', 'stretch': '^xy2', 'params': {}},
            0xe0c2: {'align': 'r', 'valign': 'c', 'stretch': '^xy2', 'params': {'overlap': 0.05}},
            0xe0c3: {'align': 'r', 'valign': 'c', 'stretch': '^xy2', 'params': {}},

            # Small squares
            0xe0c4: {'align': 'l', 'valign': 'c', 'stretch': '^xy2', 'params': {'overlap': -0.03, 'xy-ratio': 0.86}},
            0xe0c5: {'align': 'r', 'valign': 'c', 'stretch': '^xy2', 'params': {'overlap': -0.03, 'xy-ratio': 0.86}},

            # Bigger squares
            0xe0c6: {'align': 'l', 'valign': 'c', 'stretch': '^xy2', 'params': {'overlap': -0.03, 'xy-ratio': 0.78}},
            0xe0c7: {'align': 'r', 'valign': 'c', 'stretch': '^xy2', 'params': {'overlap': -0.03, 'xy-ratio': 0.78}},

            # Waveform
            0xe0c8: {'align': 'l', 'valign': 'c', 'stretch': '^xy2', 'params': {'overlap': 0.05}},
            0xe0ca: {'align': 'r', 'valign': 'c', 'stretch': '^xy2', 'params': {'overlap': 0.05}},

            # Hexagons
            0xe0cc: {'align': 'l', 'valign': 'c', 'stretch': '^xy2', 'params': {'overlap': 0.02, 'xy-ratio': 0.85}},
            0xe0cd: {'align': 'l', 'valign': 'c', 'stretch': '^xy2', 'params': {'xy-ratio': 0.865}},

            # Legos
            0xe0ce: {'align': 'l', 'valign': 'c', 'stretch': '^pa', 'params': {}},
            0xe0cf: {'align': 'c', 'valign': 'c', 'stretch': '^pa', 'params': {}},
            0xe0d0: {'align': 'l', 'valign': 'c', 'stretch': '^pa', 'params': {}},
            0xe0d1: {'align': 'l', 'valign': 'c', 'stretch': '^pa', 'params': {}},

            # Top and bottom trapezoid
            0xe0d2: {'align': 'l', 'valign': 'c', 'stretch': '^xy', 'params': {'overlap': 0.02, 'xy-ratio': 0.7}},
            0xe0d4: {'align': 'r', 'valign': 'c', 'stretch': '^xy', 'params': {'overlap': 0.02, 'xy-ratio': 0.7}}
        }
        SYM_ATTR_TRIGRAPH = {
            'default': {'align': 'c', 'valign': 'c', 'stretch': 'pa1!', 'params': {'overlap': -0.10, 'careful': True}}
        }
        SYM_ATTR_FONTA = {
            # 'pa' == preserve aspect ratio
            'default': {'align': 'c', 'valign': 'c', 'stretch': 'pa', 'params': {}},

            # Don't center these arrows vertically
            0xf0dc: {'align': 'c', 'valign': '', 'stretch': 'pa', 'params': {}},
            0xf0dd: {'align': 'c', 'valign': '', 'stretch': 'pa', 'params': {}},
            0xf0de: {'align': 'c', 'valign': '', 'stretch': 'pa', 'params': {}}
        }
        SYM_ATTR_HEAVYBRACKETS = {
            'default': {'align': 'c', 'valign': 'c', 'stretch': '^pa1!', 'params': {'ypadding': 0.3, 'careful': True}}
        }
        SYM_ATTR_BOX = {
            'default': {'align': 'c', 'valign': 'c', 'stretch': '^xy', 'params': {'overlap': 0.02, 'dont_copy': box_keep}},
            # No overlap with checkered greys (commented out because that raises problems on rescaling clients)
            # 0x2591: {'align': 'c', 'valign': 'c', 'stretch': 'xy', 'params': {'dont_copy': box_keep}},
            # 0x2592: {'align': 'c', 'valign': 'c', 'stretch': 'xy', 'params': {'dont_copy': box_keep}},
            # 0x2593: {'align': 'c', 'valign': 'c', 'stretch': 'xy', 'params': {'dont_copy': box_keep}},
        }
        SYM_ATTR_PROGRESS = {
            'default': {'align': 'c', 'valign': 'c', 'stretch': '^pa1!', 'params': {'overlap': -0.03, 'careful': True}}, # Cirles
            # All the squares:
            0xee00: {'align': 'r', 'valign': 'c', 'stretch': '^xy', 'params': {'overlap': 0.05, 'careful': True}},
            0xee01: {'align': 'c', 'valign': 'c', 'stretch': '^xy', 'params': {'overlap': 0.10, 'careful': True}},
            0xee02: {'align': 'l', 'valign': 'c', 'stretch': '^xy', 'params': {'overlap': 0.05, 'careful': True}},
            0xee03: {'align': 'r', 'valign': 'c', 'stretch': '^xy', 'params': {'overlap': 0.05, 'careful': True}},
            0xee04: {'align': 'c', 'valign': 'c', 'stretch': '^xy', 'params': {'overlap': 0.10, 'careful': True}},
            0xee05: {'align': 'l', 'valign': 'c', 'stretch': '^xy', 'params': {'overlap': 0.05, 'careful': True}},
        }
        CUSTOM_ATTR = {
            # previous custom scaling => do not touch the icons
            # 'default': {'align': 'c', 'valign': '', 'stretch': '', 'params': {}}
            'default': {'align': 'c', 'valign': 'c', 'stretch': 'pa', 'params': {'careful': self.args.careful}}
        }

        # Most glyphs we want to maximize (individually) during the scale
        # However, there are some that need to be small or stay relative in
        # size to each other.
        # The glyph-specific behavior can be given as ScaleRules in the patch-set.
        #
        # ScaleRules can contain two different kind of rules (possibly in parallel):
        #   - ScaleGlyph:
        #       Here one specific glyph is used as 'scale blueprint'. Other glyphs are
        #       scaled by the same factor as this glyph. This is useful if you have one
        #       'biggest' glyph and all others should stay relatively in size.
        #       Shifting in addition to scaling can be selected too (see below).
        #   - ScaleGroups:
        #       Here you specify a group of glyphs that should be handled together
        #       with the same scaling and shifting (see bottom). The basis for it is
        #       a 'combined bounding box' of all glyphs in that group. All glyphs are
        #       handled as if they fill that combined bounding box.
        #  (- ScaleGroupsVert: Removed with this commit)
        #
        # The ScaleGlyph method: You set 'ScaleGlyph' to the unicode of the reference glyph.
        # Note that there can be only one per patch-set.
        # Additionally you set 'GlyphsToScale' that contains all the glyphs that shall be
        # handled (scaled) like the reference glyph.
        # It is a List of: ((glyph code) or (tuple of two glyph codes that form a closed range))
        #    'GlyphsToScale': [
        #        0x0100, 0x0300, 0x0400,  # The single glyphs 0x0100, 0x0300, and 0x0400
        #        (0x0200, 0x0210),        # All glyphs 0x0200 to 0x0210 including both 0x0200 and 0x0210
        #    ]}
        # If you want to not only scale but also shift as the reference glyph you give the
        # data as 'GlyphsToScale+'. Note that only one set is used and the plus version is preferred.
        #
        # For the ScaleGroup method you define any number groups of glyphs and each group is
        # handled separately. The combined bounding box of all glyphs in the group is determined
        # and based on that the scale and shift (see bottom) for all the glyphs in the group.
        # You define the groups as value of 'ScaleGroups'.
        # It is a List of: ((lists of glyph codes) or (ranges of glyph codes))
        #    'ScaleGroups': [
        #        [0x0100, 0x0300, 0x0400],  # One group consists of glyphs 0x0100, 0x0300, and 0x0400
        #        range(0x0200, 0x0210 + 1), # Another group contains glyphs 0x0200 to 0x0210 incl.
        #
        # Note the subtle differences: tuple vs. range; closed vs open range; etc
        # See prepareScaleRules() for some more details.
        # For historic reasons ScaleGroups is sometimes called 'new method' and ScaleGlyph 'old'.
        # The codepoints mentioned here are symbol-font-codepoints.
        #
        # Shifting:
        # If we have a combined bounding box stored in a range, that
        # box is used to align all symbols in the range identically.
        # - If the symbol font is proportinal only the v alignment is synced.
        # - If the symbol font is monospaced v and h alignemnts are synced.
        # To make sure the behavior is as expected you are required to set a ShiftMode property
        # accordingly. It just checks, you can not (!) select what is done with that property.

        BOX_SCALE_LIST = {'ShiftMode': 'xy', 'ScaleGroups': [
            [*range(0x2500, 0x2570 + 1), *range(0x2574, 0x257f + 1)], # box drawing
            range(0x2571, 0x2573 + 1), # diagonals
            range(0x2580, 0x259f + 1), # blocks and greys (greys are less tall originally, so overlap will be less)
        ]}
        CODI_SCALE_LIST = {'ShiftMode': 'xy', 'ScaleGroups': [
            [0xea61, 0xeb13], # lightbulb
            range(0xeab4, 0xeab7 + 1), # chevrons
            [0xea7d, *range(0xea99, 0xeaa1 + 1), 0xebcb], # arrows
            [0xeaa2, 0xeb9a, 0xec08, 0xec09], # bells
            range(0xead4, 0xead6 + 1), # dot and arrow
            [0xeb43, 0xec0b, 0xec0c], # (pull) request changes
            range(0xeb6e, 0xeb71 + 1), # triangles
            [*range(0xeb89, 0xeb8b + 1), 0xec07], # smallish dots
            range(0xebd5, 0xebd7 + 1), # compasses
        ]}
        DEVI_SCALE_LIST = None
        FONTA_SCALE_LIST = {'ShiftMode': '', 'ScaleGroups': [
            [0xf005, 0xf006, 0xf089], # star, star empty, half star
            range(0xf026, 0xf028 + 1), # volume off, down, up
            range(0xf02b, 0xf02c + 1), # tag, tags
            range(0xf031, 0xf035 + 1), # font et al
            range(0xf044, 0xf046 + 1), # edit, share, check (boxes)
            range(0xf048, 0xf052 + 1), # multimedia buttons
            range(0xf060, 0xf063 + 1), # arrows
            [0xf053, 0xf054, 0xf077, 0xf078], # chevron all directions
            range(0xf07d, 0xf07e + 1), # resize
            range(0xf0a4, 0xf0a7 + 1), # pointing hands
            [0xf0d7, 0xf0d8, 0xf0d9, 0xf0da, 0xf0dc, 0xf0dd, 0xf0de], # caret all directions and same looking sort
            range(0xf100, 0xf107 + 1), # angle
            range(0xf130, 0xf131 + 1), # mic
            range(0xf141, 0xf142 + 1), # ellipsis
            range(0xf153, 0xf15a + 1), # currencies
            range(0xf175, 0xf178 + 1), # long arrows
            range(0xf182, 0xf183 + 1), # male and female
            range(0xf221, 0xf22d + 1), # gender or so
            range(0xf255, 0xf25b + 1), # hand symbols
        ]}
        HEAVY_SCALE_LIST = {'ShiftMode': 'xy', 'ScaleGroups': [
            range(0x276c, 0x2771+1)
        ]}
        OCTI_SCALE_LIST = {'ShiftMode': '', 'ScaleGroups': [
            [*range(0xf03d, 0xf040 + 1), 0xf019, 0xf030, 0xf04a, 0xf051,  0xf071, 0xf08c ], # arrows
            [0xF0E7, # Smily and ...
                0xf044, 0xf05a, 0xf05b, 0xf0aa, # triangles
                0xf052, 0xf053, 0xf296, 0xf2f0, # small stuff
                0xf078, 0xf0a2, 0xf0a3, 0xf0a4, # chevrons
                0xf0ca, 0xf081, 0xf092, # dash, X, github-text
            ],
            [0xf09c, 0xf09f, 0xf0de], # bells
            range(0xf2c2, 0xf2c5 + 1), # move to
            [0xf07b, 0xf0a1, 0xf0d6, 0xf306], # bookmarks
        ]}
        PROGR_SCALE_LIST = {'ShiftMode': 'xy', 'ScaleGroups': [
            range(0xedff, 0xee05 + 1), # boxes... with helper glyph EDFF for Y padding
            range(0xee06, 0xee0b + 1), # circles
        ]}
        WEATH_SCALE_LIST = {'ShiftMode': '', 'ScaleGroups': [
            [0xf03c, 0xf042, 0xf045 ], # degree signs
            [0xf043, 0xf044, 0xf048, 0xf04b, 0xf04c, 0xf04d, 0xf057, 0xf058, 0xf087, 0xf088], # arrows
            range(0xf053, 0xf055 + 1), # thermometers
            [*range(0xf059, 0xf061 + 1), 0xf0b1], # wind directions
            range(0xf089, 0xf094 + 1), # clocks
            range(0xf095, 0xf0b0 + 1), # moon phases
            range(0xf0b7, 0xf0c3 + 1), # wind strengths
            [0xf06e, 0xf070 ], # solar/lunar eclipse
            [0xf051, 0xf052, 0xf0c9, 0xf0ca, 0xf072 ], # sun/moon up/down
            [0xf049, 0xf056, 0xf071, *range(0xf073, 0xf07c + 1), 0xf08a], # other things
            # Note: Codepoints listed before that are also in the following range
            # will take the scaling of the previous group (the ScaleGroups are
            # searched through in definition order).
            # But be careful, the combined bounding box for the following group
            # _will_ include all glyphs in its definition: Make sure the exempt
            # glyphs from above are smaller (do not extend) the combined bounding
            # box of this range:
            [ *range(0xf000, 0xf041 + 1),
              *range(0xf064, 0xf06d + 1),
              *range(0xf07d, 0xf083 + 1),
              *range(0xf085, 0xf086 + 1),
              *range(0xf0b2, 0xf0b6 + 1)
            ], # lots of clouds (weather states) (Please read note above!)
        ]}
        MDI_SCALE_LIST = None # Maybe later add some selected ScaleGroups


        # Define the character ranges
        # Symbol font ranges
        self.patch_set = [
            {'Enabled': True,                           'Name': "Seti-UI + Custom",        'Filename': "original-source.otf",                            'Exact': False, 'SymStart': 0xE4FA, 'SymEnd': 0xE5FF, 'SrcStart': 0xE5FA, 'ScaleRules': None,             'Attributes': SYM_ATTR_DEFAULT},
            {'Enabled': True,                           'Name': "Heavy Angle Brackets",    'Filename': "extraglyphs.sfd",                                'Exact': True,  'SymStart': 0x276C, 'SymEnd': 0x2771, 'SrcStart': None,   'ScaleRules': HEAVY_SCALE_LIST, 'Attributes': SYM_ATTR_HEAVYBRACKETS},
            {'Enabled': box_enabled,                    'Name': "Box Drawing",             'Filename': "extraglyphs.sfd",                                'Exact': True,  'SymStart': 0x2500, 'SymEnd': 0x259F, 'SrcStart': None,   'ScaleRules': BOX_SCALE_LIST,   'Attributes': SYM_ATTR_BOX},
            {'Enabled': True,                           'Name': "Progress Indicators",     'Filename': "extraglyphs.sfd",                                'Exact': True,  'SymStart': 0xEE00, 'SymEnd': 0xEE0B, 'SrcStart': None,   'ScaleRules': PROGR_SCALE_LIST, 'Attributes': SYM_ATTR_PROGRESS},
            {'Enabled': True,                           'Name': "Devicons",                'Filename': "devicons/devicons.otf",                          'Exact': False, 'SymStart': 0xE600, 'SymEnd': 0xE7EF, 'SrcStart': 0xE700, 'ScaleRules': DEVI_SCALE_LIST,  'Attributes': SYM_ATTR_DEFAULT},
            {'Enabled': self.args.powerline,            'Name': "Powerline Symbols",       'Filename': "powerline-symbols/PowerlineSymbols.otf",         'Exact': True,  'SymStart': 0xE0A0, 'SymEnd': 0xE0A2, 'SrcStart': None,   'ScaleRules': None,             'Attributes': SYM_ATTR_POWERLINE},
            {'Enabled': self.args.powerline,            'Name': "Powerline Symbols",       'Filename': "powerline-symbols/PowerlineSymbols.otf",         'Exact': True,  'SymStart': 0xE0B0, 'SymEnd': 0xE0B3, 'SrcStart': None,   'ScaleRules': None,             'Attributes': SYM_ATTR_POWERLINE},
            {'Enabled': self.args.powerlineextra,       'Name': "Powerline Extra Symbols", 'Filename': "powerline-extra/PowerlineExtraSymbols.otf",      'Exact': True,  'SymStart': 0xE0A3, 'SymEnd': 0xE0A3, 'SrcStart': None,   'ScaleRules': None,             'Attributes': SYM_ATTR_POWERLINE},
            {'Enabled': self.args.powerlineextra,       'Name': "Powerline Extra Symbols", 'Filename': "powerline-extra/PowerlineExtraSymbols.otf",      'Exact': True,  'SymStart': 0xE0B4, 'SymEnd': 0xE0C8, 'SrcStart': None,   'ScaleRules': None,             'Attributes': SYM_ATTR_POWERLINE},
            {'Enabled': self.args.powerlineextra,       'Name': "Powerline Extra Symbols", 'Filename': "powerline-extra/PowerlineExtraSymbols.otf",      'Exact': True,  'SymStart': 0xE0CA, 'SymEnd': 0xE0CA, 'SrcStart': None,   'ScaleRules': None,             'Attributes': SYM_ATTR_POWERLINE},
            {'Enabled': self.args.powerlineextra,       'Name': "Powerline Extra Symbols", 'Filename': "powerline-extra/PowerlineExtraSymbols.otf",      'Exact': True,  'SymStart': 0xE0CC, 'SymEnd': 0xE0D7, 'SrcStart': None,   'ScaleRules': None,             'Attributes': SYM_ATTR_POWERLINE},
            {'Enabled': self.args.powerlineextra,       'Name': "Powerline Extra Symbols", 'Filename': "powerline-extra/PowerlineExtraSymbols.otf",      'Exact': True,  'SymStart': 0x2630, 'SymEnd': 0x2630, 'SrcStart': None,   'ScaleRules': None,             'Attributes': SYM_ATTR_TRIGRAPH},
            {'Enabled': self.args.pomicons,             'Name': "Pomicons",                'Filename': "pomicons/Pomicons.otf",                          'Exact': True,  'SymStart': 0xE000, 'SymEnd': 0xE00A, 'SrcStart': None,   'ScaleRules': None,             'Attributes': SYM_ATTR_DEFAULT},
            {'Enabled': self.args.fontawesome,          'Name': "Font Awesome",            'Filename': "font-awesome/FontAwesome.otf",                   'Exact': True,  'SymStart': 0xED00, 'SymEnd': 0xF2FF, 'SrcStart': None,   'ScaleRules': FONTA_SCALE_LIST, 'Attributes': SYM_ATTR_FONTA},
            {'Enabled': self.args.fontawesomeextension, 'Name': "Font Awesome Extension",  'Filename': "font-awesome-extension.ttf",                     'Exact': False, 'SymStart': 0xE000, 'SymEnd': 0xE0A9, 'SrcStart': 0xE200, 'ScaleRules': None,             'Attributes': SYM_ATTR_DEFAULT},  # Maximize
            {'Enabled': self.args.powersymbols,         'Name': "Power Symbols",           'Filename': "Unicode_IEC_symbol_font.otf",                    'Exact': True,  'SymStart': 0x23FB, 'SymEnd': 0x23FE, 'SrcStart': None,   'ScaleRules': None,             'Attributes': SYM_ATTR_DEFAULT},  # Power, Power On/Off, Power On, Sleep
            {'Enabled': self.args.powersymbols,         'Name': "Power Symbols",           'Filename': "Unicode_IEC_symbol_font.otf",                    'Exact': True,  'SymStart': 0x2B58, 'SymEnd': 0x2B58, 'SrcStart': None,   'ScaleRules': None,             'Attributes': SYM_ATTR_DEFAULT},  # Heavy Circle (aka Power Off)
            {'Enabled': False             ,             'Name': "Material legacy",         'Filename': "materialdesign/materialdesignicons-webfont.ttf", 'Exact': False, 'SymStart': 0xF001, 'SymEnd': 0xF847, 'SrcStart': 0xF500, 'ScaleRules': None,             'Attributes': SYM_ATTR_DEFAULT},
            {'Enabled': self.args.material,             'Name': "Material",                'Filename': "materialdesign/MaterialDesignIconsDesktop.ttf",  'Exact': True,  'SymStart': 0xF0001,'SymEnd': 0xF1AF0,'SrcStart': None,   'ScaleRules': MDI_SCALE_LIST,   'Attributes': SYM_ATTR_DEFAULT},
            {'Enabled': self.args.weather,              'Name': "Weather Icons",           'Filename': "weather-icons/weathericons-regular-webfont.ttf", 'Exact': False, 'SymStart': 0xF000, 'SymEnd': 0xF0EB, 'SrcStart': 0xE300, 'ScaleRules': WEATH_SCALE_LIST, 'Attributes': SYM_ATTR_DEFAULT},
            {'Enabled': self.args.fontlogos,            'Name': "Font Logos",              'Filename': "font-logos.ttf",                                 'Exact': True,  'SymStart': 0xF300, 'SymEnd': 0xF381, 'SrcStart': None,   'ScaleRules': None,             'Attributes': SYM_ATTR_DEFAULT},
            {'Enabled': self.args.octicons,             'Name': "Octicons",                'Filename': "octicons/octicons.otf",                          'Exact': False, 'SymStart': 0xF000, 'SymEnd': 0xF105, 'SrcStart': 0xF400, 'ScaleRules': OCTI_SCALE_LIST,  'Attributes': SYM_ATTR_DEFAULT},  # Magnifying glass
            {'Enabled': self.args.octicons,             'Name': "Octicons",                'Filename': "octicons/octicons.otf",                          'Exact': True,  'SymStart': 0x2665, 'SymEnd': 0x2665, 'SrcStart': None,   'ScaleRules': OCTI_SCALE_LIST,  'Attributes': SYM_ATTR_DEFAULT},  # Heart
            {'Enabled': self.args.octicons,             'Name': "Octicons",                'Filename': "octicons/octicons.otf",                          'Exact': True,  'SymStart': 0X26A1, 'SymEnd': 0X26A1, 'SrcStart': None,   'ScaleRules': OCTI_SCALE_LIST,  'Attributes': SYM_ATTR_DEFAULT},  # Zap
            {'Enabled': self.args.octicons,             'Name': "Octicons",                'Filename': "octicons/octicons.otf",                          'Exact': False, 'SymStart': 0xF27C, 'SymEnd': 0xF306, 'SrcStart': 0xF4A9, 'ScaleRules': OCTI_SCALE_LIST,  'Attributes': SYM_ATTR_DEFAULT},
            {'Enabled': self.args.codicons,             'Name': "Codicons",                'Filename': "codicons/codicon.ttf",                           'Exact': True,  'SymStart': 0xEA60, 'SymEnd': 0xEC1E, 'SrcStart': None,   'ScaleRules': CODI_SCALE_LIST,  'Attributes': SYM_ATTR_DEFAULT},
            {'Enabled': self.args.custom,               'Name': "Custom",                  'Filename': self.args.custom,                                 'Exact': True,  'SymStart': 0x0000, 'SymEnd': 0x0000, 'SrcStart': None,   'ScaleRules': None,             'Attributes': CUSTOM_ATTR}
        ]

    def improve_line_dimensions(self):
        # Make the total line size even.  This seems to make the powerline separators
        # center more evenly.
        if self.args.adjustLineHeight:
            if (self.sourceFont.os2_winascent + self.sourceFont.os2_windescent) % 2 != 0:
                # All three are equal before due to get_sourcefont_dimensions()
                self.sourceFont.hhea_ascent += 1
                self.sourceFont.os2_typoascent += 1
                self.sourceFont.os2_winascent += 1

    def add_glyphrefs_to_essential(self, unicode):
        self.essential.add(unicode)
        # According to fontforge spec, altuni is either None or a tuple of tuples
        # Those tuples contained in altuni are of the following "format":
        # (unicode-value, variation-selector, reserved-field)
        altuni = self.sourceFont[unicode].altuni
        if altuni is not None:
            for altcode in [ v for v, s, r in altuni if v >= 0 ]:
                # If alternate unicode already exists in self.essential,
                # that means it has gone through this function before.
                # Therefore we skip it to avoid infinite loop.
                # A unicode value of -1 basically means unused and is also worth skipping.
                if altcode not in self.essential:
                    self.add_glyphrefs_to_essential(altcode)
        # From fontforge documentation:
        # glyph.references return a tuple of tuples containing, for each reference in foreground,
        # a glyph name, a transformation matrix, and (depending on ff version) whether the
        # reference is currently selected.
        references = self.sourceFont[unicode].references
        for refcode in [ self.sourceFont[n].unicode for n, *_ in references ]: # tuple of 2 or 3 depending on ff version
            if refcode not in self.essential and refcode >= 0:
                self.add_glyphrefs_to_essential(refcode)

    def get_essential_references(self):
        """Find glyphs that are needed for the basic glyphs"""
        # Sometimes basic glyphs are constructed from multiple other glyphs.
        # Find out which other glyphs are also needed to keep the basic
        # glyphs intact.
        # 0x0000-0x017f is the Latin Extended-A range
        # 0xfb00-0xfb06 are 'fi' and other ligatures
        basic_glyphs = { c for c in range(0x21, 0x17f + 1) if c in self.sourceFont }
        # Collect substitution destinations
        for glyph in list(basic_glyphs) + [*range(0xfb00, 0xfb06 + 1)]:
            if not glyph in self.sourceFont:
                continue
            for possub in self.sourceFont[glyph].getPosSub('*'):
                if possub[1] == 'Substitution' or possub[1] == 'Ligature':
                    basic_glyphs.add(glyph)
                    basic_glyphs.add(self.sourceFont[possub[2]].unicode)
        basic_glyphs.discard(-1) # the .notdef glyph
        for glyph in basic_glyphs:
            self.add_glyphrefs_to_essential(glyph)

    def get_sourcefont_dimensions(self):
        """ This gets the font dimensions (cell width and height), and makes them equal on all platforms """
        # Step 1
        # There are three ways to describe the baseline to baseline distance
        # (a.k.a. line spacing) of a font. That is all a kuddelmuddel
        # and we try to sort this out here
        # See also https://glyphsapp.com/learn/vertical-metrics
        # See also https://github.com/source-foundry/font-line
        (hhea_btb, typo_btb, win_btb, win_gap) = get_btb_metrics(self.sourceFont)
        use_typo = self.sourceFont.os2_use_typo_metrics != 0

        Metric = Enum('Metric', get_metrics_names())

        if not self.args.metrics:
            # We use either TYPO (1) or WIN (2) and compare with HHEA
            # and use HHEA (0) if the fonts seems broken - no WIN, see #1056
            our_btb = typo_btb if use_typo else win_btb
            if our_btb == hhea_btb:
                metrics = Metric.TYPO if use_typo else Metric.WIN # conforming font
            elif abs(our_btb - hhea_btb) / our_btb < 0.03:
                logger.info("Font vertical metrics slightly off (%.1f%%)", (our_btb - hhea_btb) / our_btb * 100.0)
                metrics = Metric.TYPO if use_typo else Metric.WIN
            else:
                # Try the other metric
                our_btb = typo_btb if not use_typo else win_btb
                if our_btb == hhea_btb:
                    use_typo = not use_typo
                    logger.warning("Font vertical metrics probably wrong USE TYPO METRICS, assume opposite (i.e. %s)", repr(use_typo))
                    self.sourceFont.os2_use_typo_metrics = 1 if use_typo else 0
                    metrics = Metric.TYPO if use_typo else Metric.WIN
                else:
                    # We trust the WIN metric more, see experiments in #1056
                    logger.warning("Font vertical metrics inconsistent (HHEA %d / TYPO %d / WIN %d), using WIN", hhea_btb, typo_btb, win_btb)
                    our_btb = win_btb
                    metrics = Metric.WIN
        else:
            metrics = Metric[self.args.metrics]
            logger.debug("Metrics in the font: HHEA %d / TYPO %d / WIN %d", hhea_btb, typo_btb, win_btb)
            if metrics == Metric.HHEA:
                our_btb = hhea_btb
            elif metrics == Metric.TYPO:
                our_btb = typo_btb
            else:
                our_btb = win_btb
            logger.info("Manually selected metrics: %s (%d)", self.args.metrics, our_btb)

        # print("FINI hhea {} typo {} win {} use {}     {}      {}".format(hhea_btb, typo_btb, win_btb, use_typo, our_btb != hhea_btb, self.sourceFont.fontname))

        self.font_dim = {'xmin': 0, 'ymin': 0, 'xmax': 0, 'ymax': 0, 'width' : 0, 'height': 0, 'iconheight': 0, 'ypadding': 0}

        if metrics == Metric.HHEA:
            self.font_dim['ymin'] = self.sourceFont.hhea_descent - half_gap(self.sourceFont.hhea_linegap, False)
            self.font_dim['ymax'] = self.sourceFont.hhea_ascent + half_gap(self.sourceFont.hhea_linegap, True)
        elif metrics == Metric.TYPO:
            self.font_dim['ymin'] = self.sourceFont.os2_typodescent - half_gap(self.sourceFont.os2_typolinegap, False)
            self.font_dim['ymax'] = self.sourceFont.os2_typoascent + half_gap(self.sourceFont.os2_typolinegap, True)
        elif metrics == Metric.WIN:
            self.font_dim['ymin'] = -self.sourceFont.os2_windescent - half_gap(win_gap, False)
            self.font_dim['ymax'] = self.sourceFont.os2_winascent + half_gap(win_gap, True)
        else:
            logger.debug("Metrics is strange")
            pass # Will fail the metrics check some line later

        if isinstance(self.args.cellopt, list):
            logger.debug("Overriding cell Y{%d:%d} with Y{%d:%d}",
                self.font_dim['ymin'], self.font_dim['ymax'],
                self.args.cellopt[2], self.args.cellopt[3])
            self.font_dim['ymin'] = self.args.cellopt[2]
            self.font_dim['ymax'] = self.args.cellopt[3]
            our_btb = self.args.cellopt[3] - self.args.cellopt[2]

        # Calculate font height
        self.font_dim['height'] = -self.font_dim['ymin'] + self.font_dim['ymax']
        if self.font_dim['height'] == 0:
            # This can only happen if the input font is empty
            # Assume we are using our prepared templates
            self.symbolsonly = True
            self.font_dim = {
                'xmin'      : 0,
                'ymin'      : -self.sourceFont.descent,
                'xmax'      : self.sourceFont.em,
                'ymax'      : self.sourceFont.ascent,
                'width'     : self.sourceFont.em,
                'height'    : self.sourceFont.descent + self.sourceFont.ascent,
                'iconheight': self.sourceFont.descent + self.sourceFont.ascent,
                'ypadding'  : 0,
            }
            our_btb = self.sourceFont.descent + self.sourceFont.ascent
        if self.font_dim['height'] <= 0:
            logger.critical("Can not detect sane font height")
            sys.exit(1)

        self.font_dim['iconheight'] = self.font_dim['height']
        if self.args.single and self.sourceFont.capHeight > 0 and not isinstance(self.args.cellopt, list):
            # Limit the icon height on monospaced fonts because very slender and tall icons render
            # excessively tall otherwise. We ignore that effect for the other variants because it
            # does not look so much out of place there.
            # Icons can be bigger than the letter capitals, but not the whole cell:
            self.font_dim['iconheight'] = (self.sourceFont.capHeight * 2 + self.font_dim['height']) / 3

        # Make all metrics equal
        self.sourceFont.os2_typolinegap = 0
        self.sourceFont.os2_typoascent = self.font_dim['ymax']
        self.sourceFont.os2_typodescent = self.font_dim['ymin']
        self.sourceFont.os2_winascent = self.sourceFont.os2_typoascent
        self.sourceFont.os2_windescent = -self.sourceFont.os2_typodescent
        self.sourceFont.hhea_ascent = self.sourceFont.os2_typoascent
        self.sourceFont.hhea_descent = self.sourceFont.os2_typodescent
        self.sourceFont.hhea_linegap = self.sourceFont.os2_typolinegap
        self.sourceFont.os2_use_typo_metrics = 1
        (check_hhea_btb, check_typo_btb, check_win_btb, _) = get_btb_metrics(self.sourceFont)
        if check_hhea_btb != check_typo_btb or check_typo_btb != check_win_btb or check_win_btb != our_btb:
            logger.critical("Error in baseline to baseline code detected")
            sys.exit(1)

        # Step 2
        # Find the biggest char width and advance width
        # 0x00-0x17f is the Latin Extended-A range
        warned1 = self.args.nonmono # Do not warn if proportional target
        warned2 = warned1
        for glyph in range(0x21, 0x17f):
            if glyph in range(0x7F, 0xBF) or glyph in [
                    0x132, 0x133, # IJ, ij (in Overpass Mono)
                    0x022, 0x027, 0x060, # Single and double quotes in Inconsolata LGC
                    0x0D0, 0x10F, 0x110, 0x111, 0x127, 0x13E, 0x140, 0x165, # Eth and others with stroke or caron in RobotoMono
                    0x149, # napostrophe in DaddyTimeMono
                    0x02D, # hyphen for Monofur
                    ]:
                continue # ignore special characters like '1/4' etc and some specifics
            try:
                (_, _, xmax, _) = self.sourceFont[glyph].boundingBox()
            except TypeError:
                continue
            # print("WIDTH {:X} {} ({} {})".format(glyph, self.sourceFont[glyph].width, self.font_dim['width'], xmax))
            if self.font_dim['width'] < self.sourceFont[glyph].width:
                self.font_dim['width'] = self.sourceFont[glyph].width
                if not warned1 and glyph > 0x7a: # NOT 'basic' glyph, which includes a-zA-Z
                    logger.debug("Extended glyphs wider than basic glyphs, results might be useless")
                    logger.debug("%s", report_advance_widths(self.sourceFont))
                    warned1 = True
                # print("New MAXWIDTH-A {:X} {} -> {} {}".format(glyph, self.sourceFont[glyph].width, self.font_dim['width'], xmax))
            if xmax > self.font_dim['xmax']:
                self.font_dim['xmax'] = xmax
                if not warned2 and glyph > 0x7a: # NOT 'basic' glyph, which includes a-zA-Z
                    logger.debug("Extended glyphs wider bounding box than basic glyphs")
                    warned2 = True
                # print("New MAXWIDTH-B {:X} {} -> {} {}".format(glyph, self.sourceFont[glyph].width, self.font_dim['width'], xmax))
        if self.font_dim['width'] < self.font_dim['xmax']:
            logger.debug("Font has negative right side bearing in extended glyphs")
            self.font_dim['xmax'] = self.font_dim['width'] # In fact 'xmax' is never used
        if self.font_dim['width'] <= 0:
            logger.critical("Can not detect sane font width")
            sys.exit(1)
        if isinstance(self.args.cellopt, list):
            logger.debug("Overriding cell X{%d:%d} with X{%d:%d}",
                self.font_dim['xmin'], self.font_dim['xmin'] + self.font_dim['width'],
                self.args.cellopt[0], self.args.cellopt[1])
            self.font_dim['xmin'] = self.args.cellopt[0]
            self.font_dim['xmax'] = self.args.cellopt[1]
            self.font_dim['width'] = self.args.cellopt[1]
        if self.args.cellopt:
            logger.info("Cell coordinates (Xmin:Xmax:Ymin:Ymax) %s%d:%d:%d:%d",
                '' if not isinstance(self.args.cellopt, list) else 'overridden with ',
                self.font_dim['xmin'], self.font_dim['width'],
                self.font_dim['ymax'] - self.font_dim['height'], self.font_dim['ymax'])
        logger.debug("Final font cell dimensions %d w x %d h%s",
            self.font_dim['width'], self.font_dim['height'],
            ' (with icon cell {} h)'.format(int(self.font_dim['iconheight'])) if self.font_dim['iconheight'] != self.font_dim['height'] else '')
        try:
            middle = lambda x, y: abs(x - y) / 2 + min(x, y)
            x_bb = self.sourceFont['x'].boundingBox();
            X_bb = self.sourceFont['X'].boundingBox();
            logger.debug("Center x-height/cell/capitals %d/%d/%d",
                middle(x_bb[1], x_bb[3]),
                middle(self.font_dim['ymin'], self.font_dim['ymax']),
                middle(X_bb[1], X_bb[3]))
        except:
            pass

        self.xavgwidth.append(self.args.xavgwidth)
        if isinstance(self.xavgwidth[-1], int) and self.xavgwidth[-1] == 0:
            self.xavgwidth[-1] = get_old_average_x_width(self.sourceFont)


    def get_target_width(self, stretch):
        """ Get the target width (1 or 2 'cell') for a given stretch parameter """
        # For monospaced fonts all chars need to be maximum 'one' space wide
        # other fonts allows double width glyphs for 'pa' or if requested with '2'
        if self.args.single or ('pa' not in stretch and '2' not in stretch) or '1' in stretch:
            return 1
        return 2

    def get_scale_factors(self, sym_dim, stretch, overlap=None):
        """ Get scale in x and y as tuple """
        # It is possible to have empty glyphs, so we need to skip those.
        if not sym_dim['width'] or not sym_dim['height']:
            return (1.0, 1.0)

        target_width = self.font_dim['width'] * self.get_target_width(stretch)
        if overlap:
            target_width += self.font_dim['width'] * overlap
        scale_ratio_x = target_width / sym_dim['width']

        # font_dim['height'] represents total line height, keep our symbols sized based upon font's em
        # Use the font_dim['height'] only for explicit 'y' scaling (not 'pa')
        target_height = self.font_dim['height'] if '^' in stretch else self.font_dim['iconheight']
        target_height *= 1.0 - self.font_dim['ypadding']
        if overlap:
            target_height *= 1.0 + min(0.01, overlap) # never aggressive vertical overlap
        scale_ratio_y = target_height / sym_dim['height']

        if 'pa' in stretch:
            # We want to preserve x/y aspect ratio, so find biggest scale factor that allows symbol to fit
            scale_ratio_x = min(scale_ratio_x, scale_ratio_y)
            if not self.args.single and not '!' in stretch and not overlap:
                # non monospaced fonts just scale down on 'pa', not up
                scale_ratio_x = min(scale_ratio_x, 1.0)
            scale_ratio_y = scale_ratio_x
        else:
            # Keep the not-stretched direction
            if not 'x' in stretch:
                scale_ratio_x = 1.0
            if not 'y' in stretch:
                scale_ratio_y = 1.0

        return (scale_ratio_x, scale_ratio_y)


    def copy_glyphs(self, sourceFontStart, symbolFont, symbolFontStart, symbolFontEnd, exactEncoding, scaleRules, setName, attributes):
        """ Copies symbol glyphs into self.sourceFont """
        progressText = ''
        careful = False
        sourceFontCounter = 0

        if self.args.careful:
            careful = True

        # Create glyphs from symbol font
        #
        # If we are going to copy all Glyphs, then assume we want to be careful
        # and only copy those that are not already contained in the source font
        if symbolFontStart == 0:
            symbolFont.selection.all()
            careful = True
        else:
            symbolFont.selection.select((str("ranges"), str("unicode")), symbolFontStart, symbolFontEnd)

        # Get number of selected non-empty glyphs with codes >=0 (i.e. not -1 == notdef)
        symbolFontSelection = [ x for x in symbolFont.selection.byGlyphs if x.unicode >= 0 ]
        glyphSetLength = len(symbolFontSelection)

        if not self.args.quiet:
            modify = attributes['default']['params'].get('dont_copy')
            sys.stdout.write("{} {} Glyphs from {} Set\n".format(
                "Adding" if not modify else "Rescaling", glyphSetLength, setName))

        currentSourceFontGlyph = -1 # initialize for the exactEncoding case
        width_warning = False

        for index, sym_glyph in enumerate(symbolFontSelection):
            sym_attr = attributes.get(sym_glyph.unicode)
            if sym_attr is None:
                sym_attr = attributes['default']

            if self.font_extrawide:
                # Do not allow 'xy2' scaling
                sym_attr['stretch'] = sym_attr['stretch'].replace('2', '')

            if exactEncoding:
                # Use the exact same hex values for the source font as for the symbol font.
                # Problem is we do not know the codepoint of the sym_glyph and because it
                # came from a selection.byGlyphs there might be skipped over glyphs.
                # The iteration is still in the order of the selection by codepoint,
                # so we take the next allowed codepoint of the current glyph
                possible_codes = [ ]
                if sym_glyph.unicode > currentSourceFontGlyph:
                    possible_codes += [ sym_glyph.unicode ]
                if sym_glyph.altuni:
                    possible_codes += [ v for v, s, r in sym_glyph.altuni if v > currentSourceFontGlyph ]
                if len(possible_codes) == 0:
                    logger.warning("Can not determine codepoint of %X. Skipping...", sym_glyph.unicode)
                    continue
                currentSourceFontGlyph = min(possible_codes)
            else:
                # use source font defined hex values based on passed in start (fills gaps; symbols are packed)
                currentSourceFontGlyph = sourceFontStart + sourceFontCounter
                sourceFontCounter += 1

            # For debugging process only limited glyphs
            # if currentSourceFontGlyph != 0xe7bd:
            #     continue

            ypadding = sym_attr['params'].get('ypadding')
            self.font_dim['ypadding'] = ypadding or 0.0

            if not self.args.quiet:
                if self.args.progressbars:
                    update_progress(round(float(index + 1) / glyphSetLength, 2))
                else:
                    progressText = "\nUpdating glyph: {} {} putting at: {:X}".format(sym_glyph, sym_glyph.glyphname, currentSourceFontGlyph)
                    sys.stdout.write(progressText)
                    sys.stdout.flush()

            # check if a glyph already exists in this location
            do_careful = sym_attr['params'].get('careful', careful) # params take precedence
            if do_careful or currentSourceFontGlyph in self.essential:
                if currentSourceFontGlyph in self.sourceFont:
                    careful_type = 'essential' if currentSourceFontGlyph in self.essential else 'existing'
                    logger.debug("Found %s Glyph at %X. Skipping...", careful_type, currentSourceFontGlyph)
                    # We don't want to touch anything so move to next Glyph
                    continue
            else:
                # If we overwrite an existing glyph all subtable entries regarding it will be wrong
                # (Probably; at least if we add a symbol and do not substitute a ligature or such)
                if currentSourceFontGlyph in self.sourceFont:
                    self.sourceFont[currentSourceFontGlyph].removePosSub("*")

            stretch = sym_attr['stretch']
            dont_copy = sym_attr['params'].get('dont_copy')

            if dont_copy:
                # Just prepare scaling of existing glyphs
                glyph_scale_data = self.get_glyph_scale(sym_glyph.encoding, scaleRules, stretch, self.sourceFont, currentSourceFontGlyph) if scaleRules is not None else None
            else:
                # Break apart multiple unicodes linking to one glyph
                if currentSourceFontGlyph in self.sourceFont:
                    altuni = self.sourceFont[currentSourceFontGlyph].altuni
                    if altuni:
                        codes = { v for v, s, r in altuni if v >= 0 }
                        codes.add(self.sourceFont[currentSourceFontGlyph].unicode)
                        codes.remove(currentSourceFontGlyph)
                        codes = [ "{:04X}".format(c) for c in sorted(list(codes)) ]
                        logger.debug("Removing alternate unicode on %X (%s)", currentSourceFontGlyph, ' '.join(codes));
                        self.sourceFont[currentSourceFontGlyph].altuni = None
                        self.sourceFont.encoding = 'UnicodeFull' # Rebuild encoding table (needed after altuni changes)

                # This will destroy any content currently in currentSourceFontGlyph, so do it first
                glyph_scale_data = self.get_glyph_scale(sym_glyph.encoding, scaleRules, stretch, symbolFont, currentSourceFontGlyph) if scaleRules is not None else None

                # Select and copy symbol from its encoding point
                # We need to do this select after the careful check, this way we don't
                # reset our selection before starting the next loop
                symbolFont.selection.select(sym_glyph.encoding)
                symbolFont.copy()

                # Paste it
                self.sourceFont.selection.select(currentSourceFontGlyph)
                self.sourceFont.paste()
                self.sourceFont[currentSourceFontGlyph].glyphname = \
                        self.glyphnames.get(currentSourceFontGlyph, sym_glyph.glyphname) if setName != 'Custom' else sym_glyph.glyphname
                self.sourceFont[currentSourceFontGlyph].manualHints = True # No autohints for symbols

            # Prepare symbol glyph dimensions
            sym_dim = get_glyph_dimensions(self.sourceFont[currentSourceFontGlyph])
            overlap = sym_attr['params'].get('overlap')
            if overlap and ypadding:
                logger.critical("Conflicting params: overlap and ypadding")
                sys.exit(1)

            if glyph_scale_data is not None:
                if glyph_scale_data[1] is not None:
                    sym_dim = glyph_scale_data[1] # Use combined bounding box
                    (scale_ratio_x, scale_ratio_y) = self.get_scale_factors(sym_dim, stretch, overlap)
                else:
                    # This is roughly alike get_scale_factors(glyph_scale_data[1], 'pa')
                    # Except we do not have glyph_scale_data[1] always...
                    (scale_ratio_x, scale_ratio_y) = (glyph_scale_data[0], glyph_scale_data[0])
                    if overlap:
                        scale_ratio_x *= 1.0 + (self.font_dim['width'] / (sym_dim['width'] * scale_ratio_x)) * overlap
                        y_overlap = min(0.01, overlap) # never aggressive vertical overlap
                        scale_ratio_y *= 1.0 + (self.font_dim['height'] / (sym_dim['height'] * scale_ratio_y)) * y_overlap
            else:
                (scale_ratio_x, scale_ratio_y) = self.get_scale_factors(sym_dim, stretch, overlap)


            # Size in x to size in y ratio limit (to prevent over-wide glyphs)
            xy_ratio_max = sym_attr['params'].get('xy-ratio')
            if (xy_ratio_max):
                xy_ratio = sym_dim['width'] * scale_ratio_x / (sym_dim['height'] * scale_ratio_y)
                if xy_ratio > xy_ratio_max:
                    scale_ratio_x = scale_ratio_x * xy_ratio_max / xy_ratio

            if scale_ratio_x != 1.0 or scale_ratio_y != 1.0:
                scale_ratio_x *= self.sourceFont.em / (self.sourceFont.em + 1) # scale a tiny bit too small to avoid rounding problems
                self.sourceFont[currentSourceFontGlyph].transform(psMat.scale(scale_ratio_x, scale_ratio_y))

            # Drop nonintegral part of nodes' coordinates; ttf will do it anyhow, otf will be much smaller
            self.sourceFont[currentSourceFontGlyph].round()

            if self.args.single:
                # Check and correct the scaling after rounding (if all 3 tries fail we will get a warning later on)
                destmaxsize = self.font_dim['width'] * max(1, 1 + (overlap or 0))
                for increaser in range(3):
                    (xmin, _, xmax, _) = self.sourceFont[currentSourceFontGlyph].boundingBox()
                    sizeerror = (xmax - xmin) - destmaxsize
                    if sizeerror <= 0:
                        break
                    # Start from scratch with a new unscaled glyph
                    scale_ratio_x /= 1 + ((sizeerror + increaser) / destmaxsize)
                    self.sourceFont.paste()
                    self.sourceFont[currentSourceFontGlyph].transform(psMat.scale(scale_ratio_x, scale_ratio_y))
                    self.sourceFont[currentSourceFontGlyph].round()

            # We pasted and scaled now we want to align/move
            # Use the dimensions from the newly pasted and stretched glyph to avoid any rounding errors
            sym_dim = get_glyph_dimensions(self.sourceFont[currentSourceFontGlyph])
            # Use combined bounding box?
            if glyph_scale_data is not None and glyph_scale_data[1] is not None:
                scaleglyph_dim = scale_bounding_box(glyph_scale_data[1], scale_ratio_x, scale_ratio_y)
                if scaleglyph_dim['advance'] is None:
                    # On monospaced symbol collections use their advance with, otherwise align horizontally individually
                    scaleglyph_dim['xmin'] = sym_dim['xmin']
                    scaleglyph_dim['xmax'] = sym_dim['xmax']
                    scaleglyph_dim['width'] = sym_dim['width']
                sym_dim = scaleglyph_dim

            y_align_distance = 0
            if sym_attr['valign'] == 'c':
                # Center the symbol vertically by matching the center of the line height and center of symbol
                sym_ycenter = sym_dim['ymax'] - (sym_dim['height'] / 2)
                font_ycenter = self.font_dim['ymax'] - (self.font_dim['height'] / 2)
                y_align_distance = font_ycenter - sym_ycenter

            # Handle glyph l/r/c alignment
            x_align_distance = 0
            simple_nonmono = self.args.nonmono and sym_dim['advance'] is None
            if simple_nonmono:
                # Remove left side bearing
                # (i.e. do not remove left side bearing when combined BB is in use)
                x_align_distance = -self.sourceFont[currentSourceFontGlyph].left_side_bearing
            elif sym_attr['align']:
                # First find the baseline x-alignment (left alignment amount)
                x_align_distance = self.font_dim['xmin'] - sym_dim['xmin']
                if self.args.nonmono and 'pa' in stretch:
                    cell_width = sym_dim['advance'] or sym_dim['width']
                else:
                    cell_width = self.font_dim['width']
                if sym_attr['align'] == 'c':
                    # Center align
                    x_align_distance += (cell_width / 2) - (sym_dim['width'] / 2)
                elif sym_attr['align'] == 'r':
                    # Right align
                    # (not really supported with pa scaling and 2x stretch in NFP)
                    x_align_distance += cell_width * self.get_target_width(stretch) - sym_dim['width']
                if not overlap:
                    # If symbol glyph is wider than target font cell, just left-align
                    x_align_distance = max(self.font_dim['xmin'] - sym_dim['xmin'], x_align_distance)

            if overlap:
                overlap_width = self.font_dim['width'] * overlap
                if sym_attr['align'] == 'l':
                    x_align_distance -= overlap_width
                elif sym_attr['align'] == 'c':
                    # center aligned keeps being center aligned even with overlap
                    if overlap_width < 0 and simple_nonmono: # Keep positive bearing due to negative overlap (propo)
                        x_align_distance -= overlap_width / 2
                elif sym_attr['align'] == 'r' and not simple_nonmono:
                    # Check and correct overlap; it can go wrong if we have a xy-ratio limit
                    target_xmax = (self.font_dim['xmin'] + self.font_dim['width']) * self.get_target_width(stretch)
                    target_xmax += overlap_width
                    glyph_xmax = sym_dim['xmax'] + x_align_distance
                    correction = target_xmax - glyph_xmax
                    x_align_distance += correction

            align_matrix = psMat.translate(x_align_distance, y_align_distance)
            self.sourceFont[currentSourceFontGlyph].transform(align_matrix)

            # Ensure after horizontal adjustments and centering that the glyph
            # does not overlap the bearings (edges)
            if not overlap:
                self.remove_glyph_neg_bearings(self.sourceFont[currentSourceFontGlyph])

            # Needed for setting 'advance width' on each glyph so they do not overlap,
            # also ensures the font is considered monospaced on Windows by setting the
            # same width for all character glyphs. This needs to be done for all glyphs,
            # even the ones that are empty and didn't go through the scaling operations.
            # It should come after setting the glyph bearings
            if not self.args.nonmono:
                self.set_glyph_width_mono(self.sourceFont[currentSourceFontGlyph])
            else:
                # Target font with variable advance width get the icons with their native widths
                # and keeping possible (right and/or negative) bearings in effect
                if sym_dim['advance'] is not None:
                    # 'Width' from monospaced scale group
                    width = sym_dim['advance']
                else:
                    width = sym_dim['width']
                # If we have overlap we need to subtract that to keep/get negative bearings
                if overlap:
                    width -= overlap_width
                # Fontforge handles the width change like this:
                # - Keep existing left_side_bearing
                # - Set width
                # - Calculate and set new right_side_bearing
                self.sourceFont[currentSourceFontGlyph].width = int(width)

            # Check if the inserted glyph is scaled correctly for monospace
            if self.args.single:
                (xmin, _, xmax, _) = self.sourceFont[currentSourceFontGlyph].boundingBox()
                if (xmax - xmin) > self.font_dim['width'] * max(1, 1 + (overlap or 0)):
                    logger.warning("Scaled glyph %X wider than one monospace width (%d / %d (overlap %s))",
                        currentSourceFontGlyph, int(xmax - xmin), self.font_dim['width'], repr(overlap))

        # end for

        if not self.args.quiet:
            sys.stdout.write("\n")


    def set_sourcefont_glyph_widths(self):
        """ Makes self.sourceFont monospace compliant """

        for glyph in self.sourceFont.glyphs():
            if (glyph.width == self.font_dim['width']):
                # Don't touch the (negative) bearings if the width is ok
                # Ligatures will have these.
                continue

            if (glyph.width != 0):
                # If the width is zero this glyph is intended to be printed on top of another one.
                # In this case we need to keep the negative bearings to shift it 'left'.
                # Things like &Auml; have these: composed of U+0041 'A' and U+0308 'double dot above'
                #
                # If width is not zero, correct the bearings such that they are within the width:
                self.remove_glyph_neg_bearings(glyph)

            self.set_glyph_width_mono(glyph)


    def remove_glyph_neg_bearings(self, glyph):
        """ Sets passed glyph's bearings 0 if they are negative. """
        try:
            if glyph.left_side_bearing < 0:
                glyph.left_side_bearing = 0
            if glyph.right_side_bearing < 0:
                glyph.right_side_bearing = 0
        except:
            pass


    def set_glyph_width_mono(self, glyph):
        """ Sets passed glyph.width to self.font_dim.width.

        self.font_dim.width is set with self.get_sourcefont_dimensions().
        """
        try:
            # Fontforge handles the width change like this:
            # - Keep existing left_side_bearing
            # - Set width
            # - Calculate and set new right_side_bearing
            glyph.width = self.font_dim['width']
        except:
            pass

    def prepareScaleRules(self, scaleRules, stretch, symbolFont, destGlyph):
        """ Prepare raw ScaleRules data for use """
        # The scaleRules is/will be a dict with these (possible) entries:
        # 'ScaleGroups': List of ((lists of glyph codes) or (ranges of glyph codes)) that shall be scaled
        # 'scales': List of associated scale factors, one for each entry in 'ScaleGroups' (generated by this function)
        # 'bbdims': List of associated sym_dim dicts, one for each entry in 'ScaleGroups' (generated by this function)
        #           Each dim_dict describes the combined bounding box of all glyphs in one ScaleGroups group
        # Example:
        # { 'ScaleGroups': [ range(1, 3), [ 7, 10 ], ],
        #   'scales':      [ 1.23,        1.33,      ],
        #   'bbdims':      [ dim_dict1,   dim_dict2, ] }
        #
        # Each item in 'ScaleGroups' (a range or an explicit list) forms a group of glyphs that shall be
        # as rescaled all with the same and maximum possible (for the included glyphs) 'pa' factor.
        # If the 'bbdims' is present they all shall be shifted in the same way.
        #
        # Previously this structure has been used:
        #   'ScaleGlyph' Lead glyph, which scaling factor is taken
        #   'GlyphsToScale': List of ((glyph code) or (tuple of two glyph codes that form a closed range)) that shall be scaled
        #   Note that this allows only one group for the whle symbol font, and that the scaling factor is defined by
        #   a specific character, which needs to be manually selected (on each symbol font update).
        #   Previous entries are automatically rewritten to the new style.
        #
        # Note that scaleRules is overwritten with the added data.
        if 'scales' in scaleRules:
            # Already prepared... must not happen, ignore call
            return

        scaleRules['scales'] = []
        scaleRules['bbdims'] = []
        if 'ScaleGroups' not in scaleRules:
            scaleRules['ScaleGroups'] = []

        mode = scaleRules['ShiftMode'] # Mode is only documentary
        for group in scaleRules['ScaleGroups']:
            sym_dim = get_multiglyph_boundingBox([ symbolFont[g] if g in symbolFont else None for g in group ], destGlyph)
            scale = self.get_scale_factors(sym_dim, stretch)[0]
            scaleRules['scales'].append(scale)
            scaleRules['bbdims'].append(sym_dim)
            if (mode):
                if ('x' in mode) != (sym_dim['advance'] is not None):
                    d = '0x{:X} - 0x{:X}'.format(group[0], group[-1])
                    if ('x' in mode) :
                        logger.critical("Scaling in group %s is expected to do horizontal shifts but can not", d)
                    else:
                        logger.critical("Scaling in group %s is expected to not do horizontal shifts but will", d)
                    sys.exit(1)

        if 'ScaleGlyph' in scaleRules:
            # Rewrite to equivalent ScaleGroup
            group_list = []
            if 'GlyphsToScale+' in scaleRules:
                key = 'GlyphsToScale+'
                plus = True
            else:
                key = 'GlyphsToScale'
                plus = False
            for i in scaleRules[key]:
                if isinstance(i, tuple):
                    group_list.append(range(i[0], i[1] + 1))
                else:
                    group_list.append(i)
            sym_dim = get_glyph_dimensions(symbolFont[scaleRules['ScaleGlyph']])
            scale = self.get_scale_factors(sym_dim, stretch)[0]
            scaleRules['ScaleGroups'].append(group_list)
            scaleRules['scales'].append(scale)
            if plus:
                scaleRules['bbdims'].append(sym_dim)
            else:
                scaleRules['bbdims'].append(None) # The 'old' style keeps just the scale, not the positioning

    def get_glyph_scale(self, symbol_unicode, scaleRules, stretch, symbolFont, dest_unicode):
        """ Determines whether or not to use scaled glyphs for glyph in passed symbol_unicode """
        # Potentially destroys the contents of self.sourceFont[dest_unicode]
        if not 'scales' in scaleRules:
            if not dest_unicode in self.sourceFont:
                self.sourceFont.createChar(dest_unicode)
            self.prepareScaleRules(scaleRules, stretch, symbolFont, self.sourceFont[dest_unicode])
        for glyph_list, scale, box in zip(scaleRules['ScaleGroups'], scaleRules['scales'], scaleRules['bbdims']):
            for e in glyph_list:
                if isinstance(e, range):
                    if symbol_unicode in e:
                        return (scale, box)
                elif symbol_unicode == e:
                    return (scale, box)
        return None


def half_gap(gap, top):
    """ Divides integer value into two new integers """
    # Line gap add extra space on the bottom of the line which
    # doesn't allow the powerline glyphs to fill the entire line.
    # Put half of the gap into the 'cell', each top and bottom
    if gap <= 0:
        return 0
    gap_top = int(gap / 2)
    gap_bottom = gap - gap_top
    if top:
        logger.info("Redistributing line gap of %d (%d top and %d bottom)", gap, gap_top, gap_bottom)
        return gap_top
    return gap_bottom

def replace_font_name(font_name, replacement_dict):
    """ Replaces all keys with vals from replacement_dict in font_name. """
    for key, val in replacement_dict.items():
        font_name = font_name.replace(key, val)
    return font_name


def make_sure_path_exists(path):
    """ Verifies path passed to it exists. """
    try:
        os.makedirs(path)
    except OSError as exception:
        if exception.errno != errno.EEXIST:
            raise

def sanitize_filename(filename, allow_dirs = False):
    """ Enforces to not use forbidden characters in a filename/path. """
    if filename == '.' and not allow_dirs:
        return '_'
    restore_colon = sys.platform == 'win32' and re.match('[a-z]:', filename, re.I)
    trans = filename.maketrans('<>:"|?*', '_______')
    for i in range(0x00, 0x20):
        trans[i] = ord('_')
    if not allow_dirs:
        trans[ord('/')] = ord('_')
        trans[ord('\\')] = ord('_')
    else:
        trans[ord('\\')] = ord('/') # We use Posix paths
    new_filename = filename.translate(trans)
    if restore_colon:
        new_filename = new_filename[ :1] + ':' + new_filename[2: ]
    return new_filename

def get_multiglyph_boundingBox(glyphs, destGlyph = None):
    """ Returns dict of the dimensions of multiple glyphs combined(, as if they are copied into destGlyph) """
    # If destGlyph is given the glyph(s) are first copied over into that
    # glyph and measured in that font (to avoid rounding errors)
    # Leaves the destGlyph in unknown state!
    bbox = [ None, None, None, None, None ]
    for glyph in glyphs:
        if glyph is None:
            # Glyph has been in defining range but is not in the actual font
            continue
        if destGlyph and glyph.font != destGlyph.font:
            glyph.font.selection.select(glyph)
            glyph.font.copy()
            destGlyph.font.selection.select(destGlyph)
            destGlyph.font.paste()
            glyph = destGlyph
        gbb = glyph.boundingBox()
        gadvance = glyph.width
        if len(glyphs) > 1 and gbb[0] == gbb[2] and gbb[1] == gbb[3]:
            # Ignore empty glyphs if we examine more than one glyph
            continue
        bbox[0] = gbb[0] if bbox[0] is None or bbox[0] > gbb[0] else bbox[0]
        bbox[1] = gbb[1] if bbox[1] is None or bbox[1] > gbb[1] else bbox[1]
        bbox[2] = gbb[2] if bbox[2] is None or bbox[2] < gbb[2] else bbox[2]
        bbox[3] = gbb[3] if bbox[3] is None or bbox[3] < gbb[3] else bbox[3]
        if not bbox[4]:
            bbox[4] = -gadvance # Negative for one/first glyph
        else:
            if abs(bbox[4]) != gadvance:
                bbox[4] = -1 # Marker for not-monospaced
            else:
                bbox[4] = gadvance # Positive for 2 or more glyphs
    if bbox[4] and bbox[4] < 0:
        # Not monospaced when only one glyph is used or multiple glyphs with different advance widths
        bbox[4] = None
    return {
        'xmin'   : bbox[0],
        'ymin'   : bbox[1],
        'xmax'   : bbox[2],
        'ymax'   : bbox[3],
        'width'  : bbox[2] + (-bbox[0]),
        'height' : bbox[3] + (-bbox[1]),
        'advance': bbox[4], # advance width if monospaced
    }

def get_glyph_dimensions(glyph):
    """ Returns dict of the dimensions of the glyph passed to it. """
    return get_multiglyph_boundingBox([ glyph ])

def scale_bounding_box(bbox, scale_x, scale_y):
    """ Return a scaled version of a glyph dimensions dict """
    # Simulate scaling on combined bounding box, round values for better simulation
    new_dim = {
        'xmin'   : int(bbox['xmin'] * scale_x),
        'ymin'   : int(bbox['ymin'] * scale_y),
        'xmax'   : int(bbox['xmax'] * scale_x),
        'ymax'   : int(bbox['ymax'] * scale_y),
        'advance': int(bbox['advance'] * scale_x) if bbox['advance'] is not None else None,
        }
    new_dim['width'] = new_dim['xmax'] + (-new_dim['xmin'])
    new_dim['height'] = new_dim['ymax'] + (-new_dim['ymin'])
    return new_dim

def update_progress(progress):
    """ Updates progress bar length.

    Accepts a float between 0.0 and 1.0. Any int will be converted to a float.
    A value at 1 or bigger represents 100%
    modified from: https://stackoverflow.com/questions/3160699/python-progress-bar
    """
    barLength = 40  # Modify this to change the length of the progress bar
    if isinstance(progress, int):
        progress = float(progress)
    if progress >= 1:
        progress = 1
        status = "Done...\r\n"  # NOTE: status initialized and never used
    block = int(round(barLength * progress))
    text = "\r╢{0}╟ {1}%".format("█" * block + "░" * (barLength - block), int(progress * 100))
    sys.stdout.write(text)
    sys.stdout.flush()


def check_fontforge_min_version():
    """ Verifies installed FontForge version meets minimum requirement. """
    minimumVersion = 20141231
    actualVersion = int(fontforge.version())

    # un-comment following line for testing invalid version error handling
    # actualVersion = 20120731

    # versions tested: 20150612, 20150824
    if actualVersion < minimumVersion:
        logger.critical("You seem to be using an unsupported (old) version of fontforge: %d", actualVersion)
        logger.critical("Please use at least version: %d", minimumVersion)
        sys.exit(1)

def check_version_with_git(version):
    """ Upgraded the version to the current git tag version (starting with 'v') """
    git = subprocess.run("git describe --tags",
            cwd=os.path.dirname(__file__),
            shell=True,
            stdout=subprocess.PIPE, stderr=subprocess.DEVNULL
        ).stdout.decode('utf-8')
    if len(git) == 0:
        return False
    tag = git.strip()
    if len(tag) == 0 or not tag.startswith('v'):
        return False
    tag = tag[1:]
    r = re.search('(.*?)(-[0-9]+)-g[0-9a-fA-F]+$', tag)
    if r:
        tag = r.group(1)
        patchlevel = r.group(2)
    else:
        patchlevel = ""
    # Inspired by Phaxmohdem's versiontuple https://stackoverflow.com/a/28568003

    versiontuple = lambda v: tuple( p.zfill(8) for p in v.split(".") )
    if versiontuple(tag) > versiontuple(version):
        return tag + patchlevel
    if versiontuple(tag) == versiontuple(version) and len(patchlevel) > 0:
        return tag + patchlevel
    return False

def setup_arguments():
    """ Parse the command line parameters and load the config file if needed """
    parser = argparse.ArgumentParser(
        description=(
            'Nerd Fonts Font Patcher: patches a given font with programming and development related glyphs\n\n'
            '* Website: https://www.nerdfonts.com\n'
            '* Version: ' + version + '\n'
            '* Development Website: https://github.com/ryanoasis/nerd-fonts\n'
            '* Changelog: https://github.com/ryanoasis/nerd-fonts/blob/-/changelog.md'),
        formatter_class=RawTextHelpFormatter,
        add_help=False,
    )

    parser.add_argument('font',                                      help='The path to the font to patch (e.g., Inconsolata.otf)')
    # optional arguments
    parser.add_argument('--careful',                                 dest='careful',          default=False, action='store_true', help='Do not overwrite existing glyphs if detected')
    parser.add_argument('--debug',                                   dest='debugmode',        default=0,     type=int, nargs='?', help='Verbose mode (optional: 1=just to file; 2*=just to terminal; 3=display and file)', const=2, choices=range(0, 3 + 1))
    parser.add_argument('--extension', '-ext',                       dest='extension',        default="",    type=str,            help='Change font file type to create (e.g., ttf, otf)')
    parser.add_argument('--help', '-h',                              action='help',           default=argparse.SUPPRESS,          help='Show this help message and exit')
    parser.add_argument('--makegroups',                              dest='makegroups',       default=1,     type=int, nargs='?', help='Use alternative method to name patched fonts (default=1)', const=1, choices=range(-1, 6 + 1))
    parser.add_argument('--mono', '-s',                              dest='forcemono',        default=False, action='count',      help='Create monospaced font, existing and added glyphs are single-width (implies --single-width-glyphs)')
    parser.add_argument('--outputdir', '-out',                       dest='outputdir',        default=".",   type=str,            help='The directory to output the patched font file to')
    parser.add_argument('--quiet', '-q',                             dest='quiet',            default=False, action='store_true', help='Do not generate verbose output')
    parser.add_argument('--single-width-glyphs',                     dest='single',           default=False, action='store_true', help='Whether to generate the glyphs as single-width not double-width (default is double-width) (Nerd Font Mono)')
    parser.add_argument('--use-single-width-glyphs',                 dest='forcemono',        default=False, action='count',      help=argparse.SUPPRESS)
    parser.add_argument('--variable-width-glyphs',                   dest='nonmono',          default=False, action='store_true', help='Do not adjust advance width (no "overhang") (Nerd Font Propo)')
    parser.add_argument('--version', '-v',                           action='version',        version=projectName + ': %(prog)s (' + version + ')', help='Show program\'s version number and exit')
    # --makegroup has an additional undocumented numeric specifier. '--makegroup' is in fact '--makegroup 1'.
    # Original font name: Hugo Sans Mono ExtraCondensed Light Italic
    #                                                              NF  Fam agg.
    # -1  no renaming at all (keep old names and versions etc)     --- --- ---
    #  0  turned off, use old naming scheme                        [-] [-] [-]
    #  1  HugoSansMono Nerd Font ExtraCondensed Light Italic       [ ] [ ] [ ]
    #  2  HugoSansMono Nerd Font ExtCn Light Italic                [ ] [X] [ ]
    #  3  HugoSansMono Nerd Font XCn Lt It                         [ ] [X] [X]
    #  4  HugoSansMono NF ExtraCondensed Light Italic              [X] [ ] [ ]
    #  5  HugoSansMono NF ExtCn Light Italic                       [X] [X] [ ]
    #  6  HugoSansMono NF XCn Lt It                                [X] [X] [X]

    sym_font_group = parser.add_argument_group('Symbol Fonts')
    sym_font_group.add_argument('--complete', '-c',                             dest='complete',             default=False, action='store_true', help='Add all available Glyphs')
    sym_font_group.add_argument('--codicons',                                   dest='codicons',             default=False, action='store_true', help='Add Codicons Glyphs (https://github.com/microsoft/vscode-codicons)')
    sym_font_group.add_argument('--fontawesome',                                dest='fontawesome',          default=False, action='store_true', help='Add Font Awesome Glyphs (http://fontawesome.io/)')
    sym_font_group.add_argument('--fontawesomeext',                             dest='fontawesomeextension', default=False, action='store_true', help='Add Font Awesome Extension Glyphs (https://andrelzgava.github.io/font-awesome-extension/)')
    sym_font_group.add_argument('--fontlogos',                                  dest='fontlogos',            default=False, action='store_true', help='Add Font Logos Glyphs (https://github.com/Lukas-W/font-logos)')
    sym_font_group.add_argument('--material', '--mdi',                          dest='material',             default=False, action='store_true', help='Add Material Design Icons (https://github.com/templarian/MaterialDesign)')
    sym_font_group.add_argument('--octicons',                                   dest='octicons',             default=False, action='store_true', help='Add Octicons Glyphs (https://octicons.github.com)')
    sym_font_group.add_argument('--pomicons',                                   dest='pomicons',             default=False, action='store_true', help='Add Pomicon Glyphs (https://github.com/gabrielelana/pomicons)')
    sym_font_group.add_argument('--powerline',                                  dest='powerline',            default=False, action='store_true', help='Add Powerline Glyphs')
    sym_font_group.add_argument('--powerlineextra',                             dest='powerlineextra',       default=False, action='store_true', help='Add Powerline Extra Glyphs (https://github.com/ryanoasis/powerline-extra-symbols)')
    sym_font_group.add_argument('--powersymbols',                               dest='powersymbols',         default=False, action='store_true', help='Add IEC Power Symbols (https://unicodepowersymbol.com/)')
    sym_font_group.add_argument('--weather',                                    dest='weather',              default=False, action='store_true', help='Add Weather Icons (https://github.com/erikflowers/weather-icons)')

    expert_group = parser.add_argument_group('Expert Options')
    expert_group.add_argument('--adjust-line-height', '-l',                dest='adjustLineHeight', default=False, action='store_true', help='Whether to adjust line heights (attempt to center powerline separators more evenly)')
    expert_group.add_argument('--boxdrawing',                              dest='forcebox',         default=False, action='store_true', help='Force patching in (over existing) box drawing glyphs')
    expert_group.add_argument('--cell',                                    dest='cellopt',          default=None,  type=str,            help='Adjust or query the cell size, e.g. use "0:1000:-200:800" or "?"')
    expert_group.add_argument('--configfile',                              dest='configfile',       default=False, type=str,            help='Specify a file path for configuration file (see sample: src/config.sample.cfg)')
    expert_group.add_argument('--custom',                                  dest='custom',           default=False, type=str,            help='Specify a custom symbol font, all glyphs will be copied; absolute path suggested')
    expert_group.add_argument('--dry',                                     dest='dry_run',          default=False, action='store_true', help='Do neither patch nor store the font, to check naming')
    expert_group.add_argument('--glyphdir',                                dest='glyphdir',         default=__dir__ + "/src/glyphs/", type=str, help='Path to glyphs to be used for patching')
    expert_group.add_argument('--has-no-italic',                           dest='noitalic',         default=False, action='store_true', help='Font family does not have Italic (but Oblique), to help create correct RIBBI set')
    expert_group.add_argument('--metrics',                                 dest='metrics',          default=None, choices=get_metrics_names(), help='Select vertical metrics source (for problematic cases)')
    expert_group.add_argument('--name',                                    dest='force_name',       default=None, type=str,             help='Specify naming source (\'full\', \'postscript\', \'filename\', or concrete free name-string)')
    expert_group.add_argument('--postprocess',                             dest='postprocess',      default=False, type=str,            help='Specify a Script for Post Processing')
    progressbars_group_parser = expert_group.add_mutually_exclusive_group(required=False)
    expert_group.add_argument('--removeligs', '--removeligatures',         dest='removeligatures',  default=False, action='store_true', help='Removes ligatures specified in configuration file (needs --configfile)')
    expert_group.add_argument('--xavgcharwidth',                           dest='xavgwidth',        default=None,  type=int, nargs='?', help='Adjust xAvgCharWidth (optional: concrete value)', const=True)
    # --xavgcharwidth for compatibility with old applications like notepad and non-latin fonts
    # Possible values with examples:
    # <none>  - copy from sourcefont (default)
    # 0       - calculate from font according to OS/2-version-2
    # 500     - set to 500

    # progress bar arguments - https://stackoverflow.com/questions/15008758/parsing-boolean-values-with-argparse
    progressbars_group_parser.add_argument('--progressbars',         dest='progressbars',     action='store_true',                help='Show percentage completion progress bars per Glyph Set (default)')
    progressbars_group_parser.add_argument('--no-progressbars',      dest='progressbars',     action='store_false',               help='Don\'t show percentage completion progress bars per Glyph Set')
    expert_group.set_defaults(progressbars=True)

    args = parser.parse_args()
    setup_global_logger(args)

    # if we have a config file: fetch commandline arguments from there and process again with all arguments
    config = configparser.ConfigParser(empty_lines_in_values=False, allow_no_value=True)
    if args.configfile:
        if not os.path.isfile(args.configfile):
            logger.critical("Configfile does not exist: %s", args.configfile)
            sys.exit(1)
        if not os.access(args.configfile, os.R_OK):
            logger.critical("Can not open configfile for reading: %s", args.configfile)
            sys.exit(1)
        config.read(args.configfile)
        extraflags = config.get("Config", "commandline", fallback='')
        if len(extraflags):
            logger.info("Adding config commandline options: %s", extraflags)
            extraflags += ' ' + args.font # Need to re-add the mandatory argument
            args = parser.parse_args(extraflags.split(), args)

    if args.makegroups > 0 and not FontnameParserOK:
        logger.critical("FontnameParser module missing (bin/scripts/name_parser/Fontname*), specify --makegroups 0")
        sys.exit(1)

    # if you add a new font, set it to True here inside the if condition
    if args.complete:
        args.fontawesome = True
        args.fontawesomeextension = True
        args.fontlogos = True
        args.octicons = True
        args.codicons = True
        args.powersymbols = True
        args.pomicons = True
        args.powerline = True
        args.powerlineextra = True
        args.material = True
        args.weather = True

    if not args.complete:
        sym_font_args = []
        # add the list of arguments for each symbol font to the list sym_font_args
        for action in sym_font_group._group_actions:
            sym_font_args.append(action.__dict__['option_strings'])

        # determine whether or not all symbol fonts are to be used
        font_complete = True
        for sym_font_arg_aliases in sym_font_args:
            found = False
            for alias in sym_font_arg_aliases:
                if alias in sys.argv:
                    found = True
            if not found:
                font_complete = False
        args.complete = font_complete

    if args.forcemono:
        args.single = True
    if args.nonmono and args.single:
        logger.warning("Specified contradicting --variable-width-glyphs together with --mono or --single-width-glyphs. Ignoring --variable-width-glyphs.")
        args.nonmono = False

    if args.cellopt:
        if args.cellopt != '?':
            try:
                parts = [ int(v) for v in args.cellopt.split(':') ]
                if len(parts) != 4:
                    raise
            except:
                logger.critical("Parameter for --cell is not 4 colon separated integer numbers: '%s'", args.cellopt)
                sys.exit(2)
            if parts[0] >= parts[1] or parts[2] >= parts[3]:
                logger.critical("Parameter for --cell do not result in positive cell size: %d x %d",
                    parts[1] - parts[0], parts[3] - parts[2])
                sys.exit(2)
            if parts[0] != 0:
                logger.warn("First parameter for --cell should be zero, this is probably not working")
            args.cellopt = parts

    make_sure_path_exists(args.outputdir)
    if not os.path.isfile(args.font):
        logger.critical("Font file does not exist: %s", args.font)
        sys.exit(1)
    if not os.access(args.font, os.R_OK):
        logger.critical("Can not open font file for reading: %s", args.font)
        sys.exit(1)
    is_ttc = len(fontforge.fontsInFile(args.font)) > 1
    try:
        source_font_test = TableHEADWriter(args.font)
        args.is_variable = source_font_test.find_table([b'avar', b'cvar', b'fvar', b'gvarb', b'HVAR', b'MVAR', b'VVAR'], 0)
        if args.is_variable:
            logger.warning("Source font is a variable open type font (VF), opening might fail...")
    except:
        args.is_variable = False
    finally:
        try:
            source_font_test.close()
        except:
            pass

    if args.extension == "":
        args.extension = os.path.splitext(args.font)[1]
    else:
        args.extension = '.' + args.extension
    if re.match(r'\.ttc$', args.extension, re.IGNORECASE):
        if not is_ttc:
            logger.critical("Can not create True Type Collections from single font files")
            sys.exit(1)
    else:
        if is_ttc:
            logger.critical("Can not create single font files from True Type Collections")
            sys.exit(1)

    # The if might look ridiculous, but isinstance(False, int) is True!
    if isinstance(args.xavgwidth, int) and not isinstance(args.xavgwidth, bool):
        if args.xavgwidth < 0:
            logger.critical("--xavgcharwidth takes no negative numbers")
            sys.exit(2)
        if args.xavgwidth > 16384:
            logger.critical("--xavgcharwidth takes only numbers up to 16384")
            sys.exit(2)

    return (args, config)

def setup_global_logger(args):
    """ Set up the logger and take options into account """
    global logger
    logger = logging.getLogger(os.path.basename(args.font))
    logger.setLevel(logging.DEBUG)
    log_to_file = (args.debugmode & 1 == 1)
    if log_to_file:
        try:
            f_handler = logging.FileHandler('font-patcher-log.txt')
            f_handler.setFormatter(logging.Formatter('%(levelname)s: %(name)s %(message)s'))
            logger.addHandler(f_handler)
        except:
            log_to_file = False
        logger.debug(allversions)
        logger.debug("Options %s", repr(sys.argv[1:]))
    c_handler = logging.StreamHandler(stream=sys.stdout)
    c_handler.setFormatter(logging.Formatter('%(levelname)s: %(message)s'))
    if not (args.debugmode & 2 == 2):
        c_handler.setLevel(logging.INFO)
    logger.addHandler(c_handler)
    if (args.debugmode & 1 == 1) and not log_to_file:
        logger.info("Can not write logfile, disabling")

def main():
    global logger
    logger = logging.getLogger("start") # Use start logger until we can set up something sane
    s_handler = logging.StreamHandler(stream=sys.stdout)
    s_handler.setFormatter(logging.Formatter('%(levelname)s: %(message)s'))
    logger.addHandler(s_handler)

    global version
    git_version = check_version_with_git(version)
    global allversions
    allversions = "Patcher v{} ({}) (ff {})".format(
        git_version if git_version else version, script_version, fontforge.version())
    print("{} {}".format(projectName, allversions))
    if git_version:
        version = git_version
    check_fontforge_min_version()
    (args, conf) = setup_arguments()
    logger.debug("Naming mode %d", args.makegroups)

    patcher = font_patcher(args, conf)

    sourceFonts = []
    all_fonts = fontforge.fontsInFile(args.font)
    if not all_fonts:
        if re.match(".*\\.woff2?", args.font, re.I):
            all_fonts=[ "" ]
        else:
            logger.critical("Can not find any fonts in '%s'", args.font)
            sys.exit(1)
    for i, subfont in enumerate(all_fonts):
        if len(all_fonts) > 1:
          print("\n")
          logger.info("Processing %s (%d/%d)", subfont, i + 1, len(all_fonts))
        try:
            sourceFonts.append(fontforge.open("{}({})".format(args.font, i), 1)) # 1 = ("fstypepermitted",))
        except Exception:
            logger.critical("Can not open font '%s', try to open with fontforge interactively to get more information",
                subfont)
            sys.exit(1)

        patcher.setup_name_backup(sourceFonts[-1])
        patcher.patch(sourceFonts[-1])

    print("Done with Patch Sets, generating font...")
    for f in sourceFonts:
        patcher.setup_font_names(f)
    patcher.generate(sourceFonts)

    for f in sourceFonts:
        f.close()


if __name__ == "__main__":
    __dir__ = os.path.dirname(os.path.abspath(__file__))
    main()
