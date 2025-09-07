<h1 align="center">
  <img src="images/nerd-fonts-logo.svg" alt="Nerd Fonts Logo" />
</h1>
<h2 align="center">
  <img alt="Iconic font aggregator, collection, and patcher" src="images/project-subtitle-phrase.svg">
</h2>

<div align="center">

[Versões][release]&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Tipos de Letra](#tipos-de-letra)&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Modificador de Tipo de Letra](#font-patcher)&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Documentação Wiki][wiki]&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Autocolantes][stickers]&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[VimDevIcons][vim-devicons]


[![GitHub release][img-version-badge]][repo] [![Gitter][img-gitter-badge]][gitter] [![Code of Conduct][coc-badge]][coc] [![PRs Welcome][prs-badge]][prs]  <a href="#tipos-de-letra" title=""><img src="https://raw.githubusercontent.com/wiki/ryanoasis/nerd-fonts/images/faux-shield-badge-os-logos.svg?sanitize=true" alt="Nerd Fonts - OS Support"></a> [![Twitter][twitter-badge]][twitter-intent]


</div>

**Nerd Fonts** é um projeto que adere um grande número de glifos (ícones) a tipos de letra desenhados para programadores. Estes glifos são provenientes de vários «tipos de letra icónicos», tais como: [Font Awesome ➶][font-awesome], [Devicons ➶][vorillaz-devicons], [Octicons ➶][octicons], [entre outros](#conjuntos-de-glifos).

O diagram Sankey mostra os conjuntos de glifos incluídos abaixo:

<p align="center">
  <img src="images/sankey-glyphs-combined-diagram.svg" alt="@SankeyMATIC Diagrama" />
</p>
<sub><i>Diagrama criado utilizando <a href="http://sankeymatic.com/" title="SankeyMATIC (BETA): Um construtor de diagramas Sankey para todos">@SankeyMATIC</a></i></sub>.

## Avisos Importantes
* Os caminhos dos ficheiros no *branch* `master` **não são** considerados estáveis. [Verifica as referências URI do teu repositório](#ficheiros-instáveis-no-branch-master).
* Fazer clone deste repositório **não é** recomendado ([devido ao tamanho do repositório](#opção-5-dar-clone-ao-repositório)). Apenas deves dar clone ao repositório caso pretendas [contribuir para o desenvolvimento do projeto](#contribuir).

## Índice de Conteúdo

[**TL;DR**](#tldr)

[**Opções de instalação**](#opções-de-instalação)
  * [**1 - Manualmente**](#opção-1-transferir-e-instalar-manualmente)
  * [**2 - Transferência do ficheiro de lançamento**](#opção-2-transferência-do-ficheiro-de-lançamento)
  * [**3 - Execução de instalação**](#opção-3-execução-de-instalação)
  * [**4 - Tipos de letras do Homebrew (macOS (OS X))**](#opção-4-tipos-de-letra-do-homebrew)
  * [**5 - Dar clone ao repositório**](#opção-5-dar-clone-ao-repositório)
  * [**6 - Transferir *ad hoc* com `curl`**](#opção-6-transferir-ad-hoc-com-curl)
  * [**7 - Repositório do Community do Arch (Arch Linux)**](#opção-7-repositório-arch-linux)
  * [**8 - Criar o teu tipo de letra**](#opção-8-criar-o-teu-tipo-de-letra)

[**Características**](#características)
  * [**Conjuntos de glifos/ícones**](#conjuntos-de-glifos)
  * [**Tipo de letra modificados**](#tipos-de-letra)
  * [**Combinações**](#combinações)
  * [**Modificador de tipo de letra**](#font-patcher)

[**Desenvolvedor / Contribuidor**](#font-patcher)
  * [**Modificador de tipo de letra**](#font-patcher)
  * [**Modificador de fontes– «Modifica tudo!»**](#modifica-tudo)
  * [**Outros bons tipos de letra para modificar**](#outros-bons-tipos-de-letra-para-modificar)
  * [**Contribuir**](#contribuir)

[**Motivação do projeto**](#motivação-do-projeto)

**Informações Adicionais**
  * [**Ficheiros instáveis no *branch* `master`**](#ficheiros-instáveis-no-branch-master)
  * [**Histórico de alterações**](#histórico-de-alterações)
  * [**Licença**](#licença)


## TL;DR
  Nerd Fonts adere um conjunto de glifos a tipos de letra populares feitos para programação.
  Existe também um [modificador de tipo de letra](#font-patcher), caso o tipo de letra que queiras utilizar ainda não esteja modificado.
  Para mais informação lê a [wiki][wiki]. Caso estejas à procura do *plugin* para Vim, vê: [VimDevIcons ➶][vim-devicons].

### Diferentes opções para transferir os tipos de letra

_Se tu..._

  * `Opção 1.` queres **rapidamente** utilizar um **tipo de letra individual**, transfere-o do diretório: [`patched-fonts/`](#tipos-de-letra)
  * `Opção 2.` queres transferir **uma família de tipos de letra** com variações (negrito, itálico, etc.) vê: [Transferir um ficheiro](#opção-2-transferência-do-ficheiro-de-lançamento)
  * `Opção 3.` queres **automatizar** a instalação ou utilizar um **executador** vê: [Execução de instalação](#opção-3-execução-de-instalação)
  * `Opção 4.` utilizas **macOS** e queres utilizar **Homebrew** vê: [Tipos de letras do Homebrew](#opção-4-tipos-de-letra-do-homebrew)
  * `Opção 5.` queres **controlo total**, então vê: [Dar clone ao repositório](#opção-5-dar-clone-ao-repositório)
  * `Opção 6.` queres utilizar o **comando `curl`** ou **executadores** vê: [Transferir *ad hoc* com `curl`](#opção-6-transferir-ad-hoc-com-curl)
  * `Opção 7.` utilizas **Arch Linux** e queres utilizar o **Community packages** vê: [Repositório do Utilizador do Community](#opção-7-repositório-arch-linux)
  * `Opção 8.` queres modificar o teu tipo de letra vê: [Modificador de tipo de letra](#opção-8-criar-o-teu-tipo-de-letra)

## Características
* Um [executador de FontForge em Python](#font-patcher) para modificar qualquer tipo de letra
  * Inclui a opção de criar glifos **monoespaçados (de largura fixa)** _ou_ glifos de **largura dupla (não monoespaçados)**
  * Para mais detalhes, vê a seção [**Modificador de tipo de letra**](#font-patcher)
* Já existem **`50`** [tipos de letra modificados](#tipos-de-letra)
* Mais de **`1,428,000`** combinações/variações únicas de tipos de letra modificados [(mais detalhes)](#combinações)
* Cerca de **`9,000`** glifos/ícones combinados [(mais detalhes)](#combinações)
  * Os atuais conjuntos de glifos incluem: [Powerline with Extra Symbols][ryanoasis-powerline-extra-symbols], [Font Awesome][font-awesome], [Material Design Icons][font-material-design-icons], [Weather][font-weather], [Devicons][vorillaz-devicons], [Octicons][octicons], [Font Logos][font-logos] (Antigamente Font Linux), [Pomicons][gabrielelana-pomicons]
* Versões de glifos **monoespaçados (de largura fixa)** _ou_ glifos de **largura dupla (não monoespaçados)** para cada tipo de letra
  * Isto refere-se aos glifos do Nerd Font, não necessariamente ao tipo de letra
* Um desenvolvedor/contribuidor criou um [executador em Unix Shell](#modifica-tudo) para modificar novamente todos os tipos de letra

## Conjuntos de glifos

:mag: :mag: Agora podes procurar facilmente por glifos no [NerdFonts.com][Cheat Sheet] através da [Cheat Sheet][]

Vê [Wiki: Conjuntos de glifos e pontos de código para obteres mais detalhes][wiki-glyph-sets-codepoints]

### Nomes dos ícones em Unix Shell

See [Wiki: Nomes dos ícones em Unix Shell][wiki-icon-names-in-shell]

## Tipos de letra

| Nome do tipo de letra                             | Nome do tipo de letra e repositório | \*RFN | Tamanho EM | Estado           |
| :------------------------------------------------ | :---------------------------------- | :---- | :--------- | :--------------- |
| [3270 Nerd Font][p-3270]                          | [3270][f-3270]                      | NÃO   | 1000       | ![w] ![m2] ![l]  |
| [Agave][p-agave]                                  | [Agave][f-agave]                    | NÃO   | 2048       | ![w] ![m2] ![l]  |
| [AnonymicePro Nerd Font][p-anonymous-pro]         | [Anonymous Pro][f-a-pro]            | NÃO   | 2048       | ![w] ![m2] ![l]  |
| [Arimo][p-arimo]                                  | [Arimo][f-arimo]                    | NÃO   | 2048       | ![w] ![m2] ![l]  |
| [Aurulent Sans Mono Nerd Font][p-aurulent]        |                                     | NÃO   | 1000       | ![w] ![m2] ![l]  |
| [BigBlueTerminal][p-bigblueterm]                  |                                     | NÃO   | 1200       | ![w] ![m2] ![l]  |
| [Bitstream Vera Sans Mono Nerd Font][p-bitstream] |                                     | NÃO   | 2048       | ![w] ![m2] ![l]  |
| [Blex*][p-blex]                                   | [IBM Plex Mono][f-ibm-plex]         | SIM   | 1000       | ![w] ![m2] ![l]  |
| [Caskaydia Cove Nerd Font*][p-cascadia]           | [Cascadia Code][f-cascadia]         | SIM   | 2048       | ![w] ![m2] ![l]  |
| [Code New Roman Nerd Font][p-code-nr]             |                                     | NÃO   | 2048       | ![w] ![m2] ![l]  |
| [Cousine Nerd Font][p-cousine]                    | [Cousine][f-cousine]                | NÃO   | 1000       | ![w] ![m2] ![l]  |
| [DaddyTimeMono][p-daddytimemono]                  | [DaddyTimeMono][f-daddytimemono]    | NÃO   | 1024       | ![w] ![m2] ![l]  |
| [DepartureMono Nerd Font][p-departuremono]        | [Departure Mono][f-departuremono]   | NÃO   | 550        | ![w] ![m2] ![l]  |
| [DejaVu Sans Mono Nerd Font][p-dejavu]            |                                     | NÃO   | 2048       | ![w] ![m2] ![l]  |
| [Droid Sans Mono Nerd Font][p-droid]              |                                     | NÃO   | 2048       | ![w] ![m2] ![l]  |
| [Fantasque Sans Nerd Font][p-fantasque]           | [Fantasque Sans][f-fant]            | NÃO   | 2048       | ![w] ![m2] ![l]  |
| [Fira Code Nerd Font][p-fira-code]                | [Fira Code][f-fira-code]            | NÃO   | 1000       | ![w] ![m2] ![l]  |
| [Fira Mono Nerd Font][p-fira-mono]                | [Fira][f-fira-mono]                 | NÃO   | 1000       | ![w] ![m2] ![l]  |
| [Go Mono Nerd Font][p-go-mono]                    | [Go-Mono][f-go-mono]                | NÃO   | 1000       | ![w] ![m2] ![l]  |
| [Gohu Nerd Font][p-gohu]                          | [Gohu TTF][f-gohu2],[Gohu][f-gohu]  | NÃO   | 1000       | ![w] ![m2] ![l]  |
| [Hack Nerd Font][p-hack]                          | [Hack][f-hack]                      | NÃO   | 2048       | ![w] ![m2] ![l]  |
| [Hasklug Nerd Font*][p-hasklig]                   | [Hasklig][f-hasklig]                | SIM   | 1000       | ![w] ![m2] ![l]  |
| [Heavy Data Mono Nerd Font][p-heavy-data]         |                                     | NÃO   | 2048       | ![w] ![m2] ![l]  |
| [Hermut Nerd Font][p-hermit]                      |                                     | NÃO   | 1000       | ![w] ![m2] ![l]  |
| [iM-Writing*][p-im-writing]                       | [iA-Writer][f-ia-writer]            | SIM   | 1000       | ![w] ![m2] ![l]  |
| [Inconsolata Nerd Font][p-inconsolata]            |                                     | NÃO   | 1000       | ![w] ![m2] ![l]  |
| [Inconsolata Go Nerd Font][p-inconsolata-go]      |                                     | NÃO   | 1000       | ![w] ![m2] ![l]  |
| [Inconsolata LGC Nerd Font][p-inconsolata-lgc]    |                                     | NÃO   | 1000       | ![w] ![m2] ![l]  |
| [Iosevka Nerd Font][p-iosevka]                    | [Iosevka][f-iosevka]                | NÃO   | 1000       | [#83][s-iosevka] |
| [JetBrains Mono][p-jetbrains-mono]                | [JetBrains Mono][f-jetbrains-mono]  | NÃO   | 1000       | ![w] ![m2] ![l]  |
| [Lekton Nerd Font][p-lekton]                      |                                     | NÃO   | 1000       | ![w] ![m2] ![l]  |
| [Literation Mono Nerd Font*][p-liberation]        | [Liberation][f-liberation]          | SIM   | 2048       | ![w] ![m2] ![l]  |
| [Meslo Nerd Font][p-meslo]                        |                                     | NÃO   | 2048       | ![w] ![m2] ![l]  |
| [Monofur Nerd Font][p-monofur]                    |                                     | NÃO   | 2400       | ![w] ![m2] ![l]  |
| [Monoid Nerd Font][p-monoid]                      |                                     | NÃO   | 1536       | ![w] ![m2] ![l]  |
| [Mononoki Nerd Font][p-mononoki]                  | [Mononoki][f-mononoki]              | NÃO   | 1024       | ![w] ![m2] ![l]  |
| [M+ (MPlus) Nerd Font][p-mplus]                   |                                     | NÃO   | 1000       | ![w] ![m2] ![l]  |
| [Noto][p-noto]                                    |                                     | NÃO   | 1000       | ![w] ![m2] ![l]  |
| [OpenDyslexic][p-opendyslexic]                    |                                     | NÃO   | 1000       | ![w] ![m2] ![l]  |
| [Overpass][p-overpass]                            |                                     | NÃO   | 1000       | ![w] ![m2] ![l]  |
| [ProFont (Windows tweaked) Nerd Font][p-profont]  |                                     | NÃO   | 1200       | ![w] ![m2] ![l]  |
| [ProFont (x11) Nerd Font][p-profont]              |                                     | NÃO   | 1000       | ![w] ![m2] ![l]  |
| [ProggyClean Nerd Font][p-proggy-clean]           |                                     | NÃO   | 2048       | Imperfeito       |
| [Roboto Mono][p-roboto]                           |                                     | NÃO   | 2048       | ![w] ![m2] ![l]  |
| [Sauce Code Nerd Font][p-source-code-pro]         | [Source][f-source]                  | SIM   | 1000       | ![w] ![m2] ![l]  |
| [Shure Tech Mono Nerd Font*][p-share-tech-mono]   | [Share Tech Mono][f-share]          | SIM   | 1000       | ![w] ![m2] ![l]  |
| [Space Mono Nerd Font][p-space-mono]              | [Space Mono][f-space]               | NÃO   | 1000       | ![w] ![m2] ![l]  |
| [Terminess Nerd Font*][p-terminus]                | [Terminus Font][f-terminus]         | SIM   | 1000       | ![w] ![m2] ![l]  |
| [Tinos][p-tinos]                                  |                                     | NÃO   | 2048       | ![w] ![m2] ![l]  |
| [Ubuntu Nerd Font][p-ubuntu]                      |                                     | NÃO   | 1000       | ![w] ![m2] ![l]  |
| [Ubuntu Mono Nerd Font][p-ubuntu-mono]            |                                | NÃO   | 1000       | ![w] ![m2] ![l]  |
| [Victor Mono][p-victor]                           | [Victor Mono][f-victor]             | NÃO   | 1000       | ![w] ![m2] ![l]  |

<sub>_*RFN = Nome reservado do tipo de letra_</sub>

## Combinações

- Há mais de **`1,485,000`** variações/combinações únicas (Power Set) de tipos de letra modificados:
  - **`50`** tipos de letra modificado
  - **`719`** famílias de tipo de letra modificadas
  - **`2,876`** variações/combinações «completas»
  - **`'1,485,410'`** variações/combinações _possíveis_
  - - **`1,488,286`** combinações totais calculadas (2,876 + 1,428,110)
- As combinações para cada tipo de letra são quaisquer combinações de [Variações](#variações)

### Variações

- não são utilizados parâmetros (utiliza por definição **Seti-UI + Custom** e **[Devicons][vorillaz-devicons]**)

- glifos de largura **dupla _(variável/proportional)_** ou **normal _(fixo/monoespaçado)_**
- [Font Awesome][font-awesome]
- [Font Awesome Extension][font-awesome-extension]
- [Material Design Icons][font-material-design-icons]
- [Weather][font-weather]
- [GitHub Octicons][octicons]
- [Font Logos][font-logos] (Antigamente Font Linux)
- [Powerline Extra Symbols][ryanoasis-powerline-extra-symbols]
- [IEC Power Symbols][website-iecpower]
- [Pomicons][gabrielelana-pomicons]
- Compatibilidade com Windows


## Opções de instalação

### `Opção 1: Transferir e instalar Manualmente`

> Melhor opção para obter **rapidamente** um **tipo de letra** específico.

Transfere o [tipo de letra](#tipos-de-letra) modificado que quiseres

### `Opção 2: Transferência do Ficheiro de Lançamento`

> Melhor opção caso queiras um **ficheiro** ou a família completa do **tipo de letra** com as diferentes variações (negrito, itálico, etc.).

Os tipos de letra estão disponíveis como pacotes na [última versão](https://github.com/ryanoasis/nerd-fonts/releases/latest)

### `Opção 3: Execução de instalação`

> Melhor opção caso queiras **automatizar** a instalção ou utilizar em **executadores**.

_Nota_: Apenas para Linux & macOS (OS X)
_Nota_: Por agora, **implica dar clone** do repositório

#### Todos os tipos de letra:

* Instala todos os tipos de letra modificados (_Atenção: São muitos tipos de letra, ocupando assim muito espaço do disco_)

```sh
./install.sh
```

#### Um único tipo de letra:

* Instala um único tipo de letra à tua escolha

```sh
./install.sh <NomedoTipodeLetra>
./install.sh Hack
./install.sh HeavyData
```

### `Opção 4: Tipos de Letra do Homebrew`

> Melhor opção caso utilizes **macOS** e queres utilizar **Homebrew**.

Todos os tipos de letra estão disponíveis através de [Homebrew Cask](https://github.com/Homebrew/homebrew-cask) para macOS (OS X)

```sh
brew install font-hack-nerd-font
```

_On Linux you have to add `--cask` after `install`._

### `Opção 5: Dar clone ao repositório`

> Melhor opção para obter **controlo total**, **total** ou **maioritário** dos tipos de letra, ou para **contribuir** para o desenvolvimento do projeto.

Dar clone a este repoitório **não é** necessário nem eficiente (devido ao grande tamanho do repositório) caso queiras apenas instalar um número limitado de tipos de letra.

No entanto, se quiseres dar clone ao repositório garante que fazes um clone *superficial*:
```sh
git clone --depth 1
```

### `Opção 6: Transferir ad hoc com curl`

> Caso queiras utilizar o **comando `curl`** ou utilizar em **executadores**.

#### Linux

```sh
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
```

_Note:_ caminhos alternativos deprecados: `~/.fonts`

#### macOS (OS X)

```sh
cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
```

### `Opção 7: Repositório Arch Linux`

Most fonts are available via [Arch Community packages](https://archlinux.org/packages/?sort=&repo=Community&q=-nerd).
Some special packages are [in AUR](https://aur.archlinux.org/packages?K=nerd-fonts-&outdated=off).

### `Opção 8: Criar o teu tipo de letra`

> A opção a utilizar caso queiras **modificar** o **teu tipo de letra** or **personalizar** por completo um tipo de letra já modificado.

Utiliza o executador de linha de comandos em Python fornecido para gerar um tipo de letra modificado com glifos através dum tipo de letra teu

Vê: [Modificador de tipo de letra](#font-patcher) para instruções de utilização

* utiliza esta opção caso __não__ queiras utilizar um dos tipos de letra [já disponíveis](#tipos-de-letra)
* depois de modificares, vais precisar de copiar o tipo de letra gerado para o diretório de tipos de letra do teu sistema operativo


<h2 align="center" id="font-patcher">
	<img src="images/nerd-fonts-patcher-logo.png" alt="Nerd Fonts Patcher">
</h2>

Modificar o tipo de letra à tua escolha com [VimDevIcons ➶][vim-devicons]:
* requer: Python 3, o pacote `python-fontforge` (versão `20141231` ou mais recente, vê
  as [instruções de instalação (em inglês)](http://designwithfontforge.com/en-US/Installing_Fontforge.html))
* método alternativo para macOS: `brew install fontforge`
* Utilização:

```
./font-patcher CAMINHO_PARA_O_TIPO_DE_LETRA
```

* Utilização alternativa: Executa o modificador com o binário de FontForge utilizando parâmetro `-script`:

```
./fontforge -script font-patcher CAMINHO_PARA_O_TIPO_DE_LETRA
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

#### Exemplos

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

<h2 id="modifica-tudo">Modificador de fontes – «Modifica tudo!»</h2>

* para contribuidor ou desenvolvedor, utiliza

* modifica novamente **todos** os tipos de letra no diretório por modificar:

```
./gotta-patch-em-all-font-patcher\!.sh
```

* podes, opcionalmente, limitar para um certo padrão de nome:

```
./gotta-patch-em-all-font-patcher\!.sh Hermit
```

## Contribuir

Vê [contributing.md](contributing.md)

## Ficheiros instáveis no *branch* `master`

:warning: Aviso: Os caminhos dos ficheiros podem mudar consoante as versões (especialmente em versões com **grandes** alterações)

Utiliza o *branch* **release** e _não_ o branch ~~master~~, visto que os camihnos estão sujeitos a alterações na altura do lançamento da nova versão

* Por exemplo:
  * :white_check_mark: Utiliza: <code>https\://github.com/ryanoasis/nerd-fonts/blob/<b>0.9.0</b>/patched-fonts/Hermit/Medium/complete/Hurmit%20Medium%20Nerd%20Font%20Complete.otf</code>
  * :x: Em vez de: <code>https\://github.com/ryanoasis/nerd-fonts/blob/<del>master</del>/patched-fonts/Hermit/Medium/complete/Hurmit%20Medium%20Nerd%20Font%20Complete.otf</code>


## Outros bons tipos de letra para modificar

* lista de outros bons tipos de letra a modificar que não podem ser distribuídos devido às suas licenças:
 * [Input Mono][input-mono] (restrição de licença)
   * Possivelmente será disponibilizada com hospedagem externa :)
 * [PragmataPro][pragmatapro] (paga)
 * [Consolas][consolas] (proprietária)
 * [Operator Mono][operator] (paga)
 * [Dank Mono][dank] (paga)


## Motivação do projeto

Vê [Wiki: Project Purpose][wiki-project-purpose]


## Histórico de Alterações

Vê [changelog.md](changelog.md)

## Licença

[MIT](LICENSE) © Ryan L McIntyre

<!--
Referência do repositório
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
[wiki-glyph-sets-codepoints]:https://github.com/ryanoasis/nerd-fonts/wiki/Glyph-Sets-and-Code-Points
[wiki-icon-names-in-shell]:https://github.com/ryanoasis/nerd-fonts/wiki/Icon-Names-in-Shell
[repo]:https://github.com/ryanoasis/nerd-fonts
[gitter]:https://gitter.im/ryanoasis/nerd-fonts
[code-climate]:https://codeclimate.com/github/ryanoasis/nerd-fonts
[twitter-intent]:https://twitter.com/intent/tweet?url=https%3A%2F%2Fgithub.com%2Fryanoasis%2Fnerd-fonts&via=%40nerdfonts&text=Nerd%20Fonts%20-%20Iconic%20font%20aggregator%2C%20collection%2C%20and%20patcher&hashtags=iconfont%20font%20github


<!--
Referências do website
-->

[website-iecpower]:https://unicodepowersymbol.com/
[Cheat Sheet]:https://nerdfonts.com/cheat-sheet
[stickers]:https://www.redbubble.com/people/ryanoasis/works/30764810-nerd-fonts-iconic-font-aggregator

<!--
Referências das ligações
-->

[badge-version]:https://badge.fury.io/gh/ryanoasis%2Fnerd-fonts
[badge-gitter]:https://gitter.im/ryanoasis/nerd-fonts?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge

[img-version-badge]:https://img.shields.io/github/release/ryanoasis/nerd-fonts.svg?style=for-the-badge
[img-gitter-badge]:https://img.shields.io/gitter/room/nwjs/nw.js.svg?style=for-the-badge
[img-code-climate-badge]:https://img.shields.io/codeclimate/issues/ryanoasis/nerd-fonts.svg?style=for-the-badge
[coc-badge]: https://img.shields.io/badge/code%20of-conduct-ff69b4.svg?style=for-the-badge
[prs-badge]: https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=for-the-badge&logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48c3ZnIGlkPSJzdmcyIiB3aWR0aD0iNjQ1IiBoZWlnaHQ9IjU4NSIgdmVyc2lvbj0iMS4wIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPiA8ZyBpZD0ibGF5ZXIxIj4gIDxwYXRoIGlkPSJwYXRoMjQxNyIgZD0ibTI5Ny4zIDU1MC44N2MtMTMuNzc1LTE1LjQzNi00OC4xNzEtNDUuNTMtNzYuNDM1LTY2Ljg3NC04My43NDQtNjMuMjQyLTk1LjE0Mi03Mi4zOTQtMTI5LjE0LTEwMy43LTYyLjY4NS01Ny43Mi04OS4zMDYtMTE1LjcxLTg5LjIxNC0xOTQuMzQgMC4wNDQ1MTItMzguMzg0IDIuNjYwOC01My4xNzIgMTMuNDEtNzUuNzk3IDE4LjIzNy0zOC4zODYgNDUuMS02Ni45MDkgNzkuNDQ1LTg0LjM1NSAyNC4zMjUtMTIuMzU2IDM2LjMyMy0xNy44NDUgNzYuOTQ0LTE4LjA3IDQyLjQ5My0wLjIzNDgzIDUxLjQzOSA0LjcxOTcgNzYuNDM1IDE4LjQ1MiAzMC40MjUgMTYuNzE0IDYxLjc0IDUyLjQzNiA2OC4yMTMgNzcuODExbDMuOTk4MSAxNS42NzIgOS44NTk2LTIxLjU4NWM1NS43MTYtMTIxLjk3IDIzMy42LTEyMC4xNSAyOTUuNSAzLjAzMTYgMTkuNjM4IDM5LjA3NiAyMS43OTQgMTIyLjUxIDQuMzgwMSAxNjkuNTEtMjIuNzE1IDYxLjMwOS02NS4zOCAxMDguMDUtMTY0LjAxIDE3OS42OC02NC42ODEgNDYuOTc0LTEzNy44OCAxMTguMDUtMTQyLjk4IDEyOC4wMy01LjkxNTUgMTEuNTg4LTAuMjgyMTYgMS44MTU5LTI2LjQwOC0yNy40NjF6IiBmaWxsPSIjZGQ1MDRmIi8%2BIDwvZz48L3N2Zz4%3D
[twitter-badge]:https://img.shields.io/twitter/url/http/shields.io.svg?style=for-the-badge&logo=twitter
[os-badge]:https://img.shields.io/badge/-OS-brightgreen.svg?style=for-the-badge&logoWidth=80&logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz48c3ZnIHdpZHRoPSIzOS43NDFtbSIgaGVpZ2h0PSIxMy4zNzdtbSIgdmVyc2lvbj0iMS4xIiB2aWV3Qm94PSIwIDAgMzkuNzQxMjggMTMuMzc3MTI3IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOmNjPSJodHRwOi8vY3JlYXRpdmVjb21tb25zLm9yZy9ucyMiIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj48bWV0YWRhdGE%2BPHJkZjpSREY%2BPGNjOldvcmsgcmRmOmFib3V0PSIiPjxkYzpmb3JtYXQ%2BaW1hZ2Uvc3ZnK3htbDwvZGM6Zm9ybWF0PjxkYzp0eXBlIHJkZjpyZXNvdXJjZT0iaHR0cDovL3B1cmwub3JnL2RjL2RjbWl0eXBlL1N0aWxsSW1hZ2UiLz48ZGM6dGl0bGUvPjwvY2M6V29yaz48L3JkZjpSREY%2BPC9tZXRhZGF0YT48ZyB0cmFuc2Zvcm09Im1hdHJpeCguMzMwODMgMCAwIC4zMzA4MyAyNi41MDggLTEuNzc0MikiPjxwb2x5Z29uIHBvaW50cz0iMTcuNCAzOC4zIDIxLjUgNDAuNiAyNy43IDQwLjYgMzMuNSAzNi4yIDM2LjEgMjkuMyAzMC4xIDIyIDI4LjQgMTcuOSAyMC4xIDE4LjIgMjAuMiAyMC41IDE4LjYgMjMuNSAxNi4xIDI4LjQgMTUuNiAzMi41IiBmaWxsPSIjZWNlZmYxIi8%2BPHBhdGggZD0ibTM0LjMgMjMuOWMtMS42LTIuMy0yLjktMy43LTMuNi02LjZzMC4yLTIuMS0wLjQtNC42Yy0wLjMtMS4zLTAuOC0yLjItMS4zLTIuOS0wLjYtMC43LTEuMy0xLjEtMS43LTEuMi0wLjktMC41LTMtMS4zLTUuNiAwLjEtMi43IDEuNC0yLjQgNC40LTEuOSAxMC41IDAgMC40LTAuMSAwLjktMC4zIDEuMy0wLjQgMC45LTEuMSAxLjctMS43IDIuNC0wLjcgMS0xLjQgMi0xLjkgMy4xLTEuMiAyLjMtMi4zIDUuMi0yIDYuMyAwLjUtMC4xIDYuOCA5LjUgNi44IDkuNyAwLjQtMC4xIDIuMS0wLjEgMy42LTAuMSAyLjEtMC4xIDMuMy0wLjIgNSAwLjIgMC0wLjMtMC4xLTAuNi0wLjEtMC45IDAtMC42IDAuMS0xLjEgMC4yLTEuOCAwLjEtMC41IDAuMi0xIDAuMy0xLjYtMSAwLjktMi44IDEuOS00LjUgMi4yLTEuNSAwLjMtNC0wLjItNS4yLTEuNyAwLjEgMCAwLjMgMCAwLjQtMC4xIDAuMy0wLjEgMC42LTAuMiAwLjctMC40IDAuMy0wLjUgMC4xLTEtMC4xLTEuM3MtMS43LTEuNC0yLjQtMi0xLjEtMC45LTEuNS0xLjNsLTAuOC0wLjhjLTAuMi0wLjItMC4zLTAuNC0wLjQtMC41LTAuMi0wLjUtMC4zLTEuMS0wLjItMS45IDAuMS0xLjEgMC41LTIgMS0zIDAuMi0wLjQgMC43LTEuMiAwLjctMS4ycy0xLjcgNC4yLTAuOCA1LjVjMCAwIDAuMS0xLjMgMC41LTIuNiAwLjMtMC45IDAuOC0yLjIgMS40LTIuOXMyLjEtMy4zIDIuMi00LjljMC0wLjcgMC4xLTEuNCAwLjEtMS45LTAuNC0wLjQgNi42LTEuNCA3LTAuMyAwLjEgMC40IDEuNSA0IDIuMyA1LjkgMC40IDAuOSAwLjkgMS43IDEuMiAyLjcgMC4zIDEuMSAwLjUgMi42IDAuNSA0LjEgMCAwLjMgMCAwLjgtMC4xIDEuMyAwLjIgMCA0LjEtNC4yLTAuNS03LjcgMCAwIDIuOCAxLjMgMi45IDMuOSAwLjEgMi4xLTAuOCAzLjgtMSA0LjEgMC4xIDAgMi4xIDAuOSAyLjIgMC45IDAuNCAwIDEuMi0wLjMgMS4yLTAuMyAwLjEtMC4zIDAuNC0xLjEgMC40LTEuNCAwLjctMi4zLTEtNi0yLjYtOC4zeiIgZmlsbD0iIzI2MzIzOCIvPjxnIGZpbGw9IiNlY2VmZjEiPjxlbGxpcHNlIGN4PSIyMS42IiBjeT0iMTUuMyIgcng9IjEuMyIgcnk9IjIiLz48ZWxsaXBzZSBjeD0iMjYuMSIgY3k9IjE1LjIiIHJ4PSIxLjciIHJ5PSIyLjMiLz48L2c%2BPGcgZmlsbD0iIzIxMjEyMSI%2BPGVsbGlwc2UgdHJhbnNmb3JtPSJtYXRyaXgoLS4xMjU0IC0uOTkyMSAuOTkyMSAtLjEyNTQgOC45NzU0IDM4Ljk5NykiIGN4PSIyMS43IiBjeT0iMTUuNSIgcng9IjEuMiIgcnk9Ii43Ii8%2BPGVsbGlwc2UgY3g9IjI2IiBjeT0iMTUuNiIgcng9IjEiIHJ5PSIxLjMiLz48L2c%2BPGcgZmlsbD0iI2ZmYzEwNyI%2BPHBhdGggZD0ibTM5LjMgMzcuNmMtMC40LTAuMi0xLjEtMC41LTEuNy0xLjQtMC4zLTAuNS0wLjItMS45LTAuNy0yLjUtMC4zLTAuNC0wLjctMC4yLTAuOC0wLjItMC45IDAuMi0zIDEuNi00LjQgMC0wLjItMC4yLTAuNS0wLjUtMS0wLjVzLTAuNyAwLjItMC45IDAuNi0wLjIgMC43LTAuMiAxLjdjMCAwLjggMCAxLjctMC4xIDIuNC0wLjIgMS43LTAuNSAyLjctMC41IDMuNyAwIDEuMSAwLjMgMS44IDAuNyAyLjEgMC4zIDAuMyAwLjggMC41IDEuOSAwLjVzMS44LTAuNCAyLjUtMS4xYzAuNS0wLjUgMC45LTAuNyAyLjMtMS43IDEuMS0wLjcgMi44LTEuNiAzLjEtMS45IDAuMi0wLjIgMC41LTAuMyAwLjUtMC45IDAtMC41LTAuNC0wLjctMC43LTAuOHoiLz48cGF0aCBkPSJtMTkuMiAzNy45Yy0xLTEuNi0xLjEtMS45LTEuOC0yLjktMC42LTEtMS45LTIuOS0yLjctMi45LTAuNiAwLTAuOSAwLjMtMS4zIDAuN3MtMC44IDEuMy0xLjUgMS44Yy0wLjYgMC41LTIuMyAwLjQtMi43IDFzMC40IDEuNSAwLjQgM2MwIDAuNi0wLjUgMS0wLjYgMS40LTAuMSAwLjUtMC4yIDAuOCAwIDEuMiAwLjQgMC42IDAuOSAwLjggNC4zIDEuNSAxLjggMC40IDMuNSAxLjQgNC42IDEuNXMzIDAgMy0yLjdjMC4xLTEuNi0wLjgtMi0xLjctMy42eiIvPjxwYXRoIGQ9Im0yMS4xIDE5LjhjLTAuNi0wLjQtMS4xLTAuOC0xLjEtMS40czAuNC0wLjggMS0xLjNjMC4xLTAuMSAxLjItMS4xIDIuMy0xLjFzMi40IDAuNyAyLjkgMC45YzAuOSAwLjIgMS44IDAuNCAxLjcgMS4xLTAuMSAxLTAuMiAxLjItMS4yIDEuNy0wLjcgMC4yLTIgMS4zLTIuOSAxLjMtMC40IDAtMSAwLTEuNC0wLjEtMC4zLTAuMS0wLjgtMC42LTEuMy0xLjF6Ii8%2BPC9nPjxnIGZpbGw9IiM2MzQ3MDMiPjxwYXRoIGQ9Im0yMC45IDE5YzAuMiAwLjIgMC41IDAuNCAwLjggMC41IDAuMiAwLjEgMC41IDAuMiAwLjUgMC4yaDAuOWMwLjUgMCAxLjItMC4yIDEuOS0wLjYgMC43LTAuMyAwLjgtMC41IDEuMy0wLjcgMC41LTAuMyAxLTAuNiAwLjgtMC43cy0wLjQgMC0xLjEgMC40Yy0wLjYgMC40LTEuMSAwLjYtMS43IDAuOS0wLjMgMC4xLTAuNyAwLjMtMSAwLjNoLTAuOWMtMC4zIDAtMC41LTAuMS0wLjgtMC4yLTAuMi0wLjEtMC4zLTAuMi0wLjQtMC4yLTAuMi0wLjEtMC42LTAuNS0wLjgtMC42IDAgMC0wLjIgMC0wLjEgMC4xbDAuNiAwLjZ6Ii8%2BPHBhdGggZD0ibTIzLjkgMTYuOGMwLjEgMC4yIDAuMyAwLjIgMC40IDAuM3MwLjIgMC4xIDAuMiAwLjFjMC4xLTAuMSAwLTAuMy0wLjEtMC4zIDAtMC4yLTAuNS0wLjItMC41LTAuMXoiLz48cGF0aCBkPSJtMjIuMyAxN2MwIDAuMSAwLjIgMC4yIDAuMiAwLjEgMC4xLTAuMSAwLjItMC4yIDAuMy0wLjIgMC4yLTAuMSAwLjEtMC4yLTAuMi0wLjItMC4yIDAuMS0wLjIgMC4yLTAuMyAwLjN6Ii8%2BPC9nPjxwYXRoIGQ9Im0zMiAzNC43djAuM2MwLjIgMC40IDAuNyAwLjUgMS4xIDAuNSAwLjYgMCAxLjItMC40IDEuNS0wLjggMC0wLjEgMC4xLTAuMiAwLjItMC4zIDAuMi0wLjMgMC4zLTAuNSAwLjQtMC42IDAgMC0wLjEtMC4xLTAuMS0wLjItMC4xLTAuMi0wLjQtMC40LTAuOC0wLjUtMC4zLTAuMS0wLjgtMC4yLTEtMC4yLTAuOS0wLjEtMS40IDAuMi0xLjcgMC41IDAgMCAwLjEgMCAwLjEgMC4xIDAuMiAwLjIgMC4zIDAuNCAwLjMgMC43IDAuMSAwLjIgMCAwLjMgMCAwLjV6IiBmaWxsPSIjNDU1YTY0Ii8%2BPC9nPjxnIHRyYW5zZm9ybT0ibWF0cml4KC4xMzk0NSAwIDAgLjEzOTQ1IDAgMS4xNjIzKSI%2BPHBhdGggZD0ibTAgMTIuNDAyIDM1LjY4Ny00Ljg2MDIgMC4wMTU2IDM0LjQyMy0zNS42NyAwLjIwMzEzeiIgZmlsbD0iI2Y4NjgyYyIvPjxwYXRoIGQ9Im0zOS45OTYgNi45MDU5IDQ3LjMxOC02LjkwNnY0MS41MjdsLTQ3LjMxOCAwLjM3NTY1eiIgZmlsbD0iIzkxYzMwMCIvPjxwYXRoIGQ9Im0zNS42NyA0NS45MzEgMC4wMjc3IDM0LjQ1My0zNS42Ny00LjkwNDEtMmUtMyAtMjkuNzh6IiBmaWxsPSIjMDBiNGYxIi8%2BPHBhdGggZD0ibTg3LjMyNiA0Ni4yNTUtMC4wMTExIDQxLjM0LTQ3LjMxOC02LjY3ODQtMC4wNjYzLTM0LjczOXoiIGZpbGw9IiNmZmMzMDAiLz48L2c%2BPHBhdGggZD0ibTI2LjEzNyAxMC4yODRjLTAuMTk5NTggMC40NjEwNi0wLjQzNTgxIDAuODg1NDctMC43MDk1MiAxLjI3NTctMC4zNzMwOCAwLjUzMTkzLTAuNjc4NTYgMC45MDAxMy0wLjkxMzk4IDEuMTA0Ni0wLjM2NDk0IDAuMzM1NjItMC43NTU5NSAwLjUwNzUtMS4xNzQ2IDAuNTE3MjctMC4zMDA1OSAwLTAuNjYzMDgtMC4wODU1My0xLjA4NS0wLjI1OTA0LTAuNDIzMzUtMC4xNzI2OS0wLjgxMjQtMC4yNTgyMy0xLjE2ODEtMC4yNTgyMy0wLjM3MzA4IDAtMC43NzMyMiAwLjA4NTU0LTEuMjAxMiAwLjI1ODIzLTAuNDI4NjQgMC4xNzM1MS0wLjc3Mzk1IDAuMjYzOTMtMS4wMzggMC4yNzI4OS0wLjQwMTUyIDAuMDE3MTItMC44MDE3My0wLjE1OTY2LTEuMjAxMi0wLjUzMTEyLTAuMjU0OTctMC4yMjIzOC0wLjU3Mzg4LTAuNjAzNjItMC45NTU5My0xLjE0MzctMC40MDk5LTAuNTc2NzQtMC43NDY5MS0xLjI0NTUtMS4wMTA5LTIuMDA4LTAuMjgyNzUtMC44MjM1Ni0wLjQyNDQ5LTEuNjIxMS0wLjQyNDQ5LTIuMzkzMSAwLTAuODg0NDEgMC4xOTExLTEuNjQ3MiAwLjU3Mzg4LTIuMjg2NCAwLjMwMDgzLTAuNTEzNDQgMC43MDEwNC0wLjkxODQ2IDEuMjAxOS0xLjIxNTggMC41MDA5LTAuMjk3MzMgMS4wNDIxLTAuNDQ4ODQgMS42MjUtMC40NTg1NCAwLjMxODkxIDAgMC43MzcxMyAwLjA5ODY1IDEuMjU2OCAwLjI5MjUyIDAuNTE4MjUgMC4xOTQ1MyAwLjg1MTAxIDAuMjkzMTggMC45OTY5IDAuMjkzMTggMC4xMDkwOCAwIDAuNDc4NzQtMC4xMTUzNSAxLjEwNTQtMC4zNDUzMSAwLjU5MjYyLTAuMjEzMjYgMS4wOTI4LTAuMzAxNTYgMS41MDI1LTAuMjY2NzggMS4xMTAzIDAuMDg5NiAxLjk0NDQgMC41MjcyOSAyLjQ5OTIgMS4zMTU4LTAuOTkyOTkgMC42MDE2Ni0xLjQ4NDIgMS40NDQ0LTEuNDc0NCAyLjUyNTQgOWUtMyAwLjg0MjA1IDAuMzE0NDMgMS41NDI4IDAuOTE0NzkgMi4wOTkxIDAuMjcyMDggMC4yNTgyMiAwLjU3NTkyIDAuNDU3OCAwLjkxMzk4IDAuNTk5NTQtMC4wNzMzMiAwLjIxMjYxLTAuMTUwNyAwLjQxNjI2LTAuMjMyOTggMC42MTE3NnptLTIuNTQ2NC0xMC4wMmMwIDAuNjYtMC4yNDExMiAxLjI3NjItMC43MjE3MyAxLjg0NjYtMC41OCAwLjY3ODA3LTEuMjgxNSAxLjA2OTktMi4wNDIzIDEuMDA4MS0wLjAwOTctMC4wNzkxOC0wLjAxNTMtMC4xNjI1MS0wLjAxNTMtMC4yNTAwOCAwLTAuNjMzNiAwLjI3NTgyLTEuMzExNyAwLjc2NTY0LTEuODY2MSAwLjI0NDU0LTAuMjgwNzEgMC41NTU1NS0wLjUxNDEyIDAuOTMyNzEtMC43MDAzMSAwLjM3NjM1LTAuMTgzNDEgMC43MzIzMy0wLjI4NDg1IDEuMDY3MS0wLjMwMjIxIDAuMDA5OCAwLjA4ODIzIDAuMDEzODUgMC4xNzY0NyAwLjAxMzg1IDAuMjY0eiIgc3Ryb2tlLXdpZHRoPSIuMDgxNDYiLz48L3N2Zz4%3D


[consolas]:https://www.microsoft.com/typography/fonts/family.aspx?FID=300
[input-mono]:http://input.djr.com/download/
[pragmatapro]:https://www.fsd.it/shop/fonts/pragmatapro/
[operator]:https://www.typography.com/fonts/operator/
[dank]:https://dank.sh/

[release]:https://github.com/ryanoasis/nerd-fonts/releases/latest "Latest Release (external link) ➶"
[coc]:https://github.com/ryanoasis/nerd-fonts/blob/-/code_of_conduct.md "Contributor Covenant Code of Conduct"
[prs]:http://makeapullrequest.com "Make a Pull Request (external link) ➶"

<!--
Repositórios dos tipos de letra
-->

[f-arimo]:https://github.com/google/fonts/tree/master/apache/arimo
[f-hack]:https://github.com/chrissimpkins/Hack
[f-a-pro]:https://www.marksimonson.com/fonts/view/anonymous-pro
[f-3270]:https://github.com/rbanffy/3270font
[f-cascadia]:https://github.com/microsoft/cascadia-code
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
[f-ibm-plex]:https://github.com/IBM/plex
[f-victor]:https://github.com/rubjo/victor-mono
[f-daddytimemono]:https://github.com/BourgeoisBear/DaddyTimeMono
[f-agave]:https://github.com/agarick/agave
[f-ia-writer]:https://github.com/iaolo/iA-Fonts
[f-departuremono]:https://github.com/rektdeckard/departure-mono

<!--
LIgações internas do «Patched Font»
-->

[p-3270]:patched-fonts/3270
[p-anonymous-pro]:patched-fonts/AnonymousPro
[p-aurulent]:patched-fonts/AurulentSansMono
[p-arimo]:patched-fonts/Arimo
[p-bigblueterm]:patched-fonts/BigBlueTerminal
[p-bitstream]:patched-fonts/BitstreamVeraSansMono
[p-blex]:patched-fonts/IBMPlexMono
[p-cascadia]:patched-fonts/CascadiaCode
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
[p-victor]:patched-fonts/VictorMono
[p-daddytimemono]:patched-fonts/DaddyTimeMono
[p-agave]:patched-fonts/Agave
[p-im-writing]:patched-fonts/iA-Writer


<!--
Imagens do «Quick Link»
-->

[ql-1]:images/nerd-fonts-character-logo-md.png "Latest Release (external link) ➶"
[ql-2]:images/nerd-fonts-character-logo-md.png "↓ View Patched Fonts List ↓"
[ql-3]:images/nerd-fonts-patcher-logo-md.png "↓ Font Patcher Details ↓"
[ql-4]:https://raw.githubusercontent.com/wiki/ryanoasis/vim-devicons/screenshots/v1.0.0/branding-logo-sm.png "VimDevIcons Vim Plugin (external link) ➶"
[ql-5]:images/nerd-fonts-character-logo-md.png "Font Package Archive (Zip) Downloads (external link) ➶"

<!--
Estados do «Patched Font»
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
