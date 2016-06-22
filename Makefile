# Makefile for tex files

MAIN = diss-main

### Variables for dependencies
OBJECTS = Makefile
TEXDIR = tex
SVGDIR = svg
IMGDIR = img
PYTDIR = python
TEXFILES = $(shell find . -name '*.tex')
IMGFILES = $(shell find ../$(IMGDIR)/ -name '*.*')

# commands
LATEX = pdflatex --interaction=nonstopmode

.PHONY: svg python $(MAIN).pdf

all: $(MAIN).pdf

# CUSTOM BUILD RULES
show: $(MAIN).pdf
	xdg-open $<

# MAIN LATEXMK RULE
# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.
# -interactive=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.

$(MAIN).pdf: $(TEXFILES) $(IMGFILES) $(OBJECTS)
	@echo '----------------------------------------'
	@echo '| Generiere pdf mit latexmk            |'
	@echo '----------------------------------------'
	latexmk -pdf -pdflatex=$(LATEX) $(MAIN).tex



clean:
	@echo '----------------------------------------'
	@echo '| Lösche temporäre LaTeX-files         |'
	@echo '----------------------------------------'
	latexmk -c
	rm -fv *.glo
	rm -fv *.gls
	rm -fv *.slo
	rm -fv *.sls
	rm -fv *.acn
	rm -fv *.glg
	rm -fv *.slg

cleanall:
	latexmk -C
	rm -fv *.glo
	rm -fv *.gls
	rm -fv *.slo
	rm -fv *.sls
	rm -fv *.acn
	rm -fv *.glg
	rm -fv *.slg
	rm -fv *.ist
	rm -fv *.bbl
