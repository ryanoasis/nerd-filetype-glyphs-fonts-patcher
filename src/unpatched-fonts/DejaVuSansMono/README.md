# DejaVu

The DejaVu fonts are a font family based on the Bitstream Vera fonts.
Its purpose is to provide a wider range of characters while maintaining the original look and feel.

For more information have a look at the upstream website: https://github.com/dejavu-fonts/dejavu-fonts

## Preprocessed Source Font

Since Nerd Fonts 1.0.0 we manually added to the source font the trigrams `U+2630` - `U+2637` (and some Powerline glyphs).
The glyphs had the wrong width, breaking the monospaced property of the Sans **Mono** font.

This has been fixed (i.e. the width adjusted) after Nerd Fonts 3.4.0 (that release number is yet unknown).
The Powerline glyphs were dropped in that process.

Version: 2.37
