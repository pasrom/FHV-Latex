
[![Build Status](https://travis-ci.org/pasrom/FHV-Latex.svg?branch=master)](https://travis-ci.org/pasrom/FHV-Latex)
#   FHV-Latex template

To use this template, it is recommened to work with [TeXstudio](http://texstudio.sourceforge.net). You can use the given profile provided in [scripts](https://github.com/pasrom/FHV-Latex/tree/master/scripts)  (Mac, Windows, Linux is not supported yet, but should be same as Mac). 

The bibliography uses Biber to build and is adapted to FHV guidelines.

I also recommend to use [TeX Live](https://www.tug.org/texlive/) Latex distribution. 

[Here](https://github.com/pasrom/FHV-Latex/blob/master/tex/Examples.tex) you find some examples: how to use Pictures, Tables, TikZ and the usage of referencing equations/sections.

An easy to use [tablegenerator.](http://www.tablesgenerator.com).

# overallDefines.sty

Here you can define new commands (`./sty/overallDefines.sty`).

 1. With the command `\def\debug{false}` you can choose to add the packages
 
    ```
    \usepackage{pagegrid}
    \usepackage{showframe}
    \usepackage{layout}
    ```
    This helps to lock at the page layout and to find `overfull \hbox` warnings.
 3. With the command `\def\newLanguage{ngerman}` you can choose between the language english and german, don't forget to build twice and don't panic if the first compilation throws an error.
 4. Setting names of the author and supervisor:
    ```
    \def\authorName{Name\xspace}
    \def\authorSurname{Surname\xspace}
    \def\supervisorName{Supervisor Name\xspace}
    \def\supervisorSurname{Supervisor Surname\xspace}
    ```
 5. Setting the gender of the author with the command `\def\wOrM{m}`

# LatexVorlage.tex

This is the main file, where all subfiles and packages are loaded.

You can define here 

 1. The mode of the layout can be spezified with`\def\mode{x}`. Where following arguments are working:
	 `1`: **documentation**, e.g.: a documentation for a project done in a course
	 
	 `2`: **thesis**, e.g.: a master thesis (standard). It changes the style of the title page.
	 
	`3`: **summary**, changes the layout. If you want to use all the space an the 
	page, but take in mind, the typography is destroyed!
	`9`: **paper**
	
 3. `\newcommand{\version}{v0.0}` self explaining, version numbering.
