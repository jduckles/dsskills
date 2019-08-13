SVGS=$(wildcard *.svg)
PNGS=$(patsubst %.svg, %.png, $(SVGS))
PDFS=$(patsubst %.svg, %.pdf, $(SVGS))

all: $(PNGS) $(PDFS)

%.png: %.svg
	./minify	
	convert $< $@
	convert -density 300 $< 300dpi_$@

%.pdf: %.svg
	inkscape ${PWD}/$< --export-pdf ${PWD}/$@
clean:
	rm *.pdf *.png
