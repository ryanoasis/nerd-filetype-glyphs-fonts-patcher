<h1 align="center">
  <img src="images/nerd-fonts-logo.svg" alt="Nerd Fonts Logo" />
</h1>
<h2 align="center">
  <img alt="Iconic font aggregator, collection, and patcher" src="images/project-subtitle-phrase.svg" width="50%">
</h2>

<div align="center">

[![GitHub release][img-version-badge]][dépôt] [![Gitter][img-gitter-badge]][gitter] [![CodeClimate][img-code-climate-badge]][code-climate] [![Code of Conduct][coc-badge]][coc] [![PRs Welcome][prs-badge]][prs] [![Twitter][twitter-badge]][twitter-intent] <a href="#polices-disponibles" title=""><img src="https://raw.githubusercontent.com/wiki/ryanoasis/nerd-fonts/images/faux-shield-badge-os-logos.svg?sanitize=true" alt="VimDevIcons - Add Icons to Your Plugins"></a>

</div>


**Nerd Fonts** est un projet qui regroupe les polices ciblées par les développeurs proposant ainsi un nombre élevé de glyphes (icônes). Précisément pour ajouter un nombre élevé de glyphes supplémentaires à partir de « polices iconiques » populaires telles que [Font Awesome ➶][font-awesome], [Devicons ➶][vorillaz-devicons], [Octicons ➶][octicons], et [d'autres](#ensembles-de-glyphes).

Le diagramme de Sankey suivant montre les ensembles de glyphes actuels inclus :

<p align="center">
  <img src="images/sankey-glyphs-combined-diagram.svg" alt="@SankeyMATIC Diagram" />
</p>
<sub><i>Diagramme créé avec <a href="http://sankeymatic.com/" title="SankeyMATIC (BETA): A Sankey diagram builder for everyone">@SankeyMATIC</a></i></sub>


## Quick Navigation

| **[Latest Release ➶][release]** | **[Fonts](#polices-disponibles)** | **[Patcher](#font-patcher)** | **[VimDevIcons ➶][vim-devicons]** | **[Font Package <br/>Downloads ➶][release]** |
|:-------------------------------:|:---------------------------:|:----------------------------:|:---------------------------------:|:--------------------------------------------:|
| [![fonts-logo-small][ql-1]][release] | [![fonts-logo-small][ql-2]](#polices-disponibles) | [![patcher-logo-small][ql-3]](#font-patcher) | [![vim-devicons-logo-small][ql-4]][vim-devicons] | [![fonts-logo-small][ql-5]][release] |


## Important Notices
* La branche `master` **n'est pas** considérée comme stable. [Vérifiez votre branche de référence](#unstable-file-paths)
* Cloner ce dépôt **n'est pas** recommandé sauf si vous souhaitez [contribuer au développement](#contributing)


## Table des matières

[**TL;DR**](#tldr)

[**Options d'installation**](#installation-de-police)
  * [**1 - Manuel**](#option-1-download-and-install-manually)
  * [**2 - Téléchargement d'une archive de release**](#option-2-release-archive-download)
  * [**3 - Install Script**](#option-3-install-script)
  * [**4 - Homebrew Fonts (macOS (OS X))**](#option-4-homebrew-fonts)
  * [**5 - Cloner le dépôt**](#option-5-clone-the-repo)
  * [**6 - Téléchargement Ad Hoc avec Curl**](#option-6-ad-hoc-curl-download)
  * [**7 - Arch Community dépôt**](#option-7-arch-community-repository)
  * [**8 - Générer votre propre police**](#option-8-patch-your-own-font)

[**Fonctionnalités**](#features)
  * [**Glyph/Icon sets**](#glyph-sets)
  * [**Polices générées**](#polices-disponibles)
  * [**Combinations**](#combinations)
  * [**Générateur de police**](#font-patcher)

[**Développeur/Contributeur**](#font-patcher)
  * [**Générateur de police**](#font-patcher)
  * [**Gotta Patch 'em All Font Patcher!**](#gotta-patch-em-all)
  * [**D'autres bonnes polices à ajouter**](#other-good-fonts-to-patch)
  * [**Contribuer**](#contributing)

[**Motivation du projet**](#project-motivation)

**Informations additionnelles**
  * [**Instabilité des chemins de fichiers sur master**](#unstable-file-paths)
  * [**Changelog**](#changelog)
  * [**Licence**](#licence)


## TL;DR
  Nerd Fonts récupère des polices de programmation populaires et ajoute de nombreux glyphes.
  Un [généreur de polices](#font-patcher) est aussi disponible si vous souhaitez ajouter une police non présente.
  Pour plus d'informations précises, vous pouvez consulter le [wiki][wiki]. Plugin vim disponible ici : [VimDevIcons ➶][vim-devicons].

### Plusieurs options de téléchargement des polices

_Si vous..._

  * `Option 1.` voulez récupérer **rapidement** une **police individuelle** téléchargée depuis le [dossier `patched-fonts/`](#polices-disponibles)
  * `Option 2.` voulez télécharger un package de **famille de polices** ainsi que ses variations (bold, italic, etc.), voir [télécharger une archive](#option-2-release-archive-download)
  * `Option 3.` voulez une installation **automatique** ou utiliser des **scripts**, voir [Installation via un script](#option-3-install-script)
  * `Option 4.` vous êtes sur **macOS** et que vous voulez utiliser **Homebrew**, voir [Homebrew Fonts](#option-4-homebrew-fonts)
  * `Option 5.` voulez un **contrôle total**, voir [cloner le dépôt](#option-5-clone-the-repo)
  * `Option 6.` voulez utiliser la **commande `curl`** ou pour l'utiliser via des **scripts**, voir [Téléchargement Ad Hoc avec Curl](#option-6-ad-hoc-curl-download)
  * `Option 7.` êtes sur **Arch Linux** et que vous voulez utiliser les **Community packages**, voir [Dépôts Arch Community](#option-7-arch-community-repository)
  * `Option 8.` générer votre propre police [Générateur de police](#option-8-patch-your-own-font)

## Fonctionnalités
* Un [script Python FontForge](#font-patcher) pour générer n'importe quelle police
  * Includes an option to create **Monospaced (fixed-pitch, fixed-width)** _or_ **double-width (non-monospaced)** glyphs
  * Incluant une option permettant de créer des glyphes **Monospaced (fixed-pitch, fixed-width)** _ou_ **double-width (non-monospaced)**
  * For more details see the [**Font Patcher**](#font-patcher) section
  * Pour plus de détails, voir la section [**Générateur de font**](#font-patcher)
* Déjà **`50`** [familles de polices générées](#polices-disponibles)
* Plus de **`1,571,470`** unique variantes/combinaisons uniques de fonts générées [(plus de détail)](#combinations)
* Plus de **`1,600`** glyphes/icones combinés [(plus de détail)](#combinations)
  * Les ensembles de glyphes actuels incluent : [Powerline with Extra Symbols][ryanoasis-powerline-extra-symbols], [Font Awesome][font-awesome], [Material Design Icons][font-material-design-icons], [Weather][font-weather], [Devicons][vorillaz-devicons], [Octicons][octicons], [Font Logos][font-logos] (Anciennement Font Linux), [Pomicons][gabrielelana-pomicons]
* **Monospaced (fixed-pitch, fixed-width)** _ou_ **double-width (non-monospaced)** pour chaque version de glyphes de chaque police
  * Ceci fait référence aux glyphes de Nerd Font et pas nécessairement à la police dans son ensemble
* Un [script bash](#gotta-patch-em-all) fourni pour développeur/contributeur pour re-générer toutes les polices


## Ensembles de glyphes

:mag: :mag: Vous pouvez désormais rechercher facilement des glyphes sur [NerdFonts.com][Cheat Sheet] [via la table de référence][]

### Seti-UI + Custom
> Based off of [Seti-UI] Icomoon with extra custom glyphs.
> Basé sur [Seti-UI] Icomoon avec des glyphes supplémentaires.

#### [:mag: :bookmark_tabs: Voir l'ensemble sur le website NerdFonts.com](http://nerdfonts.com/?set=nf-custom-#cheat-sheet)

### [Devicons][vorillaz-devicons]
> Une police iconique faite pour les développeurs, jedis du code, ninjas, HTTPsters, evangelists et nerds(sic). / ([dépôt][vorillaz-devicons]) / ([website](https://vorillaz.github.io/devicons/))

#### [:mag: :bookmark_tabs: Voir l'ensemble sur le website NerdFonts.com](http://nerdfonts.com/?set=nf-dev-#cheat-sheet)

### [Font Awesome][font-awesome]
> Une police iconique et une boîte à outils CSS. / ([dépôt][font-awesome]) / ([website](http://fontawesome.io/))

#### [:mag: :bookmark_tabs: Voir l'ensemble sur le website NerdFonts.com](http://nerdfonts.com/?set=nf-fa-#cheat-sheet)

### [Font Awesome Extension][font-awesome-extension]
> Extension de la police Font Awesome. / ([dépôt][font-awesome-extension]) / ([website](https://andrelzgava.github.io/font-awesome-extension/))

#### [:mag: :bookmark_tabs: Voir l'ensemble sur le website NerdFonts.com](http://nerdfonts.com/?set=nf-fae-#cheat-sheet)

### [Material Design Icons][font-material-design-icons]
> Plus de 2000 icônes Material Design. / ([dépôt][font-material-design-icons]) / ([website](https://materialdesignicons.com/))

#### [:mag: :bookmark_tabs: Voir l'ensemble sur le website NerdFonts.com](http://nerdfonts.com/?set=nf-mdi-#cheat-sheet)

### [Weather][font-weather]
> 215 icônes et CSS sur le thème de la météo. / ([dépôt][font-weather]) / ([website](http://weathericons.io/))

#### [:mag: :bookmark_tabs: Voir l'ensemble sur le website NerdFonts.com](http://nerdfonts.com/?set=nf-weather-#cheat-sheet)

### [Octicons][octicons]
> Icônes GitHub. / ([dépôt][octicons]) / ([website](https://octicons.github.com))

#### [:mag: :bookmark_tabs: Voir l'ensemble sur le website NerdFonts.com](http://nerdfonts.com/?set=nf-oct-#cheat-sheet)*

<sub>* Pour éviter des conflits entre des jeux d'icônes, ceux-ci ont été modifiés dans les polices 'complètes'. Pour voir les codepoints originaux, voir le [Wiki](https://github.com/ryanoasis/nerd-fonts/wiki/Codepoint-Conflicts).</sub>

### [Powerline Extra Symbols][ryanoasis-powerline-extra-symbols]
> Fournit des glyphes de séparateur et un glyphe de numéro de colonne pour Powerline (CN). / ([dépôt][ryanoasis-powerline-extra-symbols])

#### [:mag: :bookmark_tabs: Voir l'ensemble sur le website NerdFonts.com](http://nerdfonts.com/?set=nf-ple-#cheat-sheet)

### [IEC Power Symbols][website-iecpower]
> Ajoute de nouveaux caractères dans Unicode / ([website][website-iecpower])

#### [:mag: :bookmark_tabs: Voir l'ensemble sur le website NerdFonts.com](http://nerdfonts.com/?set=nf-iec-#cheat-sheet)

### [Font Logos][font-logos] (Formerly Font Linux)
> Font-logos est une police d'icônes contenant des logos de distributions linux populaires et d'autres logiciels open source pour les inclure dans des sites web. / ([dépôt][font-logos])

#### [:mag: :bookmark_tabs: Voir l'ensemble sur le website NerdFonts.com](http://nerdfonts.com/?set=nf-linux-#cheat-sheet)

### [Pomicons][gabrielelana-pomicons]
> 8 symboles pour la ["Pomodoro Technique"®](https://cirillocompany.de/pages/pomodoro-technique). / ([dépôt][gabrielelana-pomicons])

#### [:mag: :bookmark_tabs: Voir l'ensemble sur le website NerdFonts.com](http://nerdfonts.com/?set=nf-pom-#cheat-sheet)

### Noms d'icônes en Shell

Le téléchargement fourni des fichiers `.sh` dans le dossier [bin/scripts/lib/](bin/scripts/lib/), les dossiers recommandés sont `~/.local/share/fonts/` ou `~/bin/`.

- `i_all.sh` - un helper pour charger tous les fichiers que vous avez téléchager d'un coup
- `i_dev.sh` - Devicons (198 icônes, dont 8 qui n'ont pas de nom)
- `i_fa.sh` - Font Awesome (675 icônes, 111 alias)
- `i_fae.sh` - Font Awesome Extension (170 icônes)
- `i_iec.sh` - IEC Power Symbols (5 icônes)
- `i_logos.sh` - Font Logos (20 icônes)
- `i_oct.sh` - Octicons (172 icônes)
- `i_ple.sh` - Powerline Extra Symbols (37 icônes, 2 alias, dont 16 qui n'ont pas de nom)
- `i_pom.sh` - Pomicons (11 icônes)
- `i_seti.sh` - Seti-UI + Custom (50 icônes, 2 alias, dont 5 qui n'ont pas de nom)

Puis `source` le(s) file(s) requis et afficher les variables `$i_*` pour voir les icônes :

```sh
source ~/.local/share/fonts/i_oct.sh
echo $i_oct_heart
# Output:
# ♥
```

**NOTE :** Vous devez utiliser l'une des Nerd fonts pour voir les bonnes icônes de certains jeux d'icônes (Devicons, Font Awesome Extension, Font Logos), mais d'autres jeux devraient aussi fonctionner avec leurs polices standard.


## Polices disponibles

| Nom de la police                                  | Nom de la police et dépôt         |\*RFN | EM Size | Statut            |
|:--------------------------------------------------|:----------------------------------|:-----|:--------|:------------------|
| [3270 Nerd Font][p-3270]                          | [3270][f-3270]                    | NO   | 1000    | ![w] ![m2] ![l]   |
| [AnonymicePro Nerd Font][p-anonymous-pro]         | [Anonymous Pro][f-a-pro]          | NO   | 2048    | ![w] ![m2] ![l]   |
| [Arimo][p-arimo]                                  | [Arimo][f-arimo]                  | NO   | 2048    | ![w] ![m2] ![l]   |
| [Aurulent Sans Mono Nerd Font][p-aurulent]        |                                   | NO   | 1000    | ![w] ![m2] ![l]   |
| [BigBlueTerminal][p-bigblueterm]                  |                                   | NO   | 1200    | ![w] ![m2] ![l]   |
| [Bitstream Vera Sans Mono Nerd Font][p-bitstream] |                                   | NO   | 2048    | ![w] ![m2] ![l]   |
| [Code New Roman Nerd Font][p-code-nr]             |                                   | NO   | 2048    | ![w] ![m2] ![l]   |
| [Cousine Nerd Font][p-cousine]                    | [Cousine][f-cousine]              | NO   | 1000    | ![w] ![m2] ![l]   |
| [DepartureMono Nerd Font][p-departuremono]        | [Departure Mono][f-departuremono] | NO   | 550     | ![w] ![m2] ![l]   |
| [DejaVu Sans Mono Nerd Font][p-dejavu]            |                                   | NO   | 2048    | ![w] ![m2] ![l]   |
| [Droid Sans Mono Nerd Font][p-droid]              |                                   | NO   | 2048    | ![w] ![m2] ![l]   |
| [Fantasque Sans Nerd Font][p-fantasque]           | [Fantasque Sans][f-fant]          | NO   | 2048    | ![w] ![m2] ![l]   |
| [Fura Code Nerd Font*][p-fira-code]               | [Fira][f-fira-code]               | YES  | 1000    | ![w] ![m2] ![l]   |
| [Fura Mono Nerd Font*][p-fira-mono]               | [Fira][f-fira-mono]               | YES  | 1000    | ![w] ![m2] ![l]   |
| [Go Mono Nerd Font][p-go-mono]                    | [Go-Mono][f-go-mono]              | NO   | 1000    | ![w] ![m2] ![l]   |
| [Gohu Nerd Font][p-gohu]                          | [Gohu TTF][f-gohu2],[Gohu][f-gohu]| NO   | 1000    | ![w] ![m2] ![l]   |
| [Hack Nerd Font][p-hack]                          | [Hack][f-hack]                    | NO   | 2048    | ![w] ![m2] ![l]   |
| [Hasklug Nerd Font*][p-hasklig]                   | [Hasklig][f-hasklig]              | YES  | 1000    | ![w] ![m2] ![l]   |
| [Heavy Data Mono Nerd Font][p-heavy-data]         |                                   | NO   | 2048    | ![w] ![m2] ![l]   |
| [Hermut Nerd Font][p-hermit]                      |                                   | NO   | 1000    | ![w] ![m2] ![l]   |
| [Inconsolata Nerd Font][p-inconsolata]            |                                   | NO   | 1000    | ![w] ![m2] ![l]   |
| [Inconsolata Go Nerd Font][p-inconsolata-go]      |                                   | NO   | 1000    | ![w] ![m2] ![l]   |
| [Inconsolata LGC Nerd Font][p-inconsolata-lgc]    |                                   | NO   | 1000    | ![w] ![m2] ![l]   |
| [Iosevka Nerd Font][p-iosevka]                    | [Iosevka][f-iosevka]              | YES  | 1000    | [#83][s-iosevka]  |
| [JetBrains Mono][p-jetbrains-mono]                | [JetBrains Mono][f-jetbrains-mono]| NO   | 1000    | ![w] ![m2] ![l]   |
| [Lekton Nerd Font][p-lekton]                      |                                   | NO   | 1000    | ![w] ![m2] ![l]   |
| [Literation Mono Nerd Font][p-liberation]         | [Liberation][f-liberation]        | YES  | 2048    | ![w] ![m2] ![l]   |
| [Meslo Nerd Font][p-meslo]                        |                                   | NO   | 2048    | ![w] ![m2] ![l]   |
| [Monofur Nerd Font][p-monofur]                    |                                   | NO   | 2400    | ![w] ![m2] ![l]   |
| [Monoid Nerd Font][p-monoid]                      |                                   | NO   | 1536    | ![w] ![m2] ![l]   |
| [Mononoki Nerd Font][p-mononoki]                  | [Mononoki][f-mononoki]            | NO   | 1024    | ![w] ![m2] ![l]   |
| [M+ (MPlus) Nerd Font][p-mplus]                   |                                   | NO   | 1000    | ![w] ![m2] ![l]   |
| [Noto][p-noto]                                    |                                   | NO   | 1000    | ![w] ![m2] ![l]   |
| [OpenDyslexic][p-opendyslexic]                    |                                   | NO   | 1000    | ![w] ![m2] ![l]   |
| [Overpass][p-overpass]                            |                                   | NO   | 1000    | ![w] ![m2] ![l]   |
| [ProFont (Windows tweaked) Nerd Font][p-profont]  |                                   | NO   | 1200    | ![w] ![m2] ![l]   |
| [ProFont (x11) Nerd Font][p-profont]              |                                   | NO   | 1000    | ![w] ![m2] ![l]   |
| [ProggyClean Nerd Font][p-proggy-clean]           |                                   | NO   | 2048    | Imperfect         |
| [Roboto Mono][p-roboto]                           |                                   | NO   | 2048    | ![w] ![m2] ![l]   |
| [Sauce Code Nerd Font][p-source-code-pro]         | [Source][f-source]                | YES  | 1000    | ![w] ![m2] ![l]   |
| [Shure Tech Mono Nerd Font*][p-share-tech-mono]   | [Share Tech Mono][f-share]        | YES  | 1000    | ![w] ![m2] ![l]   |
| [Space Mono Nerd Font][p-space-mono]              | [Space Mono][f-space]             | NO   | 1000    | ![w] ![m2] ![l]   |
| [Terminess Nerd Font*][p-terminus]                | [Terminus Font][f-terminus]       | YES  | 1000    | ![w] ![m2] ![l]   |
| [Tinos][p-tinos]                                  |                                   | YES  | 2048    | ![w] ![m2] ![l]   |
| [Ubuntu Nerd Font][p-ubuntu]                      |                                   | NO   | 1000    | ![w] ![m2] ![l]   |
| [Ubuntu Mono Nerd Font][p-ubuntu-mono]            |                                   | NO   | 1000    | ![w] ![m2] ![l]   |

<sub>_*RFN = Reserved Font Name (Nom de police réservé)_</sub>

## Combinaisons

- Plus de **`1,485,000`** variantes/combinaisons uniques de fonts générées :
  - **`50`** polices de caractères
  - **`719`** familles de polices
  - **`9,000+`** 'complètes' variantes/combinaisons
  - **`'1,485,410'`** _possibles_ variantes/combinaisons
  - **`1,488,286`** total des combinaisons calculées (2,876 + 1,428,110)
- Les combinaisons pour chaque police sont une combinaison de [Variations](#variations)

### Variations

- no flags given (defaults to only **Seti-UI + Custom** and **[Devicons][vorillaz-devicons]**)
- **double _(variable/proportional)_** or **single _(fixed/monospaced)_** width glyphs
- [Font Awesome][font-awesome]
- [Font Awesome Extension][font-awesome-extension]
- [Material Design Icons][font-material-design-icons]
- [Weather][font-weather]
- [GitHub Octicons][octicons]
- [Font Logos][font-logos] (Anciennement Font Linux)
- [Powerline Extra Symbols][ryanoasis-powerline-extra-symbols]
- [IEC Power Symbols][website-iecpower]
- [Pomicons][gabrielelana-pomicons]
- Compatible avec Windows


## Installation de police

### `Option 1: Téléchargement et installion manuelle`

> Meilleure option pour l'installation **rapide** d'une **police spécifique individuelle**.

Télécharger la [police générée](#polices-disponibles) spécifique de votre choix

### `Option 2: Téléchargement d'une archive de release`

> Meilleure option si vous voulez une **archive** ou une **police** complète ainsi que ses variations (Bold, Italic, etc.).

Les polices sont disponibles pour téléchargement au format archives dans la section [latest release](https://github.com/ryanoasis/nerd-fonts/releases/latest)

### `Option 3: Installation via un script`

> Meilleure option si vous voulez **automatiser** l'installation ou pour l'utilisation via des **scripts**.

_Note_: Seulement pour Linux & macOS (OS X)
_Note_: **Requiert le clonage** du dépôt

#### Toutes les polices :

* Installation de toutes les polices (_Attention : Il y a beaucoup de polices, ce qui peut augmenter fortement la taille_)

```sh
./install.sh
```

#### Police unique:

* Installation d'une police unique de votre choix

```sh
./install.sh <FontName>
./install.sh Hack
./install.sh HeavyData
```

### `Option 4: Homebrew Fonts`

> La meilleure option si vous êtes sur **macOS** et que vous voulez utiliser **Homebrew**.

Toutes les polices sont disponibles via [Homebrew Cask](https://github.com/Homebrew/homebrew-cask) sur macOS (OS X)

```sh
brew install font-hack-nerd-font
```

_On Linux you have to add `--cask` after `install`._

### `Option 5: Cloner le dépôt`

> La meilleure option pour un **contrôle total**, de **toutes** ou **la plupart** des polices, ou **contribuer** au développement.

Cloner ce dépôt **n'est pas** requis ni efficace si vous êtes simplement intéressé par un ensemble limité de polices.

Cependant, si vous voulez quand même cloner le dépôt, assurez-vous de le cloner _superficiellement_ :
```sh
git clone --depth 1
```

### `Option 6: Téléchargement Ad Hoc avec Curl`

> Option si vous voulez utiliser la **commande `curl`** ou pour l'utiliser via des **scripts**.

#### Linux

```sh
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
```

_Note:_ chemins alternatifs dépréciés: `~/.fonts`

#### macOS (OS X)

```sh
cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
```

### `Option 7: Dépôts Arch Community`

> L'option pour **Arch Linux** et voulant utiliser les **AUR packages**.

Most fonts are available via [Arch Community packages](https://archlinux.org/packages/?sort=&repo=Community&q=-nerd).
Some special packages are [in AUR](https://aur.archlinux.org/packages?K=nerd-fonts-&outdated=off).

### `Option 8: Générer votre propre police`

> L'option pour **générer** votre **propre police** ou **customiser** la police générée.

Utilisez le script en ligne de commande Python fourni pour générer une police corrigée à partir de votre propre police pour obtenir les nouveaux glyphes supplémentaires

Voir: [Font Patcher](#font-patcher) pour utilisation

* Utiliser cette option si vous ne voulez __pas__ utiliser l'une des [polices fournies](#polices-disponibles)
* Vous devriez quand même copier la police générée dans le bon dossier de votre système


<h2 align="center" id="font-patcher">
	<img src="images/nerd-fonts-patcher-logo.png" alt="Nerd Fonts Patcher">
</h2>

Générer la police de votre choix pour l'utiliser avec [VimDevIcons ➶][vim-devicons]:
* Requis : Python 3, `python-fontforge` package (version `20141231` ou plus récente, voir
  les [instructions d'installation](http://designwithfontforge.com/en-US/Installing_Fontforge.html))
* Méthode alternative sur OSX : `brew install fontforge`
* Utilisation:

```
./font-patcher PATH_TO_FONT
```

* Autre utilisation: Exécuter le patcher avec le binaire FontForge en utilisant l'option script

```
./fontforge -script font-patcher PATH_TO_FONT
```


```
Nerd Fonts Patcher v3.0.2 (4.4.0) (ff 20230101)
usage: font-patcher [-h] [-v] [-s] [-l] [-q] [-c] [--careful] [--removeligs] [--postprocess [POSTPROCESS]] [--configfile [CONFIGFILE]] [--custom [CUSTOM]]
                    [-ext [EXTENSION]] [-out [OUTPUTDIR]] [--glyphdir [GLYPHDIR]] [--makegroups [{-1,0,1,2,3,4,5,6}]] [--variable-width-glyphs]
                    [--has-no-italic] [--progressbars | --no-progressbars] [--debug [{0,1,2,3}]] [--dry] [--xavgcharwidth [XAVGWIDTH]] [--fontawesome]
                    [--fontawesomeextension] [--fontlogos] [--octicons] [--codicons] [--powersymbols] [--pomicons] [--powerline] [--powerlineextra]
                    [--material] [--weather]
                    font

Nerd Fonts Font Patcher: patches a given font with programming and development related glyphs

* Website: https://www.nerdfonts.com
* Version: 3.0.2
* Development Website: https://github.com/ryanoasis/nerd-fonts
* Changelog: https://github.com/ryanoasis/nerd-fonts/blob/-/changelog.md

positional arguments:
  font                  The path to the font to patch (e.g., Inconsolata.otf)

options:
  -h, --help            show this help message and exit
  -v, --version         show program's version number and exit
  -s, --mono            Whether to generate the glyphs as single-width not double-width (default is double-width)
  -l, --adjust-line-height
                        Whether to adjust line heights (attempt to center powerline separators more evenly)
  -q, --quiet, --shutup
                        Do not generate verbose output
  -c, --complete        Add all available Glyphs
  --careful             Do not overwrite existing glyphs if detected
  --removeligs, --removeligatures
                        Removes ligatures specificed in JSON configuration file
  --postprocess [POSTPROCESS]
                        Specify a Script for Post Processing
  --configfile [CONFIGFILE]
                        Specify a file path for JSON configuration file (see sample: src/config.sample.json)
  --custom [CUSTOM]     Specify a custom symbol font, all glyphs will be copied; absolute path suggested
  -ext [EXTENSION], --extension [EXTENSION]
                        Change font file type to create (e.g., ttf, otf)
  -out [OUTPUTDIR], --outputdir [OUTPUTDIR]
                        The directory to output the patched font file to
  --glyphdir [GLYPHDIR]
                        Path to glyphs to be used for patching
  --makegroups [{-1,0,1,2,3,4,5,6}]
                        Use alternative method to name patched fonts (recommended)
  --variable-width-glyphs
                        Do not adjust advance width (no "overhang")
  --has-no-italic       Font family does not have Italic (but Oblique)
  --progressbars        Show percentage completion progress bars per Glyph Set (default)
  --no-progressbars     Don't show percentage completion progress bars per Glyph Set
  --debug [{0,1,2,3}]   Verbose mode (optional: 1=just to file; 2*=just to terminal; 3=display and file)
  --dry                 Do neither patch nor store the font, to check naming
  --xavgcharwidth [XAVGWIDTH]
                        Adjust xAvgCharWidth (optional: concrete value)

Symbol Fonts:
  --fontawesome         Add Font Awesome Glyphs (http://fontawesome.io/)
  --fontawesomeextension
                        Add Font Awesome Extension Glyphs (https://andrelzgava.github.io/font-awesome-extension/)
  --fontlogos, --fontlinux
                        Add Font Logos Glyphs (https://github.com/Lukas-W/font-logos)
  --octicons            Add Octicons Glyphs (https://octicons.github.com)
  --codicons            Add Codicons Glyphs (https://github.com/microsoft/vscode-codicons)
  --powersymbols        Add IEC Power Symbols (https://unicodepowersymbol.com/)
  --pomicons            Add Pomicon Glyphs (https://github.com/gabrielelana/pomicons)
  --powerline           Add Powerline Glyphs
  --powerlineextra      Add Powerline Glyphs (https://github.com/ryanoasis/powerline-extra-symbols)
  --material, --materialdesignicons, --mdi
                        Add Material Design Icons (https://github.com/templarian/MaterialDesign)
  --weather, --weathericons
                        Add Weather Icons (https://github.com/erikflowers/weather-icons)
```

#### Exemples

	./font-patcher Droid\ Sans\ Mono\ for\ Powerline.otf
	./font-patcher Droid\ Sans\ Mono\ for\ Powerline.otf -s -q
	./font-patcher Droid\ Sans\ Mono\ for\ Powerline.otf --mono --quiet
	./font-patcher Droid\ Sans\ Mono\ for\ Powerline.otf -w
	./font-patcher Droid\ Sans\ Mono\ for\ Powerline.otf --windows --quiet
	./font-patcher Droid\ Sans\ Mono\ for\ Powerline.otf --windows --pomicons --quiet
	./font-patcher Inconsolata.otf --fontawesome
	./font-patcher Inconsolata.otf --fontawesome --octicons --pomicons
	./font-patcher Inconsolata.otf


<a name="gotta-patch-em-all"></a>
## Gotta Patch 'em All Font Patcher!

* Pour les contributeurs ou les développeurs

* re-patches **toutes** les polices dans le dossier unpatched:
```
./gotta-patch-em-all-font-patcher\!.sh
```

* pour limiter à un seul nom de police :
```
./gotta-patch-em-all-font-patcher\!.sh Hermit
```


## Contribuer

Voir [contributing.md](contributing.md)


## Instabilité des chemins de fichiers

:warning: Attention: Les chemins des fichiers peuvent changer en fonction des releases (notamment lors de releases **majeures**)

Prendre en référence la branche **release** et _non_ la branche ~~master~~ car les chemins de fichiers sont sujets à modifications entre les releases

* Par exemple:
  * :white_check_mark: Utiliser : <code>https\://github.com/ryanoasis/nerd-fonts/blob/<b>0.9.0</b>/patched-fonts/Hermit/Medium/complete/Hurmit%20Medium%20Nerd%20Font%20Complete.otf</code>
  * :x: Au lieu de : <code>https\://github.com/ryanoasis/nerd-fonts/blob/<del>master</del>/patched-fonts/Hermit/Medium/complete/Hurmit%20Medium%20Nerd%20Font%20Complete.otf</code>


## D'autres bonnes polices à ajouter

* Une liste de bonnes polices supplémentaires à ajouter mais que je ne peux pas fournir ou partager en raison de leur licence :
 * [Input Mono][input-mono] (restriction de licence)
   * Peut-être avec un hébergement externe :)
 * [PragmataPro][pragmatapro] (non gratuite)
 * [Consolas][consolas] (propriétaire)


## Motivation du projet

Voir [Wiki: Project Purpose][wiki-project-purpose]


## Changelog

Voir [changelog.md](changelog.md)

## Licence

[MIT](LICENSE) © Ryan L McIntyre

<!--
Repo References
-->

[vim-devicons]:https://github.com/ryanoasis/vim-devicons "VimDevIcons Vim Plugin (external link) ➶"
[vorillaz-devicons]:https://vorillaz.github.io/devicons/
[font-awesome]:https://github.com/FortAwesome/Font-Awesome
[font-awesome-extension]:https://github.com/AndreLZGava/font-awesome-extension
[font-material-design-icons]:https://github.com/Templarian/MaterialDesign
[font-weather]:https://github.com/erikflowers/weather-icons
[octicons]:https://github.com/primer/octicons
[font-logos]:https://github.com/Lukas-W/font-logos
[gabrielelana-pomicons]:https://github.com/gabrielelana/pomicons
[Seti-UI]:https://atom.io/themes/seti-ui
[ryanoasis-powerline-extra-symbols]:https://github.com/ryanoasis/powerline-extra-symbols
[wiki]:https://github.com/ryanoasis/nerd-fonts/wiki
[wiki-project-purpose]:https://github.com/ryanoasis/nerd-fonts/wiki/Project-Purpose
[dépôt]:https://github.com/ryanoasis/nerd-fonts
[gitter]:https://gitter.im/ryanoasis/nerd-fonts
[code-climate]:https://codeclimate.com/github/ryanoasis/nerd-fonts
[twitter-intent]:https://twitter.com/intent/tweet?url=https%3A%2F%2Fgithub.com%2Fryanoasis%2Fnerd-fonts&via=%40nerdfonts&text=Nerd%20Fonts%20-%20Iconic%20font%20aggregator%2C%20collection%2C%20and%20patcher&hashtags=iconfont%20font%20github


<!--
Website References
-->

[website-iecpower]:https://unicodepowersymbol.com/
[Cheat Sheet]:https://nerdfonts.com/cheat-sheet

<!--
Link References
-->

[badge-version]:https://badge.fury.io/gh/ryanoasis%2Fnerd-fonts
[badge-gitter]:https://gitter.im/ryanoasis/nerd-fonts?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge

[img-version-badge]:https://img.shields.io/github/release/ryanoasis/nerd-fonts.svg?style=for-the-badge
[img-gitter-badge]:https://img.shields.io/gitter/room/nwjs/nw.js.svg?style=for-the-badge
[img-code-climate-badge]:https://img.shields.io/codeclimate/issues/github/ryanoasis/nerd-fonts.svg?style=for-the-badge
[coc-badge]: https://img.shields.io/badge/code%20of-conduct-ff69b4.svg?style=for-the-badge
[prs-badge]: https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=for-the-badge&logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48c3ZnIGlkPSJzdmcyIiB3aWR0aD0iNjQ1IiBoZWlnaHQ9IjU4NSIgdmVyc2lvbj0iMS4wIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPiA8ZyBpZD0ibGF5ZXIxIj4gIDxwYXRoIGlkPSJwYXRoMjQxNyIgZD0ibTI5Ny4zIDU1MC44N2MtMTMuNzc1LTE1LjQzNi00OC4xNzEtNDUuNTMtNzYuNDM1LTY2Ljg3NC04My43NDQtNjMuMjQyLTk1LjE0Mi03Mi4zOTQtMTI5LjE0LTEwMy43LTYyLjY4NS01Ny43Mi04OS4zMDYtMTE1LjcxLTg5LjIxNC0xOTQuMzQgMC4wNDQ1MTItMzguMzg0IDIuNjYwOC01My4xNzIgMTMuNDEtNzUuNzk3IDE4LjIzNy0zOC4zODYgNDUuMS02Ni45MDkgNzkuNDQ1LTg0LjM1NSAyNC4zMjUtMTIuMzU2IDM2LjMyMy0xNy44NDUgNzYuOTQ0LTE4LjA3IDQyLjQ5My0wLjIzNDgzIDUxLjQzOSA0LjcxOTcgNzYuNDM1IDE4LjQ1MiAzMC40MjUgMTYuNzE0IDYxLjc0IDUyLjQzNiA2OC4yMTMgNzcuODExbDMuOTk4MSAxNS42NzIgOS44NTk2LTIxLjU4NWM1NS43MTYtMTIxLjk3IDIzMy42LTEyMC4xNSAyOTUuNSAzLjAzMTYgMTkuNjM4IDM5LjA3NiAyMS43OTQgMTIyLjUxIDQuMzgwMSAxNjkuNTEtMjIuNzE1IDYxLjMwOS02NS4zOCAxMDguMDUtMTY0LjAxIDE3OS42OC02NC42ODEgNDYuOTc0LTEzNy44OCAxMTguMDUtMTQyLjk4IDEyOC4wMy01LjkxNTUgMTEuNTg4LTAuMjgyMTYgMS44MTU5LTI2LjQwOC0yNy40NjF6IiBmaWxsPSIjZGQ1MDRmIi8%2BIDwvZz48L3N2Zz4%3D
[twitter-badge]:https://img.shields.io/twitter/url/http/shields.io.svg?style=for-the-badge&logo=twitter
[os-badge]:https://img.shields.io/badge/-OS-brightgreen.svg?style=for-the-badge&logoWidth=80&logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48c3ZnIHdpZHRoPSIzOS43NDFtbSIgaGVpZ2h0PSIxMy4zNzdtbSIgdmVyc2lvbj0iMS4xIiB2aWV3Qm94PSIwIDAgMzkuNzQxMjggMTMuMzc3MTI3IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOmNjPSJodHRwOi8vY3JlYXRpdmVjb21tb25zLm9yZy9ucyMiIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj48bWV0YWRhdGE%2BPHJkZjpSREY%2BPGNjOldvcmsgcmRmOmFib3V0PSIiPjxkYzpmb3JtYXQ%2BaW1hZ2Uvc3ZnK3htbDwvZGM6Zm9ybWF0PjxkYzp0eXBlIHJkZjpyZXNvdXJjZT0iaHR0cDovL3B1cmwub3JnL2RjL2RjbWl0eXBlL1N0aWxsSW1hZ2UiLz48ZGM6dGl0bGUvPjwvY2M6V29yaz48L3JkZjpSREY%2BPC9tZXRhZGF0YT48ZyB0cmFuc2Zvcm09Im1hdHJpeCguMzMwODMgMCAwIC4zMzA4MyAyNi41MDggLTEuNzc0MikiPjxwb2x5Z29uIHBvaW50cz0iMTcuNCAzOC4zIDIxLjUgNDAuNiAyNy43IDQwLjYgMzMuNSAzNi4yIDM2LjEgMjkuMyAzMC4xIDIyIDI4LjQgMTcuOSAyMC4xIDE4LjIgMjAuMiAyMC41IDE4LjYgMjMuNSAxNi4xIDI4LjQgMTUuNiAzMi41IiBmaWxsPSIjZWNlZmYxIi8%2BPHBhdGggZD0ibTM0LjMgMjMuOWMtMS42LTIuMy0yLjktMy43LTMuNi02LjZzMC4yLTIuMS0wLjQtNC42Yy0wLjMtMS4zLTAuOC0yLjItMS4zLTIuOS0wLjYtMC43LTEuMy0xLjEtMS43LTEuMi0wLjktMC41LTMtMS4zLTUuNiAwLjEtMi43IDEuNC0yLjQgNC40LTEuOSAxMC41IDAgMC40LTAuMSAwLjktMC4zIDEuMy0wLjQgMC45LTEuMSAxLjctMS43IDIuNC0wLjcgMS0xLjQgMi0xLjkgMy4xLTEuMiAyLjMtMi4zIDUuMi0yIDYuMyAwLjUtMC4xIDYuOCA5LjUgNi44IDkuNyAwLjQtMC4xIDIuMS0wLjEgMy42LTAuMSAyLjEtMC4xIDMuMy0wLjIgNSAwLjIgMC0wLjMtMC4xLTAuNi0wLjEtMC45IDAtMC42IDAuMS0xLjEgMC4yLTEuOCAwLjEtMC41IDAuMi0xIDAuMy0xLjYtMSAwLjktMi44IDEuOS00LjUgMi4yLTEuNSAwLjMtNC0wLjItNS4yLTEuNyAwLjEgMCAwLjMgMCAwLjQtMC4xIDAuMy0wLjEgMC42LTAuMiAwLjctMC40IDAuMy0wLjUgMC4xLTEtMC4xLTEuM3MtMS43LTEuNC0yLjQtMi0xLjEtMC45LTEuNS0xLjNsLTAuOC0wLjhjLTAuMi0wLjItMC4zLTAuNC0wLjQtMC41LTAuMi0wLjUtMC4zLTEuMS0wLjItMS45IDAuMS0xLjEgMC41LTIgMS0zIDAuMi0wLjQgMC43LTEuMiAwLjctMS4ycy0xLjcgNC4yLTAuOCA1LjVjMCAwIDAuMS0xLjMgMC41LTIuNiAwLjMtMC45IDAuOC0yLjIgMS40LTIuOXMyLjEtMy4zIDIuMi00LjljMC0wLjcgMC4xLTEuNCAwLjEtMS45LTAuNC0wLjQgNi42LTEuNCA3LTAuMyAwLjEgMC40IDEuNSA0IDIuMyA1LjkgMC40IDAuOSAwLjkgMS43IDEuMiAyLjcgMC4zIDEuMSAwLjUgMi42IDAuNSA0LjEgMCAwLjMgMCAwLjgtMC4xIDEuMyAwLjIgMCA0LjEtNC4yLTAuNS03LjcgMCAwIDIuOCAxLjMgMi45IDMuOSAwLjEgMi4xLTAuOCAzLjgtMSA0LjEgMC4xIDAgMi4xIDAuOSAyLjIgMC45IDAuNCAwIDEuMi0wLjMgMS4yLTAuMyAwLjEtMC4zIDAuNC0xLjEgMC40LTEuNCAwLjctMi4zLTEtNi0yLjYtOC4zeiIgZmlsbD0iIzI2MzIzOCIvPjxnIGZpbGw9IiNlY2VmZjEiPjxlbGxpcHNlIGN4PSIyMS42IiBjeT0iMTUuMyIgcng9IjEuMyIgcnk9IjIiLz48ZWxsaXBzZSBjeD0iMjYuMSIgY3k9IjE1LjIiIHJ4PSIxLjciIHJ5PSIyLjMiLz48L2c%2BPGcgZmlsbD0iIzIxMjEyMSI%2BPGVsbGlwc2UgdHJhbnNmb3JtPSJtYXRyaXgoLS4xMjU0IC0uOTkyMSAuOTkyMSAtLjEyNTQgOC45NzU0IDM4Ljk5NykiIGN4PSIyMS43IiBjeT0iMTUuNSIgcng9IjEuMiIgcnk9Ii43Ii8%2BPGVsbGlwc2UgY3g9IjI2IiBjeT0iMTUuNiIgcng9IjEiIHJ5PSIxLjMiLz48L2c%2BPGcgZmlsbD0iI2ZmYzEwNyI%2BPHBhdGggZD0ibTM5LjMgMzcuNmMtMC40LTAuMi0xLjEtMC41LTEuNy0xLjQtMC4zLTAuNS0wLjItMS45LTAuNy0yLjUtMC4zLTAuNC0wLjctMC4yLTAuOC0wLjItMC45IDAuMi0zIDEuNi00LjQgMC0wLjItMC4yLTAuNS0wLjUtMS0wLjVzLTAuNyAwLjItMC45IDAuNi0wLjIgMC43LTAuMiAxLjdjMCAwLjggMCAxLjctMC4xIDIuNC0wLjIgMS43LTAuNSAyLjctMC41IDMuNyAwIDEuMSAwLjMgMS44IDAuNyAyLjEgMC4zIDAuMyAwLjggMC41IDEuOSAwLjVzMS44LTAuNCAyLjUtMS4xYzAuNS0wLjUgMC45LTAuNyAyLjMtMS43IDEuMS0wLjcgMi44LTEuNiAzLjEtMS45IDAuMi0wLjIgMC41LTAuMyAwLjUtMC45IDAtMC41LTAuNC0wLjctMC43LTAuOHoiLz48cGF0aCBkPSJtMTkuMiAzNy45Yy0xLTEuNi0xLjEtMS45LTEuOC0yLjktMC42LTEtMS45LTIuOS0yLjctMi45LTAuNiAwLTAuOSAwLjMtMS4zIDAuN3MtMC44IDEuMy0xLjUgMS44Yy0wLjYgMC41LTIuMyAwLjQtMi43IDFzMC40IDEuNSAwLjQgM2MwIDAuNi0wLjUgMS0wLjYgMS40LTAuMSAwLjUtMC4yIDAuOCAwIDEuMiAwLjQgMC42IDAuOSAwLjggNC4zIDEuNSAxLjggMC40IDMuNSAxLjQgNC42IDEuNXMzIDAgMy0yLjdjMC4xLTEuNi0wLjgtMi0xLjctMy42eiIvPjxwYXRoIGQ9Im0yMS4xIDE5LjhjLTAuNi0wLjQtMS4xLTAuOC0xLjEtMS40czAuNC0wLjggMS0xLjNjMC4xLTAuMSAxLjItMS4xIDIuMy0xLjFzMi40IDAuNyAyLjkgMC45YzAuOSAwLjIgMS44IDAuNCAxLjcgMS4xLTAuMSAxLTAuMiAxLjItMS4yIDEuNy0wLjcgMC4yLTIgMS4zLTIuOSAxLjMtMC40IDAtMSAwLTEuNC0wLjEtMC4zLTAuMS0wLjgtMC42LTEuMy0xLjF6Ii8%2BPC9nPjxnIGZpbGw9IiM2MzQ3MDMiPjxwYXRoIGQ9Im0yMC45IDE5YzAuMiAwLjIgMC41IDAuNCAwLjggMC41IDAuMiAwLjEgMC41IDAuMiAwLjUgMC4yaDAuOWMwLjUgMCAxLjItMC4yIDEuOS0wLjYgMC43LTAuMyAwLjgtMC41IDEuMy0wLjcgMC41LTAuMyAxLTAuNiAwLjgtMC43cy0wLjQgMC0xLjEgMC40Yy0wLjYgMC40LTEuMSAwLjYtMS43IDAuOS0wLjMgMC4xLTAuNyAwLjMtMSAwLjNoLTAuOWMtMC4zIDAtMC41LTAuMS0wLjgtMC4yLTAuMi0wLjEtMC4zLTAuMi0wLjQtMC4yLTAuMi0wLjEtMC42LTAuNS0wLjgtMC42IDAgMC0wLjIgMC0wLjEgMC4xbDAuNiAwLjZ6Ii8%2BPHBhdGggZD0ibTIzLjkgMTYuOGMwLjEgMC4yIDAuMyAwLjIgMC40IDAuM3MwLjIgMC4xIDAuMiAwLjFjMC4xLTAuMSAwLTAuMy0wLjEtMC4zIDAtMC4yLTAuNS0wLjItMC41LTAuMXoiLz48cGF0aCBkPSJtMjIuMyAxN2MwIDAuMSAwLjIgMC4yIDAuMiAwLjEgMC4xLTAuMSAwLjItMC4yIDAuMy0wLjIgMC4yLTAuMSAwLjEtMC4yLTAuMi0wLjItMC4yIDAuMS0wLjIgMC4yLTAuMyAwLjN6Ii8%2BPC9nPjxwYXRoIGQ9Im0zMiAzNC43djAuM2MwLjIgMC40IDAuNyAwLjUgMS4xIDAuNSAwLjYgMCAxLjItMC40IDEuNS0wLjggMC0wLjEgMC4xLTAuMiAwLjItMC4zIDAuMi0wLjMgMC4zLTAuNSAwLjQtMC42IDAgMC0wLjEtMC4xLTAuMS0wLjItMC4xLTAuMi0wLjQtMC40LTAuOC0wLjUtMC4zLTAuMS0wLjgtMC4yLTEtMC4yLTAuOS0wLjEtMS40IDAuMi0xLjcgMC41IDAgMCAwLjEgMCAwLjEgMC4xIDAuMiAwLjIgMC4zIDAuNCAwLjMgMC43IDAuMSAwLjIgMCAwLjMgMCAwLjV6IiBmaWxsPSIjNDU1YTY0Ii8%2BPC9nPjxnIHRyYW5zZm9ybT0ibWF0cml4KC4xMzk0NSAwIDAgLjEzOTQ1IDAgMS4xNjIzKSI%2BPHBhdGggZD0ibTAgMTIuNDAyIDM1LjY4Ny00Ljg2MDIgMC4wMTU2IDM0LjQyMy0zNS42NyAwLjIwMzEzeiIgZmlsbD0iI2Y4NjgyYyIvPjxwYXRoIGQ9Im0zOS45OTYgNi45MDU5IDQ3LjMxOC02LjkwNnY0MS41MjdsLTQ3LjMxOCAwLjM3NTY1eiIgZmlsbD0iIzkxYzMwMCIvPjxwYXRoIGQ9Im0zNS42NyA0NS45MzEgMC4wMjc3IDM0LjQ1My0zNS42Ny00LjkwNDEtMmUtMyAtMjkuNzh6IiBmaWxsPSIjMDBiNGYxIi8%2BPHBhdGggZD0ibTg3LjMyNiA0Ni4yNTUtMC4wMTExIDQxLjM0LTQ3LjMxOC02LjY3ODQtMC4wNjYzLTM0LjczOXoiIGZpbGw9IiNmZmMzMDAiLz48L2c%2BPHBhdGggZD0ibTI2LjEzNyAxMC4yODRjLTAuMTk5NTggMC40NjEwNi0wLjQzNTgxIDAuODg1NDctMC43MDk1MiAxLjI3NTctMC4zNzMwOCAwLjUzMTkzLTAuNjc4NTYgMC45MDAxMy0wLjkxMzk4IDEuMTA0Ni0wLjM2NDk0IDAuMzM1NjItMC43NTU5NSAwLjUwNzUtMS4xNzQ2IDAuNTE3MjctMC4zMDA1OSAwLTAuNjYzMDgtMC4wODU1My0xLjA4NS0wLjI1OTA0LTAuNDIzMzUtMC4xNzI2OS0wLjgxMjQtMC4yNTgyMy0xLjE2ODEtMC4yNTgyMy0wLjM3MzA4IDAtMC43NzMyMiAwLjA4NTU0LTEuMjAxMiAwLjI1ODIzLTAuNDI4NjQgMC4xNzM1MS0wLjc3Mzk1IDAuMjYzOTMtMS4wMzggMC4yNzI4OS0wLjQwMTUyIDAuMDE3MTItMC44MDE3My0wLjE1OTY2LTEuMjAxMi0wLjUzMTEyLTAuMjU0OTctMC4yMjIzOC0wLjU3Mzg4LTAuNjAzNjItMC45NTU5My0xLjE0MzctMC40MDk5LTAuNTc2NzQtMC43NDY5MS0xLjI0NTUtMS4wMTA5LTIuMDA4LTAuMjgyNzUtMC44MjM1Ni0wLjQyNDQ5LTEuNjIxMS0wLjQyNDQ5LTIuMzkzMSAwLTAuODg0NDEgMC4xOTExLTEuNjQ3MiAwLjU3Mzg4LTIuMjg2NCAwLjMwMDgzLTAuNTEzNDQgMC43MDEwNC0wLjkxODQ2IDEuMjAxOS0xLjIxNTggMC41MDA5LTAuMjk3MzMgMS4wNDIxLTAuNDQ4ODQgMS42MjUtMC40NTg1NCAwLjMxODkxIDAgMC43MzcxMyAwLjA5ODY1IDEuMjU2OCAwLjI5MjUyIDAuNTE4MjUgMC4xOTQ1MyAwLjg1MTAxIDAuMjkzMTggMC45OTY5IDAuMjkzMTggMC4xMDkwOCAwIDAuNDc4NzQtMC4xMTUzNSAxLjEwNTQtMC4zNDUzMSAwLjU5MjYyLTAuMjEzMjYgMS4wOTI4LTAuMzAxNTYgMS41MDI1LTAuMjY2NzggMS4xMTAzIDAuMDg5NiAxLjk0NDQgMC41MjcyOSAyLjQ5OTIgMS4zMTU4LTAuOTkyOTkgMC42MDE2Ni0xLjQ4NDIgMS40NDQ0LTEuNDc0NCAyLjUyNTQgOWUtMyAwLjg0MjA1IDAuMzE0NDMgMS41NDI4IDAuOTE0NzkgMi4wOTkxIDAuMjcyMDggMC4yNTgyMiAwLjU3NTkyIDAuNDU3OCAwLjkxMzk4IDAuNTk5NTQtMC4wNzMzMiAwLjIxMjYxLTAuMTUwNyAwLjQxNjI2LTAuMjMyOTggMC42MTE3NnptLTIuNTQ2NC0xMC4wMmMwIDAuNjYtMC4yNDExMiAxLjI3NjItMC43MjE3MyAxLjg0NjYtMC41OCAwLjY3ODA3LTEuMjgxNSAxLjA2OTktMi4wNDIzIDEuMDA4MS0wLjAwOTctMC4wNzkxOC0wLjAxNTMtMC4xNjI1MS0wLjAxNTMtMC4yNTAwOCAwLTAuNjMzNiAwLjI3NTgyLTEuMzExNyAwLjc2NTY0LTEuODY2MSAwLjI0NDU0LTAuMjgwNzEgMC41NTU1NS0wLjUxNDEyIDAuOTMyNzEtMC43MDAzMSAwLjM3NjM1LTAuMTgzNDEgMC43MzIzMy0wLjI4NDg1IDEuMDY3MS0wLjMwMjIxIDAuMDA5OCAwLjA4ODIzIDAuMDEzODUgMC4xNzY0NyAwLjAxMzg1IDAuMjY0eiIgc3Ryb2tlLXdpZHRoPSIuMDgxNDYiLz48L3N2Zz4%3D


[consolas]:https://www.microsoft.com/typography/fonts/family.aspx?FID=300
[input-mono]:http://input.djr.com/download/
[pragmatapro]:https://www.fsd.it/shop/fonts/pragmatapro/

[release]:https://github.com/ryanoasis/nerd-fonts/releases/latest "Latest Release (external link) ➶"
[coc]:https://github.com/ryanoasis/nerd-fonts/blob/-/code_of_conduct.md "Contributor Covenant Code of Conduct"
[prs]:http://makeapullrequest.com "Make a Pull Request (external link) ➶"

<!--
Font repos
-->

[f-arimo]:https://github.com/google/fonts/tree/master/apache/arimo
[f-hack]:https://github.com/chrissimpkins/Hack
[f-a-pro]:https://www.marksimonson.com/fonts/view/anonymous-pro
[f-3270]:https://github.com/rbanffy/3270font
[f-cousine]:https://fonts.google.com/specimen/Cousine
[f-source]:https://github.com/adobe-fonts/source-code-pro
[f-liberation]:https://pagure.io/liberation-fonts
[f-terminus]:http://terminus-font.sourceforge.net
[f-fira-mono]:https://github.com/mozilla/Fira
[f-fira-code]:https://github.com/tonsky/FiraCode
[f-monoid]:https://github.com/larsenwork/monoid
[f-iosevka]:https://github.com/be5invis/Iosevka
[f-jetbrains-mono]:https://github.com/JetBrains/JetBrainsMono
[f-fant]:https://github.com/belluzj/fantasque-sans
[f-share]:https://fonts.google.com/specimen/Share+Tech+Mono
[f-space]:https://fonts.google.com/specimen/Space+Mono
[f-go-mono]:https://go.googlesource.com/image/+/master/font/gofont/ttfs/
[f-gohu]:http://font.gohu.org/
[f-gohu2]:https://github.com/koemaeda/gohufont-ttf
[f-mononoki]:https://madmalik.github.io/mononoki/
[f-hasklig]:https://github.com/i-tu/Hasklig
[f-departuremono]:https://github.com/rektdeckard/departure-mono

<!--
Patched Font internal links
-->

[p-3270]:patched-fonts/3270
[p-anonymous-pro]:patched-fonts/AnonymousPro
[p-aurulent]:patched-fonts/AurulentSansMono
[p-arimo]:patched-fonts/Arimo
[p-bigblueterm]:patched-fonts/BigBlueTerminal
[p-bitstream]:patched-fonts/BitstreamVeraSansMono
[p-cousine]:patched-fonts/Cousine
[p-departuremono]:patched-fonts/DepartureMono
[p-dejavu]:patched-fonts/DejaVuSansMono
[p-droid]:patched-fonts/DroidSansMono
[p-fantasque]:patched-fonts/FantasqueSansMono
[p-fira-code]:patched-fonts/FiraCode
[p-fira-mono]:patched-fonts/FiraMono
[p-heavy-data]:patched-fonts/HeavyData
[p-hermit]:patched-fonts/Hermit
[p-inconsolata]:patched-fonts/Inconsolata
[p-inconsolata-go]:patched-fonts/InconsolataGo
[p-inconsolata-lgc]:patched-fonts/InconsolataLGC
[p-iosevka]:patched-fonts/Iosevka
[p-jetbrains-mono]:patched-fonts/JetBrainsMono
[p-hack]:patched-fonts/Hack
[p-lekton]:patched-fonts/Lekton
[p-liberation]:patched-fonts/LiberationMono
[p-meslo]:patched-fonts/Meslo
[p-monofur]:patched-fonts/Monofur
[p-monoid]:patched-fonts/Monoid
[p-mplus]:patched-fonts/MPlus
[p-noto]:patched-fonts/Noto
[p-opendyslexic]:patched-fonts/OpenDyslexic
[p-overpass]:patched-fonts/Overpass
[p-profont]:patched-fonts/ProFont
[p-proggy-clean]:patched-fonts/ProggyClean
[p-roboto]:patched-fonts/RobotoMono
[p-source-code-pro]:patched-fonts/SourceCodePro
[p-terminus]:patched-fonts/Terminus
[p-tinos]:patched-fonts/Tinos
[p-ubuntu]:patched-fonts/Ubuntu
[p-ubuntu-mono]:patched-fonts/UbuntuMono
[p-share-tech-mono]:patched-fonts/ShareTechMono
[p-space-mono]:patched-fonts/SpaceMono
[p-go-mono]:patched-fonts/Go-Mono
[p-gohu]:patched-fonts/Gohu
[p-mononoki]:patched-fonts/Mononoki
[p-code-nr]:patched-fonts/CodeNewRoman
[p-hasklig]:patched-fonts/Hasklig


<!--
Quick Link Images
-->

[ql-1]:images/nerd-fonts-character-logo-md.png "Latest Release (external link) ➶"
[ql-2]:images/nerd-fonts-character-logo-md.png "↓ View Patched Fonts List ↓"
[ql-3]:images/nerd-fonts-patcher-logo-md.png "↓ Font Patcher Details ↓"
[ql-4]:https://raw.githubusercontent.com/wiki/ryanoasis/vim-devicons/screenshots/v1.0.0/branding-logo-sm.png "VimDevIcons Vim Plugin (external link) ➶"
[ql-5]:images/nerd-fonts-character-logo-md.png "Font Package Archive (Zip) Downloads (external link) ➶"

<!--
Patched Font Statuses
-->

[w-top]:https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/windows-pass-sm.png "↓ Windows Compatibility Status ↓"
[l-top]:https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/linux-pass-sm.png "↓ Linux Compatibility Status ↓"
[m-top]:https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/mac-pass-sm.png "↓ macOS (OSX) Compatibility Status ↓"

[w]:https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/windows-pass-sm.png "Windows status is working ☺"
[l]:https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/linux-pass-sm.png "Linux status is working ☺"
[m]:https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/mac-pass-sm.png "macOS (OSX) status is working ☺"

[w2]:https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/windows-unknown-sm.png "Windows status is Unknown/Un-tested"
[l2]:https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/linux-unknown-sm.png "Linux status is Unknown/Un-tested"
[m2]:https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/mac-unknown-sm.png "macOS (OSX) status is Unknown/Un-tested"

[s-iosevka]:https://github.com/ryanoasis/nerd-fonts/issues/83
