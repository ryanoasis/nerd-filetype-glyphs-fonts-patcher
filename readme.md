<h1 align="center">
  <img src="images/nerd-fonts-logo.svg" alt="Nerd Fonts Logo" />
</h1>
<h2 align="center">
  <img alt="Iconic font aggregator, collection, and patcher" src="images/project-subtitle-phrase.svg">
</h2>

<div align="center">

[Releases][release]&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Fonts](#patched-fonts)&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Font Patcher](#font-patcher)&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Wiki Documentation][wiki]&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Stickers][stickers]&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[VimDevIcons][vim-devicons]


[![GitHub release][img-version-badge]][repo] [![Gitter][img-gitter-badge]][gitter] [![Code of Conduct][coc-badge]][coc] [![PRs Welcome][prs-badge]][prs]  <a href="#patched-fonts" title=""><img src="https://raw.githubusercontent.com/wiki/ryanoasis/nerd-fonts/images/faux-shield-badge-os-logos.svg?sanitize=true" alt="Nerd Fonts - OS Support"></a>


</div>


**Nerd Fonts** is a project that patches developer targeted fonts with a high number of glyphs (icons). Specifically to add a high number of extra glyphs from popular 'iconic fonts' such as [Font Awesome][font-awesome], [Devicons][devicons], [Octicons][octicons], and [others](#glyph-sets).

The following flow diagram shows the current glyph sets included:

<p align="center">
  <img src="images/sankey-glyphs-combined-diagram.svg" alt="@SankeyMATIC Diagram" />
</p>
<sub><i>Diagram created using <a href="http://sankeymatic.com/" title="SankeyMATIC (BETA): A Sankey diagram builder for everyone">@SankeyMATIC</a></i></sub>


## Important Notices
* `master` branch file paths are **not** considered stable. [Verify your repository URI references](#unstable-file-paths)
* cloning this repository is **not** recommended ([due to Repo size](#option-9-clone-the-repo)) unless you are going to be [contributing to development](#contributing)


## Table of Contents

[**TL;DR**](#tldr)

[**Installation Options**](#font-installation)
  * [**1 - Release Archive Download**](#option-1-release-archive-download)
  * [**2 - Homebrew Fonts (macOS (OS X))**](#option-2-homebrew-fonts)
  * [**3 - Chocolatey or Scoop (Windows)**](#option-3-unofficial-chocolatey-or-scoop-repositories)
  * [**4 - Arch Linux Repository (Extra, AUR)**](#option-4-arch-extra-repository)
  * [**5 - PowerShell Installer (Multi-Platform)**](#option-5-powershell-installer)
  * [**6 - Ad Hoc Curl Download**](#option-6-ad-hoc-curl-download)
  * [**7 - Install Script**](#option-7-install-script)
  * [**8 - Use Fontfallback**](#option-8-font-fallback)
  * [**9 - Clone Repo**](#option-9-clone-the-repo)
  * [**10 - Patch Your Own Font**](#option-10-patch-your-own-font)

[**Features**](#features)
  * [**Glyph/Icon sets**](#glyph-sets)
  * [**Patched Fonts**](#patched-fonts)
  * [**Variations**](#variations)
  * [**Font Patcher**](#font-patcher)

[**Developer / Contributor**](#font-patcher)
  * [**Font Patcher**](#font-patcher)
  * [**Gotta Patch 'em All Font Patcher!**](#gotta-patch-em-all)
  * [**Other Good Fonts to Patch**](#other-good-fonts-to-patch)
  * [**Contributing**](#contributing)

[**Project Motivation**](#project-motivation)

**Additional Info**
  * [**In case of problems**](#common-problems)
  * [**Unstable file paths on master**](#unstable-file-paths)
  * [**Changelog**](#changelog)
  * [**License**](#license)


## TL;DR
  Nerd Fonts takes popular programming fonts and adds a bunch of Glyphs.
  There is also a [font patcher](#font-patcher) available if your desired font isn't already patched.
  For more high level information see the [wiki][wiki]. If you are looking for the Vim plugin see [VimDevIcons ➶][vim-devicons].

### Various Download Options for Fonts

_If you..._

  * `Option 1.` want to download a **font family** package of variations (bold, italic, etc.) see [download an archive](#option-1-release-archive-download)
  * `Option 2.` are on **macOS** and want to use **Homebrew** see [Homebrew Fonts](#option-2-homebrew-fonts)
  * `Option 3.` are on **Windows** and want to use **Chocolatey** or **Scoop** see [Unofficial Chocolatey or Scoop Repositories](#option-3-unofficial-chocolatey-or-scoop-repositories)
  * `Option 4.` are on **Arch Linux** and want to use **Extra packages** see [Arch Extra Repositories](#option-4-arch-extra-repository)
  * `Option 5.` are using **PowerShell** and want an **interactive setup** or **use in scripts** see the [PowerShell Installer](#option-5-powershell-installer)
  * `Option 6.` want to use the **`curl` command** or use in **scripts** see [Ad Hoc Curl Download](#option-6-ad-hoc-curl-download)
  * `Option 7.` want to **automate** installing or use in **scripts** see the [Install Script](#option-7-install-script)
  * `Option 8.` want to install only one font for all fonts see [Font Fallback](#option-8-font-fallback)
  * `Option 9.` want **complete control** then see [cloning the repo](#option-9-clone-the-repo)
  * `Option 10.` want to patch your own font see the [Font Patcher](#option-10-patch-your-own-font)

## Features
* A [FontForge Python script](#font-patcher) to patch any font
  * Includes an option to create **Monospaced (fixed-pitch, fixed-width)** _or_ **double-width (non-monospaced)** glyphs
  * For more details see the [**Font Patcher**](#font-patcher) section
* **`67`** already [patched font families](#patched-fonts)
* Over **`10,000`** glyphs/icons combined [(more details)](#combinations)
  * Current glyph sets include: [Powerline with Extra Symbols][ryanoasis-powerline-extra-symbols], [Font Awesome][font-awesome], [Material Design Icons][font-material-design-icons], [Weather][font-weather], [Devicons][devicons], [Octicons][octicons], [Font Logos][font-logos] (Formerly Font Linux), [Pomicons][gabrielelana-pomicons], [Codeicons][codicons]
* **Monospaced (fixed-pitch, fixed-width)** _or_ **double-width (non-monospaced)** _or_ **proportional** glyphs version of each font
  * This refers to the Nerd Font glyphs themselves not necessarily the Font as a whole
* A Developer/Contributor provided [bash script](#gotta-patch-em-all) to re-patch all the fonts


## Glyph Sets

:mag: :mag: You can search for glyphs easily on [NerdFonts.com][Cheat Sheet] via the [Cheat Sheet][]

See [Wiki: Glyph Sets and Codepoints for more details][wiki-glyph-sets-codepoints]

### Icon names in shell

See [Wiki: Icon names in shell][wiki-icon-names-in-shell]

## Patched Fonts

A preview of all fonts can be found [here](https://www.nerdfonts.com/font-downloads).

| Font Name                                         | Original Font Name and Repository      | ver        |\*RFN |
|:--------------------------------------------------|:---------------------------------------|:-----------|:-----|
| [0xProto Nerd Font][p-0xProto]                    | [0xProto][f-0xProto]                   | 2.300      | NO   |
| [3270 Nerd Font][p-3270]                          | [3270][f-3270]                         | 3.0.1      | NO   |
| [AdwaitaMono Nerd Font][p-adwaita-mono]           | [Adwaita Mono][f-adwaita-mono]         | 32.4       | NO   |
| [Agave Nerd Font][p-agave]                        | [Agave][f-agave]                       | 37         | NO   |
| [AnonymicePro Nerd Font][p-anonymous-pro]         | [Anonymous Pro][f-a-pro]               | 1.002      | YES  |
| [Arimo Nerd Font][p-arimo]                        | [Arimo][f-arimo]                       | 1.33       | NO   |
| [AtkynsonMono Nerd Font][p-atkinson-mono]         | [Atkinson Hyperlegible Mono][f-atkinson]| 2.001     | YES  |
| [AurulentSansMono Nerd Font][p-aurulent]          | Aurulent Sans Mono (Stephen G. Hartke) |            | NO   |
| [BigBlueTerminal Nerd Font][p-bigblueterm]        | BigBlueTerminal (VileR)                |            | NO   |
| [BitstromWera Nerd Font][p-bitstream]             | Vera Sans Mono (Bitstream Inc)         | 1.1        | YES  |
| [BlexMono Nerd Font][p-blex]                      | [IBM Plex Mono][f-ibm-plex]            | 2.004      | YES  |
| [CaskaydiaCove Nerd Font][p-cascadia]             | [Cascadia Code][f-cascadia]            | 2407.24    | YES  |
| [CaskaydiaMono Nerd Font][p-cascadia-mono]        | [Cascadia Mono][f-cascadia]            | 2407.24    | YES  |
| [CodeNewRoman Nerd Font][p-code-nr]               | Code New Roman (Sam Radian)            | 2.0        | NO   |
| [ComicShannsMono Nerd Font][p-comic]              | [Comic Shanns Mono][f-comic]           | 1.3.1      | NO   |
| [CommitMono Nerd Font][p-commit]                  | [Commit Mono][f-commit]                | 1.143      | NO   |
| [Cousine Nerd Font][p-cousine]                    | [Cousine][f-cousine]                   | 1.211      | NO   |
| [D2Coding Nerd Font][p-d2coding]                  | [D2Coding][f-d2coding]                 | 1.3.2      | NO   |
| [DaddyTimeMono Nerd Font][p-daddytimemono]        | [DaddyTimeMono][f-daddytimemono]       | 1.2.3      | NO   |
| [DepartureMono Nerd Font][p-departuremono]        | [Departure Mono][f-departuremono]      | 1.422      | NO   |
| [DejaVuSansMono Nerd Font][p-dejavu]              | [DejaVu][f-dejavu]                     | 2.37       | NO   |
| [DroidSansMono Nerd Font][p-droid]                | Droid Sans Mono (Ascender Corp)        | 1.00-113   | NO   |
| [EnvyCodeR Nerd Font][p-envy]                     | [Envy Code R][f-envy]                  | 0.79       | YES  |
| [FantasqueSansMono Nerd Font][p-fantasque]        | [Fantasque Sans Mono][f-fant]          | 1.8.0      | NO   |
| [FiraCode Nerd Font][p-fira-code]                 | [Fira Code][f-fira-code]               | 6.2        | NO   |
| [FiraMono Nerd Font][p-fira-mono]                 | [Fira Mono][f-fira-mono]               | 3.206      | NO   |
| [GeistMono Nerd Font][p-geist-mono]               | [Geist Mono][f-geist-mono]             | 1.401      | NO   |
| [GoMono Nerd Font][p-go-mono]                     | [Go-Mono][f-go-mono]                   | 2.010      | NO   |
| [Gohu Nerd Font][p-gohu]                          | [Gohu TTF][f-gohu2], [Gohu][f-gohu]    | 2.0        | NO   |
| [Hack Nerd Font][p-hack]                          | [Hack][f-hack]                         | 3.003      | NO   |
| [Hasklug Nerd Font][p-hasklig]                    | [Hasklig][f-hasklig]                   | 1.2        | YES  |
| [HeavyDataMono Nerd Font][p-heavy-data]           | HeavyData (Vic Fieger)                 | 1          | NO   |
| [Hurmit Nerd Font][p-hermit]                      | [Hermit][f-hermit]                     | 2.0        | YES  |
| [iM-Writing Nerd Font][p-im-writing]              | [iA-Writer][f-ia-writer]               | Dec 2018   | YES  |
| [Inconsolata Nerd Font][p-inconsolata]            | [Inconsolata][f-inconsolata]           | 3.000      | NO   |
| [InconsolataGo Nerd Font][p-inconsolata-go]       | [InconsolataGo][f-inconsolatago]       | 1.013      | NO   |
| [Inconsolata LGC Nerd Font][p-inconsolata-lgc]    | [Inconsolata LGC][f-inconsolatalgc]    | 1.13       | NO   |
| [IntoneMono Nerd Font][p-intel-one-mono]          | [Intel One Mono][f-intel-one-mono]     | 1.4.0      | YES  |
| [Iosevka Nerd Font][p-iosevka]                    | [Iosevka][f-iosevka]                   | 33.2.1     | NO   |
| [IosevkaTerm Nerd Font][p-iosevka-term]           | [Iosevka Term][f-iosevka]              | 33.2.1     | NO   |
| [IosevkaTermSlab Nerd Font][p-iosevka-term-slab]  | [Iosevka Term Slab][f-iosevka]         | 33.2.1     | NO   |
| [JetBrainsMono Nerd Font][p-jetbrains-mono]       | [JetBrains Mono][f-jetbrains-mono]     | 2.304      | NO   |
| [Lekton Nerd Font][p-lekton]                      | [Lekton][f-lekton]                     | 34         | NO   |
| [Literation Nerd Font][p-liberation]              | [Liberation][f-liberation]             | 2.1.5      | YES  |
| [Lilex Nerd Font][p-lilex]                        | [Lilex][f-lilex]                       | 2.600      | NO   |
| [MartianMono Nerd Font][p-martian]                | [MartianMono][f-martian]               | 1.1.0      | NO   |
| [Meslo Nerd Font][p-meslo]                        | [Meslo][f-meslo]                       | 1.21       | NO   |
| [Monaspice Nerd Font][p-monaspace]                | [Monaspace][f-monaspace]               | 1.200      | YES  |
| [Monofur Nerd Font][p-monofur]                    | Monofur (Tobias B Koehler)             | 1.0        | NO   |
| [Monoid Nerd Font][p-monoid]                      | [Monoid][f-monoid]                     | 0.61       | NO   |
| [Mononoki Nerd Font][p-mononoki]                  | [Mononoki][f-mononoki]                 | 1.6        | YES  |
| [M+ Nerd Font][p-mplus]                           | [MPlus Fonts][f-mplus]                 | 1.007      | NO   |
| [Noto Nerd Font][p-noto]                          | [Noto][f-noto]                         | div        | NO   |
| [OpenDyslexic Nerd Font][p-opendyslexic]          | [OpenDyslexic][f-opendyslexic]         | 2.001      | NO   |
| [Overpass Nerd Font][p-overpass]                  | [Overpass][f-overpass]                 | 3.0.5      | NO   |
| [ProFont Nerd Font][p-profont]                    | [ProFont][f-profont]                   | 2.3, 2.2   | NO   |
| [ProggyClean Nerd Font][p-proggy-clean]           | ProggyClean (Tristan Grimmer)          | 2004/04/15 | NO   |
| [RecMono Nerd Font][p-recursive]                  | [Recursive Mono][f-recursive]          | 1.085      | NO   |
| [RobotoMono Nerd Font][p-roboto]                  | [Roboto Mono][f-roboto]                | 3.0        | NO   |
| [SauceCodePro Nerd Font][p-source-code-pro]       | [Source Code Pro][f-source]            | 2.042      | YES  |
| [ShureTechMono Nerd Font][p-share-tech-mono]      | [Share Tech Mono][f-share]             | 1.003      | YES  |
| [SpaceMono Nerd Font][p-space-mono]               | [Space Mono][f-space]                  | 1.001      | NO   |
| [Terminess Nerd Font][p-terminus]                 | [Terminus TTF][f-terminus]             | 4.49.3     | YES  |
| [Tinos Nerd Font][p-tinos]                        | [Tinos][f-tinos]                       | 1.23       | NO   |
| [Ubuntu Nerd Font][p-ubuntu]                      | [Ubuntu Font][f-ubuntu]                | 0.83       | NO   |
| [UbuntuMono Nerd Font][p-ubuntu-mono]             | [Ubuntu Font][f-ubuntu]                | 0.80       | NO   |
| [UbuntuSans Nerd Font][p-ubuntu-sans]             | [Ubuntu Sans][f-ubuntu-sans]           | 1.006      | NO   |
| [VictorMono Nerd Font][p-victor]                  | [Victor Mono][f-victor]                | 1.5.6      | NO   |
| [ZedMono Nerd Font][p-zed-mono]                   | [Zed Mono][f-zed-mono]                 | 1.2.0      | NO   |

<sub>_\*RFN = Reserved Font Name_</sub>

### Variations

- no flags given (defaults to only **Seti-UI + Custom** and **[Devicons][devicons]**)
- **double _(variable/proportional)_** or **single _(fixed/monospaced)_** or **proportional** width icon-glyphs
- [Font Awesome][font-awesome]
- [Font Awesome Extension][font-awesome-extension]
- [Material Design Icons][font-material-design-icons]
- [Weather][font-weather]
- [GitHub Octicons][octicons]
- [Font Logos][font-logos] (Formerly Font Linux)
- [Powerline Extra Symbols][ryanoasis-powerline-extra-symbols]
- [IEC Power Symbols][website-iecpower]
- [Pomicons][gabrielelana-pomicons]
- [Codicons][codicons]

## Font Installation

Some of the options below just help you to download the font file(s) (i.e. `.ttf` or `.otf`) or archives of font files.
These must be installed on your system, depending on your OS. Usually (double) clicking the font files individually does the trick.
Ask your OS' community if installing a font file is a problem.

### `Option 1: Release Archive Download`

> Best option if you want an **archive** or complete **font family** of variations (Bold, Italic, etc.).

Fonts are available for download as packages in the [latest release](https://github.com/ryanoasis/nerd-fonts/releases/latest)
A nice overview is [on the Nerd Font site](https://www.nerdfonts.com/font-downloads) (but misses the more compact `xv` archives).

If you want download the latest release of a given font inside a script you can use (replace "JetBrainsMono" with your font):
```sh
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
```

### `Option 2: Homebrew Fonts`

> Best option if on **macOS** and want to use **Homebrew**.

All fonts are available via [Homebrew Cask](https://github.com/Homebrew/homebrew-cask) on macOS (OS X)

```sh
brew install font-hack-nerd-font
```

_On Linux you have to add `--cask` after `install`._

### `Option 3: Unofficial Chocolatey or Scoop Repositories`

> Option for **Windows** and wanting to use **Chocolatey** or **Scoop**.

Chocolatey users can download fonts published to the [Chocolatey Community Repository (CCR)](https://community.chocolatey.org/packages):

```powershell
choco install nerd-fonts-hack
```

Scoop users can download fonts using the [Scoop bucket for Nerd Fonts](https://github.com/matthewjberger/scoop-nerd-fonts):

```powershell
scoop bucket add nerd-fonts
scoop install Hack-NF
```

### `Option 4: Arch Extra Repository`

> Option for **Arch Linux** and wanting to use **Extra packages**.

Most fonts are available via [Arch Extra packages](https://archlinux.org/groups/any/nerd-fonts/).
Some special packages are [in AUR](https://aur.archlinux.org/packages?K=nerd-fonts-&outdated=off).

### `Option 5: PowerShell Installer`

> Best option for **interactive setup guidance** or **automating** installations through **PowerShell scripts**.

#### PSModule NerdFonts

This is a 3rd-party community tool. More information can be found on its GitHub repository [here](https://github.com/PSModule/NerdFonts).

To install the module:

```powershell
Install-PSResource -Name NerdFonts
Import-Module -Name NerdFonts
```

To install one font:

```powershell
Install-NerdFont -Name 'FiraCode' # Tab completion works on name
```

#### Powershell Web Installer

This is a 3rd-party community tool. More information can be found on its GitHub repository [here](https://github.com/jpawlowski/nerd-fonts-installer-PS).

- **Requires PowerShell 7+** to be installed on Windows, macOS, or Linux.
- **Windows PowerShell 5.1** is also supported.

To run the interactive installer, use the following command:

```powershell
& ([scriptblock]::Create((iwr 'https://to.loredo.me/Install-NerdFont.ps1')))
```

To install specific fonts directly, use the following command:

```powershell
& ([scriptblock]::Create((iwr 'https://to.loredo.me/Install-NerdFont.ps1'))) -Name hack, heavy-data
```

### `Option 6: Ad Hoc Curl Download`

> Option if you want to use the **`curl` command** or for use in **scripts**.

_Note_: Will not work to get newer fonts as they are not inside the repo anymore.

#### Linux

```sh
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf
```

_Note:_ deprecated alternative paths: `~/.fonts`

#### macOS (OS X)

```sh
cd ~/Library/Fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf
```

### `Option 7: Install Script`

> Best option if you want to **automate** installing or for use in **scripts**.

_Note_:
  - **Requires (shallow) cloning** the repo as of now :-(
  - Will not work to get newer fonts as they are not inside the repo anymore.

#### All fonts:

* Installs all the patched Fonts (_Warning: This is a lot of Fonts adding up to a large size_)

```sh
./install.sh
```

or, in PowerShell (Windows only):

```powershell
./install.ps1
```

#### Single font:

* Installs a single Font of your choice

```sh
./install.sh <FontName>
./install.sh Hack
./install.sh HeavyData
```

or, in PowerShell (Windows only):

```powershell
./install.ps1 <FontName>
./install.ps1 Hack
./install.ps1 HeavyData
./install.ps1 FiraCode, Hack
./install.ps1 DejaVuSansMono -WhatIf
```

### `Option 8: Font Fallback`
Most systems have a mechanism to search for an alternative font when the current font does not
have a glyph that is needed. For example you edit a Latin text and insert a Chinese character,
that glyph is taken not from your active font (it does not have it) but from some other font.

For this font fallback you can use one of the `SymbolsOnly` fonts.

For fontconfig based systems like Linux you can improve the behavior with the
`10-nerd-font-symbols.conf` configuration file, that needs to be manually installed.

* Pro: One symbol font is sufficient for all text fonts
* Con: Scaling and placement of the fallback symbols can be hit or miss

### `Option 9: Clone the Repo`

> Best option for **full control**, **all** or **some** of the fonts, or **contributing** to development.

_Note_: Will not work to get newer fonts as they are not inside the repo anymore.

A full clone of this repository is **not** required nor efficient (mostly due to Repository size) if you are simply only interested in a limited set of fonts.

If you do want to clone the entire repo be sure to _shallow_ clone:
```sh
git clone --depth 1
```

Even if you develop you probably do not need the old versions of the font files. With this command you have all commits but not all the old data - it will be loaded only if you check out old binaries (or do a blame):

```sh
git clone --filter=blob:none git@github.com:ryanoasis/nerd-fonts
```

If you want to clone just a sub-directory, use `git sparse-checkout`.

```sh
git clone --filter=blob:none --sparse git@github.com:ryanoasis/nerd-fonts
cd nerd-fonts
git sparse-checkout add patched-fonts/JetBrainsMono
```

### `Option 10: Patch Your Own Font`

> The option for **patching** your **own font** or fully **customizing** the patched font.

Use the provided Python command line script to generate a patched font from your own font to get the extra new glyphs

See: [Font Patcher](#font-patcher) for usage

* use this option if you do __not__ want to use one of the [fonts provided](#patched-fonts)
* you will still need to copy the generated font to the correct font directory on your system

## font-patcher

<p align="center">
  <img src="images/nerd-fonts-patcher-logo.png" alt="Nerd Fonts Patcher">
</p>

Patching the font of your own choosing:
* Use the script
  * Download script and its helper files as [archive](https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FontPatcher.zip) and extract
  * Just downloading the `font-patcher` script is not enough.
  * Requires: Fontforge, Python 3, `python-fontforge` and `argparse` packages
    * Fontforge can be installed as package
    * or on OSX via `brew install fontforge`
    * or as [AppImage](https://github.com/fontforge/fontforge/releases)
  * Usage, recommended:
  ```
  fontforge -script font-patcher PATH_TO_FONT
  ```
  * Usage, direct (more convenient call, if it works for you):
  ```
  ./font-patcher PATH_TO_FONT
  ```
  * Usage, with Fontforge AppImage

    _Note_: `chmod u+x` the AppImage after download. All supplied paths need to be **absolute** and an explicit output path is required! If everything is located in the same directory, you can use the `$PWD` shorthand.
  ```
  ./FontForge.AppImage -script $PWD/font-patcher $PWD/BaseFont.ttf -out /tmp
  ```

* Use docker
  * Default parallel tasks
  ```
  docker run --rm -v /path/to/fonts:/in:Z -v /path/for/output:/out:Z nerdfonts/patcher [OPTIONS]
  ```
  * Single process (slow)
  ```
  docker run --rm -v /path/to/fonts:/in:Z -v /path/for/output:/out:Z -e "PN=1" nerdfonts/patcher [OPTIONS]
  ```
  * Specify the parallel tasks number to 10
  ```
  docker run --rm -v /path/to/fonts:/in:Z -v /path/for/output:/out:Z -e "PN=10" nerdfonts/patcher [OPTIONS]
  ```


> [!NOTE]
> The resulting font's family (aka font name) will be set to the original family after CamelCasing, removing whitespace and appending ` Nerd Font`. For example, `iosevka term` would become `IosevkaTerm Nerd Font`.

Full options follow, see also [**page explaining all options**](https://github.com/ryanoasis/nerd-fonts/wiki/ScriptOptions):

```
Nerd Fonts Patcher v3.4.0-5 (4.20.3) (ff 20230101)
usage: font-patcher [--careful] [--debug [{0,1,2,3}]] [--extension EXTENSION]
                    [--help] [--makegroups [{-1,0,1,2,3,4,5,6}]] [--mono]
                    [--outputdir OUTPUTDIR] [--quiet] [--single-width-glyphs]
                    [--variable-width-glyphs] [--version] [--complete]
                    [--codicons] [--fontawesome] [--fontawesomeext]
                    [--fontlogos] [--material] [--octicons] [--pomicons]
                    [--powerline] [--powerlineextra] [--powersymbols]
                    [--weather] [--adjust-line-height] [--boxdrawing]
                    [--cell CELLOPT] [--configfile CONFIGFILE]
                    [--custom CUSTOM] [--dry] [--glyphdir GLYPHDIR]
                    [--has-no-italic] [--metrics {HHEA,TYPO,WIN}]
                    [--name FORCE_NAME] [--postprocess POSTPROCESS]
                    [--removeligs] [--xavgcharwidth [XAVGWIDTH]]
                    [--progressbars | --no-progressbars]
                    font

Nerd Fonts Font Patcher: patches a given font with programming and development related glyphs

* Website: https://www.nerdfonts.com
* Version: 3.4.0-5
* Development Website: https://github.com/ryanoasis/nerd-fonts
* Changelog: https://github.com/ryanoasis/nerd-fonts/blob/-/changelog.md

positional arguments:
  font                  The path to the font to patch (e.g., Inconsolata.otf)

options:
  --careful             Do not overwrite existing glyphs if detected
  --debug [{0,1,2,3}]   Verbose mode (optional: 1=just to file; 2*=just to terminal; 3=display and file)
  --extension EXTENSION, -ext EXTENSION
                        Change font file type to create (e.g., ttf, otf)
  --help, -h            Show this help message and exit
  --makegroups [{-1,0,1,2,3,4,5,6}]
                        Use alternative method to name patched fonts (default=1)
  --mono, -s            Create monospaced font, existing and added glyphs are single-width (implies --single-width-glyphs)
  --outputdir OUTPUTDIR, -out OUTPUTDIR
                        The directory to output the patched font file to
  --quiet, -q           Do not generate verbose output
  --single-width-glyphs
                        Whether to generate the glyphs as single-width not double-width (default is double-width) (Nerd Font Mono)
  --variable-width-glyphs
                        Do not adjust advance width (no "overhang") (Nerd Font Propo)
  --version, -v         Show program's version number and exit

Symbol Fonts:
  --complete, -c        Add all available Glyphs
  --codicons            Add Codicons Glyphs (https://github.com/microsoft/vscode-codicons)
  --fontawesome         Add Font Awesome Glyphs (http://fontawesome.io/)
  --fontawesomeext      Add Font Awesome Extension Glyphs (https://andrelzgava.github.io/font-awesome-extension/)
  --fontlogos           Add Font Logos Glyphs (https://github.com/Lukas-W/font-logos)
  --material, --mdi     Add Material Design Icons (https://github.com/templarian/MaterialDesign)
  --octicons            Add Octicons Glyphs (https://octicons.github.com)
  --pomicons            Add Pomicon Glyphs (https://github.com/gabrielelana/pomicons)
  --powerline           Add Powerline Glyphs
  --powerlineextra      Add Powerline Extra Glyphs (https://github.com/ryanoasis/powerline-extra-symbols)
  --powersymbols        Add IEC Power Symbols (https://unicodepowersymbol.com/)
  --weather             Add Weather Icons (https://github.com/erikflowers/weather-icons)

Expert Options:
  --adjust-line-height, -l
                        Whether to adjust line heights (attempt to center powerline separators more evenly)
  --boxdrawing          Force patching in (over existing) box drawing glyphs
  --cell CELLOPT        Adjust or query the cell size, e.g. use "0:1000:-200:800" or "?"
  --configfile CONFIGFILE
                        Specify a file path for configuration file (see sample: src/config.sample.cfg)
  --custom CUSTOM       Specify a custom symbol font, all glyphs will be copied; absolute path suggested
  --dry                 Do neither patch nor store the font, to check naming
  --glyphdir GLYPHDIR   Path to glyphs to be used for patching
  --has-no-italic       Font family does not have Italic (but Oblique), to help create correct RIBBI set
  --metrics {HHEA,TYPO,WIN}
                        Select vertical metrics source (for problematic cases)
  --name FORCE_NAME     Specify naming source ('full', 'postscript', 'filename', or concrete free name-string)
  --postprocess POSTPROCESS
                        Specify a Script for Post Processing
  --removeligs, --removeligatures
                        Removes ligatures specified in configuration file (needs --configfile)
  --xavgcharwidth [XAVGWIDTH]
                        Adjust xAvgCharWidth (optional: concrete value)
  --progressbars        Show percentage completion progress bars per Glyph Set (default)
  --no-progressbars     Don't show percentage completion progress bars per Glyph Set
```

#### Examples

```
./font-patcher Droid\ Sans\ Mono\ for\ Powerline.otf
./font-patcher Droid\ Sans\ Mono\ for\ Powerline.otf -s -q
./font-patcher Droid\ Sans\ Mono\ for\ Powerline.otf --mono --quiet

./font-patcher Inconsolata.otf --fontawesome
./font-patcher Inconsolata.otf --fontawesome --octicons --pomicons
./font-patcher Inconsolata.otf

./FontForge.AppImage -script /tmp/nerdfonts/font-patcher /tmp/nerdfonts/CascadiaMonoPL-Semibold.ttf --fontawesome -out /tmp
./FontForge.AppImage -script $PWD/font-patcher $PWD/CascadiaMonoPL-Semibold.ttf --octicons -out $HOME

docker run --rm -v ~/myfont/patchme:/in:Z -v ~/myfont/patched:/out:Z nerdfonts/patcher
docker run --rm -v ~/Desktop/myfont/patchme:/in:Z -v ~/Desktop/myfont/patched:/out:Z nerdfonts/patcher --fontawesome
```

Usually you want the `--complete` option.

<a name="gotta-patch-em-all"></a>
## Gotta Patch 'em All Font Patcher!

* for Contributor or Developer use

* re-patches **all** fonts in the unpatched directory:

  ```
  ./gotta-patch-em-all-font-patcher\!.sh
  ```

* can optionally limit to specific font name pattern:

  ```
  ./gotta-patch-em-all-font-patcher\!.sh Hermit
  ```

* or to specific directory name start:

  ```
  ./gotta-patch-em-all-font-patcher\!.sh /Heavy
  ```

Full options:

```
Usage: ./gotta-patch-em-all-font-patcher!.sh [OPTION] [FILTER]

    OPTION:
        -c, --checkfont     Create the font(s) in check-fonts/ instead
        -t, --keeptime      Try to preserve timestamp of previously patched
                            font in patched-fonts/ directory
        -v, --verbose       Show more information when running
        -i, --info          Rebuild JUST the readmes
        -j, --jobs          Run up to 8 patch processes in parallel
        -h, --help          Show this help

    FILTER:
        The filter argument to this script is a filter for the fonts to patch.
        The filter is a regex (glob * is expressed as [^/]*, see `man 7 glob`)
        All font files that start with that filter (and are ttf, otf, or sfd files) will
        be processed only.
          Example ./gotta-patch-em-all-font-patcher\!.sh "iosevka"
          Process all font files that start with "iosevka"
        If the argument starts with a '/' all font files in a directory that matches
        the filter are processed only.
          Example ./gotta-patch-em-all-font-patcher\!.sh "/iosevka"
          Process all font files that are in directory "iosevka"
```

## Contributing

See [contributing.md](contributing.md)

## Common Problems

Some solutions can be found on the Wiki, if you are lucky. For example hints to use the pager `less` are there:

* https://github.com/ryanoasis/nerd-fonts/wiki/FAQ-and-Troubleshooting
* https://github.com/ryanoasis/nerd-fonts/wiki/Terminal-Emulators
* https://github.com/ryanoasis/nerd-fonts/wiki/Reporting-Issues

## Unstable File Paths

:warning: Warning: File paths may change based on releases (especially **major** version bumps)

Reference the **release** tag or branch and _not_ the ~~master~~ branch because paths are subject to change for each release

* For example:
  * :white_check_mark: Use: <code>https\://github.com/ryanoasis/nerd-fonts/tree/<b>v3.0.0</b>/patched-fonts/Hermit/Regular/HurmitNerdFont-Regular.otf</code>
  * :white_check_mark: Use: <code>https\://github.com/ryanoasis/nerd-fonts/blob/<b>0.9.0</b>/patched-fonts/Hermit/Medium/complete/Hurmit%20Medium%20Nerd%20Font%20Complete.otf</code>
  * :x: Instead of: <code>https\://github.com/ryanoasis/nerd-fonts/blob/<del>master</del>/patched-fonts/Hermit/Medium/complete/Hurmit%20Medium%20Nerd%20Font%20Complete.otf</code>


## Other Good Fonts to Patch

Non exhaustive list of fonts that would benefit from being patched but are not included in Nerd Fonts due to their license (proprietary, commercial, etc.):

* [Consolas][consolas]
* [Dank Mono][dank]
* [Input Mono][input-mono]
* [Operator Mono][operator]
* [PragmataPro][pragmatapro]
* [SF Mono][sf-mono]


## Project Motivation

See [Wiki: Project Purpose][wiki-project-purpose]


## Changelog

See [changelog.md](changelog.md)

## License

See [LICENSE][LICENSE]

<!--
Repo References
-->

[vim-devicons]:https://github.com/ryanoasis/vim-devicons "VimDevIcons Vim Plugin (external link) ➶"
[devicons]:https://github.com/devicons/devicon
[font-awesome]:https://github.com/FortAwesome/Font-Awesome
[font-awesome-extension]:https://github.com/AndreLZGava/font-awesome-extension
[font-material-design-icons]:https://github.com/Templarian/MaterialDesign
[font-weather]:https://github.com/erikflowers/weather-icons
[octicons]:https://github.com/primer/octicons
[font-logos]:https://github.com/Lukas-W/font-logos
[gabrielelana-pomicons]:https://github.com/gabrielelana/pomicons
[Seti-UI]:https://atom.io/themes/seti-ui
[ryanoasis-powerline-extra-symbols]:https://github.com/ryanoasis/powerline-extra-symbols
[codicons]:https://github.com/microsoft/vscode-codicons
[wiki]:https://github.com/ryanoasis/nerd-fonts/wiki
[wiki-project-purpose]:https://github.com/ryanoasis/nerd-fonts/wiki/Project-Purpose
[wiki-glyph-sets-codepoints]:https://github.com/ryanoasis/nerd-fonts/wiki/Glyph-Sets-and-Code-Points
[wiki-icon-names-in-shell]:https://github.com/ryanoasis/nerd-fonts/wiki/Icon-Names-in-Shell
[repo]:https://github.com/ryanoasis/nerd-fonts
[gitter]:https://gitter.im/ryanoasis/nerd-fonts
[code-climate]:https://codeclimate.com/github/ryanoasis/nerd-fonts


<!--
Website References
-->

[website-iecpower]:https://unicodepowersymbol.com/
[Cheat Sheet]:https://nerdfonts.com/cheat-sheet
[stickers]:https://www.redbubble.com/people/ryanoasis/works/30764810-nerd-fonts-iconic-font-aggregator

<!--
Link References
-->

[badge-version]:https://badge.fury.io/gh/ryanoasis%2Fnerd-fonts
[badge-gitter]:https://gitter.im/ryanoasis/nerd-fonts?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge

[img-version-badge]:https://img.shields.io/github/release/ryanoasis/nerd-fonts.svg?style=for-the-badge
[img-gitter-badge]:https://img.shields.io/gitter/room/nwjs/nw.js.svg?style=for-the-badge
[img-code-climate-badge]:https://img.shields.io/codeclimate/issues/ryanoasis/nerd-fonts.svg?style=for-the-badge
[coc-badge]: https://img.shields.io/badge/code%20of-conduct-ff69b4.svg?style=for-the-badge
[prs-badge]: https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=for-the-badge&logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48c3ZnIGlkPSJzdmcyIiB3aWR0aD0iNjQ1IiBoZWlnaHQ9IjU4NSIgdmVyc2lvbj0iMS4wIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPiA8ZyBpZD0ibGF5ZXIxIj4gIDxwYXRoIGlkPSJwYXRoMjQxNyIgZD0ibTI5Ny4zIDU1MC44N2MtMTMuNzc1LTE1LjQzNi00OC4xNzEtNDUuNTMtNzYuNDM1LTY2Ljg3NC04My43NDQtNjMuMjQyLTk1LjE0Mi03Mi4zOTQtMTI5LjE0LTEwMy43LTYyLjY4NS01Ny43Mi04OS4zMDYtMTE1LjcxLTg5LjIxNC0xOTQuMzQgMC4wNDQ1MTItMzguMzg0IDIuNjYwOC01My4xNzIgMTMuNDEtNzUuNzk3IDE4LjIzNy0zOC4zODYgNDUuMS02Ni45MDkgNzkuNDQ1LTg0LjM1NSAyNC4zMjUtMTIuMzU2IDM2LjMyMy0xNy44NDUgNzYuOTQ0LTE4LjA3IDQyLjQ5My0wLjIzNDgzIDUxLjQzOSA0LjcxOTcgNzYuNDM1IDE4LjQ1MiAzMC40MjUgMTYuNzE0IDYxLjc0IDUyLjQzNiA2OC4yMTMgNzcuODExbDMuOTk4MSAxNS42NzIgOS44NTk2LTIxLjU4NWM1NS43MTYtMTIxLjk3IDIzMy42LTEyMC4xNSAyOTUuNSAzLjAzMTYgMTkuNjM4IDM5LjA3NiAyMS43OTQgMTIyLjUxIDQuMzgwMSAxNjkuNTEtMjIuNzE1IDYxLjMwOS02NS4zOCAxMDguMDUtMTY0LjAxIDE3OS42OC02NC42ODEgNDYuOTc0LTEzNy44OCAxMTguMDUtMTQyLjk4IDEyOC4wMy01LjkxNTUgMTEuNTg4LTAuMjgyMTYgMS44MTU5LTI2LjQwOC0yNy40NjF6IiBmaWxsPSIjZGQ1MDRmIi8%2BIDwvZz48L3N2Zz4%3D
[os-badge]:https://img.shields.io/badge/-OS-brightgreen.svg?style=for-the-badge&logoWidth=80&logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48c3ZnIHdpZHRoPSIzOS43NDFtbSIgaGVpZ2h0PSIxMy4zNzdtbSIgdmVyc2lvbj0iMS4xIiB2aWV3Qm94PSIwIDAgMzkuNzQxMjggMTMuMzc3MTI3IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOmNjPSJodHRwOi8vY3JlYXRpdmVjb21tb25zLm9yZy9ucyMiIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj48bWV0YWRhdGE%2BPHJkZjpSREY%2BPGNjOldvcmsgcmRmOmFib3V0PSIiPjxkYzpmb3JtYXQ%2BaW1hZ2Uvc3ZnK3htbDwvZGM6Zm9ybWF0PjxkYzp0eXBlIHJkZjpyZXNvdXJjZT0iaHR0cDovL3B1cmwub3JnL2RjL2RjbWl0eXBlL1N0aWxsSW1hZ2UiLz48ZGM6dGl0bGUvPjwvY2M6V29yaz48L3JkZjpSREY%2BPC9tZXRhZGF0YT48ZyB0cmFuc2Zvcm09Im1hdHJpeCguMzMwODMgMCAwIC4zMzA4MyAyNi41MDggLTEuNzc0MikiPjxwb2x5Z29uIHBvaW50cz0iMTcuNCAzOC4zIDIxLjUgNDAuNiAyNy43IDQwLjYgMzMuNSAzNi4yIDM2LjEgMjkuMyAzMC4xIDIyIDI4LjQgMTcuOSAyMC4xIDE4LjIgMjAuMiAyMC41IDE4LjYgMjMuNSAxNi4xIDI4LjQgMTUuNiAzMi41IiBmaWxsPSIjZWNlZmYxIi8%2BPHBhdGggZD0ibTM0LjMgMjMuOWMtMS42LTIuMy0yLjktMy43LTMuNi02LjZzMC4yLTIuMS0wLjQtNC42Yy0wLjMtMS4zLTAuOC0yLjItMS4zLTIuOS0wLjYtMC43LTEuMy0xLjEtMS43LTEuMi0wLjktMC41LTMtMS4zLTUuNiAwLjEtMi43IDEuNC0yLjQgNC40LTEuOSAxMC41IDAgMC40LTAuMSAwLjktMC4zIDEuMy0wLjQgMC45LTEuMSAxLjctMS43IDIuNC0wLjcgMS0xLjQgMi0xLjkgMy4xLTEuMiAyLjMtMi4zIDUuMi0yIDYuMyAwLjUtMC4xIDYuOCA5LjUgNi44IDkuNyAwLjQtMC4xIDIuMS0wLjEgMy42LTAuMSAyLjEtMC4xIDMuMy0wLjIgNSAwLjIgMC0wLjMtMC4xLTAuNi0wLjEtMC45IDAtMC42IDAuMS0xLjEgMC4yLTEuOCAwLjEtMC41IDAuMi0xIDAuMy0xLjYtMSAwLjktMi44IDEuOS00LjUgMi4yLTEuNSAwLjMtNC0wLjItNS4yLTEuNyAwLjEgMCAwLjMgMCAwLjQtMC4xIDAuMy0wLjEgMC42LTAuMiAwLjctMC40IDAuMy0wLjUgMC4xLTEtMC4xLTEuM3MtMS43LTEuNC0yLjQtMi0xLjEtMC45LTEuNS0xLjNsLTAuOC0wLjhjLTAuMi0wLjItMC4zLTAuNC0wLjQtMC41LTAuMi0wLjUtMC4zLTEuMS0wLjItMS45IDAuMS0xLjEgMC41LTIgMS0zIDAuMi0wLjQgMC43LTEuMiAwLjctMS4ycy0xLjcgNC4yLTAuOCA1LjVjMCAwIDAuMS0xLjMgMC41LTIuNiAwLjMtMC45IDAuOC0yLjIgMS40LTIuOXMyLjEtMy4zIDIuMi00LjljMC0wLjcgMC4xLTEuNCAwLjEtMS45LTAuNC0wLjQgNi42LTEuNCA3LTAuMyAwLjEgMC40IDEuNSA0IDIuMyA1LjkgMC40IDAuOSAwLjkgMS43IDEuMiAyLjcgMC4zIDEuMSAwLjUgMi42IDAuNSA0LjEgMCAwLjMgMCAwLjgtMC4xIDEuMyAwLjIgMCA0LjEtNC4yLTAuNS03LjcgMCAwIDIuOCAxLjMgMi45IDMuOSAwLjEgMi4xLTAuOCAzLjgtMSA0LjEgMC4xIDAgMi4xIDAuOSAyLjIgMC45IDAuNCAwIDEuMi0wLjMgMS4yLTAuMyAwLjEtMC4zIDAuNC0xLjEgMC40LTEuNCAwLjctMi4zLTEtNi0yLjYtOC4zeiIgZmlsbD0iIzI2MzIzOCIvPjxnIGZpbGw9IiNlY2VmZjEiPjxlbGxpcHNlIGN4PSIyMS42IiBjeT0iMTUuMyIgcng9IjEuMyIgcnk9IjIiLz48ZWxsaXBzZSBjeD0iMjYuMSIgY3k9IjE1LjIiIHJ4PSIxLjciIHJ5PSIyLjMiLz48L2c%2BPGcgZmlsbD0iIzIxMjEyMSI%2BPGVsbGlwc2UgdHJhbnNmb3JtPSJtYXRyaXgoLS4xMjU0IC0uOTkyMSAuOTkyMSAtLjEyNTQgOC45NzU0IDM4Ljk5NykiIGN4PSIyMS43IiBjeT0iMTUuNSIgcng9IjEuMiIgcnk9Ii43Ii8%2BPGVsbGlwc2UgY3g9IjI2IiBjeT0iMTUuNiIgcng9IjEiIHJ5PSIxLjMiLz48L2c%2BPGcgZmlsbD0iI2ZmYzEwNyI%2BPHBhdGggZD0ibTM5LjMgMzcuNmMtMC40LTAuMi0xLjEtMC41LTEuNy0xLjQtMC4zLTAuNS0wLjItMS45LTAuNy0yLjUtMC4zLTAuNC0wLjctMC4yLTAuOC0wLjItMC45IDAuMi0zIDEuNi00LjQgMC0wLjItMC4yLTAuNS0wLjUtMS0wLjVzLTAuNyAwLjItMC45IDAuNi0wLjIgMC43LTAuMiAxLjdjMCAwLjggMCAxLjctMC4xIDIuNC0wLjIgMS43LTAuNSAyLjctMC41IDMuNyAwIDEuMSAwLjMgMS44IDAuNyAyLjEgMC4zIDAuMyAwLjggMC41IDEuOSAwLjVzMS44LTAuNCAyLjUtMS4xYzAuNS0wLjUgMC45LTAuNyAyLjMtMS43IDEuMS0wLjcgMi44LTEuNiAzLjEtMS45IDAuMi0wLjIgMC41LTAuMyAwLjUtMC45IDAtMC41LTAuNC0wLjctMC43LTAuOHoiLz48cGF0aCBkPSJtMTkuMiAzNy45Yy0xLTEuNi0xLjEtMS45LTEuOC0yLjktMC42LTEtMS45LTIuOS0yLjctMi45LTAuNiAwLTAuOSAwLjMtMS4zIDAuN3MtMC44IDEuMy0xLjUgMS44Yy0wLjYgMC41LTIuMyAwLjQtMi43IDFzMC40IDEuNSAwLjQgM2MwIDAuNi0wLjUgMS0wLjYgMS40LTAuMSAwLjUtMC4yIDAuOCAwIDEuMiAwLjQgMC42IDAuOSAwLjggNC4zIDEuNSAxLjggMC40IDMuNSAxLjQgNC42IDEuNXMzIDAgMy0yLjdjMC4xLTEuNi0wLjgtMi0xLjctMy42eiIvPjxwYXRoIGQ9Im0yMS4xIDE5LjhjLTAuNi0wLjQtMS4xLTAuOC0xLjEtMS40czAuNC0wLjggMS0xLjNjMC4xLTAuMSAxLjItMS4xIDIuMy0xLjFzMi40IDAuNyAyLjkgMC45YzAuOSAwLjIgMS44IDAuNCAxLjcgMS4xLTAuMSAxLTAuMiAxLjItMS4yIDEuNy0wLjcgMC4yLTIgMS4zLTIuOSAxLjMtMC40IDAtMSAwLTEuNC0wLjEtMC4zLTAuMS0wLjgtMC42LTEuMy0xLjF6Ii8%2BPC9nPjxnIGZpbGw9IiM2MzQ3MDMiPjxwYXRoIGQ9Im0yMC45IDE5YzAuMiAwLjIgMC41IDAuNCAwLjggMC41IDAuMiAwLjEgMC41IDAuMiAwLjUgMC4yaDAuOWMwLjUgMCAxLjItMC4yIDEuOS0wLjYgMC43LTAuMyAwLjgtMC41IDEuMy0wLjcgMC41LTAuMyAxLTAuNiAwLjgtMC43cy0wLjQgMC0xLjEgMC40Yy0wLjYgMC40LTEuMSAwLjYtMS43IDAuOS0wLjMgMC4xLTAuNyAwLjMtMSAwLjNoLTAuOWMtMC4zIDAtMC41LTAuMS0wLjgtMC4yLTAuMi0wLjEtMC4zLTAuMi0wLjQtMC4yLTAuMi0wLjEtMC42LTAuNS0wLjgtMC42IDAgMC0wLjIgMC0wLjEgMC4xbDAuNiAwLjZ6Ii8%2BPHBhdGggZD0ibTIzLjkgMTYuOGMwLjEgMC4yIDAuMyAwLjIgMC40IDAuM3MwLjIgMC4xIDAuMiAwLjFjMC4xLTAuMSAwLTAuMy0wLjEtMC4zIDAtMC4yLTAuNS0wLjItMC41LTAuMXoiLz48cGF0aCBkPSJtMjIuMyAxN2MwIDAuMSAwLjIgMC4yIDAuMiAwLjEgMC4xLTAuMSAwLjItMC4yIDAuMy0wLjIgMC4yLTAuMSAwLjEtMC4yLTAuMi0wLjItMC4yIDAuMS0wLjIgMC4yLTAuMyAwLjN6Ii8%2BPC9nPjxwYXRoIGQ9Im0zMiAzNC43djAuM2MwLjIgMC40IDAuNyAwLjUgMS4xIDAuNSAwLjYgMCAxLjItMC40IDEuNS0wLjggMC0wLjEgMC4xLTAuMiAwLjItMC4zIDAuMi0wLjMgMC4zLTAuNSAwLjQtMC42IDAgMC0wLjEtMC4xLTAuMS0wLjItMC4xLTAuMi0wLjQtMC40LTAuOC0wLjUtMC4zLTAuMS0wLjgtMC4yLTEtMC4yLTAuOS0wLjEtMS40IDAuMi0xLjcgMC41IDAgMCAwLjEgMCAwLjEgMC4xIDAuMiAwLjIgMC4zIDAuNCAwLjMgMC43IDAuMSAwLjIgMCAwLjMgMCAwLjV6IiBmaWxsPSIjNDU1YTY0Ii8%2BPC9nPjxnIHRyYW5zZm9ybT0ibWF0cml4KC4xMzk0NSAwIDAgLjEzOTQ1IDAgMS4xNjIzKSI%2BPHBhdGggZD0ibTAgMTIuNDAyIDM1LjY4Ny00Ljg2MDIgMC4wMTU2IDM0LjQyMy0zNS42NyAwLjIwMzEzeiIgZmlsbD0iI2Y4NjgyYyIvPjxwYXRoIGQ9Im0zOS45OTYgNi45MDU5IDQ3LjMxOC02LjkwNnY0MS41MjdsLTQ3LjMxOCAwLjM3NTY1eiIgZmlsbD0iIzkxYzMwMCIvPjxwYXRoIGQ9Im0zNS42NyA0NS45MzEgMC4wMjc3IDM0LjQ1My0zNS42Ny00LjkwNDEtMmUtMyAtMjkuNzh6IiBmaWxsPSIjMDBiNGYxIi8%2BPHBhdGggZD0ibTg3LjMyNiA0Ni4yNTUtMC4wMTExIDQxLjM0LTQ3LjMxOC02LjY3ODQtMC4wNjYzLTM0LjczOXoiIGZpbGw9IiNmZmMzMDAiLz48L2c%2BPHBhdGggZD0ibTI2LjEzNyAxMC4yODRjLTAuMTk5NTggMC40NjEwNi0wLjQzNTgxIDAuODg1NDctMC43MDk1MiAxLjI3NTctMC4zNzMwOCAwLjUzMTkzLTAuNjc4NTYgMC45MDAxMy0wLjkxMzk4IDEuMTA0Ni0wLjM2NDk0IDAuMzM1NjItMC43NTU5NSAwLjUwNzUtMS4xNzQ2IDAuNTE3MjctMC4zMDA1OSAwLTAuNjYzMDgtMC4wODU1My0xLjA4NS0wLjI1OTA0LTAuNDIzMzUtMC4xNzI2OS0wLjgxMjQtMC4yNTgyMy0xLjE2ODEtMC4yNTgyMy0wLjM3MzA4IDAtMC43NzMyMiAwLjA4NTU0LTEuMjAxMiAwLjI1ODIzLTAuNDI4NjQgMC4xNzM1MS0wLjc3Mzk1IDAuMjYzOTMtMS4wMzggMC4yNzI4OS0wLjQwMTUyIDAuMDE3MTItMC44MDE3My0wLjE1OTY2LTEuMjAxMi0wLjUzMTEyLTAuMjU0OTctMC4yMjIzOC0wLjU3Mzg4LTAuNjAzNjItMC45NTU5My0xLjE0MzctMC40MDk5LTAuNTc2NzQtMC43NDY5MS0xLjI0NTUtMS4wMTA5LTIuMDA4LTAuMjgyNzUtMC44MjM1Ni0wLjQyNDQ5LTEuNjIxMS0wLjQyNDQ5LTIuMzkzMSAwLTAuODg0NDEgMC4xOTExLTEuNjQ3MiAwLjU3Mzg4LTIuMjg2NCAwLjMwMDgzLTAuNTEzNDQgMC43MDEwNC0wLjkxODQ2IDEuMjAxOS0xLjIxNTggMC41MDA5LTAuMjk3MzMgMS4wNDIxLTAuNDQ4ODQgMS42MjUtMC40NTg1NCAwLjMxODkxIDAgMC43MzcxMyAwLjA5ODY1IDEuMjU2OCAwLjI5MjUyIDAuNTE4MjUgMC4xOTQ1MyAwLjg1MTAxIDAuMjkzMTggMC45OTY5IDAuMjkzMTggMC4xMDkwOCAwIDAuNDc4NzQtMC4xMTUzNSAxLjEwNTQtMC4zNDUzMSAwLjU5MjYyLTAuMjEzMjYgMS4wOTI4LTAuMzAxNTYgMS41MDI1LTAuMjY2NzggMS4xMTAzIDAuMDg5NiAxLjk0NDQgMC41MjcyOSAyLjQ5OTIgMS4zMTU4LTAuOTkyOTkgMC42MDE2Ni0xLjQ4NDIgMS40NDQ0LTEuNDc0NCAyLjUyNTQgOWUtMyAwLjg0MjA1IDAuMzE0NDMgMS41NDI4IDAuOTE0NzkgMi4wOTkxIDAuMjcyMDggMC4yNTgyMiAwLjU3NTkyIDAuNDU3OCAwLjkxMzk4IDAuNTk5NTQtMC4wNzMzMiAwLjIxMjYxLTAuMTUwNyAwLjQxNjI2LTAuMjMyOTggMC42MTE3NnptLTIuNTQ2NC0xMC4wMmMwIDAuNjYtMC4yNDExMiAxLjI3NjItMC43MjE3MyAxLjg0NjYtMC41OCAwLjY3ODA3LTEuMjgxNSAxLjA2OTktMi4wNDIzIDEuMDA4MS0wLjAwOTctMC4wNzkxOC0wLjAxNTMtMC4xNjI1MS0wLjAxNTMtMC4yNTAwOCAwLTAuNjMzNiAwLjI3NTgyLTEuMzExNyAwLjc2NTY0LTEuODY2MSAwLjI0NDU0LTAuMjgwNzEgMC41NTU1NS0wLjUxNDEyIDAuOTMyNzEtMC43MDAzMSAwLjM3NjM1LTAuMTgzNDEgMC43MzIzMy0wLjI4NDg1IDEuMDY3MS0wLjMwMjIxIDAuMDA5OCAwLjA4ODIzIDAuMDEzODUgMC4xNzY0NyAwLjAxMzg1IDAuMjY0eiIgc3Ryb2tlLXdpZHRoPSIuMDgxNDYiLz48L3N2Zz4%3D


[consolas]:https://docs.microsoft.com/en-us/typography/font-list/consolas
[input-mono]:http://input.djr.com/download/
[pragmatapro]:https://www.fsd.it/shop/fonts/pragmatapro/
[operator]:https://www.typography.com/fonts/operator/
[dank]:https://dank.sh/
[sf-mono]:https://developer.apple.com/fonts/

[release]:https://github.com/ryanoasis/nerd-fonts/releases/latest "Latest Release (external link) ➶"
[coc]:https://github.com/ryanoasis/nerd-fonts/blob/-/code_of_conduct.md "Contributor Covenant Code of Conduct"
[LICENSE]:https://github.com/ryanoasis/nerd-fonts/blob/-/LICENSE
[prs]:http://makeapullrequest.com "Make a Pull Request (external link) ➶"

<!--
Font repos
-->

[f-0xProto]:https://github.com/0xType/0xProto
[f-3270]:https://github.com/rbanffy/3270font
[f-adwaita-mono]:https://gitlab.gnome.org/GNOME/adwaita-fonts
[f-agave]:https://github.com/agarick/agave
[f-a-pro]:https://www.marksimonson.com/fonts/view/anonymous-pro
[f-arimo]:https://github.com/googlefonts/Arimo
[f-atkinson]:https://www.brailleinstitute.org/freefont/
[f-cascadia]:https://github.com/microsoft/cascadia-code
[f-cousine]:https://fonts.google.com/specimen/Cousine
[f-comic]:https://github.com/jesusmgg/comic-shanns-mono
[f-commit]:https://github.com/eigilnikolajsen/commit-mono
[f-d2coding]:https://github.com/naver/d2codingfont
[f-daddytimemono]:https://github.com/BourgeoisBear/DaddyTimeMono
[f-departuremono]:https://github.com/rektdeckard/departure-mono
[f-dejavu]:https://github.com/dejavu-fonts/dejavu-fonts
[f-envy]:https://github.com/damieng/envy-code-r
[f-fant]:https://github.com/belluzj/fantasque-sans
[f-fira-code]:https://github.com/tonsky/FiraCode
[f-fira-mono]:https://github.com/mozilla/Fira
[f-geist-mono]:https://github.com/vercel/geist-font
[f-gohu2]:https://github.com/koemaeda/gohufont-ttf
[f-gohu]:http://font.gohu.org/
[f-go-mono]:https://go.googlesource.com/image/+/master/font/gofont/ttfs/
[f-hack]:https://github.com/chrissimpkins/Hack
[f-hasklig]:https://github.com/i-tu/Hasklig
[f-hermit]:https://pcaro.es/hermit
[f-ia-writer]:https://github.com/iaolo/iA-Fonts
[f-ibm-plex]:https://github.com/IBM/plex
[f-inconsolata]:https://github.com/googlefonts/Inconsolata
[f-inconsolatago]:https://levien.com/type/myfonts/inconsolata.html
[f-inconsolatalgc]:https://github.com/MihailJP/Inconsolata-LGC
[f-intel-one-mono]:https://github.com/intel/intel-one-mono
[f-iosevka]:https://github.com/be5invis/Iosevka
[f-jetbrains-mono]:https://github.com/JetBrains/JetBrainsMono
[f-lekton]:https://fonts.google.com/specimen/Lekton
[f-liberation]:https://github.com/liberationfonts/liberation-fonts
[f-lilex]:https://github.com/mishamyrt/Lilex
[f-martian]:https://github.com/evilmartians/mono
[f-meslo]:https://github.com/andreberg/Meslo-Font
[f-monaspace]:https://github.com/githubnext/monaspace
[f-monoid]:https://github.com/larsenwork/monoid
[f-mononoki]:https://madmalik.github.io/mononoki
[f-mplus]:https://mplusfonts.github.io
[f-noto]:https://fonts.google.com/noto
[f-opendyslexic]:https://github.com/antijingoist/open-dyslexic
[f-overpass]:http://overpassfont.org
[f-profont]:https://tobiasjung.name/profont
[f-recursive]:https://github.com/arrowtype/recursive
[f-roboto]:https://fonts.google.com/specimen/Roboto+Mono
[f-share]:https://fonts.google.com/specimen/Share+Tech+Mono
[f-source]:https://github.com/adobe-fonts/source-code-pro
[f-space]:https://fonts.google.com/specimen/Space+Mono
[f-terminus]:http://terminus-font.sourceforge.net
[f-tinos]:https://fonts.google.com/specimen/Tinos
[f-ubuntu]:http://font.ubuntu.com
[f-ubuntu-sans]:https://github.com/canonical/Ubuntu-Sans-Mono-fonts
[f-victor]:https://github.com/rubjo/victor-mono
[f-zed-mono]:https://github.com/zed-industries/zed-fonts

<!--
Patched Font internal links
-->

[p-0xProto]:patched-fonts/0xProto
[p-3270]:patched-fonts/3270
[p-adwaita-mono]:patched-fonts/AdwaitaMono
[p-agave]:patched-fonts/Agave
[p-anonymous-pro]:patched-fonts/AnonymousPro
[p-arimo]:patched-fonts/Arimo
[p-atkinson-mono]:patched-fonts/AtkinsonHyperlegibleMono
[p-aurulent]:patched-fonts/AurulentSansMono
[p-bigblueterm]:patched-fonts/BigBlueTerminal
[p-bitstream]:patched-fonts/BitstreamVeraSansMono
[p-blex]:patched-fonts/IBMPlexMono
[p-cascadia]:patched-fonts/CascadiaCode
[p-cascadia-mono]:patched-fonts/CascadiaMono
[p-code-nr]:patched-fonts/CodeNewRoman
[p-comic]:patched-fonts/ComicShannsMono
[p-commit]:patched-fonts/CommitMono
[p-cousine]:patched-fonts/Cousine
[p-d2coding]:patched-fonts/D2Coding
[p-daddytimemono]:patched-fonts/DaddyTimeMono
[p-departuremono]:patched-fonts/DepartureMono
[p-dejavu]:patched-fonts/DejaVuSansMono
[p-droid]:patched-fonts/DroidSansMono
[p-envy]:patched-fonts/EnvyCodeR
[p-fantasque]:patched-fonts/FantasqueSansMono
[p-fira-code]:patched-fonts/FiraCode
[p-fira-mono]:patched-fonts/FiraMono
[p-geist-mono]:patched-fonts/GeistMono
[p-gohu]:patched-fonts/Gohu
[p-go-mono]:patched-fonts/Go-Mono
[p-hack]:patched-fonts/Hack
[p-hasklig]:patched-fonts/Hasklig
[p-heavy-data]:patched-fonts/HeavyData
[p-hermit]:patched-fonts/Hermit
[p-im-writing]:patched-fonts/iA-Writer
[p-inconsolata-go]:patched-fonts/InconsolataGo
[p-inconsolata-lgc]:patched-fonts/InconsolataLGC
[p-inconsolata]:patched-fonts/Inconsolata
[p-intel-one-mono]:patched-fonts/IntelOneMono
[p-iosevka]:patched-fonts/Iosevka
[p-iosevka-term]:patched-fonts/IosevkaTerm
[p-iosevka-term-slab]:patched-fonts/IosevkaTermSlab
[p-jetbrains-mono]:patched-fonts/JetBrainsMono
[p-lekton]:patched-fonts/Lekton
[p-liberation]:patched-fonts/LiberationMono
[p-lilex]:patched-fonts/Lilex
[p-martian]:patched-fonts/MartianMono
[p-meslo]:patched-fonts/Meslo
[p-monaspace]:patched-fonts/Monaspace
[p-monofur]:patched-fonts/Monofur
[p-monoid]:patched-fonts/Monoid
[p-mononoki]:patched-fonts/Mononoki
[p-mplus]:patched-fonts/MPlus
[p-noto]:patched-fonts/Noto
[p-opendyslexic]:patched-fonts/OpenDyslexic
[p-overpass]:patched-fonts/Overpass
[p-profont]:patched-fonts/ProFont
[p-proggy-clean]:patched-fonts/ProggyClean
[p-recursive]:patched-fonts/Recursive
[p-roboto]:patched-fonts/RobotoMono
[p-share-tech-mono]:patched-fonts/ShareTechMono
[p-source-code-pro]:patched-fonts/SourceCodePro
[p-space-mono]:patched-fonts/SpaceMono
[p-terminus]:patched-fonts/Terminus
[p-tinos]:patched-fonts/Tinos
[p-ubuntu]:patched-fonts/Ubuntu
[p-ubuntu-mono]:patched-fonts/UbuntuMono
[p-ubuntu-sans]:patched-fonts/UbuntuSans
[p-victor]:patched-fonts/VictorMono
[p-zed-mono]:patched-fonts/ZedMono


<!--
Quick Link Images
-->

[ql-1]:images/nerd-fonts-character-logo-md.png "Latest Release (external link) ➶"
[ql-2]:images/nerd-fonts-character-logo-md.png "↓ View Patched Fonts List ↓"
[ql-3]:images/nerd-fonts-patcher-logo-md.png "↓ Font Patcher Details ↓"
[ql-4]:https://raw.githubusercontent.com/wiki/ryanoasis/vim-devicons/screenshots/v1.0.0/branding-logo-sm.png "VimDevIcons Vim Plugin (external link) ➶"
[ql-5]:images/nerd-fonts-character-logo-md.png "Font Package Archive (Zip) Downloads (external link) ➶"
