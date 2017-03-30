# svg-Makefile (in svg subfolder)
SOURCES := $(shell find . -name '*.svg')
OBJECTS := $(SOURCES:%.svg=%.pdf)
UNAME := $(shell uname)
all: svg
svg: $(OBJECTS)

%.pdf: %.svg

ifeq ($(UNAME), Linux)
		inkscape -D -z -f $< --export-latex -A $@
endif
ifeq ($(UNAME), Darwin)
		/Applications/Inkscape.app/Contents/Resources/bin/inkscape -D -z -f $< --export-latex -A $@
endif
	

cleanall:
	-rm *.pdf
	-rm *.pdf_tex

.SILENT: clean
