WHAT IS THIS?

This is ProFont TrueType, converted to Windows TrueType format
by Mike Smith, with some tweaks added by "ardu".

Modifications include:
- A Euro character
- Missing characters from the Latin 1 code page
- Full support for CodePage 850. These are mostly the famous
  block/box characters you know from DOS. Very useful if you use
  Mightnight Commander through PuTTY.
- Fixed metrics so that point size of 9 works correctly. Until now
  you had to select 7 to obtain the native point size of 9.
- Added some quick&dirty hinting for point size of 9. Most characters
  now match closely the look of the bitmap version.
  Don't expect it to look good on anything else than Windows...



To get the full original Distribution, other ProFont builds
and more information
go to <http://tobiasjung.name/profont/>


DISCLAIMER
See LICENSE file


Tobias Jung
January 2014
profont@tobiasjung.name

## Which font?

### TL;DR

* Pick your font family:
  * If you are limited to monospaced fonts (because of your terminal, etc) then pick a font with `Nerd Font Mono` (or `NFM`).
  * If you want to have bigger icons (usually around 1.5 normal letters wide) pick a font without `Mono` i.e. `Nerd Font` (or `NF`). Most terminals support this, but ymmv.
  * If you work in a proportional context (GUI elements or edit a presentation etc) pick a font with `Nerd Font Propo` (or `NFP`).

### Ligatures

Ligatures are generally preserved in the patched fonts.
Nerd Fonts `v2.0.0` had no ligatures in the `Nerd Font Mono` fonts, this has been dropped with `v2.1.0`.
If you have a ligature-aware terminal and don't want ligatures you can (usually) disable them in the terminal settings.

### Explanation

Once you narrow down your font choice of family (`Droid Sans`, `Inconsolata`, etc) and style (`bold`, `italic`, etc) you have 2 main choices:

#### `Option 1: Download already patched font`

 * For a stable version download a font package from the [release page](https://github.com/ryanoasis/nerd-fonts/releases)
 * Or download the development version from the folders here

#### `Option 2: Patch your own font`

 * Patch your own variations with the various options provided by the font patcher (i.e. not include all symbols for smaller font size)

For more information see: [The FAQ](https://github.com/ryanoasis/nerd-fonts/wiki/FAQ-and-Troubleshooting#which-font)

[SIL-RFN]:http://scripts.sil.org/cms/scripts/page.php?item_id=OFL_web_fonts_and_RFNs#14cbfd4a

