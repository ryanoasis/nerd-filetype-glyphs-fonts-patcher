# Adwaita Mono

Adwaita Mono is the default monospace font for GNOME 48+. It is a modification of the [Iosevka](https://typeof.net/Iosevka/) font, customized to fit with Adwaita Sans, which is a variation of [Inter](https://rsms.me/inter/) with a disambiguated lowercase L.

The fonts and license are available on the GNOME GitLab instance: https://gitlab.gnome.org/GNOME/adwaita-fonts

Version: 32.4

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
 * Direct links for [AdwaitaMono.zip](https://github.com/ryanoasis/nerd-fonts/releases/latest/download/AdwaitaMono.zip) or [AdwaitaMono.tar.xz](https://github.com/ryanoasis/nerd-fonts/releases/latest/download/AdwaitaMono.tar.xz)

#### `Option 2: Patch your own font`

 * Patch your own variations with the various options provided by the font patcher (i.e. not include all symbols for smaller font size)

For more information see: [The FAQ](https://github.com/ryanoasis/nerd-fonts/wiki/FAQ-and-Troubleshooting#which-font)

[SIL-RFN]:http://scripts.sil.org/cms/scripts/page.php?item_id=OFL_web_fonts_and_RFNs#14cbfd4a

