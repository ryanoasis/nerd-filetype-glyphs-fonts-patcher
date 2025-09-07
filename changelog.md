CHANGELOG
================================================================================
This project is using [Semantic Versioning 2.0.0](http://semver.org/)

## v3.4.0

Easter Release without Eggs

Mainly a font update release. No surprises here (we hope).

### Breaking
 - Remove patcher option `--use-single-width-glyphs` (use `-s` or `--mono` instead)

### Fonts
 - Add Adwaita Mono @badlydrawnface #1819
 - Add Atkinson Hyperlegible Mono @joshestein #1802
 - Update 0xProto to 2.300 @my4ng #1803
 - Update Cascadia Code to 2407.24 #1844
 - Update Geist Mono to 1.401 #1838
 - Update InconsolataLGC to 1.13 #1839
 - Update Iosevka to 33.2.1 #1845
 - Update Lilex to 2.600 #1840
 - Update Martian Mono to 1.1.0 #1841
 - Update Monaspace to 1.200 #1846
 - Update MPlus to 1.007 #1842
 - Update Noto (Sans and Serif) to 2.015 #1843
 - Update Ubuntu Sans to 1.006 #1836

### Icons
 - Add new CSS icon @skoch13 #1762
 - Manually optimize many Devicon icons #1779

### Features
 - Add possibility to create single width icons without touching existing glyphs #1773
 - Add possibility to manually set target cell size (`--cell`) #1773
 - The patched fonts in `otf` format are now much smaller (comparable to `ttf`) #1851
 - Intermediate icon storage is not rounded anymore #1849

### Bugs and improvements
 - Fix few missing new Devicons @hasecilu #1768
 - Fix glitches in Devicon icons #1779
 - Fix self-patching on Windows #1761
 - Fix handling of some glyphs in `Nerd Font Propo` and `SymbolsOnly` #1852

## v3.3.0

The Post-Halloween Release

The biggest change is the update of **Devicons** by switching from the unmaintained repo
to a more maintained fork that has lots of asked for icons. Some very old icons have
been dropped now; hope noone is really affected. See the description in #1691 for
a complete list.

### Breaking
 - Because Devicons are updated some old icons were dropped (replaced) #1691

### Fonts
 - Add Departure Mono @rektdeckard #1709
 - Add Monaspace weight ExtraLight (Italic) #1670
 - Update 0xProto to 2.201 @my4ng #1623
 - Update Intel One Mono to 1.4.0 #1741
 - Update Monaspace to v1.101 @Stealthii #1630
 - Fix upstream Gohufont 14 question mark bug #1654

### Icons
 - Switch to devicons/devicon #1691
 - Add Chuck and Vitruvian Man #1740
 - Add Progress Indicators a la Fira Code #1733
 - Update Font Logos to 1.3.0 #1721
 - FontAwesome: Scale glyphs a bit smaller #1722
 - Improve Bazel icon @zaucy #1610
 - Improve Ruby and Firebase icons

### Features
 - Add shell based cheat-sheet script @hasecilu #1694
 - Add fontconfig file to SymbolsOnly release archive (for repackagers) #1713
 - Unify configuration files for font-patcher and gotta-patch-em (format changed) #1613

### Bugs and improvements
 - Fix Powerline glyphs position and size in some cases #1727
 - font-patcher: Allow to rehint glyphs via config file #1613
 - font-patcher: don't double-shrink heavy angle brackets @gibfahn #1617
 - font-patcher: Fix behavior when trying to patch non-font files #1648
 - font-patcher: Fix escaping warning
 - gotta-patch-em: Remove post processing
 - Increase Powerline overlap (big triangles and more) #1724
 - Increase weather icons 'other' icons scale #1726
 - ShareTechMono: Fix fi/fl ligs #1631
 - PowerShell install @jpawlowski #1701

### Website and docs
Again a lot has been done by various people, thank you all!

## v3.2.1

This bugfix release is mainly because of the Fira Code progress indicator glyphs. These are used by some applications, and usually could be used via fontfallback from any font (because the codepoints were un-occupied in the Nerd Fonts). But with adding more FontAwesome glyphs we utilized that codepoints for the new glyphs, breaking this common setup.
To fix that we keep these codepoints (there are 9 glyphs) free and un-occupied. So the usual fallback scheme will continue to work.

Please see below for a list of codepoint that change with this release (which were new in 3.2.0), so I count that not really as breaking, because they were just some days ago (accidentally) introduced.

<details>

| name | v3.2.0 codepoint | v3.2.1 codepoint |
|---|---|---|
| `fa_less_than`              | `EE00` | `EFC3` |
| `fa_less_than_equal`        | `EE01` | `EFC4` |
| `fa_memory`                 | `EE02` | `EFC5` |
| `fa_microphone_lines_slash` | `EE03` | `EFC6` |
| `fa_money_bill_wave`        | `EE04` | `EFC7` |
| `fa_money_bill_1_wave`      | `EE05` | `EFC8` |
| `fa_money_check`            | `EE06` | `EFC9` |
| `fa_money_check_dollar`     | `EE07` | `EFCA` |
| `fa_not_equal`              | `EE08` | `EFCB` |
| `fa_palette`                | `EE09` | `EFCC` |
| `fa_square_parking`         | `EE0A` | `EFCD` |
| `fa_diagram_project`        | `EE0B` | `EFCE` |
| this moves:                                   |
| `fa_avianex`                | `F0E6` | `EFC2` |
| these swap:                                   |
| `fa_diamond`                | `F219` | `F29F` |
| `fa_gem`                    | `F29F` | `F219` |
| `fa_cloudsmith`             | `F16A` | `F167` |
| `fa_youtube`                | `F167` | `F16A` |

</details>

### Codepoint shift :warning: (only relative to 3.2.0)
* Reorder some FontAwesome glyphs #1596
  (see list above)

### Bugs
* Remove Ubuntu 'fi' and 'fl' ligs #1597

### Improvements for package maintainers

* Add individual licenses to font database `fonts.json` for package maintainers #1599
* Add sha256 checksums to release (commit c2cd3cdf)

## v3.2.0

The Easter release. Lets see which eggs can be found:

### Fonts
 - Add Recursive Mono #1576
 - Add Ubuntu Sans #1583
 - Add Zed Mono @cabrinha #1504
 - Update 0xProto to version 1.603 @junoslukan #1516 #1575
 - Update Commit Mono to 1.143 #1575
 - Update Geist Mono to 1.200 #1575
 - Update IBM Plex Mono to 2.004 (v6.4.0) #1575
 - Update InconsolataLGC to 1.5.2 #1575
 - Update Intel One Mono to 1.3.0 @landfillbaby #1558
 - Update Iosevka to 29.0.4 @iruoy #1497
 - Update Lilex to 2.400 #1575
 - Update Noto to 2.013/2.014 #1478
 - Update SourceCodePro to 2.042/1.062 #1444
 - Update Terminus to 4.49.3 #1571
 - Update Victor Mono to 1.5.6 #1575
 - Fix ComicShanns carons (pending upstream) #1546

### Icons
 - Add Ada icon #1577
 - Add Astro icon @roginfarrer #1464
 - Add inverse Powerline arrow heads #1490
 - Add Prettier icon @ronitkrshah #1470
 - Update Codicons to 0.0.35 #1544
 - Update Font Awesome to 6.5.1 (partially) #1563
 - Update Font Logos to 1.2.0 #1585

### Bugs and improvements
Only some notable fixes listed here
 - docker: Allow blancs in filenames
 - docker: Include logfile in output
 - docker: Run parallel by default @robk #1508
 - font-patcher: Prevent excessively tall icons in mono fonts #1564
 - Increase Powerline overlap (only rounded) #1551
 - name-parser: Add "thick" weight for Lilex
 - name-parser: Fill short and long name as TypoFamily (for VSCode etc) #1442
 - name-parser: Fix Terminus-Bold-Italic parsing
 - name-parser: Sort Widths before Weights
 - Manually fix several icons with corrupt paths

### Website and docs
A lot of work has been done here by various people, thank you all!

## v3.1.1

This release is mainly a bugfix release: It undoes the breaking naming change of the
last release which was an unwanted consequence of Fix naming problem (Visual Studio) #1406
See #1434 for a discussion.

Because these changes were already approved they are also included:

### New fonts and icons
 - Monaspace: Add Light weight #1433
 - Add TOML icon @cpea2506 #1436

## v3.1.0

This release fixes some bugs and adds fonts. More icons will come with the next release.

We also sunset in-repo releases (new fonts will only be released as release artifact) #1360

### New fonts and updates
 - Add 0xProto @piraces #1381
 - Add Cascadia Mono #1412
 - Add Commit Mono #1414
 - Add D2Coding #1413
 - Add Envy Code R #1318 (already since 3.0.2b)
 - Add Geist Mono @QuiiBz #1398
 - Add IntelOne Mono @ (already since 3.0.2b)
 - Add Iosevka Term Slab #803
 - Add Martian Mono @skryukov #1092
 - Add Monaspace @julien-blanchon #1405
 - Update Lilex to v2.3.0 #1356
 - Update MPlus #1357

### Fixes
 - Fix naming problem (Visual Studio) #1406
 - Fix fi-ligature in Noto Sans Mono #1400
 - Fix logging error in font-patcher @lolicon0930 #1287

### Features
 - Add Common Lisp and Scheme icon #1428
 - Add Fennel icon @Grazfather #1129
 - Add Neovim icon @georgeguimaraes #1391
 - Update Font Logos to v1.1.1 @hasecilu 1427
 - Update Windows icon to Windows 11 #1290
 - Add font-patcher option to specify metrics source #1300
 - Add font-patcher option to specify naming source #1319 #1282
 - Add font-patcher option to specify box drawing glyph behavior #1300
 - test-fonts.sh: allow wrapping at any number @hasecilu #1270

### Website and docs
 A lot of work has been done here by various people, thank you all!

## v3.0.2

**One general fix and some font specific ones**

Note the breaking changes introduced with the `v3.0.0` release.
If you miss icons, check #1190 and probably https://github.com/loichyan/nerdfix

### Fixes
 - Bugfix `Codicon` Circles #1261
 - Fix `DaddyTimeMono NFM` #1244
 - Fix `fsSelection` for `--has-no-italic` (`Bitstream Vera` + `DejaVu`) #1255
 - Fix naming of some fonts of BlexMono and GohuFont

### Features
 - Allow not renaming the font #1282 for `Cascadia Code` self-patcher (#1242)
 - Create `tar.xz` packs now automated #1235
 - Improve cheat sheet @rszyma #1252 #1254
 - `test-fonts.sh`: allow wrapping at any number by @hasecilu #1270

## v3.0.1

This bugfix release handles the following issues.

### Fixes
 - Revive some ligature removal (only of problematic ligs)
 - Correct Octicons scale (of very few icons)
 - Fix logging with AppImage `fontforge`
 - Drop box-drawing glyphs from Symbols Only fonts
 - Reintroduce upstream-dropped `oct-file-symlink-directory`
 - Reintroduce old style `oct-file-directory` in `custom-`
 - Fix wrong `fsSelection` bit
 - Fix `fi` ligature in Ubuntu
 - Fix scaling of heavy brackets (mostly in Nerd Font Mono)
 - Fix Ubuntu Mono Condensed font property (upstream bug)
 - Fix small scaling glitch for 4 Codicons
 - Correct CaskaydiaCove's version string (which contains the autohinter)

## v3.0.0

This major release introduces some breaking changes:

### Breaking 1: Naming

This release fixes some long standing issues that are due to the naming of the fonts: There is a completely new naming scheme. This might be inconvientient for existing setups, sorry.
 - Some fonts will have `Nerd Font` in the name while other have it abbreviated as `NF`. This is needed because some names just were too long. (Same for `Nerd Font Mono` and `NFM`.)
 - There are no `Windows Compatible` fonts anymore. All fonts work on all platforms.
 - The `Complete` from the font names (and the repo directories) has been dropped (Complete is the new normal).
 - The name parts will be ordered as expected with style and weight last (`Somefont Bold Nerd Font` -> `Somefont Nerd Font Bold`).
 - The filename will have no blanks anymore.

### Breaking 2: Material Design Icons Codepoints

The old Material Design Icon codepoints are finally dropped. Due to an historic mistake we placed them in between some asiatic glyphs, breaking that script.
Since v2.3.0 the (updated and expanded) Material Design Icons have new codepoints in the 5 digit region.
 - Dropped codepoints `F500`... and class names `nf-mdi-*`
 - New codepoints `F0001`... and class names `nf-md-*`
 - The whole discussions are here: https://github.com/ryanoasis/nerd-fonts/issues/365
 - A translation table is available here: https://github.com/ryanoasis/nerd-fonts/issues/1059#issuecomment-1404891287
 - There are tools out there that probably can update your configuration.

Otherwise this is a 'Update release', so now the good stuff:

### Updates
  - Update `Agave` to v37
  - Update `Arimo` to 1.33
  - Update `DaddyTimeMono` to 1.2.3
  - Update `Fira Mono` to 3.206
  - Update `Go Mono` to 2.010
  - Update `Hermit` to 2.0
  - Update `IBM Plex` to 2.3
  - Update `Iosevka` to 22.1.0
  - Update `Literation` to 2.1.5
  - Update `Lilex` to 2.000
  - Update `mononoki` to 1.6
  - Update `MPlus` to ... current
  - Update `Overpass` to 3.0.5
  - Update `Roboto Mono` to 3.0
  - Update `Source Code Pro` to 2.038
  - Update `Terminus` to 4.49.2
  - Update `Victor Mono` to 1.5.4
  - Update the Octicons set to 18.3.0

### Features
  - New font `ComicShannsMono`
  - New variant in release `Nerd Font Propo` for GUI usecases
  - Patch in heavy angle brackets
  - Patch in boxdrawing glyphs (if the font has no complete set)
  - Repair Panose info if source font has broken data
  - Reform PowerlineExtra sizing
  - Autocreate a `FontPatcher.zip` from `HEAD`
  - Create a json database with css names
  - Disentangle `Iosevka` into two packets (one for `Iosevka Term`)
  - Add option to manipulate `xAvgCharWidth` (needed rarely by self-patchers)
  - Add option to allow italic-less fonts with oblique
  - Add `--debug` and `--dry` to `font-patcher`
  - Add logging into file to `font-patcher`
  - Add `NERDFONTS` environment variable to transport options through `gotta-patch-em`

### Improvements
  - Fix `Caskaydia Code` height different to `Cascadia Code` (hinting problem) (font is now `ttf` instead of `otf`!)

### Fixes
  - Fix baseline to basline distance (line gap) for some fonts
  - Fix weather icons cloud scaling
  - Fix UniqueID of the fonts
  - Fix `Bitstream Vera` name: Is now `Bitstrom Wera` due to licensing issue
  - No fix, but: Drop support for Python 2

## v2.3.3

### Fixes
  - Fix licenses in archives 8a749ab21
  - Fix Nerd Fonts Symbols Only metrics 4939ac5

## v2.3.2

### Fixes
  - Update `JetBrains Mono` to 2.304 c6b3b0841
  - Cover alternate unicode encodings _(for Input Mono)_ by @nathanielevan #1058
  - Fix some Nerd Font Mono too wide #1062
  - Fix line gap calculation #1060

## v2.3.1

### Fixes
  - Fix windows Mono family names with --makegroups f240e073

## v2.3.0

The `v2.3.x` release is an interim release that tackles a lot technical issues and some updates. It is the preparatory step for `v3.0.0` that will update 'everything' and introduce new concepts. See [#1074](https://github.com/ryanoasis/nerd-fonts/discussions/1074).

### Features
  - Process `TTC` files #783
  - Preserve existing bitmaps #939
  - Symbol scaling in nonmono (down to 2 'widths') #748
  - Add New Material Design Icons to **its own region** by @earboxer #773
  - Calculate line gap correctly #1060

### Updates
  - Update `Inconsolata` to v3.000 #775
  - Update `3270font` to v3.0.1 #948
  - Update `Mononoki` to 1.5 fec587385
  - Update `Seti` glyph set #978
  - Update `JetBrains Mono` by @rluvaton #1053

### Improvements
  - `install.sh --remove` #822
  - Stable codepoints #778
  - Add `-WindowsCompatibleOnly` on `install.ps1` by @ev-dev #841
  - Sunset ligature removal #977
  - Fix Iosevka Family names #1019
  - Fix unequal weather icon scale #916
  - Use Fontforge January 2023 Release #1037
  - Warn if sourcefont is a variable font `VF` #960
  - Improve Assembly icon by @ignamartinoli #990

### Fixes
  - Fix `fontconfig` #920
  - Fix scaling related rounding error #921
  - Fix hasklug ligature #938
  - Avoid patching proportional sources #912
  - Fix JetBrains Mono `!=` ligature #964
  - Fix crash on some custom sets #1006
  - Sanitize output filenames #1029
  - Fix unexpected 'Book' SubFamily #1047
  - Fix licenses in archives 8a749ab21
  - Fix some Nerd Font Mono too wide #1045
  - Fix line gap calculation #943

### Next Release Outlook

The `v3.0.0` release will bring two bigger changes:

#### Material Design Icons
The Material Design Icons have to move codepoints. Historically we patch them in between `F500` - `FD46`; but part of that range is needed for Chinese and other glyphs. With #773 and _Plan 5+_ of #365 their new home will be after `F0001`. And they grow considerably.

The `v2.3.x` release has both, the 'old' and the 'new' codepoints to enable you an easier transision. **Please change** already **now** your prompts and other uses to the new codepoints. Release `v3.0.0` will finally drop the old codepoints (`F500` - `FD46`).

#### Naming
Naming will also change. The name parts will move to places where they are customarily expected (e.g. weight and style comes last). This will fix some more problems. Probably we will drop the `Complete` monicker, as ... everyone uses the complete versions, it just takes precious space in the names.
The details are not fixed yet, follow [#1074](https://github.com/ryanoasis/nerd-fonts/discussions/1074) to keep up to date.

## v2.2.2

This makes all the prepached `Nerd Fonts` monospaced again, like v2.1.0 had it.

### New Features

  - Make Nerd Fonts Monospaced Again by @Finii in #764
  - Add new icons:
    - Add icons for Emacs and Orgmode by @ashfinal in #833
    - Add Kotlin icon by @Finii in #862

### Updates / Improvements

  - Update Hasklig readme by @chezbgone in #910
  - font-patcher:
    - Correct python module missing message by @Finii in #798
    - Do not overwrite glyphs that are needed for basic glyphs by @Finii in #914
    - Correct mono scaling of thin glyphs by @Finii in #749
    - Allow to specify custom symbolfont with absolute path by @Finii in #794
    - Allow glyphs with altuni for exactEncoding by @Finii in #793

## v2.2.1

### Fixes

  - Monospaced fonts wrong width (b71a9e474b4f2e8c416c32949e6c0f76949a14ee)

## v2.2.0

### New Features

  - Add new fonts:
    - Add Lilex font by @adavidzh in #474
  - Add new icons:
    - Add Crystal icon by @mamantoha in #429
    - Add PureScript Icon by @andys8 in #545
    - Add the official Puppet icon as a custom icon by @dhollinger in #652
  - Add Docker support by @mdschweda in #449
  - Add support for codicons by @cstrahan in #705
  - Use fontforge 2022 for release by @Finii in #884

### Updates / Improvements

  - Update various fonts:
    - Update Cascadia Code to its latest release by @LuanVSO in #433
    - Update Cascadia Code to version 2007.01 by @natebwangsut in #499
    - Update Cascadia to 2111.01 by @Finii in #723
    - Update JetBrains Mono to 1.0.3 by @alindeman in #437
    - Update JetBrains Mono to 1.0.5 by @alindeman in #459
    - Update JetBrains Mono to version v2.001 by @moritzdietz in #518
    - Update JetBrains Mono to version v2.210 by @moritzdietz in #540
    - Update JetBrains Mono to version v2.225 by @moritzdietz in #572
    - Update JetBrains Mono to version v2.242 by @moritzdietz in #648
    - Update JetBrains Mono to version v2.251 by @moritzdietz in #776
    - Upgrade Victor Mono to 1.4.1 by @ea2809 in #516
    - Update Fira Code to v3.1 by @iamolivinius in #473
    - Update Fira Code to latest version by @gitfool in #497
    - Update Fira Code to latest version by @gitfool in #704
    - Update Hasklig to v1.2 by @Tehnix in #555
    - Update Iosevka font to 6.1.3 by @FollieHiyuki in #622
  - Update Symbols-only fonts for #249 and #429 by @polyzen in #461
  - Automatic symbols only font generation by @Finii in #801
  - Update source icons:
    - Update font-logos with new linux icons by @daniruiz in #551
    - Update Font Logos to 1.0.1 by @Finii in #859
  - Add new language translations:
    - Add pt-pt language to readme.md by @LiTO773 in #431
    - Add Hindi version of readme.md. by @HarshalRathore in #707
  - font-patcher:
    - Take the style from the filename if it's longer than the subfamily (fixes #257) by @duganchen in #526
    - font-patcher: remove\_ligatures() never displays warnings by @fracsinus in #644
    - Allow setting custom glyph storage directory by @epsilon-0 in #613
    - Give meaningful error messages on trivial open fails by @Finii in #699
    - Feature: correct small rendering by @Finii in #761
  - Docu
    - Add additional Archlinux links by @quinnjr in #462
    - Add AppImage patching instructions to Readme by @adrian5 in #624
    - Add sparse-checkout example to only clone one font by @vnys in #625
    - List AUR packages for Jetbrains & Victor Mono by @avalonv in #887
  - Allow running gotta-patch-em-all from any dir by @RL-S in #863

### Fixes

  - Fix #412 by @onokatio in #439
  - CI's error by @get-me-power in #493
  - Change bearing to int, since an int is expected by @WhyNotHugo in #471
  - Add Caskyadia Mono to RFN replacements by @KexyBiscuit in #681
  - Bugfix/fstype font does not open by @Finii in #687
  - font-patcher: Use correct source font metrics by @Finii in #593
  - font-patcher: Reintroduce fsType fix by @Finii in #692
  - font-patcher: Set SFNT Version by @Finii in #693
  - font-patcher: Remove obsolete metadata on glyph exchange by @Finii in #711
  - font-patcher: Allow patching without --ext by @Finii in #720
  - font-patcher: Improve 'Mono' compatibility with Windows by @Finii in #695
  - font-patcher: Copy selection instead of continuously regenerating by @Finii in #736
  - Handle TTCs gracefully by @Finii in #752
  - Bugfix monospaced glyph scaling by @Finii in #732
  - patcher: Fix grave (backtick) zero width by @Finii in #860
  - Fix Noto too wide by @Finii in #830
  - Docu
    - Fix European Portuguese and Spanish translations errors by @gusbemacbe in #446
    - Restore new line in README.ja by @delphinus in #447
    - Update link to cheat sheet in readme's by @polyzen in #457
    - Fix misleading note: Only for Linux & macOS (OS X) | Option 3: Install Script by @GiorgosXou in #671
    - readme.md (et al): fix FQDN for input font (input.djr.com) by @atomicstack in #680
    - Update command about Homebrew cask option by @ktanoooo in #689
    - Replace non-existent polish words with other words that do exist in readme\_pl.md. by @MarcelskyXD in #710
    - font info: Remove references to 'Terminess' from non-Terminus fonts by @Finii in #724
    - Correct example patch call through fontforge [skip ci] by @Finii in #827
    - Fix grammar mistakes in readme\_uk.md by @dev99problems in #853
    - Fix (jetbrain-mono-font): installation guide by @GervinFung in #867
  - Typos
    - spelling: hermut -> hurmit by @Harwood in #537
    - Fix homebrew cask tap command by @lepht in #525
    - Fix typo in Cascadia Code README by @adrian5 in #529
    - Fix typo: partcular -> particular by @alexislefebvre in #550
    - Fix typo: partcular -> particular #550 by @alexislefebvre in #557
    - Fix typo: orignal -> original by @pajlero in #737
  - Update command for Mac OSX Homebrew install by @jesdavpet in #552
  - Update contribution instructions with fontforge --script by @Tehnix in #554
  - Link to gohu.eu is dead by @Skeeve in #567
  - Brew cask install update by @JakobFerdinand in #611
  - Fix ps installer by @fsackur in #570
  - Docker:
    - Update docker-entrypoint.sh by @diddledani in #654
    - Consider .ttc in docker entrypoint by @kraftwerk28 in #664
    - Update Dockerfile to use supported version of alpine and Python by @dgswilkins in #626
    - Update Dockerfile to use latest alpine and py3-pip by @cmarincia in #684
    - Fix Failing Docker Builds by @frankhinek in #882
  - Update issue templates by @Finii in #782
  - patch-em-all: Purge destination dirs if possible by @Finii in #787
  - CI: Add Lilex to release by @Finii in #886

## v2.1.0

### New Features

  - Added new fonts:
    - IBM Plex (PR #253 @romen)
    - iA Writer (patched as iM Writing) (PR #326 @xasx)
    - Agave (PR #327 @xasx)
    - DaddyTimeMono (fixes #330)
    - Victor Mono (PR #364 @kule)
    - Cascadia Code (patched as Caskaydia Cove)
    - JetBrains Mono (PR #421 @Knovour, fixes #420, #425)
  - Added chocolatey install script (PR #259 @rahuliyer95)
  - Added PowerShell installation script for Windows (PR #357 @LZong-tw)
  - Added font previews to website (fixes #316)

### Updates / Improvements

  - Updated most of the glyphs in the 'original-source' (PR #249 @danbee)
  - Updated font patcher script via refactor (PR #288 @haasosaurus)
  - Updated various fonts:
    - Updated Fira Code to version 1.206 (PR #298 @mashehu)
    - Updated 'Fura' to 'Fira' (PR #356 @ShalokShalom) (fixes #352)
    - Updated Fira Code to version 2.0 (PR #372 @hugo-vrijswijk, fixes #424)
    - Updated Iosevka to version 2.1.0 (PR #328 @MindTooth)
    - Updated Fantasque Sans Mono to version 1.8.0 (PR #423 @adzenith)
    - Updated Inconsolata to version 2.001 (fixes #289)
    - Updated Liberation to version 2.00.5 (fixes #344)
    - Updated Victor Mono to version 1.3.1 (fixes #388)
  - Added Cascadia Code to font sources (PR #374 @AaronFriel)
  - Added new language translations:
    - Added Polish readme (PR #301 @P1X3L0V4)
    - Added Spanish readme (PR #378 @Tamh)
    - Added Korean readme (PR #382 @ParkSB)
    - Added Ukrainian readme (PR #392 @igavelyuk)
    - Added Japanese readme (PR #389 @delphinus)
    - Added Italian readme (PR #427 @JGiola)
  - Added documentation about ligatures for patched fonts (PR #315 @sideeffffect)

### Fixes

  - Fixed monospace overlapping (PR #283 @haasosaurus, fixes #270)
  - Fixed glyph bears in monospaced variants (PR #394 @Finii)
  - Fixed archive artifact script not including all fonts (fixes #418)
  - Fixed URLs in font table (PR #260 @raffclar)
  - Fixed possible mixed content error on website for Google Fonts (PR #276 @mashehu)
  - Fixed UX of font-patcher log to be inside `<details>` block (PR #291 @kevinSuttle)
  - Fixed bash scripts execution from non-standard bash (PR #282 @deadloko)
  - Fixed missing variations of Meslo (PR #308 @segevfiner fixes #302)
  - Fixed typo (PR #331 @mikeshatch)
  - Fixed typo in css class and cheatsheet (fixes #285)
  - Fixed including uuid files (ignored) (PR #371 @lebel)
  - Fixed RFN for Anka Coder (PR #376 @gunman808)
  - Fixed BigBlueTerminal font formatting in readme (PR #381 @this-is-you)
  - Fixed formatting of Agave readme (PR #379 @Roshanjossey)
  - Fixed link to Fish Shell on website (PR #385 @kaykayehnn)
  - Fixed showcase images in FiraCode readme (PR #405 @equwal)
  - Fixed outdated AUR references (PR #416 @sudoLife)
  - Fixed elixir image src in Fira Code readme (PR #419 @kadimisetty)
  - Fixed missing Italic variation for SourceCodePro (fixes #271)
  - Fixed English text in French translation (PR #322 @leoz2007)
  - Fixed exit code in install script (PR #361 @evaryont)
  - Fixed link of Caskroom (PR #349 @satoryu)

## v2.0.0

### New Features

  - Added new fonts:
    - Noto (all variations) (#213)
    - Overpass Mono (fixes #177)
    - BigBlue Terminal (fixes #170)
    - Dyslexic (fixes #217)
    - Iosevka Term variant (no ligatures) (fixes #198)
    - FiraCode TTF variant (fixes #244)
    - SourceCodePro italics variant (fixes #236)
  - Added new glyph sets:
    - [Material Design Icons](https://github.com/templarian/MaterialDesign)
    - [Weather](https://github.com/erikflowers/weather-icons)
  - Added new glyphs to core:
    - Elm (fixes #172)
    - Elixir (fixes #228)
    - Electron (fixes #237)
  - Added new translations:
    - Added Traditional Chinese of readme (partially fixes #118) (PR #222) (@MindyTai)
    - Added French readme (partially fixes #118) (PR #251) (@pgrimaud)
  - Added ability to remove ligatures via the `--removeligatures` option in `font-patcher`
  - Added `--configfile` option to `font-patcher`

### Updates / Improvements

  - Updated `Hack` font to latest version (`v3.003`) (fixes #216) (with help from @chrissimpkins)
  - Updated `Iosevka` to the latest version (`v1.14.0`) (fixes #229)
  - Updated `Fantasque Sans Mono` to the latest version (`v1.7.2`) (fixes #240)
  - Updated `MPlus` version from `1.018` to `1.063`
  - Updated documentation for urxvt wcwidth implementations (fixes #155)
  - Updated logos and Sankey diagram

### Breaking Updates / Improvements / Changes

  - Updated Font Logos (formerly Font Linux) to latest version (fixes #157)

### Fixes

  - Fixed incorrect exitcode returned from installer (fixes #218) (PR #230 @Phuurl)
  - Fixed 3270 font not being valid/installable on Windows (fixes #12, #196)
  - Fixed weather variables script typo (PR #242 @snown)
  - Fixed Monospaced fonts having ligatures by default (fixed Meslo Mono having ligatures) (fixes #186)
  - Fixed Hasklig ExtraLight & Light variants (fixes #231)

## v1.2.0

### New Features

  - Added new fonts:
    - `Arimo` (fixes #206) (PR #207 @Ksbugbee)
    - `Go-Mono` (PR #199 @bbrks)
    - `Tinos` (fixes #200) (PR #201 @jerezereh)
    - `InconsolataLGC` (PR #205 @iloginow)
    - `Cousine` (fixes #208) (PR #209 @de-olagundoye)
  - Added Contributors section to Website and Repo (fixes #160) (PR #202, PR #204 @lucasreed)
  - Added Travis CI and integrated with ShellCheck script (fixes #120) (#212 PR @andrewimeson)
  - Added new translations:
    - Added Russian translation of readme (partially fixes #118) (PR #203 @magauran)
    - Added Mandarin Chinese translation of readme (partially fixes #118) (PR #214 @hiby90hou)

### Updates / Improvements

  - Updated `Hasklig (Hasklug)` font from version `1.0` to `1.1` (fixes #188) (PR #215 @fernandomora)
  - Updated fontconfig with `monospace` (PR #211 @Tyilo)

### Fixes

  - Fixed font-patcher relative path issues with glyph sources (PR #193 @theGivingTree)
  - Fixed install script not being callable from other directories (PR #194 @Twanislas)
  - Fixed broken links (@reujab)
  - Fixed minor misc readme issues

## v1.1.0

### New Features

  - Added shell helper script (and shell variables) for referencing glyphs (PR #147 @powerman)
  - Added new fonts:
    - `InconsoltaGo` (PR #130 @sodiumjoe)
    - `Ubuntu` (non mono) (fixes #134)
  - Added release script (fixes #137)
  - Added better terminal and font test scripts
  - Added CSS file for using Nerd Fonts on websites
  - Added script to build CSS file with classes to use Nerd Font glyphs
  - Added `--adjust-line-height` option to `font-patcher`

### Updates / Improvements

  - Updated 'Features' section counts (fixes #117) (PR #122 @OmarB97)
  - Updated location of readme images (PR #149 @agriffis)
  - Updated `DejaVu` version from `2.33` to `2.37` (and removes the `DejaVu for Powerline`) (PR #151 @agriffis)
  - Updated Reserved Font Name (RFN) details and provides clarification (fixes #136)
  - Updated `Ubuntu Mono` version from `0.80` to `0.83` and adds missing Bold and Italic variants (fixes #134)
  - Updated `FiraCode` version from `1.102` to `1.204` (fixes #180) (PR #181 @aidanharris)
  - Updated install and Quick Links info in readme
  - Updated Homebrew font install in readme
  - Updated readme with AUR package links
  - Updated readme with links to [NerdFonts.com's Cheat Sheet](http://nerdfonts.com/#cheat-sheet)
  - Updated readme with 'TL;DR' section and re-ordering of font install options (fixes #124)
  - Updated readme with more details on font install options
  - Updated various readme sections
  - Updated contributing markdown with better information
  - Updated explanations of `--mono` option and monospace in general (fixes #165)
  - Updated `font-patcher` progress bars styling
  - Updated `installh.sh` script to support installing to global system paths via `-U` (default) or `-S` flags (PR #187 @brennanfee)

### Fixes

  - Fixed Powerline glyphs sizes, alignment and offsets (fixes #26)
  - Fixed FAQ links in `.github/` (PR #132 @polyzen)
  - Fixed Homebrew command instructions in readme (PR #133 @teddy-error)
  - Fixed markdown rendering issues in readme (PR #148 @aloisdg)
  - Fixed glyph offsets (especially Powerline) (fixes #142)
  - Fixed incorrect typeface names on some fonts (fixes #126)
  - Fixed `Font Linux` screenshot with correct code points (fixes #138) (PR #149 @agriffis)
  - Fixed trailing spaces in readme (clean-up) (PR #167 @thyrlian)
  - Fixed wiki link in issue template (fixes #174) (PR #179 @kballard)
  - Fixed misc typos and link references in readme and `font-patcher` (PR #184 @reujab)
  - Fixed font family name conflicts by adding `Mono` to single-width fonts (fixes #176) (PR #178 @kballard)
  - Fixed `font-patcher` progress bar rounding output (PR #183 @reujab)
  - Fixed executing scripts from other directories (PR #185 @reujab)
  - Fixed missing glyph `e0ca` (ice waveform mirrored) (fixes #182)
  - Fixed `Hasklig` (`Hasklug`) SIL OFL compliance issue
  - Fixed missing or out of date patched font readmes
  - Fixed `font-patcher` glyph set count not ignoring empty codepoints
  - Fixed `font-patcher` progress bars stopping at incorrect percentage

## v1.0.0

### New Features
  - Added 6 new fonts:
    - Code New Roman (enhancement #85)
    - Gohu (enhancement #90)
    - Hasklig (enhancement PR #103) (@jrolfs)
    - Mononoki (enhancement #89)
    - Share Tech Mono (enhancement #105)
    - Space Mono (enhancement #93)
  - Added new Glyph Sets:
    - [Font Awesome Extension](http://andrelzgava.github.io/font-awesome-extension/) (Over 170 glyphs) (enhancement #96)
    - [IEC Power Symbols](http://unicodepowersymbol.com/) (enhancement #94)
  - Added additional methods to download the fonts:
    - Support for [Home Brew fonts](https://github.com/caskroom/homebrew-fonts) (enhancement #72)
    - Archive downloads via releases with scripts to generate archive downloads for patched fonts (enhancement #32)
  - Added single Nerd Fonts glyphs only fonts for Fontconfig aliasing (enhancement #84)
  - Added TTF version of Terminess (Terminus) font (fixes #23)
  - Added support for custom symbol fonts (with `--custom` flag) (PR #107 @sharkusk)
  - Added progress bars options: `--progressbars` & `--no-progressbars` to patcher script
  - Added `--postprocess` flag to allow additional scripts to run after patching (related to #70)

### Updates / Improvements
  - Improved repository size greatly (partially fixes #73)
    - Provides only `complete` version of patched fonts by default (others are still possible via patcher script)
  - Removed `minimal` version of patched fonts (not particularly useful)
  - Removed `variation` versions of patched fonts and instead provides generated list of commands for each combination
  - Updated Font Awesome to the latest version v4.7.0:
    - https://github.com/FortAwesome/Font-Awesome/releases/tag/v4.7.0
    - https://github.com/FortAwesome/Font-Awesome/issues?q=milestone%3A4.7.0
  - Updated Octicons font from [v3.2.0](https://github.com/github/octicons/releases/tag/v3.2.0) to [v4.4.0](https://github.com/github/octicons/releases/tag/v4.4.0)
    - Last version with [font support](https://github.com/primer/octicons/issues/108)
    - Adds glyphs: `verified`, `smiley`, `unverified`, `ellipses`, `file`, `grabber`, `plus-small`, `reply`
    - Various glyph modifications and fixes
  - Updated [DejaVu Sans Mono](http://dejavu-fonts.org/wiki/Changelog) from version 2.33 to 2.37
  - Updated readme with information on shallow cloning (enhancement #102)
  - Updated readme with better readability, prose, and removes some passive voice issues
  - Updated sankey diagram in readme with a more visual representation of the glyphs combined
  - Updated readability and format of changelog (even past versions)
  - Removed redundant flag `--limit-font-name-length`

### Fixes
  - Added missing glyphs in range `2630` through `2637` (trigrams) to DejaVu Sans Mono (fixes #100)
  - Fixed various missing glyphs such as `heart`, `zap`, `desktop` (fixes #87)
  - Fixed several long standing issues (fix & enhancement PR #107) (@sharkusk)
    - glyphs (scaling and positioning) (fixes #74, #37)
    - Monospaced font issues
    - Windows and macOS issues (fixes #111)
  - Fixed font name for glyph font 'PowerlineExtraSymbols.otf' (fixes #109)
  - Fixed and tweaked various powerline gaps (PR #107 @sharkusk)
  - Fixed Hack hints being removed in patched versions (Knack) (fixes #70, with help from @chrissimpkins)
  - Fixed various issues with '--careful' flag (PR #107 @sharkusk)
  - Fixed missing codepoint conflict information for Octicons & Font Awesome (fixes #116) (image from @kaymmm)
  - Fixed and refactored various code logic and style
  - Fixed missing Powerline glyphs in `MPlus` font (fixes #40)

## v0.8.0
  - Added 2 new fonts:
    - [Fantasque Sans Mono](https://github.com/belluzj/fantasque-sans) (enhancement #80)
    - [Iosevka](https://github.com/be5invis/Iosevka) (enhancement #81)
  - Added new Glyph set: [Font Linux](https://github.com/Lukas-W/font-linux) (enhancement #75)
  - Updated font install script to limit to a single font family (more typical use case) (enhancement PR #82) (@rawkode)
  - Updated readme: Misc readability tweaks and clean-up
  - Fixed Powerline Symbols not correctly rendering (if font already has the symbols) (fixes #78)
  - Fixed AttributeError with Python 3 version of font patcher script (fixes #79)
  - Fixed certain Hack/Knack font style sets by updating version of Hack to [v2.020](https://github.com/chrissimpkins/Hack/releases/tag/v2.020) (fixes #63)

## v0.7.0
  - Added 3 new fonts:
    - Monoid (enhancement #54)
    - Roboto Mono (enhancement #55)
    - Fira Code (enhancement PR #62, fixes #59) (@jrolfs)
  - Added 1 new font variant:
    - Proggy Clean (Slashed Zero) (fixes #69)
  - Added contributing and issue PR templates (enhancement #66)
  - Added Python 3 version of the font-patcher script (fixes #49)
  - Improved explanation of font choices (complete vs alternative vs minimal choices) with bash script to maintain (fixes #52)
  - Updated Hack to v2.019 (fixes #53)
  - Updated Font Awesome to the latest version v4.5.0 (20 new icons) (fixes #48):
    - https://github.com/FortAwesome/Font-Awesome/releases/tag/v4.5.0
    - https://github.com/FortAwesome/Font-Awesome/issues?q=milestone%3A4.5.0
  - Fixed fonts showing as duplicates in OS X Font Book (fixes #56, enhancement PR #61) (@jrolfs)
  - Fixed Powerline Symbols not being applied correctly to patched fonts since v0.5.0 (fixes #68, fix PR #71) (@F1LT3R)

## v0.6.1
  - Added 'font installation' section from [vim-devicons](https://github.com/ryanoasis/vim-devicons) with changes (enhancement PR #47) (@her)
  - Improved various readme updates and fixes: Improved section headers, gitter badge, misc
  - Fixed possible error with '--careful' flag (fixes #45)
  - Fixed default font directory on linux install script to `~/.local/share/fonts` as the previous was deprecated (fix PR #51) (@shaief)
  - Fixed broken curl download example (fixes #50)
- v0.6.0
  - Updated Font naming conventions and directory paths that are more manageable (partially fixes #32, #42)
  - Updated Font variations to use same Font Family (partially fixes #25, #42)
  - Updated Hack/Knack font to [v2.018](https://github.com/chrissimpkins/Hack/releases/tag/v2.018) (enhancement #39)
  - Updated Source Code Pro (Sauce Code Pro) font to [v2.010/v1.030](https://github.com/adobe-fonts/source-code-pro/releases/tag/2.010R-ro%2F1.030R-it) (enhancement #33)
  - Updated Octicons font to [v3.2.0](https://github.com/github/octicons/releases/tag/v3.2.0) plus latest master commits
  - Updated readme with alternate OSX install and execution options (enhancement #38)
  - Improved performance of 'Multiple Fonts Patcher (Gotta Patch 'em All Font Patcher!) by using parallelization (background processes) (enhancement #44)
  - Added new flag/option to font patcher (--outputdir) to allow specifying where to save patched font instead of current directory (enhancement #44)
  - Added 'Powerline Extra' symbols (enhancement #30, #35)
  - Added more Glyphs from Vim-devicons glyph set (various folders, Go, Windows logo, Vim logo, etc)
  - Fixed patched fonts not retaining glyph names (fixes #41)
  - Fixed Ligatures being lost/overwritten when patching (fixes #43)
  - Regenerated all patched fonts

## v0.5.1
  - Added Gitter chat badge
  - Updated readme with badges

## v0.5.0
  - Added Hack font (as 'Knack' for now) (enhancement PR #28) (@cheba)
  - Updated and improved all fonts patcher script (enhancement PR #27) (@cheba)
  - Updated Font Awesome to the latest version v4.4.0
    - for more details see https://github.com/FortAwesome/Font-Awesome/releases/tag/v4.4.0
  - Updated readme with Reserved Font Name info, Hack font, and various version updates
  - Updated the directory structures to make it easier to find font styles
  - Updated all patch fonts to use latest changes and fixes
  - Fixed unicode codepoints for Font Awesome glyphs (fixes #31)
  - Fixed potential SIL Open Font License (OFL) issue with 'Fira Mono' (patched as 'Fura')

## v0.4.1
  - Fixed wrong em sizes on some glyphs (particularly Font Awesome) (fixes #24)
    - Regenerated all patched fonts
  - Added version, comment and fontlog (with changelog notes) to fonts
  - Added image: non text version of patcher logo
  - Removed misc unnecessary code (clean-up)
  - Updated changelog: added missing release details and updated other releases

## v0.4.0
 - Added support for 'octicons', 'font-awesome' font glyphs
 - Added missing font combinations
 - Added Hermit (as 'Hurmit' to comply with SIL Open Font License (OFL)) font
 - Added more sample fonts (Hermit and SourceCodePro variants)
 - Added logos
 - Added 'Code of Conduct'
 - Added missing Pomicons.otf source file and update .gitignore (fixes #19)
 - Added 'all fonts patcher script' pattern parameter support (fuzzy matching)
 - Updated readme: python-fontforge minimum version & link to FontForge install docs (enhancement PR #18) (@blueyed)
 - Updated readme: various misc improvements and fixes
 - Fixed font-patcher to only load Pomicons.otf with '--pomicons' flag (enhancement PR #20) (fixes #19) (@blueyed)
 - Fixed other misc issues
 - Added font files versioning

## v0.3.1
 - Updated readme
 - Fixed font patcher output name for Mono fonts
 - Fixed patcher overwriting fonts with 'Mono' versions preventing all combinations from being generated (only 220 instead of 352)
 - Fixed more possible license issues by completely removed 'Input Mono' font related files
 - Fixed all patched fonts: Re-patched all the fonts due to issue with font patcher and all fonts

## v0.3.0
 - Added new fonts, set up unpatched sources, and set up patched version folders (enhancement #10)
   - Fonts: 3270, Aurulent Sans Mono, Bitstream Vera Sans Mono, Heavy Data, Lekton, MPlus (M+), ProFont
 - Added script to re-patch all of the fonts (work in progress) for enhancement (enhancement #11)
 - Added pomicon glyphs (enhancement #14)
 - Updated devicons font source to latest version 1.8.0 release
 - Updated the range to include new glyphs from latest devicons 1.8.0 (work toward but NOT does not fix #12)
 - Updated scripts and files: various clean-up and refactoring tasks
 - Updated readme

## v0.2.1
 - Added fonts install script for Linux and Mac OS (enhancement PR #5) (@srijanshetty)
 - Added detection and warnings when using unsupported (old) fontforge versions (fixes #6)
 - Added missing patched fonts
 - Fixed Licensing compliance issues (#7)
   - includes removing PragmataPro (@abl)
 - Updated readme: misc updates and tweaks

## v0.2.0
 - True mono support
   - Script can now build single and double width glyphs!
 - Added details of cli parameters and updated fonts list with the true mono spaced fonts (#4)
 - Added/fixed mono fonts single width glyphs support
 - Updated readme

## v0.1.2
 - Updated readme with better description and explanation of the options available
 - Added new unpatched font PragmataPro for Powerline
 - Added new patched font PragmataPro for Powerline Plus Nerd File Types

## v0.1.1
 - Fixes scaling issues in first set of glyphs in certain fonts (fixes issue #1)

## v0.1.0
 - Release
 - Inital port from 'features/1-script-patch-fonts' branch on vim-webdevicons repo
