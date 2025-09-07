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


**Nerd Fonts** - это проект, который улучшает шрифты с большим количеством глифов (значков). В частности, добавляет большое количество значков из популярных 'символьных шрифтов', таких как [Font Awesome][font-awesome], [Devicons][vorillaz-devicons], [Octicons][octicons] и [других](#glyph-sets).

На следующей Sankey-диаграме показаны текущие наборы глифов:

<p align="center">
  <img src="images/sankey-glyphs-combined-diagram.svg" alt="@SankeyMATIC Diagram" />
</p>
<sub><i>Диаграма создана с помощью <a href="http://sankeymatic.com/" title="SankeyMATIC (BETA): A Sankey diagram builder for everyone">@SankeyMATIC</a></i></sub>


## Важные Замечания
* Пути к файлам ветки `master` **нестабильны**. [Проверить свою ссылку на репозиторий](#unstable-file-paths)
* Клонировать этот репозиторий **не** рекомендуется ([из-за его размеров](#option-5-clone-the-repo)), если Вы не собираетесь [участвовать в разработке](#contributing)


## Содержание

[**TL;DR**](#tldr)

[**Параметры Установки**](#font-installation)
  * [**1 - Руководство**](#option-1-download-and-install-manually)
  * [**2 - Архив Выпусков**](#option-2-release-archive-download)
  * [**3 - Установочный Скрипт**](#option-3-install-script)
  * [**4 - Шрифты Homebrew (macOS (OS X))**](#option-4-homebrew-fonts)
  * [**5 - Клонировать репозиторий**](#option-5-clone-the-repo)
  * [**6 - Скачать Ad Hoc Curl**](#option-6-ad-hoc-curl-download)
  * [**7 - Chocolatey или Scoop (Windows)**](#option-7-unofficial-chocolatey-or-scoop-repositories)
  * [**8 - Arch Linux Repository (Community, AUR)**](#option-8-arch-community-repository)
  * [**9 - Исправить свой собственный шрифт**](#option-9-patch-your-own-font)

[**Особенности**](#features)
  * [**Наборы Глифов/Значков**](#glyph-sets)
  * [**Исправленные шрифты**](#patched-fonts)
  * [**Вариации**](#variations)
  * [**Улучшитель Шрифтов**](#font-patcher)

[**Разработчикам / Контрибьютерам**](#font-patcher)
  * [**Улучшитель Шрифтов**](#font-patcher)
  * [**Прокачай все шрифты!**](#gotta-patch-em-all)
  * [**Другие хорошие шрифты для улучшения**](#other-good-fonts-to-patch)
  * [**Сотрудничество в разработке**](#contributing)

[**Мотивация проекта**](#project-motivation)

**Дополнительная информация**
  * [**Нестабильные пути к файлам в master**](#unstable-file-paths)
  * [**Журнал изменений**](#changelog)
  * [**Лицензия**](#license)


## TL;DR
  Nerd Fonts использует популярные программные шрифты и добавляет кучу Значков.
  Существует также [Исправитель шрифтов](#font-patcher), если нужный Вам шрифт ещё не исправлен.
  Более подробную информацию смотрите в [wiki][wiki]. Если Вы ищете плагин Vim, смотрите [VimDevIcons][vim-devicons].

### Различные варианты загрузки шрифтов

_Если Вы..._

  * `Вариант 1.` хотите **быстро** взять **отдельный шрифт**, то скачайте из [директории `patched-fonts/`](#patched-fonts)
  * `Вариант 2.` хотите скачать пакет вариаций (bold, italic и т.д.) **семейства шрифтов**, смотрите [скачать архив](#option-2-release-archive-download)
  * `Вариант 3.` хотите **автоматизировать** установку или использовать в **скриптах**, смотрите [установка скриптом](#option-3-install-script)
  * `Вариант 4.` пользователь **macOS** и хотите использовать **Homebrew**, смотрите [Homebrew Fonts](#option-4-homebrew-fonts)
  * `Вариант 5.` хотите **полный контроль**, смотрите [клонировать репозиторий](#option-5-clone-the-repo)
  * `Вариант 6.` хотите использовать **`curl` команду** или использовать её в **скриптах**, смотрите [Ad Hoc Curl Download](#option-6-ad-hoc-curl-download)
  * `Option 7.` если вы пользуетесь **Windows** и хотите использовать **Chocolatey** или **Scoop** смотрите [Неофициальные репозитории Chocolatey или Scoop](#option-7-unofficial-chocolatey-or-scoop-repositories)
  * `Вариант 8.` пользователь **Arch Linux** и хотите использовать **Community packages**, смотрите [Arch Community Repositories](#option-8-arch-community-repository)
  * `Вариант 9.` хотите улучшить свой собственный шрифт, смотрите [Улучшитель Шрифтов](#option-9-patch-your-own-font)

## Особенности
* [Python скрипт FontForge](#font-patcher) для улучшения любого шрифта
  * Включена возможность создания **Моноширинных (с фиксированным шагом, с фиксированной шириной)** _или_ **двойных (не моноширинных)** глифов
  * Для получения дополнительной информации смотрите раздел [**Улучшитель шрифтов**](#font-patcher)
* **`53`** [улучшенных семейства шрифтов](#patched-fonts)
* Более **`9,000`** комбинаций глифов/значков [(больше информации)](#combinations)
  * Текущие наборы глифов включают: [Powerline with Extra Symbols][ryanoasis-powerline-extra-symbols], [Font Awesome][font-awesome],  [Devicons][vorillaz-devicons], [Octicons][octicons], [Font Logos][font-logos], [Pomicons][gabrielelana-pomicons]
* **Моноширинная (фиксированный шаг, фиксированная ширина)** _или_ "**двойные (не моноширинные)** глифы" версии каждого шрифта
  * Это относится к самим символам Nerd Font, не обязательно ко всему шрифту в целом
* Разработчик/Помощник предоставил [bash скрипт](#gotta-patch-em-all) для повторного исправления всех шрифтов


## Наборы значков

:mag: :mag: Теперь Вы можете легко искать глифы на [NerdFonts.com][Cheat Sheet] через [Cheat Sheet][]

Смотрите [Wiki: Glyph Sets and Codepoints for more details][wiki-glyph-sets-codepoints]

### Наименования значков в оболочке

See [Wiki: Icon names in shell][wiki-icon-names-in-shell]


## Исправленные Шрифты

| Название шрифта                                         | Название шрифта и репозиторий          | Версия   |\*RFN | Статус            |
|:--------------------------------------------------|:----------------------------------|:------|:-----|:------------------|
| [3270 Nerd Font][p-3270]                          | [3270][f-3270]                    | 3.0.1 | НЕТ   | ![w] ![m2] ![l]   |
| [Agave][p-agave]                                  | [Agave][f-agave]                  | 37    | НЕТ   | ![w] ![m2] ![l]   |
| [AnonymicePro Nerd Font][p-anonymous-pro]         | [Anonymous Pro][f-a-pro]          | 1.002 | ДА  | ![w] ![m2] ![l]   |
| [Arimo][p-arimo]                                  | [Arimo][f-arimo]                  | 1.33  | НЕТ   | ![w] ![m2] ![l]   |
| [Aurulent Sans Mono Nerd Font][p-aurulent]        | Stephen G. Hartke                 |       | НЕТ   | ![w] ![m2] ![l]   |
| [BigBlueTerminal][p-bigblueterm]                  | VileR                             |       | НЕТ   | ![w] ![m2] ![l]   |
| [Bitstrom Wera Nerd Font][p-bitstream]            | Bitstream Inc                     | 1.1   | ДА  | ![w] ![m2] ![l]   |
| [Blex Mono][p-blex]                               | [IBM Plex Mono][f-ibm-plex]       | 2.3   | ДА  | ![w] ![m2] ![l]   |
| [Caskaydia Cove Nerd Font][p-cascadia]            | [Cascadia Code][f-cascadia]       |2111.01| ДА  | ![w] ![m2] ![l]   |
| [Code New Roman Nerd Font][p-code-nr]             | Sam Radian                        | 2.0   | НЕТ   | ![w] ![m2] ![l]   |
| [Comic Shanns Mono Nerd Font][p-comic]            | [Comic Shanns Mono][f-comic]      | 1.3   | НЕТ   | ![w] ![m2] ![l]   |
| [Cousine Nerd Font][p-cousine]                    | [Cousine][f-cousine]              | 1.211 | НЕТ   | ![w] ![m2] ![l]   |
| [DaddyTimeMono][p-daddytimemono]                  | [DaddyTimeMono][f-daddytimemono]  | 1.2.3 | НЕТ   | ![w] ![m2] ![l]   |
| [DepartureMono Nerd Font][p-departuremono]        | [Departure Mono][f-departuremono] | 1.422 | НЕТ   | ![w] ![m2] ![l]   |
| [DejaVu Sans Mono Nerd Font][p-dejavu]            | [DejaVu][f-dejavu]                | 2.37  | НЕТ   | ![w] ![m2] ![l]   |
| [Droid Sans Mono Nerd Font][p-droid]              | Ascender Corp                     |1.00-113| НЕТ   | ![w] ![m2] ![l]   |
| [Fantasque Sans Nerd Font][p-fantasque]           | [Fantasque Sans][f-fant]          | 1.8.0 | НЕТ   | ![w] ![m2] ![l]   |
| [Fira Code Nerd Font][p-fira-code]                | [Fira Code][f-fira-code]          | 6.2   | НЕТ   | ![w] ![m2] ![l]   |
| [Fira Mono Nerd Font][p-fira-mono]                | [Fira][f-fira-mono]               | 3.206 | НЕТ   | ![w] ![m2] ![l]   |
| [Go Mono Nerd Font][p-go-mono]                    | [Go-Mono][f-go-mono]              | 2.010 | НЕТ   | ![w] ![m2] ![l]   |
| [Gohu Nerd Font][p-gohu]                          | [Gohu TTF][f-gohu2],[Gohu][f-gohu]| 2.0   | НЕТ   | ![w] ![m2] ![l]   |
| [Hack Nerd Font][p-hack]                          | [Hack][f-hack]                    | 3.003 | НЕТ   | ![w] ![m2] ![l]   |
| [Hasklug Nerd Font][p-hasklig]                    | [Hasklig][f-hasklig]              | 1.2   | ДА  | ![w] ![m2] ![l]   |
| [Heavy Data Mono Nerd Font][p-heavy-data]         | Vic Fieger                        | 1     | НЕТ   | ![w] ![m2] ![l]   |
| [Hurmit Nerd Font][p-hermit]                      | [Hermit][f-hermit]                | 2.0   | ДА  | ![w] ![m2] ![l]   |
| [iM-Writing][p-im-writing]                        | [iA-Writer][f-ia-writer]          | Dec 2018 | ДА  | ![w] ![m2] ![l]   |
| [Inconsolata Nerd Font][p-inconsolata]            | [Inconsolata][f-inconsolata]      | 3.000 | НЕТ   | ![w] ![m2] ![l]   |
| [Inconsolata Go Nerd Font][p-inconsolata-go]      | [InconsolataGo][f-inconsolatago]  | 1.013 | НЕТ   | ![w] ![m2] ![l]   |
| [Inconsolata LGC Nerd Font][p-inconsolata-lgc]    | [Inconsolata LGC][f-inconsolatalgc] | 1.3 | НЕТ   | ![w] ![m2] ![l]   |
| [Iosevka Nerd Font][p-iosevka]                    | [Iosevka][f-iosevka]              |22.1.0 | НЕТ   | ![w] ![m2] ![l]   |
| [Iosevka Term Nerd Font][p-iosevka-term]          | [Iosevka Term][f-iosevka]         |22.1.0 | НЕТ   | ![w] ![m2] ![l]   |
| [JetBrains Mono][p-jetbrains-mono]                | [JetBrains Mono][f-jetbrains-mono]| 2.304 | НЕТ   | ![w] ![m2] ![l]   |
| [Lekton Nerd Font][p-lekton]                      | [Lekton][f-lekton]                | 34    | НЕТ   | ![w] ![m2] ![l]   |
| [Literation Mono Nerd Font][p-liberation]         | [Liberation][f-liberation]        | 2.1.5 | ДА  | ![w] ![m2] ![l]   |
| [Lilex Nerd Font][p-lilex]                        | [Lilex][f-lilex]                  | 2.300 | НЕТ   | ![w2] ![m2] ![l]  |
| [Meslo Nerd Font][p-meslo]                        | [Meslo][f-meslo]                  | 1.21  | НЕТ   | ![w] ![m2] ![l]   |
| [Monofur Nerd Font][p-monofur]                    | Tobias B Koehler                  | 1.0   | НЕТ   | ![w] ![m2] ![l]   |
| [Monoid Nerd Font][p-monoid]                      | [Monoid][f-monoid]                | 0.61  | НЕТ   | ![w] ![m2] ![l]   |
| [Mononoki Nerd Font][p-mononoki]                  | [Mononoki][f-mononoki]            | 1.6   | ДА  | ![w] ![m2] ![l]   |
| [M+ (MPlus) Nerd Font][p-mplus]                   | [M+ Fonts][f-mplus]               |2023/03| НЕТ   | ![w] ![m2] ![l]   |
| [Noto][p-noto]                                    | [Noto][f-noto]                    | div   | НЕТ   | ![w] ![m2] ![l]   |
| [OpenDyslexic][p-opendyslexic]                    | [OpenDyslexic][f-opendyslexic]    | 2.001 | НЕТ   | ![w] ![m2] ![l]   |
| [Overpass][p-overpass]                            | [Overpass][f-overpass]            | 3.0.5 | НЕТ   | ![w] ![m2] ![l]   |
| [ProFont (Windows tweaked) Nerd Font][p-profont]  | [ProFont][f-profont]              | 2.3   | НЕТ   | ![w] ![m2] ![l]   |
| [ProFont (x11) Nerd Font][p-profont]              | [ProFont][f-profont]              | 2.2   | НЕТ   | ![w] ![m2] ![l]   |
| [ProggyClean Nerd Font][p-proggy-clean]           | Tristan Grimmer                   |2004/04/15| НЕТ   | Imperfect         |
| [Roboto Mono][p-roboto]                           | [Roboto Mono][f-roboto]           | 3.0   | НЕТ   | ![w] ![m2] ![l]   |
| [Sauce Code Nerd Font][p-source-code-pro]         | [Source][f-source]                | 2.038 | ДА  | ![w] ![m2] ![l]   |
| [Shure Tech Mono Nerd Font][p-share-tech-mono]    | [Share Tech Mono][f-share]        | 1.003 | ДА  | ![w] ![m2] ![l]   |
| [Space Mono Nerd Font][p-space-mono]              | [Space Mono][f-space]             | 1.001 | НЕТ   | ![w] ![m2] ![l]   |
| [Terminess Nerd Font][p-terminus]                 | [Terminus TTF][f-terminus]        |4.49.2 | ДА  | ![w] ![m2] ![l]   |
| [Tinos][p-tinos]                                  | [Tinos][f-tinos]                  | 1.23  | НЕТ   | ![w] ![m2] ![l]   |
| [Ubuntu Nerd Font][p-ubuntu]                      | [Ubuntu Font][f-ubuntu]           | 0.83  | НЕТ   | ![w] ![m2] ![l]   |
| [Ubuntu Mono Nerd Font][p-ubuntu-mono]            | [Ubuntu Font][f-ubuntu]           | 0.80  | НЕТ   | ![w] ![m2] ![l]   |
| [Victor Mono][p-victor]                           | [Victor Mono][f-victor]           | 1.5.4 | НЕТ   | ![w] ![m2] ![l]   |

<sub>_*RFN = Reserved Font Name_</sub>

### Вариации

- не указаны флаги (по умолчанию **Seti-UI + Custom** и **[Devicons][vorillaz-devicons]**)
- **двойная _(variable/proportional)_** или **обычная _(fixed/monospaced)_** ширина символов
- [Font Awesome][font-awesome]
- [Font Awesome Extension][font-awesome-extension]
- [Material Design Icons][font-material-design-icons]
- [Weather][font-weather]
- [GitHub Octicons][octicons]
- [Font Logos][font-logos] (Ранее известный как Font Linux)
- [Powerline Extra Symbols][ryanoasis-powerline-extra-symbols]
- [IEC Power Symbols][website-iecpower]
- [Pomicons][gabrielelana-pomicons]
- [Codicons][codicons]

## Установка

### `Вариант 1: Скачать и установить вручную`

> Лучший вариант для **быстрого** получения конкретного **индивидуального шрифта**.

Скачайте конкретный [улучшенный шрифт](#patched-fonts) на Ваш выбор

### `Вариант 2: Скачать журнал версий`

> Лучший вариант, если вам нужен **архив** или полное **семейство шрифтовых** вариаций (Bold, Italic и т.д.).

Шрифты доступны для скачивания в виде пакетов в [последней версии](https://github.com/ryanoasis/nerd-fonts/releases/latest)

### `Вариант 3: Установить скрипт`

> Лучший вариант, если вы хотите **автоматизировать** установку или использовать в **скриптах**.

_Замечание_: **Необходимо клонировать** текущее состояние репозитория

#### Все шрифты:

* Установить все улучшенные шрифты (_Замечание: Многие шрифты занимают много памяти_)

```sh
./install.sh
```

или используя Powershell (только на Windows):

```pwsh
./install.ps1
```

#### Один шрифт:

* Установка одного шрифта по Вашему выбору

```sh
./install.sh <FontName>
./install.sh Hack
./install.sh HeavyData
```

или используя Powershell (только на Windows):

```pwsh
./install.ps1 <FontName>
./install.ps1 Hack
./install.ps1 HeavyData
./install.ps1 FiraCode, Hack
./install.ps1 DejaVuSansMono -WhatIf
```

### `Вариант 4: Homebrew Fonts`

> Лучший вариант, если у Вас **macOS** и Вы хотите использовать **Homebrew**.

Все шрифты доступны через [Homebrew Cask](https://github.com/Homebrew/homebrew-cask) на macOS (OS X)

```sh
brew install font-hack-nerd-font
```

_On Linux you have to add `--cask` after `install`._

### `Вариант 5: Клонировать Репозиторий`

> Лучший выбор для **полного контроля всех** или **большинства** шрифтов, или для **помощи** в разработке.

Клонирование этого репозитория **не** требуется и неэффективно, если Вас интересует только ограниченный набор шрифтов.

Однако, если Вы хотите клонировать репозиторий, обязательно выполните _мелкое_ клонирование:
```sh
git clone --depth 1
```

Если вы хотите клонировать суб-директорию, используйте `git sparse-checkout`. Для выполнения необходим `Git v2.26`:

```sh
git clone --filter=blob:none --sparse git@github.com:ryanoasis/nerd-fonts
cd nerd-fonts
git sparse-checkout add patched-fonts/JetBrainsMono
```

### `Вариант 6: Скачать Ad Hoc Curl`

> Вариант для тех, кто хочет использовать **`curl` команды** или для использования в **скриптах**.

#### Linux

```sh
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf
```

_Внимание:_ устаревшие альтернативные пути: `~/.fonts`

#### macOS (OS X)

```sh
cd ~/Library/Fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf
```

### `Вариант 7: Неофициальные репозитории Chocolatey или Scoop`

> Вариант для пользователей **Windows** которые хотят использовать **Chocolatey** или **Scoop**.

Пользователи Chocolatey могут скачать опубликованные шрифты в репозиторий [Chocolatey Community Repository (CCR)](https://community.chocolatey.org/packages):

```powershell
choco install nerd-fonts-hack
```

Scoop users can download fonts using the [Scoop bucket for Nerd Fonts](https://github.com/matthewjberger/scoop-nerd-fonts):

```powershell
scoop bucket add nerd-fonts
scoop install Hack-NF
```

### `Вариант 8: Arch Community Repository`

Большинство шрифтов доступно в официальных репозиториях [Arch Community packages](https://archlinux.org/groups/any/nerd-fonts/).
Дополнительные пакеты доступны [в AUR](https://aur.archlinux.org/packages?K=nerd-fonts-&outdated=off).

### `Вариант 9: Улучшить Свой Шрифт`

> Опция для **исправления** Вашего **собственного шрифта** или полная **настройка** улучшенного шрифта.

Используйте Python-скрипт для командной строки, чтобы создавать улучшенный шрифт из вашего собственного шрифта с дополнительными новыми символами.

Смотрите: [Font Patcher](#font-patcher) для использования
* используйте эту опцию, если вы __не__ хотите использовать один из [предоставленных шрифтов](#patched-fonts)
* Вас всё равно придётся копировать созданный шрифт в корректную директорую шрифтов в Вашей системе


<h2 align="center" id="font-patcher">
	<img src="images/nerd-fonts-patcher-logo.png" alt="Nerd Fonts Patcher">
</h2>

Исправление шрифта по собственному выбору:
* Используя скрипт
  * Скачайте скрипт и дополнительные файлы [archive](https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FontPatcher.zip) и распакуйте архив
  * Скачать только скрипт `font-patcher` не достаточно.
  * Зависимости: Fontforge, Python 3, и пакеты`python-fontforge`, `argparse`
    * Fontforge может быть установлен как пакет
    * или на OSX с помощью `brew install fontforge`
    * или как [AppImage](https://github.com/fontforge/fontforge/releases)
  * Использование (рекоменд.):
  ```
  fontforge -script font-patcher PATH_TO_FONT
  ```
  * Использование напрямую (более удобный способ, если он у вас сработает):
  ```
  ./font-patcher PATH_TO_FONT
  ```
  * Используя Fontforge AppImage

    _Заметка_: выполните `chmod u+x` на AppImage-файле после загрузки. Все пути должны быть **абсолютными** и необходимо явное задание пути для готовых файлов! Если все располагается в одной директории, вы можете использовать `$PWD`.
  ```
  ./FontForge.AppImage -script $PWD/font-patcher $PWD/BaseFont.ttf -out /tmp
  ```

* Используя docker
  ```
  docker run --rm -v /path/to/fonts:/in:Z -v /path/for/output:/out:Z nerdfonts/patcher [OPTIONS]
  ```

Все параметры:

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

#### Примеры

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

Обычно следует использовать параметр `--complete`.

<a name="gotta-patch-em-all"></a>
## Давайте прокачаем все шрифты!

* для использования Контрибьюторами или Разработчиками

* улучшайте **все** шрифты в 'неулучшенном' каталоге:

  ```
  ./gotta-patch-em-all-font-patcher\!.sh
  ```

* можно задать определенный шаблон имени шрифта:

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

## Сотрудничество в разработке

Смотрите [contributing.md](contributing.md)


## Нестабильные пути к файлам

:warning: Предупреждение: Пути файлов могут изменяться в зависимости от релизов (особенно после **крупных** релизов)

Ссылка на ветвь **release**, а не на ветку ~~master~~, потому что пути изменяются для каждой версии

* Например:
  * :white_check_mark: Используйте: <code>https\://github.com/ryanoasis/nerd-fonts/blob/<b>0.9.0</b>/patched-fonts/Hermit/Medium/complete/Hurmit%20Medium%20Nerd%20Font%20Complete.otf</code>
  * :x: Вместо: <code>https\://github.com/ryanoasis/nerd-fonts/blob/<del>master</del>/patched-fonts/Hermit/Medium/complete/Hurmit%20Medium%20Nerd%20Font%20Complete.otf</code>


## Другие Хорошие Шрифты Для Улучшения

* список дополнительных хороших шрифтов для исправления, которые я не могу предоставить или поделиться из-за лицензии:
* [Input Mono][input-mono]
* [PragmataPro][pragmatapro]
* [Consolas][consolas]
* [Operator Mono][operator]
* [Dank Mono][dank]


## Мотивация Проекта

Смотрите [Wiki: Project Purpose][wiki-project-purpose]


## Журнал Изменений

Смотрите [changelog.md](changelog.md)

## Лицензия

Смотрите [LICENSE][LICENSE]

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

[release]:https://github.com/ryanoasis/nerd-fonts/releases/latest "Latest Release (external link) ➶"
[coc]:https://github.com/ryanoasis/nerd-fonts/blob/-/code_of_conduct.md "Contributor Covenant Code of Conduct"
[LICENSE]:https://github.com/ryanoasis/nerd-fonts/blob/-/LICENSE
[prs]:http://makeapullrequest.com "Make a Pull Request (external link) ➶"

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
