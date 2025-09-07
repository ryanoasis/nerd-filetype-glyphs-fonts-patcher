# Cascadia Code

**Cascadia Code** is a fun, new monospaced font that includes programming ligatures.

For more information have a look at the upstream website: https://github.com/microsoft/cascadia-code

Note that upstream has a version with Nerd Font icons: CascadiaCodeNF. That has not been created with the Nerd Fonts `font-patcher`.

## Preprocessed Source Font

This source font has been preprocessed - it is not taken directly from upstream.
Cascadia Code is mainly a variable font (VF) and the static versions (that Nerd Fonts
are based on) are prepared in a different way: They have been hinted with `ttfautohint`.
That hints differ considerably from the hints in the VF. That changes the rendering for
smaller sizes (usual sizes in terminals) considerably.

To get the 'original' (i.e. VF) feel of the font we redo the hints in the static versions:
Open the font with Microsoft's VisualTrueType (VTT) and apply Light Latin Autohint.
The issue is known upstream and will probably be fixed. But until it is fixed we need
to do this manual process on all source updates.

Version: 2407.24
