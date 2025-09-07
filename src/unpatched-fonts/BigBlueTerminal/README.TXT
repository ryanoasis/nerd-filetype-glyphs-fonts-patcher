           _ Ä --- Ä                  _ Ä --- Ä
        .ù"    ,Â,   ~=Ò_    .ù.   .ù"          ~=Ò_
      .    . .OZZZO¸    ^g,      .    .şø~øş.      ^%·   .s%ZO¿
          `  À¦qZp¦' øù  `Z,         `        _.,ú  `gZ¿  ù:ZZ|
      _Âg%%oc,  ~ _.,  `  ÔZ;         _.,Â©y%Z=-:ú .s%Z%L, `OZZYi%gÂ_
     jOZZ˜˜ZZOLú jOZZ˜ª,  `Zb  _.Â©y%ZZZZZZZZ%=:ù jZZZZZZZb `ZZZZ˜ZZZb
    ùZZ?~ ~\ZZZ| |›ZZZZO\ ú?Z.ù%˜ZZZZZZ¦*Êü^ø"`' /ZZ¦"~"¦ZZ\ ùT   ~!ZZ´
     Z6f   ùZZZOùú|ZZZ^ZZi ]Z1ú:-":ZZZ'      _. ùOZ/     \ZZL :    |6Z'
 .   `ZZª._ ~"^Z| ùZZZ;\ZZ ÆZµ   ú›ZZZú  _Â%ZZú l%! .oZo, ]ZZúù  _ÒZZ'   .
  ,    ~^Ê*Ê^~.Z›úúZZZl ZZÂZZ1 ú ùZZZZù  ^¦!ZZù :=l dZZZb ùZZ|  ~^"~
   ù        g%ZZZúúZZZZ `ZZZø : úZZZZ:   ùlZZ| ù;ù :ZZZF úZZ|         .'
    ~Ä_    úZZZZ| ùZZZZ  ÀZZ˜' ù  ?ZZZ!    :ZZ³ú úù  "¦"  dZgú      _Ä~
       ~"^ :ZZZOùù|ZZZ!   `^'  '  `ZZZ    ú¦ZZ:  ú     ./ZZf úÄ--`~
           OZZZù jZ¦Ê~  `. _ _. .   ~^¦L, YZZZZOzzÂÂ úù:=CO/
     -V!  j¦Ê^~     .     ~-ºù-~    .     `^Ê¦Z˜ZF'úù:%CG' . O R G
                     ~Ä_    T    _Ä~             ~'  '^"~
                        ~"Í=|=Í"~
                            ù
                            ú
                   .--------------------------------ú  ú
                   :  B I G B L U E   T E R M I N A L  :
                   ú  ú--------------------------------'

                An oldschool fixed-width pixel font / v1.00


                         1.  What's this?
                         2.  Contents
                         3.  Sizes & display
                         4.  Formats & encodings
                         5.  'Plus' version notes
                         6.  Bonus DOS stuff
                         7.  Credits & acknowledgements
                         8.  Contact
                         9.  Legal stuff



---------------
1. WHAT'S THIS?
===============


   BigBlue Terminal is a monospaced pixel font, designed for use in fixed-
   width textual environments (consoles/terminals, text/code/hex editors and
   so on).  It follows the metrics and dimensions of Windows' old Terminal
   font (at the 9pt/12px size), but the appearance is closer to the classic
   IBM PC text mode character sets.

   At 8x12 pixels, Terminal is nicely compact and useful, but also kind of
   ugly.  Instead, BigBlue Terminal is closely based on IBM's 8x14 EGA/VGA
   charset -- I just like it better.  Basically, that font has been squeezed
   and modified to fit into a 8x12-pixel cell.  For the extended 'Plus'
   version, many additional Unicode characters have been added to support
   international scripts and symbol sets.



-----------
2. CONTENTS
===========


   BigBlue_TerminalPlus.TTF    BigBlue TerminalPlus
                               TrueType font
                               Multi-language Unicode character set

   BigBlue_Terminal_437TT.TTF  BigBlue Terminal 437TT
                               TrueType font
                               Codepage 437 (DOS/OEM-US) mapped to Unicode

   Bigblue_Terminal_437BM.FON  BigBlue Terminal 437BM
                               Windows bitmap format
                               Code page 437 (DOS/OEM-US)

   BLUETERM.F12                Raw bitmap font data

   BLUETERM.COM                TSR font loader for DOS/VGA

   README.TXT                  This file

   LICENSE.TXT                 CC-BY-SA 4.0 license terms



