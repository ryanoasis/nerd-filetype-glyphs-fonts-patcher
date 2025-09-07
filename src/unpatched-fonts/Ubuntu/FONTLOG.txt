This is the FONTLOG file for the Ubuntu Font Family and attempts to follow
the recommendations at:  http://scripts.sil.org/OFL-FAQ_web#43cecb44


Overview

The new Ubuntu Font Family was started to enable the personality of
Ubuntu to be seen and felt in every menu, button and dialog.
The typeface is sans-serif, uses OpenType features and is manually
hinted for clarity on desktop and mobile computing screens.

The scope of the Ubuntu Font Family includes all the languages used by
the various Ubuntu users around the world in tune with Ubuntu's
philosophy which states that every user should be able to use their
software in the language of their choice. So the Ubuntu Font Family
project will be extended to cover many more written languages.


History

The Ubuntu Font Family has been creating during 2010 and 2011.  As of
September 2011 coverage is provided for Latin, Cyrillic and Greek across
Regular, Italic, Bold and Bold-Italic.  Further work was uptaken during
2015.


ChangeLog

2015-08-21 (Paul Sladen) Ubuntu Font Family version 0.83

  Note: This release was created by binary patching from the v0.80
  release using the scripts in 'sources/patch-0.80-0.83/' to rebuild
  the necessary tables. The release selectively updates only those
  proportional .ttf font files exhibiting the bug below bug number;
  the Ubuntu Mono monospace font files remain unchanged, being the
  original version 0.80 ones.

  [Marc Foley]
  * [Engineering] Fixed wrong characters appear in some mac apps. (LP: #1334363)


2011-09-22 (Paul Sladen) Ubuntu Font Family version 0.80

  [Vincent Connare/Dalton Maag]
  * Wish for addition of a monospaced member to the family (LP: #640382)
  * Mono: No hinting yet - Ubuntu Beta Mono font looks jagged in
    Netbeans and terrible with ClearType (LP: #820493)
  * Emacs: choosing normal monospace font in Emacs but gives bold-italic
    (LP: #791076)
  * PUA: ensure that Ubuntu Circle of Friends logo is full size: (LP: #853855)
    + U+E0FF becomes large size in proportionals, remains small width in
      monospaces
    + U+F0FF becomes small size (proportionals only)
    + U+F200 is full ubuntu logomark (proportionals only)

  [Paul Sladen]
  * Monospace: Patch Family Name to be "Ubuntu Mono"
  * Monospace: Patch U+EFFD version debugging glyph to be '0.8'

  [Cody Boisclair]
  * Monospace: Force .null HDMX advance to 500
  * Monospace: Remap ASCII box-drawing characters (LP: #788757)

  [Júlio Reis]
  * Date corrections to 'FONTLOG' (LP: #836595)

2011-03-08 (Paul Sladen) Ubuntu Font Family version 0.71.2

  * (Production) Adjust Medium WeightClass to 500 (Md, MdIt) (LP: #730912)

2011-03-07 (Paul Sladen) Ubuntu Font Family version 0.71.1

  * (Design) Add Capitalised version of glyphs and kern. (Lt, LtIt,
    Md, MdIt) DM (LP: #677446)
  * (Design) Re-space and tighen Regular and Italic by amount specified
    by Mark Shuttleworth (minus 4 FUnits). (Rg, It) (LP: #677149)
  * (Design) Design: Latin (U+0192) made straight more like l/c f with
    tail (LP: #670768)
  * (Design) (U+01B3) should have hook on right, as the lowercase
    (U+01B4) (LP: #681026)
  * (Design) Tail of Light Italic germandbls, longs and lowercase 'f'
    to match Italic/BoldItalic (LP: #623925)
  * (Production) Update <case> feature (Lt, LtIt, Md, MdIt). DM
    (LP: #676538, #676539)
  * (Production) Remove Bulgarian locl feature for Italics. (LP: #708578)
  * (Production) Update Description information with new string:
      "The Ubuntu Font Family are libre fonts funded by Canonical Ltd
      on behalf of the Ubuntu project. The font design work and
      technical implementation is being undertaken by Dalton Maag. The
      typeface is sans-serif, uses OpenType features and is manually
      hinted for clarity on desktop and mobile computing screens. The
      scope of the Ubuntu Font Family includes all the languages used
      by the various Ubuntu users around the world in tune with
      Ubuntu's philosophy which states that every user should be able
      to use their software in the language of their choice. The
      project is ongoing, and we expect the family will be extended to
      cover many written languages in the coming years."
    (Rg, It, Bd, BdIt, Lt, LtIt, Md, MdIt) (LP: #690590)
  * (Production) Pixel per em indicator added at U+F000 (Lt, LtIt, Md,
    MdIt) (LP: #615787)
  * (Production) Version number indicator added at U+EFFD (Lt, LtIt, Md,
    MdIt) (LP: #640623)
  * (Production) fstype bit set to 0 - Editable (Lt, LtIt, Md, MdIt)
    (LP: #648406)
  * (Production) Localisation of name table has been removed because
    of problems with Mac OS/X interpretation of localisation. DM
    (LP: #730785)
  * (Hinting) Regular '?' dot non-circular (has incorrect control
    value). (LP: #654336)
  * (Hinting) Too much space after latin capital 'G' in 13pt
    regular. Now reduced. (LP: #683437)
  * (Hinting) Balance Indian Rupee at 18,19pt (LP: #662177)
  * (Hinting) Make Regular '£' less ambiguous at 13-15 ppm (LP: #685562)
  * (Hinting) Regular capital 'W' made symmetrical at 31 ppem (LP: #686168)

2010-12-14 (Paul Sladen) Ubuntu Font Family version 0.70.1

  Packaging, rebuilt from '2010-12-08 UbuntuFontsSourceFiles_070.zip':
  * (Midstream) Fstype bit != 0 (LP: #648406)
  * (Midstream) Add unit test to validate fstype bits (LP: #648406)
  * (Midstream) Add unit test to validate licence

2010-12-14 (Paul Sladen) Ubuntu Font Family version 0.70

  Release notes 0.70:
  * (Design) Add Capitalised version of glyphs and kern. (Rg, It, Bd,
    BdIt) DM (LP: #676538, #677446)
  * (Design) Give acute and grave a slight upright move to more match
    the Hungarian double acute angle. (Rg, It, Bd, BdIt) (LP: #656647)
  * (Design) Shift Bold Italic accent glyphs to be consistent with the
    Italic. (BdIt only) DM (LP: #677449)
  * (Design) Check spacing and kerning of dcaron, lcaron and
    tcaron. (Rg, It, Bd, BdIt) (LP: #664722)
  * (Design) Add positive kerning to () {} [] to open out the
    combinations so they are less like a closed box. (Rg, It, Bd,
    BdIt) (LP: #671228)
  * (Design) Change design of acute.asc and check highest points (Bd
    and BdIt only) DM
  * (Production) Update <case> feature. DM (LP: #676538, #676539)
  * (Production) Remove Romanian locl feature. (Rg, It, Bd, BdIt)
    (LP: #635615)
  * (Production) Update Copyright information with new
    strings. "Copyright 2010 Canonical Ltd. Licensed under the Ubuntu
    Font Licence 1.0" Trademark string "Ubuntu and Canonical are
    registered trademarks of Canonical Ltd." (Rg, It, Bd, BdIt) DM
    (LP: #677450)
  * (Design) Check aligning of hyphen, math signs em, en, check braces
    and other brackets. 16/11 (LP: #676465)
  * (Production) Pixel per em indicator added at U+F000 (Rg, It, Bd,
    BdIt) (LP: #615787)
  * (Production) Version number indicator added at U+EFFD (Rg, It, Bd,
    BdIt) (LP: #640623)
  * (Production) fstype bit set to 0 - Editable (Rg, It, Bd, BdIt)
    (LP: #648406)

2010-10-05 (Paul Sladen) Ubuntu Font Family version 0.69

  [Dalton Maag]
  * Italic,
    - Hinting on lowercase Italic l amended 19ppm (LP: #632451)
    - Hinting on lowercase Italic u amended 12ppm (LP: #626376)

  * Regular, Italic, Bold, BoldItalic
    - New Rupee Sign added @ U+20B9 (LP: #645987)
    - Ubuntu Roundel added @ U+E0FF (LP: #651606)

  [Paul Sladen]
  * All
    - Removed "!ubu" GSUB.calt ligature for U+E0FF (LP: #651606)


Acknowledgements

If you make modifications be sure to add your name (N), email (E),
web-address (if you have one) (W) and description (D). This list is in
alphabetical order.

N: Ryan Abdullah
W: http://www.rayan.de/
D: Arabic calligraphy and design in collaboration with Dalton Maag
D: Arabic testing

N: Cody Boisclair
D: Monospace low-level debugging and patching ('fixboxdrawing-ft.py')

N: Amélie Bonet
W: http://ameliebonet.com/
D: Type design with Dalton Maag, particularly Ubuntu Mono and Ubuntu Condensed

N: Jason Campbell
W: http://www.campbellgraphics.com/design/fonts.shtml
D: Monospace hinting (first phase) at Dalton Maag

N: Pilar Cano
W: http://www.pilarcano.com/
D: Hebrew realisation with Dalton Maag

N: Fernando Caro  
D: Type design with Dalton Maag, particularly Ubuntu Condensed

N: Ron Carpenter
W: http://www.daltonmaag.com/
D: Type design with Dalton Maag
D: Arabic realisation in collaboration with Ryan Abdullah

N: Vincent Connare
W: http://www.connare.com/
D: Type design, and engineering with Dalton Maag
D: Monospace hinting (second phase) at Dalton Maag

N: Dave Crossland
E: dave@understandingfonts.com
W: http://understandingfonts.com/
D: Documentation and libre licensing guidance
D: Google Webfont integration at Google

N: Steve Edwards
W: http://www.madebymake.com/
D: font.ubuntu.com revamp implementation with Canonical Web Team

N: Iain Farrell
W: http://www.flickr.com/photos/iain
D: Ubuntu Font Family delivery for the Ubuntu UX team at Canonical

N: Marc Foley
W: http://www.marcfoley.co/
D: Font Engineer at Dalton Maag for the 2015 updates

N: Shiraaz Gabru
W: http://www.daltonmaag.com/
D: Ubuntu Font Family project management at Dalton Maag

N: Marcus Haslam
W: http://design.canonical.com/author/marcus-haslam/
D: Creative inspiration

N: Ben Laenen
D: Inspiration behind the pixels-per-em (PPEM) readout debugging glyph at U+F000
   (for this font the concept was re-implemented from scratch by Dalton-Maag)

N: Bruno Maag
W: http://www.daltonmaag.com/
D: Stylistic direction of the Ubuntu Font Family, as head of Dalton Maag

N: Ivanka Majic
W: http://www.ivankamajic.com/
D: Guiding the UX team and Cyrillic feedback

N: David Marshall
W: http://www.daltonmaag.com/
D: Technical guidance and administration at Dalton Maag

N: Malcolm Wooden
W: http://www.daltonmaag.com/
D: Font Engineering at Dalton Maag

N: Lukas Paltram
W: http://www.daltonmaag.com/
D: Type design with Dalton Maag

N: Júlio Reis
D: Date fixes to the documentation

N: Rodrigo Rivas
D: Indian Rupee Sign glyph

N: Mark Shuttleworth
E: mark@ubuntu.com
W: http://www.markshuttleworth.com/
D: Executive quality-control and funding

N: Paul Sladen
E: ubuntu@paul.sladen.org
W: http://www.paul.sladen.org/
D: Bug triaging, packaging at Ubuntu and Canonical

N: Nicolas Spalinger
W: http://planet.open-fonts.org
D: Continuous guidance on libre/open font licensing, best practises in source
   tree layout, release and packaging (pkg-fonts Debian team)

N: Kenneth Wimer
D: Initial PPA packaging

* Canonical Ltd is the primary commercial sponsor of the Ubuntu and
  Kubuntu operating systems
* Dalton Maag are a custom type foundry headed by Bruno Maag

For further documentation, information on contributors, source code
downloads and those involved with the Ubuntu Font Family, visit:

  http://font.ubuntu.com/
