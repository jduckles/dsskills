SVGS=$(wildcard *.svg)
PNGS=$(patsubst %.svg, %.png, $(SVGS))
PDFS=$(patsubst %.svg, %.pdf, $(SVGS))

all: $(PNGS) $(PDFS)

dockerbuild:
	docker build . -t jduckles/dsskills
	docker push jduckles/dsskills

%.png: %.svg
	svgo *.svg
	convert $< $@
	convert -density 300 $< 300dpi_$@

%.pdf: %.svg
	inkscape ${PWD}/$< --export-pdf ${PWD}/$@
clean:
	rm *.pdf *.png
