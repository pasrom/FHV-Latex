
#   FHV-Latex template

To use this template, it is recommened to work with [TeXstudio](http://texstudio.sourceforge.net). You can use the given profile provided in [scripts](https://github.com/pasrom/FHV-Latex/tree/master/scripts)  (Mac, Windows, Linux is not supported yet, but should be same as Mac). 

The bibliography uses Biber to build and is adapted to FHV guidelines.

I also recommend to use [TeX Live](https://www.tug.org/texlive/) Latex distribution. 

[Here](https://github.com/pasrom/FHV-Latex/blob/master/tex/Examples.tex) you find some examples: how to use Pictures, Tables, TikZ and the usage of referencing equations/sections.

With the command `\Zusammenfassung` in [LatexVorlage.tex](https://github.com/pasrom/FHV-Latex/blob/master/LatexVorlage.tex) you can choose between a summary or thesis. The summary has a wider layout in comparison with the thesis type.

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
        
 2. With the command `\def\thesis{false}` you can choose between a report or a thesis type. It changes the style of the title page.
 3. With the command `\def\newLanguage{ngerman}` you can choose between the language english and german, don't forget to build twice.
 4. Setting names of the author and supervisor:
    ```
    \def\authorName{Name\xspace}
    \def\authorSurname{Surname\xspace}
    \def\supervisorName{Supervisor Name\xspace}
    \def\supervisorSurname{Supervisor Surname\xspace}
    ```
 5. Setting the gender of the author with the command `\def\wOrM{m}`