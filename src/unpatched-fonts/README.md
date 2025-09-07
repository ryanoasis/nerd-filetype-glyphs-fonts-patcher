## Sourcefonts for Releases

Here reside all source fonts that are used for releases. These fonts
are fully supported, following renaming schemes and having possible specific
patch-flags that must be used for best results (in their `config.*` files).

To try things out on all fonts here is also a list of one specimen each for
all the fonts in `fontfilenames`. This can be used via

        cat fontfilenames | xargs fontforge .....

## Regenerating the fontfilenames file

Just call

        jq -r '.fonts[$i].imagePreviewFontSource' ../../bin/scripts/lib/fonts.json \
            | grep -v '\.sfd$' \
            | sed 's/ /\\ /g' \
            | LC_ALL=C sort --ignore-case \
            > fontfilenames
