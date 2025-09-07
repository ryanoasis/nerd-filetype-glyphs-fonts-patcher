### Contents

Note: Usually you need to call the scripts in this directory while actually being in this directory (i.e. `pwd = .../nerd-fonts/bin/scripts`).

Shell scripts here require a halfway recent version of `bash`, i.e. at least version 4 which came out in 2009.<br />
MacOS usually has a `bash` version 3; you can install a current version via Homebrew.

* `archive-font-patcher.sh`: Archives the font patcher script and subscripts and the required source glyph files [1]
* `archive-fonts.sh`: Creates the release zip file of one or more font(s) from existing `patched-fonts/` content [1]
* `cheatsheet.sh`: Search for a glyph by part of its name [4]
* `data/`: Contains plain text files used to generate the CSS and cheat sheet files
* `data/sankey/`: Contains instructions on how to create the sankey glyph table manually [3]
* `docker-entrypoint.sh`: This script is packaged into the docker container and is usually used to start patching [2]
* `fetch-archives.sh`: Script to download the release zip archives [6]
* `fpfix.py`: Can be used to set isFixedPitch property in a font [x]
* `generate-casks.sh`: Generates cask files for fonts from data in `archives/` [6]
* `generate-css.sh`: Generates the Nerd Fonts CCS, which can be used to access the glyphs on a web page, and the Cheat Sheet [1]
* `generate-extraglyphs.py:` Generates `extraglyphs.sfd` from Hack Regular [4]
* `generate-fontconfig.sh`: Generates font configuration to enable use of unpatched fonts with Symbols Only Nerd Font [1]
* `generate-font-image-previews.sh`: Generates the preview images for `nerdfonts.com` (i.e. gh-pages) [3]
* `generate-glyph-info-from-set.py`: Generate the `i_xxx.sh` file from a glyph source (font) file, if the glyphs are named correctly [4]
* `generate-original-source.py`: Generate `original-source.otf` from single glyph svgs. [5]
* `generate-release-summary.sh`: Helper to generate the release table with zip and xz [3]
* `generate-sample-set.sh`: Generate one patched font file from each source font (for manual checks) [4]
* `generate-webfonts.sh`: Generate woff and woff2 font files from the SymbolsOnly font (for the gh-pages) [1]
* `get-font-names-from-json.sh`: Helper to setup the CI font matrix from `data/fonts.json` [1]
* `gotta-patch-em-all-font-patcher!.sh`: Patch one or more fonts 'complete' with and without `mono` and with and without `windows compat` [1]
* `lib/`: See its own README
* `name_parser/`: Suite to set up sane Family and SubFamily names, used by `font-patcher` (on demand)
* `optimize-original-source.sh`: Run all icons in `src/svgs` through inkscape to simplify (remove nodes and edges) [5]
* `release.sh`: Rough process how a release is created, not used (see `.github/workflows/release.yml`)
* `standardize-and-complete-readmes.sh`: Used by `gotta-patch-em-all-font-patcher!.sh`
* `test-fonts.sh`: Print-to-debug all glyphs we patch in [4]
* `test-powerlines.sh`: Print-to-debug powerline examples [4]
* `test-vertical-lines.sh`: Print-to-debug powerline examples [4]
* `update-all-contributors-website.py`: Update the contributors page on `nerdfonts.com` (i.e. gh-pages) [7]
* `update-gitignore.sh`: Correct gitignore file for not-released-in-repo fonts [8]
* `version-bump.sh`: Change version number in all scripts on a new release [1]

[1] Used by CI (github release workflow)<br />
[2] Used by CI (github docker-release workflow)<br />
[3] To be used manually (sigh)<br />
[4] To be used manually<br />
[5] Used by CI (github packsvgs workflow)<br />
[6] Used by CI (github casks workflow)<br />
[7] Used by CI (github contributors workflow)<br />
[8] Used by CI (github fontjson workflow)
