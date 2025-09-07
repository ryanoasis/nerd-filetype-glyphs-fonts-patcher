# Contributing Guide

**Working on your first Pull Request?** You can learn how from this *free* series [How to Contribute to an Open Source Project on GitHub][First PR]

## How to contribute summary

**Often it can be helpful to discuss a PR first in an Issue** to avoid later problems or re-design when it is in review.

* Fork the project and submit a Pull Request (PR)
  * Explain what the PR fixes or improves
  * Screenshots for bonus points
* Use sensible commit messages
  * Short descriptive title in the first line, one empty line, and then multiple lines with an explanation (why and how).
  * If your PR fixes a separate issue number, include it in the commit message like `Fixes: #123` (on a separate line).
* Use a sensible number of commit messages as well
  * e.g. Your PR should not have 100s of commits
  * If you fix a previous commit of the PR it might be worth considering to squash them

## How to add yourself to the contributors (give yourself attribution)

Don't forget to give yourself credit! Make sure you add yourself to the contributors list that will eventually propagate to [NerdFonts.com](https://nerdfonts.com)
Usually the person pulling your PR will make sure you did not forget this step.

Either:
* Invoke the [@all-contributors bot](https://allcontributors.org/docs/en/bot/usage) by commenting on your Pull Request or Issue.
* _(not advised)_ Shallow clone repo and execute `all-contributors add <YOUR_GITHUB_HANDLE> <CONTRIBUTION_TYPE>`

Common types for this project include: `code`, `doc`, `translation`, `review`. For full list of contribution types see: https://allcontributors.org/docs/en/emoji-key

## Steps for updating an existing font

### 1. Update original (unpatched) version
* Copy and replace the existing unpatched version of the font and any readme and/or license files in the `src/unpatched-fonts/XYZ` directory
  * e.g. Updating *XYZ Font*, update files in directory `src/unpatched-fonts/XYZ/{PUT FONT FILES HERE}`
  * Make sure to update the correct subfolders for each font style (e.g. `src/unpatched-fonts/XYZ/Bold/{BOLD FONT FILES HERE}`), but only if the subfolder structure is already existing
  * Update version information in the `readme.md` file(s) and `bin/scripts/lib/fonts.json`
  * Add all the modifications into a git commit
### 2. Execute basic testing
* Do a basic test with the new font to ensure it patches correctly and generates a new font file, e.g.
  * `fontforge --script ./font-patcher src/unpatched-fonts/XYZ/XYZ.ttf --complete --debug 2`
  * Make sure to then delete this new font file if it is in the repository
### 3. Run build scripts
This is not needed and you should never commit any patched files directly to the repo. The Github workflow will do that at appropriate times.

* When fairly satisfied the font patches correctly, run the following:
  * Patch **all** of the variations/options, e.g.
    * `./gotta-patch-em-all-font-patcher\!.sh /XYZ`

## Steps for adding a new font or removing an existing font

### 1. Verify license
* Check the license even allows the font to be modified and shared
### 2. Add original (unpatched) version
* Add the unpatched version of the font and any license files to the `src/unpatched-fonts/` directory inside a new directory
  * e.g. Adding *XYZ Font*, create directory `src/unpatched-fonts/XYZ/{PUT FONT FILES HERE}`
  * Do not make subfolders for each font style
  * Add a `README.md` file to `src/unpatched-fonts/XYZ` that follows the style of the existing fonts
  * If the font has only Oblique instead of Italic, set that (and other specials) in the `config.cfg` file
  * Update information in the `/readme.md` file(s)
  * Insert font into `bin/scripts/lib/fonts.json`; use `repoRelease=false`
  * Add all the modifications into a git commit
### 3. Execute basic testing
* Do a basic test with the new font to ensure it patches correctly and generates a new font file, e.g.
  * `fontforge --script ./font-patcher src/unpatched-fonts/XYZ/XYZ.ttf --complete --debug 2`
  * Make sure to then delete this new font file if it is in the repository (all patched fonts should be generated in the `patched-fonts` directory)
### 4. Run build scripts
You should never commit any patched files directly to the repo. The Github workflow will do that at appropriate times.

* When fairly satisfied the font patches correctly, run the following:
  * Patch **all** of the variations/options, e.g.
    * `NERDFONTS='--debug 2 --makegroups 1' ./gotta-patch-em-all-font-patcher\!.sh /XYZ`
  * If there are name length problems you might want to use `--makegroups 2` or increasing (3, 4, ...), until all fonts of the set come out without error.
  * To increase testing speed add `--dry` to the `NERDFONTS` variable above.
  * Add the needed `makegroups` level (if it is not 1) to the `config.cfg` file and amend your commit.
### 5. Release
* As we do not release directly to the repository anymore the new font will only be seen on a real release.
* For that the font image preview will also be needed (`generate-font-image-previews.sh`).
* What is automated via Github workflows and what not might change over time, so nothing is specified here.

## Steps to add a new icon to the core set
Codepoints in the code set are a scarce resource, so in general it is unlikely that an icon will be added.
* To add a icon one just needs to throw the svg into the correct directory and add a line to `icons.tsv`.
* The workflow than automagically updates the `i_seti.sh` and the `original-source.otf` (workflow `PackSVGs`).

## Things to keep in mind

* Smaller Pull Requests are likely to be merged more quickly than bigger changes
* This project is using a [KISS Workflow][]
  * Pull Requests and bugfixes are directly merged into the default branch after sanity testing
  * The default branch is basically consider the main developer branch
    * We no longer wait to get changes into the default branch when there is a release/milestone/version!
  * The release branches and version tags are considered stable and frozen
* This project is using [Semantic Versioning 2.0.0](http://semver.org/)
  * If a bugfix or PR is *not* trivial it will likely end up in the next **MINOR** version
  * If a bugfix or PR *is* trivial *or* critical it will likely end up in the next **PATCH** version
* Useful Pull Requests **will** get merged in eventually
  * [E.g. see how many have already been merged vs. still open][pulls]

## Commit messages

* Squashing to 1 commit is **not** required at this time
* Use sensible commit messages (when in doubt: `git log`)
* Short descriptive title in the first line, one empty line, and then multiple lines with an explanation (e.g. why and how).
* Use a sensible number of commits
* If your PR fixes a specific issue number, include it in the commit message: `Fixes: #123` as this activates the autolink and autoclose mechanism.

## Code standards

### Shell Scripts

* Follow [ShellCheck](https://github.com/koalaman/shellcheck) - A shell script static analysis tool
* Try to follow [Google's Shell Style Guide](https://google.github.io/styleguide/shell.xml)

### Python

* Use 4 spaces for indentation
* Consider PEP8 and other (@todo)

<!-- link references -->

[pulls]: https://github.com/ryanoasis/nerd-fonts/pulls
[Features Section]: https://github.com/ryanoasis/nerd-fonts/blob/-/readme.md#features
[Combinations Section]: https://github.com/ryanoasis/nerd-fonts/blob/-/readme.md#combinations
[Patched Fonts]: https://github.com/ryanoasis/nerd-fonts/blob/-/readme.md#patched-fonts
[KISS Workflow]: https://github.com/ryanoasis/nerd-fonts/wiki/Development-Workflow#kiss-workflow
[First PR]: https://egghead.io/courses/how-to-contribute-to-an-open-source-project-on-github