------------------
3. SIZES & DISPLAY
==================


 3.1. Pixel and point sizes
 --------------------------

   The native font size is 8x12.  Since this is a pixel font, it'll look
   best at a size of 12 pixels (or integer multiples of 12), whether you're
   using the bitmap or TrueType versions.  Otherwise you *will* get fugly
   artifacted scaling.

   On Windows, this translate to 9 pt (at the default screen density of 96
   PPI); on Mac, you'll want 12 pt (72 PPI).  Do the math for other screen
   densities.  On newfangled super-high-PPI displays, scaling artifacts
   become less apparent, so you may be able to get away with arbitrary
   sizes.


 3.2. Rendering
 --------------

   Current operating systems usually have subpixel anti-aliasing enabled by
   default: ClearType on Windows, FreeType on Linux, Core Text on Mac OS X.
   This is less than ideal for TrueType pixel fonts, since it may introduce
   a sort of "color fringing" effect in some cases.

   In practice I don't find it *that* noticeable, but it bothers you, you
   can get rid of it.  On Windows, turn ClearType off or use the bitmap
   (.FON) version.  On Linux, there are ways to disable anti-aliasing for
   specific fonts with FreeType.  You'll have to see your docs/the web on
   how to pull that off though.



----------------------
4. FORMATS & ENCODINGS
======================


 4.1. BigBlue Terminal 437TT  (TrueType, CP437 charset)
 ------------------------------------------------------

   This version features the Codepage 437 character set (DOS/OEM-US).  Since
   any TrueType font can (and should) include a Unicode character map, this
   is still a Unicode font, and has multi-platform support as such.

   CP437 can be problematic to map to Unicode, due to characters 00h-1Fh and
   7Fh: they can be interpreted either as control codes, or as graphical
   symbols.  Thus there are two 'canonical' Unicode maps for CP437, and
   software that expects one of them may not play nice with the other one.

   This font covers both bases in the same mapping: the problem characters
   are duplicated so that your program will find them at either placement.
   Windows detects the font as an "OEM/DOS" one, and you can use it in any
   program/environment that understands this charset (including the Command
   Prompt).  The same will be true on other platforms, as long as your
   software is properly configured -- RTFM, GIYF, etc.



 4.2. BigBlue TerminalPlus  (TrueType, extended charset)
 -------------------------------------------------------

   This is more of a "Unicode font" as most people grok the term.  On top of
   the CP437 range, this version supports extended Latin, Greek, Cyrillic
   and Hebrew scripts plus a bunch of additional glyphs and Unicode symbols.

   There are 782 characters in total (more than the Windows Glyph List 4 --
   in fact the entire WGL4 range is there).  Some were based on various
   international codepages, others were drawn entirely by hand to match the
   visual style.  A handful of the cp437 characters had to be remapped (see
   the next section), but they're all still around as well.



 4.3. BigBlue Terminal 437BM  (Windows bitmap, CP437 charset)
 ------------------------------------------------------------

   A straight bitmap version of the DOS/CP437 charset.  This may still be
   more useful than 437TT in certain situations:


   *  You don't need to modify the registry to use it in the Command Prompt
      (or any console window).

   *  .FON isn't Unicode, so this version can force the CP437 encoding on
      programs like Notepad, which insist on failing miserably otherwise.

   *  Bitmap fonts aren't subject to ClearType subpixel anti-aliasing.



