## Creating Consistently Grouped Patched Fonts

This is a small sub-project to font-patcher that uses a little bit more knowledge
to come up with font names and name parts. In applications multiple fonts are grouped
under a 'Family'. Each member of the Family has a different 'SubFamily' or 'Style'.

Consider a font named 'Times' that has two variants: normal and bold. For this font the
Family would be 'Times' and the 'Style' would be 'Regular' (i.e normal) in one file and
'Bold' in the other file.

With this information applications are able to group all 'Times' together and additionally choose the
'Bold' font if the user pushes the 'B' button on the font style dialog in that application.

### Motivation

Quite a number of patched fonts have inconsistent or simply wrong font grouping. The naming in
general is sometimes surprising and not following naming conventions. This is in part due to
the font-patcher, but in part the source fonts are already strange.
This results in invisible (but installed) fonts in some applications, inconsistent naming
(Familyname differs from Fullname) and not correctly working bold/italic selectors in some applications.

And we would like to have the information within the names sorted in a consistent way.
usually a font name consists of these parts (in this order):

1. Name base (e.g. `Noto`)
2. Variant (e.g. `Sans`)
3. Subvariant (e.g. `Display`)
4. Weight (e.g. `Black`)
5. Style (e.g. `Italic`)

This is important because we want to add subvariant information, namely the `Nerd Font` part.

Example:

* (old) `Iosevka Term Light Italic Nerd Font`
* (new) `Iosevka Term Nerd Font Light Italic`

### The Plan

To solve these issues the font name parts have to be analyzed more thoroughly and then categorized.
These categories are then used to assemble the names in correct order. The simple (not
typographically aware) applications shall always get groups of at most four styles, and these
are Regular, Bold, Italic, and Bold-Italic. Other styles turn up as Families, because this is the
only way they would work in these more simple applications.

Typographically aware applications, on the other hand, get all styles grouped under one Family name.

First experiments showed that the full information can usually be restored already from the file
names that our source fonts have.

This new naming is complete optional (but recommended). Give the option `--makegroups` to `font-patcher`
and it will try to come up with reasonable grouping and naming. Leave the option out and it will
work as it always did.

### The Tests

In this directory were two tests. If interested you need to go back in the git history.
They are not needed anymore.

### Helper scripts

There are some helper scripts that help examining the font files. Of course there are other,
more professional tools to dump font information, but here we get all we need in a concise
way:
* `query_mono` `font_name [font_name ...]`
* `query_names` `font_name [font_name ...]`
* `query_panose` `font_name`
* `query_sftn` `[<sfnt-name>] font_name`
* `query_version` `font_name`

They can be invoked like this `$ fontforge query_sfnt foo.ttf`.
