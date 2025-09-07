## Contents

This directory contains
* List of all source fonts to patch with CI
* List of all glyphs for the cheat-sheet

### Source fonts

The file `fonts.json` is used by the github CI to patch all fonts and create all the release zip archives.
The 'font matrix' is derived from it.

`get-font-names-from-json.sh` is a small helper to set the matrix up.

The `fonts.json` is the source of a lot details used on the
https://www.nerdfonts.com site and for some scripts. It needs to be
filled manually for each added font.
 * `unpatchedName`: [string] Human readable name used in readme
 * `licenseId`: [string] SPDX license identifier
 * `RFN`: [bool] Has the font a Reserved Font Name clause
 * `version`: [string] The real version inside the font files
 * `patchedName`: [string] Human readable name used in readme
 * `folderName`: [string] Folder name in `src/unpatched-fonts/`
 * `imagePreviewFont`: [string] Font family name that should be used for the preview image
 * `imagePreviewFontSource`: [string] File name of the font that is can be used to generate the font that is used for the preview image
 * `linkPreviewFont`: [string] Anchor to reach the preview at https://www.programmingfonts.org
 * `caskName`: [string] Will be expanded by `font-` and `-nerd-font` and must follow the Homebrew naming rules
 * `repoRelease`: [bool] Are the patched fonts committed back into the repo
 * `isMonospaced`: [bool] Is the source font monospaced, at least some of them (i.e. suitable for terminals)
 * `description`: [string] Mention what makes this font stand out

### Cheat Sheet

The glyphs get their names through the individual (per glyph source) i\_\*.sh files in this directory.
Only glyphs listed here could be found with the cheat sheet.

* `codicons/codicon.ttf`: `i_cod.sh`
* `devicons.ttf`: `i_dev.sh`
* `font-awesome-extension.ttf`: `i_fae.sh`
* `font-awesome/FontAwesome.otf`: `i_fa.sh`
* `Unicode_IEC_symbol_font.otf`: `i_iec.sh`
* `font-logos.ttf`: `i_logos.sh`
* `materialdesignicons-webfont.ttf`: `i_material.sh` _removed with Nerd Fonts v3_
* `materialdesign/MaterialDesignIconsDesktop.ttf` : `i_md.sh`
* `octicons.ttf`: `i_oct.sh`
* `PowerlineExtraSymbols.otf`: `i_ple.sh`
* `powerline-symbols/PowerlineSymbols.otf`: _is a subset of PowerlineExtraSymbols_
* `Pomicons.otf`: `i_pom.sh`
* `extraglyphs.sfd`: `i_extra.sh` _(only a subset)_
* `original-source.otf`: `i_seti.sh`
* `weather-icons/weathericons-regular-webfont.ttf`: `i_weather.sh`
