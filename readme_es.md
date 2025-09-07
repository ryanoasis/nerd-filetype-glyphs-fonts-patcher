<h1 align="center" name="top">
  <img src="images/nerd-fonts-logo.svg" alt="Nerd Fonts Logo" />
</h1>
<h2 align="center">
  <img alt="Agregador, colección y parchador para fuentes de iconos" src="images/project-subtitle-phrase.svg">
</h2>

<div align="center">

[Lanzamientos][release]&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Fuentes](#patched-fonts)&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Parchador de Fuentes](#font-patcher)&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Documentación en Wiki][wiki]&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Stickers][stickers]&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[VimDevIcons][vim-devicons]


[![Lanzamientos en GitHub][img-version-badge]][repo] [![Gitter][img-gitter-badge]][gitter] [![Código de Conducta][coc-badge]][coc] [![PRs son Bienvenidos][prs-badge]][prs]  <a href="#patched-fonts" title=""><img src="https://raw.githubusercontent.com/wiki/ryanoasis/nerd-fonts/images/faux-shield-badge-os-logos.svg?sanitize=true" alt="Nerd Fonts - Soporte de SO"></a>


</div>


**Nerd Fonts** es un proyecto que parcha las fuentes que un desarrollador va a usar con un número alto de glifos (iconos). Especificamente añade un gran número de glifos extra de algunas 'fuentes de iconos' como [Font Awesome ➶][font-awesome], [Devicons ➶][vorillaz-devicons], [Octicons ➶][octicons], y [otras](#glyph-sets).

El siguiente diagrama Sankey muestra los conjuntos de glifos incluidos en la actualidad:

<p align="center">
  <img src="images/sankey-glyphs-combined-diagram.svg" alt="Diagrama @SankeyMATIC" />
</p>
<sub><i>Diagrama creado usando <a href="http://sankeymatic.com/" title="SankeyMATIC (BETA): Un contructor de diagramas Sankey para todos">@SankeyMATIC</a></i></sub>


## Noticias Importantes
* Las rutas de archivo en la rama `master` **no** son consideradas estables. [Verifica las referencias URI de tu repositorio](#unstable-file-paths)
* Clonar este repositorio **no** es recomendado ([debido al tamaño del Repo](#option-5-clone-the-repo)) a menos que vayas a [contribuir al desarrollo](#contributing)


## Tabla de Contenidos

[**TL;DR**](#tldr)

[**Opciones de Instalación**](#font-installation)
  * [**1 - Manual**](#option-1-download-and-install-manually)
  * [**2 - Descarga de Archivo de Release**](#option-2-release-archive-download)
  * [**3 - Script de Instalación**](#option-3-install-script)
  * [**4 - Fuentes Homebrew (macOS (OS X))**](#option-4-homebrew-fonts)
  * [**5 - Clonar el Repo**](#option-5-clone-the-repo)
  * [**6 - Descarga Ad Hoc con Curl**](#foo)
  * [**7 - Chocolatey o Scoop (Windows)**](#option-7-unofficial-chocolatey-or-scoop-repositories)
  * [**8 - Repositorio de Arch Linux (Community, AUR)**](#option-8--arch-community-repository)
  * [**9 - Parcha tu Propia Fuente**](#option-9-patch-your-own-font)

[**Características**](#features)
  * [**Conjuntos de Glifos/Iconos**](#glyph-sets)
  * [**Fuentes Parchadas**](#patched-fonts)
  * [**Combinaciones**](#combinations)
  * [**Parchador de Fuentes**](#font-patcher)

[**Desarrollador / Contribuidor**](#font-patcher)
  * [**Parchador de Fuentes**](#font-patcher)
  * [**Parchador de Fuentes ¡Hay que Parcharlas a Todas!**](#gotta-patch-em-all-font-patcher)
  * [**Otras Buenas Fuentes para Parchar**](#other-good-fonts-to-patch)
  * [**Contribuir**](#contributing)

[**Motivación del Proyecto**](#project-motivation)

**Información adicional**
  * [**Rutas de Archivo Inestables en master**](#unstable-file-paths)
  * [**Registro de Cambios**](#changelog)
  * [**Licencia**](#license)


## TL;DR
  Nerd Fonts toma algunas fuentes populares para desarrollo y les añade bastantes glifos.
  También hay un [parchador de fuentes](#font-patcher) disponible si tu fuente preferida no ha sido parchada previamente.
  Para información de alto nivel revisa la [wiki (en inglés)][wiki]. Si estás buscando el plugin de Vim ve a [VimDevIcons ➶][vim-devicons].

### Varias Opciones de Descarga para Fuentes

_Si tú..._

  * `Opción 1.` quieres descargar **rápidamente** una **fuente individual**, descárgala desde [el directorio `patched-fonts/`](#patched-fonts)
  * `Opción 2.` quieres descargar un paquete de variaciones de una **familia de fuentes** (negrita, itálica, etc.), ve a [descargar un paquete](#option-2-release-archive-download)
  * `Opción 3.` quieres **automatizar** la instalación o usar esto en un **script**, ve a [Script de Instalación](#option-3-install-script)
  * `Opción 4.` estás en **macOS** y quieres usar el **Homebrew**, ve a [Fuentes Homebrew](#option-4-homebrew-fonts)
  * `Opción 5.` quieres **control completo**, entonces ve a [clonar el repo](#option-5-clone-the-repo)
  * `Opción 6.` quieres usar el **comando `curl`** o usar en **scripts**, ve a [Descarga Ad Hoc con Curl](#option-6-ad-hoc-curl-download)
  * `Opción 7.` estás en **Windows** y quieres usar **Chocolatey** o **Scoop** ve a [Repositorios no oficiales Chocolatey o Scoop](#option-7-unofficial-chocolatey-or-scoop-repositories)
  * `Opción 8.` estás en **Arch Linux** y quieres usar **paquetes Community**, ve a [Repositorios Community de Arch](#option-8-arch-community-repository)
  * `Opción 9.` quieres parchar tu propia fuente, ve a [Parchador de Fuentes](#option-9-patch-your-own-font)

## Características
* Un [script de FontForge en Python](#font-patcher) para parchar cualquier fuente
  * Incluye una opción para crear glifos **Monoespaciados (paso fijo, ancho fijo)** _o_ glifos de **ancho doble (no monoespaciados)**
  * Para más detalles ve a la sección del [**Parchador de Fuentes**](#font-patcher)
* **`53`** [familias de fuentes parchadas](#patched-fonts) hasta ahora
* Más de **`9,000`** glifos/iconos en total [(más detalles)](#combinations)
  * Los conjuntos de glifos actuales incluyen: [Powerline with Extra Symbols][ryanoasis-powerline-extra-symbols], [Font Awesome][font-awesome], [Material Design Icons][font-material-design-icons], [Weather][font-weather], [Devicons][vorillaz-devicons], [Octicons][octicons], [Font Logos][font-logos] (Formerly Font Linux), [Pomicons][gabrielelana-pomicons]
* Hay versiones de glifos **Monoespaciados (paso fijo, ancho fijo)** _o_ de **ancho doble (no monoespaciados)** para cada fuente
  * Esto se refiere a los glifos de Nerd Fonts, no necesariamente a la fuente en general
* Un [script de bash](#gotta-patch-em-all-font-patcher) provisto por desarrolladores/contribuidores para reparchar todas las fuentes


## Conjuntos de Glifos

:mag: :mag: Puedes buscar glifos fácilmente entrando a [NerdFonts.com][Cheat Sheet] a través de la [Hoja de Trampa][Cheat Sheet]

Ve a la [Wiki: Conjuntos de Glifos y Puntos de Código para más detalles][wiki-glyph-sets-codepoints]

### Nombres de Iconos en la Shell

Ve a la [Wiki: Nombres de iconos en la shell][wiki-icon-names-in-shell]


## Fuentes Parchadas

| Nombre de la Fuente                              | Nombre de Fuente y REpositorio     |versión|\*RFN | Estado            |
|:--------------------------------------------------|:----------------------------------|:------|:-----|:------------------|
| [3270 Nerd Font][p-3270]                          | [3270][f-3270]                    | 3.0.1 | NO   | ![w] ![m2] ![l]   |
| [Agave][p-agave]                                  | [Agave][f-agave]                  | 37    | NO   | ![w] ![m2] ![l]   |
| [AnonymicePro Nerd Font][p-anonymous-pro]         | [Anonymous Pro][f-a-pro]          | 1.002 | YES  | ![w] ![m2] ![l]   |
| [Arimo][p-arimo]                                  | [Arimo][f-arimo]                  | 1.33  | NO   | ![w] ![m2] ![l]   |
| [Aurulent Sans Mono Nerd Font][p-aurulent]        | Stephen G. Hartke                 |       | NO   | ![w] ![m2] ![l]   |
| [BigBlueTerminal][p-bigblueterm]                  | VileR                             |       | NO   | ![w] ![m2] ![l]   |
| [Bitstrom Wera Nerd Font][p-bitstream]            | Bitstream Inc                     | 1.1   | YES  | ![w] ![m2] ![l]   |
| [Blex Mono][p-blex]                               | [IBM Plex Mono][f-ibm-plex]       | 2.3   | YES  | ![w] ![m2] ![l]   |
| [Caskaydia Cove Nerd Font][p-cascadia]            | [Cascadia Code][f-cascadia]       |2111.01| YES  | ![w] ![m2] ![l]   |
| [Code New Roman Nerd Font][p-code-nr]             | Sam Radian                        | 2.0   | NO   | ![w] ![m2] ![l]   |
| [Comic Shanns Mono Nerd Font][p-comic]            | [Comic Shanns Mono][f-comic]      | 1.3   | NO   | ![w] ![m2] ![l]   |
| [Cousine Nerd Font][p-cousine]                    | [Cousine][f-cousine]              | 1.211 | NO   | ![w] ![m2] ![l]   |
| [DaddyTimeMono][p-daddytimemono]                  | [DaddyTimeMono][f-daddytimemono]  | 1.2.3 | NO   | ![w] ![m2] ![l]   |
| [DepartureMono Nerd Font][p-departuremono]        | [Departure Mono][f-departuremono] | 1.422 | NO   | ![w] ![m2] ![l]   |
| [DejaVu Sans Mono Nerd Font][p-dejavu]            | [DejaVu][f-dejavu]                | 2.37  | NO   | ![w] ![m2] ![l]   |
| [Droid Sans Mono Nerd Font][p-droid]              | Ascender Corp                     |1.00-113| NO   | ![w] ![m2] ![l]   |
| [Fantasque Sans Nerd Font][p-fantasque]           | [Fantasque Sans][f-fant]          | 1.8.0 | NO   | ![w] ![m2] ![l]   |
| [Fira Code Nerd Font][p-fira-code]                | [Fira Code][f-fira-code]          | 6.2   | NO   | ![w] ![m2] ![l]   |
| [Fira Mono Nerd Font][p-fira-mono]                | [Fira][f-fira-mono]               | 3.206 | NO   | ![w] ![m2] ![l]   |
| [Go Mono Nerd Font][p-go-mono]                    | [Go-Mono][f-go-mono]              | 2.010 | NO   | ![w] ![m2] ![l]   |
| [Gohu Nerd Font][p-gohu]                          | [Gohu TTF][f-gohu2],[Gohu][f-gohu]| 2.0   | NO   | ![w] ![m2] ![l]   |
| [Hack Nerd Font][p-hack]                          | [Hack][f-hack]                    | 3.003 | NO   | ![w] ![m2] ![l]   |
| [Hasklug Nerd Font][p-hasklig]                    | [Hasklig][f-hasklig]              | 1.2   | YES  | ![w] ![m2] ![l]   |
| [Heavy Data Mono Nerd Font][p-heavy-data]         | Vic Fieger                        | 1     | NO   | ![w] ![m2] ![l]   |
| [Hurmit Nerd Font][p-hermit]                      | [Hermit][f-hermit]                | 2.0   | YES  | ![w] ![m2] ![l]   |
| [iM-Writing][p-im-writing]                        | [iA-Writer][f-ia-writer]          | Dec 2018 | YES  | ![w] ![m2] ![l]   |
| [Inconsolata Nerd Font][p-inconsolata]            | [Inconsolata][f-inconsolata]      | 3.000 | NO   | ![w] ![m2] ![l]   |
| [Inconsolata Go Nerd Font][p-inconsolata-go]      | [InconsolataGo][f-inconsolatago]  | 1.013 | NO   | ![w] ![m2] ![l]   |
| [Inconsolata LGC Nerd Font][p-inconsolata-lgc]    | [Inconsolata LGC][f-inconsolatalgc] | 1.3 | NO   | ![w] ![m2] ![l]   |
| [Iosevka Nerd Font][p-iosevka]                    | [Iosevka][f-iosevka]              |22.1.0 | NO   | ![w] ![m2] ![l]   |
| [Iosevka Term Nerd Font][p-iosevka-term]          | [Iosevka Term][f-iosevka]         |22.1.0 | NO   | ![w] ![m2] ![l]   |
| [JetBrains Mono][p-jetbrains-mono]                | [JetBrains Mono][f-jetbrains-mono]| 2.304 | NO   | ![w] ![m2] ![l]   |
| [Lekton Nerd Font][p-lekton]                      | [Lekton][f-lekton]                | 34    | NO   | ![w] ![m2] ![l]   |
| [Literation Mono Nerd Font][p-liberation]         | [Liberation][f-liberation]        | 2.1.5 | YES  | ![w] ![m2] ![l]   |
| [Lilex Nerd Font][p-lilex]                        | [Lilex][f-lilex]                  | 2.300 | NO   | ![w2] ![m2] ![l]  |
| [Meslo Nerd Font][p-meslo]                        | [Meslo][f-meslo]                  | 1.21  | NO   | ![w] ![m2] ![l]   |
| [Monofur Nerd Font][p-monofur]                    | Tobias B Koehler                  | 1.0   | NO   | ![w] ![m2] ![l]   |
| [Monoid Nerd Font][p-monoid]                      | [Monoid][f-monoid]                | 0.61  | NO   | ![w] ![m2] ![l]   |
| [Mononoki Nerd Font][p-mononoki]                  | [Mononoki][f-mononoki]            | 1.6   | YES  | ![w] ![m2] ![l]   |
| [M+ (MPlus) Nerd Font][p-mplus]                   | [M+ Fonts][f-mplus]               |2023/03| NO   | ![w] ![m2] ![l]   |
| [Noto][p-noto]                                    | [Noto][f-noto]                    | div   | NO   | ![w] ![m2] ![l]   |
| [OpenDyslexic][p-opendyslexic]                    | [OpenDyslexic][f-opendyslexic]    | 2.001 | NO   | ![w] ![m2] ![l]   |
| [Overpass][p-overpass]                            | [Overpass][f-overpass]            | 3.0.5 | NO   | ![w] ![m2] ![l]   |
| [ProFont (Windows tweaked) Nerd Font][p-profont]  | [ProFont][f-profont]              | 2.3   | NO   | ![w] ![m2] ![l]   |
| [ProFont (x11) Nerd Font][p-profont]              | [ProFont][f-profont]              | 2.2   | NO   | ![w] ![m2] ![l]   |
| [ProggyClean Nerd Font][p-proggy-clean]           | Tristan Grimmer                   |2004/04/15| NO   | Imperfect         |
| [Roboto Mono][p-roboto]                           | [Roboto Mono][f-roboto]           | 3.0   | NO   | ![w] ![m2] ![l]   |
| [Sauce Code Nerd Font][p-source-code-pro]         | [Source][f-source]                | 2.038 | YES  | ![w] ![m2] ![l]   |
| [Shure Tech Mono Nerd Font][p-share-tech-mono]    | [Share Tech Mono][f-share]        | 1.003 | YES  | ![w] ![m2] ![l]   |
| [Space Mono Nerd Font][p-space-mono]              | [Space Mono][f-space]             | 1.001 | NO   | ![w] ![m2] ![l]   |
| [Terminess Nerd Font][p-terminus]                 | [Terminus TTF][f-terminus]        |4.49.2 | YES  | ![w] ![m2] ![l]   |
| [Tinos][p-tinos]                                  | [Tinos][f-tinos]                  | 1.23  | NO   | ![w] ![m2] ![l]   |
| [Ubuntu Nerd Font][p-ubuntu]                      | [Ubuntu Font][f-ubuntu]           | 0.83  | NO   | ![w] ![m2] ![l]   |
| [Ubuntu Mono Nerd Font][p-ubuntu-mono]            | [Ubuntu Font][f-ubuntu]           | 0.80  | NO   | ![w] ![m2] ![l]   |
| [Victor Mono][p-victor]                           | [Victor Mono][f-victor]           | 1.5.4 | NO   | ![w] ![m2] ![l]   |

<sub>_*RFN = Reserved Font Name_</sub>

### Variaciones

- si no se pasan parámetros (por defecto solo para **Seti-UI + Personalizado** y **[Devicons][vorillaz-devicons]**)
- glifos de ancho **doble _(variable/proporcional)_** o **simple _(fijo/monoespaciado)_**
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

## Instalación de Fuentes

### `Opción 1: Descarga e Instala Manualmente`

> Es la mejor opción para obtener **rápidamente** una **fuente individual**.

Descarga la [fuente parchada](#patched-fonts) específica que desees

### `Opción 2: Descargar Paquete de Release`

> Es la mejor opción si quieres un **paquete** o una **familia de fuentes** con variaciones (negrita, itálica, etc.).

Las fuentes están disponibles para descarga como paquetes en los [últimos lanzamientos](https://github.com/ryanoasis/nerd-fonts/releases/latest)

### `Opción 3: Script de Instalación`

> Es la mejor opción si quieres **automatizar** la instalación o usarlo en **scripts**.

_Nota_: **Requiere clonar** el repo por el momento

#### Todas las fuentes:

* Instala todas las Fuentes parchadas (_Advertencia: Son una gran cantidad de Fuentes que suman un tamaño grande_)

```sh
./install.sh
```

o, en Powershell (solo Windows):

```pwsh
./install.ps1
```

#### Fuentes individuales:

* Instala una fuente individual de tu preferencia

```sh
./install.sh <NombreFuente>
./install.sh Hack
./install.sh HeavyData
```

o, en Powershell (solo Windows):

```pwsh
./install.ps1 <FontName>
./install.ps1 Hack
./install.ps1 HeavyData
./install.ps1 FiraCode, Hack
./install.ps1 DejaVuSansMono -WhatIf
```

### `Opción 4: Fuentes Homebrew`

> Es la mejor opcion si estás en **macOS** y quieres usar **Homebrew**.

Todas las fuentes están disponibles en [Homebrew Cask](https://github.com/Homebrew/homebrew-cask) en macOS (OS X)

```sh
brew install font-hack-nerd-font
```

_On Linux you have to add `--cask` after `install`._

### `Opción 5: Clonar el repo`

> Es la mejor opción si quieres **control completo**, **todas** o **la mayoría** de las fuentes, o **contribuir** al desarrollo.

Clonar este repositorio **no** es requerido ni es eficiente (más que todo debido al tamaño del Repositorio) si tú simplemente estás interesado en un conjunto limitado de fuentes.

Sin embargo, si quieres clonar el repo, asegúrate de hacer un clón _superficial_:
```sh
git clone --depth 1
```

Si quires clonar un sub-directorio, usa `git sparse-checkout`. El siguiente ejemplo requiere `Git v2.26`:

```sh
git clone --filter=blob:none --sparse git@github.com:ryanoasis/nerd-fonts
cd nerd-fonts
git sparse-checkout add patched-fonts/JetBrainsMono
```

### `Opción 6: Descarga Ad Hoc con Curl`

> Esta es la opción si deseas usar el **comando `curl`** o para usarlo con **scripts**.

#### Linux

```sh
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf
```

Nota:_ Rutas alternativas deprecadas: `~/.fonts`

#### macOS (OS X)

```sh
cd ~/Library/Fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf
```

### `Opción 7: Repositorios no oficiales Chocolatey o Scoop`

> Es la opción para **Windows** si quieres usar **Chocolatey** o **Scoop**.

Los usuarios de Chocolatey pueden descargar fuentes publicadas en el [Repositorio de la Comunidad Chocolatey (CCR)](https://community.chocolatey.org/packages):

```powershell
choco install nerd-fonts-hack
```

Los usuarios de Scoop pueden descargar fuentes usando el [Scoop bucket para Nerd Fonts](https://github.com/matthewjberger/scoop-nerd-fonts):

```powershell
scoop bucket add nerd-fonts
scoop install Hack-NF
```

### `Opción 8: Repositorio Community de Arch`

> Es la opción para usuarios de **Arch Linux** que quieren usar **paquetes Community**.

La mayoría de las fuentes están disponibles a través de los [paquetes Community de Arch](https://archlinux.org/groups/any/nerd-fonts/).
Algunos paquetes especiales están [en AUR](https://aur.archlinux.org/packages?K=nerd-fonts-&outdated=off).

### `Opción 9: Parchar tu Propia Fuente`

> La opción para **parchar** tu **propia fuente** o **personalizar** completamente la fuente parchada.

Usa el script de línea de comandos de Python provisto para generar una fuente parchada desde tu propia fuente y obtener los glifos extra nuevos.

Ve a: [Parchador de fuentes](#font-patcher) para aprender como usarlo.

* usa esta opción si __no__ quieres usar alguna de las [fuentes provistas](#patched-fonts)
* aún necesitarás copiar la fuente generada al directorio correcto de fuentes de tu sistema


<h2 align="center" id="font-patcher">
	<img src="images/nerd-fonts-patcher-logo.png" alt="Parchador de Nerd Fonts">
</h2>

Parcha la fuente de tu preferencia:
* Usa el script
  * Descarga el script y los archivos auxiliares como [archivo](https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FontPatcher.zip) y extráelo
  * Descargar únicamente el script `font-patcher` no es suficiente.
  * Requieres: Fontforge, Python 3, los paquetes `python-fontforge` y `argparse` 
    * Fontforge puede ser instalado como un paquete
    * o en OSX mediante `brew install fontforge`
    * o como [AppImage](https://github.com/fontforge/fontforge/releases)
  * Uso, recomendado:
  ```
  fontforge -script font-patcher PATH_TO_FONT
  ```
  * Uso, directo (comando más conveniente, si funciona para ti):
  ```
  ./font-patcher PATH_TO_FONT
  ```
  * Uso, con Fontforge AppImage

    _Nota_: ejecuta `chmod u+x` en el archivo AppImage después de la descarga. Todas las rutas proveidas necesitan que ser **absolutas** y ¡una ruta de salida explícita es requerida! Si todo está localizado en el mismo directorio, puedes usar el atajo `$PWD`.
  ```
  ./FontForge.AppImage -script $PWD/font-patcher $PWD/BaseFont.ttf -out /tmp
  ```

* Usa docker
  ```
  docker run --rm -v /path/to/fonts:/in:Z -v /path/for/output:/out:Z nerdfonts/patcher [OPTIONS]
  ```

Opciones completas:

```
Nerd Fonts Patcher v3.0.1 (4.3.1) (ff 20230101)
uso: font-patcher [-h] [-v] [-s] [-l] [-q] [-c] [--careful] [--removeligs] [--postprocess [POSTPROCESS]] [--configfile [CONFIGFILE]] [--custom [CUSTOM]]
                    [-ext [EXTENSION]] [-out [OUTPUTDIR]] [--glyphdir [GLYPHDIR]] [--makegroups [{0,1,2,3,4,5,6}]] [--variable-width-glyphs] [--has-no-italic]
                    [--progressbars | --no-progressbars] [--debug [{0,1,2,3}]] [--dry] [--xavgcharwidth [XAVGWIDTH]] [--fontawesome] [--fontawesomeextension] [--fontlogos]
                    [--octicons] [--codicons] [--powersymbols] [--pomicons] [--powerline] [--powerlineextra] [--material] [--weather]
                    font

Parchador de fuentes Nerd Fonts: parcha una fuente dada con glifos relacionados con la programación y el desarrollo

* Sitio web: https://www.nerdfonts.com
* Versión: 3.0.1
* Sitio de Desarrollo: https://github.com/ryanoasis/nerd-fonts
* Registro de Cambios: https://github.com/ryanoasis/nerd-fonts/blob/-/changelog.md

argumentos posicionales:
  font                  Ruta a la fuente a parchar (ej., Inconsolata.otf)

argumentos opcionales:
  -h, --help            muestra este mensaje de ayuda y sale
  -v, --version         muestra la versión del programa y sale
  -s, --mono            Indica si genera los glifos como ancho simple, no doble (por defecto es ancho doble)
  -l, --adjust-line-height
                        Indica si se ajustan las alturas de línea (para intentar centrar los separadores de powerline más parejo)
  -q, --quiet, --shutup
                        No generar salida verbal
  -c, --complete        Añade todos los glifos disponibles
  --careful             No sobreescribe los glifos que ya existen si son detectados
  --removeligs, --removeligatures
                        Remueve ligaturas especificadas en el archivo de configuración JSON
  --postprocess [POSTPROCESS]
                        Especifica un Script para Post Procesamiento
  --configfile [CONFIGFILE]
                        Especifica una ruta de archivo para un archivo de configuración JSON (mira el ejemplo en: src/config.sample.json)
  --custom [CUSTOM]     Especifica una fuente de símbolos personalizados. Todos los glifos serán copiados; se recomienda ruta absoluta.
  -ext [EXTENSION], --extension [EXTENSION]
                        Cambia el tipo de archivo de fuente a crear (ej., ttf, otf)
  -out [OUTPUTDIR], --outputdir [OUTPUTDIR]
                        El directorio donde se generará el archivo de fuente parchado
  --glyphdir [GLYPHDIR]
                        Ruta a los glifos que se utilizarán para parchar
  --makegroups [{0,1,2,3,4,5,6}]
                        Usar el método alternativo para nombrar a las fuentes parchadas (recomendado)
  --variable-width-glyphs
                        No ajustar el ancho de avance (sin "voladizos")
  --has-no-italic       La familia de fuente no tiene Italica (pero sí Oblicua)
  --progressbars        Muestra barras de progreso con porcentajes de completitud por cada Conjunto de Glifos
  --no-progressbars     No muestra barras de progreso con porcentajes de completitud por cada Conjunto de Glifos
  --debug [{0,1,2,3}]   Modo de verbosidad (opcional: 1=solo a archivo; 2*=solo a terminal; 3=terminal y archivo)
  --dry                 No parchar ni guardar la fuente, para checar los nombres
  --xavgcharwidth [XAVGWIDTH]
                        Ajustar xAvgCharWidth (opcional: valor en concreto)

Symbol Fonts:
  --fontawesome         Añade los glifos de Font Awesome (http://fontawesome.io/)
  --fontawesomeextension
                        Añade los glifos de Font Awesome Extension (https://andrelzgava.github.io/font-awesome-extension/)
  --fontlogos, --fontlinux
                        Añade los glifos de Font Logos (https://github.com/Lukas-W/font-logos)
  --octicons            Añade los glifos de Octicons (https://octicons.github.com)
  --codicons            Add Codicons Glyphs (https://github.com/microsoft/vscode-codicons)
  --powersymbols        Añade los glifos de IEC Power Symbols (https://unicodepowersymbol.com/)
  --pomicons            Añade los glifos de Pomicon (https://github.com/gabrielelana/pomicons)
  --powerline           Añade los glifos de Powerline
  --powerlineextra      Añade los glifos de Powerline (https://github.com/ryanoasis/powerline-extra-symbols)
  --material, --materialdesignicons, --mdi
                        Añade los glifos de Material Design Icons (https://github.com/templarian/MaterialDesign)
  --weather, --weathericons
                        Añade los glifos de Weather Icons (https://github.com/erikflowers/weather-icons)
```

#### Ejemplos

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

Usualmente quieres la opción `--complete`.

## Parchador de Fuentes ¡Hay que Parcharlas a Todas!

* para uso de los Contribuidores o Desarrolladores

* reparcha **todas** las fuentes sin parchar en el directorio:

  ```
  ./gotta-patch-em-all-font-patcher\!.sh
  ```

* puede opcionalmente limitarse a un patrón específico de nombre de fuente:

  ```
  ./gotta-patch-em-all-font-patcher\!.sh Hermit
  ```

* o a un inicio de nombre de directorioespecífico :

  ```
  ./gotta-patch-em-all-font-patcher\!.sh /Heavy
  ```

Opciones completas:

```
Uso: ./gotta-patch-em-all-font-patcher!.sh [OPCIÓN] [FILTRO]

    OPCIÓN:
        -c, --checkfont     Crear la(s) fuente(s) en el directorio check-fonts/
        -t, --keeptime      Intenta preservar la marca de tiempo de la fuente
                            parchada previamente en el directorio patched-fonts/
        -v, --verbose       Mostrar más información al momento de ejecución
        -i, --info          Reconstruir ÚNICAMENTE los readmes
        -j, --jobs          Ejecutar hasta 8 procesos de parchado en paralelo
        -h, --help          Mostrar esta ayuda

    FILTRO:
        El argumento del filtro a este script es un filtro para las fuentes a parchar.
        El filtro es un regex (glob * se expresa como [^/]*, ver 'man 7 glob`)
        Todos los archivos de fuentes que comienzan con ese filtro (y son archivos tft, otf o sfd)
        serán procesados únicamente.
          Ejemplo ./gotta-patch-em-alt-font-patcher\!.sh "iosevka"
          Procesa todos los archivos de fuentes que comienzan con "iosevka"
        Si el argumento comienza con un '/' todos los archivos de fuentes en un directorio que coincida
        con el filtro serán procesados únicamente.
          Ejemplo ./gotta-patch-em-all-font-patcher\!.sh "/iosevka"
          Procesa todos los archivos de fuentes que están en el directorio "iosevka"
```

## Contribuir

Ve a [contributing.md](contributing.md)


## Rutas de Archivo Inestables

:warning: Advertencia: Las rutas de nombres de archivo podrían cambiar en cada lanzamiento (especialmente en cambios de número de versión **mayor**)

Referencia a la rama **release** y _no_ a la rama ~~master~~ porque las rutas de archivos podrían cambiar en cada lanzamiento

* Por ejemplo:
  * :white_check_mark: Usa: <code>https\://github.com/ryanoasis/nerd-fonts/blob/<b>0.9.0</b>/patched-fonts/Hermit/Medium/complete/Hurmit%20Medium%20Nerd%20Font%20Complete.otf</code>
  * :x: En lugar de: <code>https\://github.com/ryanoasis/nerd-fonts/blob/<del>master</del>/patched-fonts/Hermit/Medium/complete/Hurmit%20Medium%20Nerd%20Font%20Complete.otf</code>


## Otras Buenas Fuentes para Parchar

Una lista no exhaustiva de fuentes adicionales que podrían beneficiarse de ser parchadas, pero no se pueden incluir o compartir debido a sus licencias (propietaria, commercial, etc.):

* [Input Mono][input-mono]
* [PragmataPro][pragmatapro]
* [Consolas][consolas]
* [Operator Mono][operator]
* [Dank Mono][dank]


## Motivación del Proyecto

Ve a la [Wiki: Propósito del Proyecto][wiki-project-purpose]


## Registro de Cambios

Ve a [changelog.md](changelog.md)

## Licencia

Ve a [LICENCIA][LICENSE]

<!--
Repo References
-->

[vim-devicons]:https://github.com/ryanoasis/vim-devicons "VimDevIcons, Plugin de Vim (link externo) ➶"
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

[release]:https://github.com/ryanoasis/nerd-fonts/releases/latest "Último lanzamiento (link externo) ➶"
[coc]:https://github.com/ryanoasis/nerd-fonts/blob/-/code_of_conduct.md "Pacto de Código de Conducta del Contribuidor"
[LICENSE]:https://github.com/ryanoasis/nerd-fonts/blob/-/LICENSE
[prs]:http://makeapullrequest.com "Haz un Pull Request (link externo) ➶"

<!--
Font repos
-->

[f-3270]:https://github.com/rbanffy/3270font
[f-agave]:https://github.com/agarick/agave
[f-a-pro]:https://www.marksimonson.com/fonts/view/anonymous-pro
[f-arimo]:https://github.com/googlefonts/Arimo
[f-cascadia]:https://github.com/microsoft/cascadia-code
[f-cousine]:https://fonts.google.com/specimen/Cousine
[f-comic]:https://github.com/jesusmgg/comic-shanns-mono
[f-daddytimemono]:https://github.com/BourgeoisBear/DaddyTimeMono
[f-departuremono]:https://github.com/rektdeckard/departure-mono
[f-dejavu]:https://github.com/dejavu-fonts/dejavu-fonts
[f-fant]:https://github.com/belluzj/fantasque-sans
[f-fira-code]:https://github.com/tonsky/FiraCode
[f-fira-mono]:https://github.com/mozilla/Fira
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
[f-iosevka]:https://github.com/be5invis/Iosevka
[f-jetbrains-mono]:https://github.com/JetBrains/JetBrainsMono
[f-lekton]:https://fonts.google.com/specimen/Lekton
[f-liberation]:https://github.com/liberationfonts/liberation-fonts
[f-lilex]:https://github.com/mishamyrt/Lilex
[f-meslo]:https://github.com/andreberg/Meslo-Font
[f-monoid]:https://github.com/larsenwork/monoid
[f-mononoki]:https://madmalik.github.io/mononoki
[f-mplus]:https://mplusfonts.github.io
[f-noto]:https://fonts.google.com/noto
[f-opendyslexic]:https://github.com/antijingoist/open-dyslexic
[f-overpass]:http://overpassfont.org
[f-profont]:https://tobiasjung.name/profont
[f-roboto]:https://fonts.google.com/specimen/Roboto+Mono
[f-share]:https://fonts.google.com/specimen/Share+Tech+Mono
[f-source]:https://github.com/adobe-fonts/source-code-pro
[f-space]:https://fonts.google.com/specimen/Space+Mono
[f-terminus]:http://terminus-font.sourceforge.net
[f-tinos]:https://fonts.google.com/specimen/Tinos
[f-ubuntu]:http://font.ubuntu.com
[f-victor]:https://github.com/rubjo/victor-mono

<!--
Patched Font internal links
-->

[p-3270]:patched-fonts/3270
[p-agave]:patched-fonts/Agave
[p-anonymous-pro]:patched-fonts/AnonymousPro
[p-arimo]:patched-fonts/Arimo
[p-aurulent]:patched-fonts/AurulentSansMono
[p-bigblueterm]:patched-fonts/BigBlueTerminal
[p-bitstream]:patched-fonts/BitstreamVeraSansMono
[p-blex]:patched-fonts/IBMPlexMono
[p-cascadia]:patched-fonts/CascadiaCode
[p-code-nr]:patched-fonts/CodeNewRoman
[p-comic]:patched-fonts/ComicShannsMono
[p-cousine]:patched-fonts/Cousine
[p-daddytimemono]:patched-fonts/DaddyTimeMono
[p-departuremono]:patched-fonts/DepartureMono
[p-dejavu]:patched-fonts/DejaVuSansMono
[p-droid]:patched-fonts/DroidSansMono
[p-fantasque]:patched-fonts/FantasqueSansMono
[p-fira-code]:patched-fonts/FiraCode
[p-fira-mono]:patched-fonts/FiraMono
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
[p-iosevka]:patched-fonts/Iosevka
[p-iosevka-term]:patched-fonts/IosevkaTerm
[p-jetbrains-mono]:patched-fonts/JetBrainsMono
[p-lekton]:patched-fonts/Lekton
[p-liberation]:patched-fonts/LiberationMono
[p-lilex]:patched-fonts/Lilex
[p-meslo]:patched-fonts/Meslo
[p-monofur]:patched-fonts/Monofur
[p-monoid]:patched-fonts/Monoid
[p-mononoki]:patched-fonts/Mononoki
[p-mplus]:patched-fonts/MPlus
[p-noto]:patched-fonts/Noto
[p-opendyslexic]:patched-fonts/OpenDyslexic
[p-overpass]:patched-fonts/Overpass
[p-profont]:patched-fonts/ProFont
[p-proggy-clean]:patched-fonts/ProggyClean
[p-roboto]:patched-fonts/RobotoMono
[p-share-tech-mono]:patched-fonts/ShareTechMono
[p-source-code-pro]:patched-fonts/SourceCodePro
[p-space-mono]:patched-fonts/SpaceMono
[p-terminus]:patched-fonts/Terminus
[p-tinos]:patched-fonts/Tinos
[p-ubuntu-mono]:patched-fonts/UbuntuMono
[p-ubuntu]:patched-fonts/Ubuntu
[p-victor]:patched-fonts/VictorMono


<!--
Quick Link Images
-->

[ql-1]:images/nerd-fonts-character-logo-md.png "Último Lanzamiento (link externo) ➶"
[ql-2]:images/nerd-fonts-character-logo-md.png "↓ Ver Lista de Fuentes Parchadas ↓"
[ql-3]:images/nerd-fonts-patcher-logo-md.png "↓ Detalles del Parchador de Fuentes ↓"
[ql-4]:https://raw.githubusercontent.com/wiki/ryanoasis/vim-devicons/screenshots/v1.0.0/branding-logo-sm.png "VimDevIcons, Plugin de Vim (link externo) ➶"
[ql-5]:images/nerd-fonts-character-logo-md.png "Descargas del Archivo (Zip) del paquete de Fuentes  (link externo) ➶"

<!--
Patched Font Statuses
-->

[w-top]:https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/windows-pass-sm.png "↓ Estado de Compatibilidad en Windows  ↓"
[l-top]:https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/linux-pass-sm.png "↓ Estado de Compatibilidad en Linux ↓"
[m-top]:https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/mac-pass-sm.png "↓ Estado de Compatibilidad en macOS (OSX) ↓"

[w]:https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/windows-pass-sm.png "El estado en Windows funciona ☺"
[l]:https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/linux-pass-sm.png "El estado en Linux funciona ☺"
[m]:https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/mac-pass-sm.png "El estado en macOS (OSX) funciona ☺"

[w2]:https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/windows-unknown-sm.png "El estado en Windows desconocido/sin probar"
[l2]:https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/linux-unknown-sm.png "El estado en Linux desconocido/sin probar"
[m2]:https://github.com/ryanoasis/nerd-fonts/wiki/screenshots/v1.0.x/mac-unknown-sm.png "El estado en macOS (OSX) desconocido/sin probar"

