# Makefile for tex files

MAIN = diss-main

### Variables for dependencies
OBJECTS = Makefile
#TEXDIR = tex
SVGDIR = svg
IMGDIR = img

# commands
LATEX = pdflatex --interaction=nonstopmode

.PHONY: svg python $(MAIN).pdf

all: svg tex

svg:
	@echo '----------------------------------------'
	@echo '| Generiere Bilder svg >> pdf          |'
	@echo '----------------------------------------'
	$(MAKE) -C $(SVGDIR)

tex:	
	@echo '----------------------------------------'
	@echo '| Generiere pdf mit latexmk            |'
	@echo '----------------------------------------'
	latexmk -pdf -pdflatex=$(LATEX) $(MAIN).tex

clean:
	@echo '----------------------------------------'
	@echo '| Lösche temporäre LaTeX-files         |'
	@echo '----------------------------------------'
	latexmk -C
	rm -fv *.glo
	rm -fv *.gls
	rm -fv *.slo
	rm -fv *.sls
	rm -fv *.acn
	rm -fv *.acr
	rm -fv *.alg
	rm -fv *.glg
	rm -fv *.slg
	rm -fv *.ist
	rm -fv *.bbl

cleanall:
	latexmk -C
	rm -fv *.glo
	rm -fv *.gls
	rm -fv *.slo
	rm -fv *.sls
	rm -fv *.acn
	rm -fv *.acr
	rm -fv *.alg
	rm -fv *.glg
	rm -fv *.slg
	rm -fv *.ist
	rm -fv *.bbl
	rm -fv svg/*.pdf
	rm -fv svg/*.pdf_tex
