# Rec Mono for Code

**Recursive Mono** or **Rec Mono** is a variable type family built
for better code and UI. It is inspired by casual script signpainting,
but designed primarily to meet the needs of programming environments
and application interfaces.

For more information have a look at the upstream website: https://github.com/arrowtype/recursive/

### Rec Mono Duotone
A personal favorite – this use the Linear style for Regular text and
Casual styles for Bold, Italic, and Bold Italic text. In many themes
that use italic styles, this will give most code a utilitarian look,
but set comments, some keywords, and certain headlines in the
more-handwritten Casual style.

### Rec Mono Linear
An everyday workhorse for code. Slightly-boxy shapes maximize legibility
while maintaining a standard monospace width, while a few quirks add a
little bit of extra personality and differentiation between
similarly-shaped characters.

### Rec Mono Casual
A party in a font. Fun and wacky shapes, simplified enough for small sizes
but curvy enough to have plenty of character. Best in casual coding and
non-primary terminals.

### Rec Mono SemiCasual
Sets the CASL axis at `0.5` for font that is serious but softened a
little bit. This isn't the best choice for text at large sizes (like
headlines on a website), but can be a really nice balance in code.

Version: 1.085

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
 * Direct links for [Recursive.zip](https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Recursive.zip) or [Recursive.tar.xz](https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Recursive.tar.xz)

#### `Option 2: Patch your own font`

 * Patch your own variations with the various options provided by the font patcher (i.e. not include all symbols for smaller font size)

For more information see: [The FAQ](https://github.com/ryanoasis/nerd-fonts/wiki/FAQ-and-Troubleshooting#which-font)

[SIL-RFN]:http://scripts.sil.org/cms/scripts/page.php?item_id=OFL_web_fonts_and_RFNs#14cbfd4a

