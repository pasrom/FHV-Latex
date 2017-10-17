@echo off
if %1!==! goto ende
if %2!==! goto ende
copy /Y %2build\%1.pdf %2%1-built.pdf
:ende

:: add this line to TexStudio "?a)scripts\copy_TeXstudio.bat" "%" "?a)"