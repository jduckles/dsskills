SVGS=$(wildcard *.svg)
PNGS=$(patsubst %.svg, %.png, $(SVGS))
PDFS=$(patsubst %.svg, %.pdf, $(SVGS))

all: $(PNGS) $(PDFS)

dockerbuild:
	docker build . -t jduckles/dsskills
	docker push jduckles/dsskills

%.png: %.svg
	docker run -v ${PWD}:/data jduckles/dsskills svgo *.svg
	docker run -v ${PWD}:/data jduckles/dsskills convert $< $@
	docker run -v ${PWD}:/data jduckles/dsskills convert -density 300 $< 300dpi_$@

%.pdf: %.svg
	docker run -v ${PWD}:/data jduckles/dsskills inkscape /data/$< --export-pdf /data/$@
clean:
	rm *.pdf *.png
