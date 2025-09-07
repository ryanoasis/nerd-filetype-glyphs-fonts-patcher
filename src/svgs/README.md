### Contents

These are the source glyphs for the 'Seti and Original' icon set.

Files for the 'Original' set have a `_nf` suffix to avoid any mixup with the Seti filenames.

`generate-original-source.py` generates a font file from all these individual glyphs. That font is then used for the actual patching process.

The codepoints and names of the icons here have to be put into `icons.tsv`.

If you push a new svg-file here it will be run through Inkscape 'simplify-path'! Keep that in mind.

The simplification is also automated for every push via `optimize-original-source.sh`.
