all: linux-on-smartphone.pdf

slides.aux: slides.tex slides.bib
	xelatex slides.tex

#slides.bbl: slides.aux
#	bibtex slides.aux

#slides.pdf: slides.tex slides.bbl macros.tex graphics/timeline.pdf
slides.pdf: slides.tex macros.tex graphics/timeline.pdf
	xelatex slides.tex
	xelatex slides.tex

graphics/timeline.pdf: resources/timeline.dot
	dot -Tpdf resources/timeline.dot > graphics/timeline.pdf

linux-on-smartphone.pdf: slides.pdf
	cp slides.pdf linux-on-smartphone.pdf

clean:
	rm -f *.blg *.log *.pdf *.bbl *.aux *.out *.nav *.snm *.toc *.vrb

