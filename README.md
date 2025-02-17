<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [FEIstyle](#feistyle)
    - [Changelog](#changelog)
- [Latex installation](#latex-installation)
  - [Installation on macOS](#installation-on-macos)
    - [Updating TeX packages](#updating-tex-packages)
  - [Installation on Ubuntu / Fedora](#installation-on-ubuntu-and-fedora)
      - [Newer versions of Ubuntu](#for-newer-versions-of-ubuntu)
      - [Older versions of Ubuntu and Fedora](#older-versions-using-eitl)
- [Usage](#usage)
- [Compile chain](#compile-chain)
  - [Manual compiling](#manual-compiling)
  - [Using *latexmk*](#using-latexmk)
  - [Using Makefile (uses *latexmk*)](#using-makefile-uses-latexmk)
  - [Sublime-text 3 project file](#sublime-text-3-project-file)
- [Hints and trics](#hints-and-trics)
  - [Counting words, lines and characters](#counting-words-lines-and-characters)
- [TODO](#todo)
- [Contribution](#contribution)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# FEIstyle
[![Latest Version](https://img.shields.io/github/release/Kyslik/FEIStyle.svg?style=flat-square)](https://github.com/Kyslik/FEIStyle/releases)
[![Software License](https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)](LICENSE.md)

Upgraded FEIStyle ([original](https://github.com/Kyslik/FEIStyle)) modified for use at the Institute of Robotics and Cybernetics FEI STU. 
 
 - Use Times New Roman font for consistency with the [official MS word templates from URK](https://urk.fei.stuba.sk/semester/pazp)
 - support for citation standard [ISO-690](https://github.com/michal-h21/biblatex-iso690) required by [STU FEI](http://www.fei.stuba.sk/sk/kniznica-fei/vzory-bibliografickych-odkazov-a-citovanie.html?page_id=1756), using biber
 - support for <strike>acronym</strike> glossaries package
 - removed FEIstyle.bst (not needed)
 - added Makefile
 - added seminar paper template (**example_paper.tex**) [example_paper.pdf](example_paper.pdf)
 - <strike>python script (utils/tree.py) to auto-generate contents of electronic medium (**attachmentA.tex**)</strike>
 - improved contents of electronic medium example, added 2 commands to make it easy to write [**attachmentA.tex**](https://github.com/Kyslik/FEIStyle/blob/master/includes/attachmentA.tex) like files
 
>**Note**: FEIstyle supports **only UTF-8** encoding.

### Changelog

Change-log is located [here](CHANGELOG.md). 

>**Note**: Minor changes are not noted in change-log.

# Latex installation

[Here](https://www.tug.org/texlive/) you can find the full documentation of how to download Latex for Linux, Windows and macOS.

## Installation on macOS

 - install [MacTex distribution](https://tug.org/mactex/) using [homebrew](http://brew.sh/index.html) (~2GB / 6GB installed)

    ```
    $ brew cask install mactex
    ```
 - you can download MacTex manually from [tug.org](http://www.tug.org/mactex/mactex-download.html).

>**Note**: MacTex installs also BibDesk which can be used to maintain your bibliography in a very nice way.

### Updating TeX packages

If you installed MacTex distribution you also have application called TeX Live Utility (it is a front-end for `pkmgr` program)
which is used to upgrade all TeX related packages, open it from time to time and do a full update.

## Installation on Ubuntu and Fedora

### For newer versions of Ubuntu

[Here](https://www.tug.org/texlive/) you can see detailed info about downloading latex on ubuntu.

#### TL;DR

 There are more types of downloads. They differ in the amount of contents you would download.
 The texlive-latex-recommended is recommended to download. The full version will download every
 package linked with texlive (also those like Japanese or Chinese language support). Then add
 the missing packages. This can be achieved using command:

  ```
   $ sudo apt install texlive-latex-recomended latexmk biber texlive-lang-czechslovak texlive-bibtex-extra texlive-science
  ```

### Older versions using eitl
>**Note**:  Works for Fedora too

Do following steps only if you have texlive 2015 or less

>**Note**: biblatex-iso690 is included in 2016 build of texlive

 - download install script
  
   ```
   $ wget http://mirrors.ctan.org/support/texlive/eitl.zip
   ```
 
 - unzip
   
   ```
   $ unzip eitl.zip && cd eitl
   ```

 - install TexLive
 
   ```
   $ ./eitl.sh /usr/share/texlive
   ```

# Usage
  Download the [zip](https://github.com/Kyslik/FEIStyle/archive/master.zip) file or clone the repository. In case of the zip file, extract it to desired folder and enjoy. 

# Compile chain

In following sub-chapters `file` is your main `file.tex` (e.g.: `diploma.tex` in root folder)

## Manual compiling

Following chain should output `file.pdf`

```
$ pdflatex file
$ biber file
$ glossary file
$ pdflatex file
$ pdflatex file #not a typo!
```

## Using *latexmk*
>**Note**: see [Hints and Trics](https://github.com/Kyslik/FEIStyle#hints-and-trics) section to get information on how to install **letexmk**

Following command runs necessary compile chain.

```
$ latexmk -pdf -synctex=1 -interaction=nonstopmode -silent file
```

## Using Makefile (uses *latexmk*)

>**Note**: make sure to change file-name in Makefile on line [#2](https://github.com/Kyslik/FEIStyle/blob/master/Makefile#L2)

Build in `.build` folder

```
$ make
```

Clean `.build` folder and delete PDF file in parent folder

```
$ make clean
```

Combine two commands above

```
$ make refresh
```

Read more on how to be even more efficient with [latexmk && make](https://drewsilcock.co.uk/using-make-and-latexmk).

## Sublime-text 3 project file
Repository consists of ST3 project file which includes building your PDF using `SUPER+b`.

>**Note**: to enable building with short-cut `tools->Build System->FEI-LaTeX`

You can also install [LaTeXTools](https://github.com/SublimeText/LaTeXTools) to make build / debug process even easier. File [fei.sublime-project](https://github.com/Kyslik/FEIStyle/blob/master/fei.sublime-project) comes with settings set to build your documentation - just edit `TEXroot` setting.

# Hints and trics
search terms:

 - latexmk, CTAN, latex, tex, make, Makefile
 
humans whom you can ask: 

 - [http://tex.stackexchange.com/](http://tex.stackexchange.com/)
 
editors and IDEs:

 - [http://tex.stackexchange.com/questions/339/latex-editors-ides](http://tex.stackexchange.com/questions/339/latex-editors-ides)
 
> Afraid of losing your work? Use Git.

## Counting words, lines and characters

There is a variety of ways to count words and lines (characters are not so important) of compiled PDF file, and none is precise so we list a few and you can compare results yourself.

**Using ps2ascii**

```
$ ps2ascii example.pdf |  wc -l -w -c
```

**Using pdftotext**

```
pdftotext example.pdf - | wc -l -w -c
```

>**Note**: [CZRP](http://cms.crzp.sk/) does word counting differently, for example my thesis using `ps2ascii` method outputs *4288*, *21031*, *145198*; `pdftotext` method outputs *7051*, *21377*, *148535*; CZRP word count is *14039* and character count *138687*.
 
Counting words from source file (**not recommended**, since template does a lot of `/include`ing and `/input`ting).

```
texcount -inc example.tex
```


# TODO

 - [ ] <strike>working example on [Sharelatex.com](https://www.sharelatex.com)</strike>
   - Sharelatex does not support biblatex-iso690 at this time 
 - [ ] transform **tutorial.pdf** to wiki page
 - [ ] update read-me to include usage for Windows OS users
 - [x] update csquotes style to Slovak after [this PR](https://github.com/josephwright/csquotes/pull/9) is merged, (perhaps in 2017)
   - optional since not everyone has up-to-date packages installed
 - [x] <strike>auto-generate contents of electronic medium</strike>
   - electronic medium should be brief with explanation, see example
 - [x] publish example of electronic medium

# Contribution

Any contributions are welcome!

