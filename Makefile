# A Simple Makefile for LaTeX
# Author: Lester James V. Miranda
# E-mail: ljvmiranda@gmail.com

# Default variables which can be edited via the terminal
BUILDDIR = build
ARTIFACTDIR = artifacts
COMPILER = pdflatex
PROJECT = LatexVorlage
BIBLIOGRAPHY = bib/Bibliography
FHVMODE = 2
LANGUAGE = ngerman
FHVTITLEPAGE =

ifeq ($(FHVTITLEPAGE),)
    COMMAND = -shell-escape -recorder -synctex=1 -interaction=nonstopmode  -halt-on-error -output-directory=$(BUILDDIR) '\def\FHVmode{$(FHVMODE)} \def\newLanguage{$(LANGUAGE)} \input{$(PROJECT).tex}'
else
	COMMAND = -shell-escape -recorder -synctex=1 -interaction=nonstopmode  -halt-on-error -output-directory=$(BUILDDIR) '\def\FHVmode{$(FHVMODE)} \def\newLanguage{$(LANGUAGE)} \def\FHVtitlePage{$(FHVTITLEPAGE)} \input{$(PROJECT).tex}'
endif

latex:
	@echo "Building $(PROJECT) in $(BUILDDIR) directory using $(COMPILER)..."
	@echo "Creating $(BUILDDIR) directory..."
	@mkdir -p $(BUILDDIR)
	@echo "Creating $(ARTIFACTDIR) directory..."
	@mkdir -p $(ARTIFACTDIR)
	@$(COMPILER) $(COMMAND)
	@echo "First pass (via $(COMPILER)) done!"
	#@cp $(BIBLIOGRAPHY).bib $(BUILDDIR)
	@biber --output_directory=$(BUILDDIR) $(PROJECT)
	@echo "Second pass A (via bibtex) done!"
	@makeglossaries -d $(BUILDDIR) $(PROJECT);
	@echo "Second pass B (via makeglossaries) done!"
	@$(COMPILER) $(COMMAND)
	@biber --output_directory=$(BUILDDIR) $(PROJECT)
	@makeglossaries -d $(BUILDDIR) $(PROJECT);
	@echo "Third pass (via $(COMPILER)) done!"
	@$(COMPILER) $(COMMAND)
	@echo "Fourth pass (via $(COMPILER)) done!"
	@echo "Compilation done. Output file can be seen in $(BUILDDIR)"

clean:
	@rm -rf $(BUILDDIR)
	@echo "Removed $(BUILDDIR) directory"
