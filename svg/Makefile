# svg-Makefile (in svg subfolder)
SOURCES := $(shell find . -name '*.svg')
OBJECTS := $(SOURCES:%.svg=%.pdf)
all: svg
svg: $(OBJECTS)

%.pdf: %.svg
	inkscape -D -z -f $< --export-latex -A $@

cleanall:
	-rm *.pdf
	-rm *.pdf_tex

.SILENT: clean