-------------------------------------
5. 'PLUS' VERSION CHARACTER MAP NOTES
=====================================


   If you care about this sort of thing, you can use your favorite font
   viewer to see the full character range.  Windows has charmap.exe (I like
   SIL ViewGlyph better), OS X has Font Book, etc.  A few things that may be
   of interest about the expanded 'Plus' character mapping:


   *  Alternate number forms: there's a flat-top "3" mapped to U+01B7
      ('Latin capital letter Ezh'), which is more easily distinguished from
      the Cyrillic letter Ze.  Also, two alternative zeroes (dotted and
      slashed) are mapped to U+2299 ('circled dot operator') and U+2300
      ('diameter symbol') respectively.

   *  Cursor shapes: Unicode character U+2581 ('lower one eight block') can
      be used to mimic the classic text-mode cursor appearance.  U+2584
      ('lower half block') and U+2588 ('full block') could also stand in for
      those respective cursor forms, too.

   *  The 'Plus' version includes a full Greek alphabet, which takes over
      the code points that Unicode assigns to the Greek/Math characters from
      DOS codepage 437.  Instead of just dropping the CP437 originals, I
      tried to preserve them at remapped code points that make *some* sense.
      Here's what's changed:


      CP437     Canonical mapping from         Modified 'Plus' mapping
      Char      CP437 to Unicode               from CP437 to Unicode
      -------   ----------------------------   --------------------------
      à (E0h)   U+03B1 'Greek small Alpha'     U+0251 'Latin small Alpha'
      á (E1h)   U+00DF 'Latin small Sharp S'   U+03D0 'Greek Beta symbol'
      â (E2h)   U+0393 'Greek capital Gamma'   U+1D26 'Small capital Gamma'
      ã (E3h)   U+03C0 'Greek small Pi'        U+1D28 'Small capital Pi'
      ä (E4h)   U+03A3 'Greek capital Sigma'   U+2211 'N-ary Summation'
      å (E5h)   U+03C3 'Greek small Sigma'     U+01A1 'Small o with horn'
      ç (E7h)   U+03C4 'Greek small Tau'       U+1D1B 'Small capital T'
      è (E8h)   U+03A6 'Greek capital Phi'     U+0278 'Latin small Phi'
      é (E9h)   U+0398 'Greek capital Theta'   U+03F4 'Capital Theta symbol'
      ê (EAh)   U+03A9 'Greek capital Omega'   U+2126 'Ohm symbol'
      ë (EBh)   U+03B4 'Greek small Delta'     U+1E9F 'Latin small Delta'
      í (EDh)   U+03C6 'Greek small Phi'       U+2205 'Empty set'
      î (EEh)   U+03B5 'Greek small Epsilon'   U+2208 'Element of'



------------------
6. BONUS DOS STUFF
==================


   Yes, you can get BigBlue Terminal working in actual DOS too, because you
   are just THAT oldschool!  The following files will let you do that on any
   VGA-compatible DOS machine (or in DOSBox, PCEm and so on).
   
   
   *  BLUETERM.COM:  a TSR program (courtesy of ripsaw8080) that gives you
      a 640x480 text mode with the 8x12 font -- 80 rows by 40 columns.  It
      persists across mode changes, and I find it nice to use in DOSBox,
      since 640x480 is a square-pixel resolution and doesn't get mangled by
      aspect correction.
   
   *  BLUETERM.F12:  the raw bitmap font data, usable with any font-loading
      program such as Yossi Gil's LOADFONT (from the widespread FNTCOL16
      archive).  You'll typically get the standard 400-line text mode, and
      with a 12-scanline font this gives you 33 rows of text.


-----------------------------
7. CREDITS & ACKNOWLEDGEMENTS
=============================


   - Fonts, documentation and ASCII logo by VileR.
   
   
   THANKS TO:
   ----------
   
   - ripsaw8080, for providing the code for the TSR DOS version (and for
     granting permission to include it here)
   
   - Rebecca G. Bettencourt/Kreative Korp, for responding to my inquiries
     with a surprise open-source release of the awesome Bits'n'Picas bitmap-
     to-outline converter
   
   
   TOOLS USED:
   -----------
   
   - Bitmap font editing: Fony 1.4.7 by hukka <http://hukka.ncn.fi/?fony>
     
   - Bitmap-to-outline vectorization:  Bits'n'Picas by Kreative Korp
     <https://github.com/kreativekorp/bitsnpicas>
     
   - TrueType font editing, fine-tuning, re-encoding etc.: FontForge by
     George Williams and the FontForge Project <http://fontforge.github.io/>
   
   - Windows .TTF testing/viewing: SIL ViewGlyph v1.81.0 by Bob Hallissy/
     SIL International <http://scripts.sil.org/ViewGlyph_home>



----------
8. CONTACT
==========


   I can be reached at:   email - viler -AT- int10h -DOT- org
                            www - http://int10h.org
                           blog - http://8088mph.blogspot.com

   Spam and/or excessive dumbness will be ignored, deleted, spindled and
   mutilated.
      

--------------
9. LEGAL STUFF
==============


   BigBlue Terminal is licensed under a Creative Commons Attribution-
   ShareAlike 4.0 International License.

   You should have received a copy of the license along with this work. If
   not, see <http://creativecommons.org/licenses/by-sa/4.0/>.

                                                              (c) 2015 VileR