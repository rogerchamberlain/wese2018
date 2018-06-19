
default: paper.pdf

all: paper.pdf

paper.dvi: paper.tex paper.bib intro.tex topics.tex delivery.tex weeks.tex lessons.tex conclude.tex
	latex paper
	bibtex paper
	latex paper
	latex paper

paper.ps: paper.dvi
	dvips -Ppdf -G0 -tletter paper.dvi

paper.pdf: paper.ps
	ps2pdf -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress paper.ps paper.pdf

clean:
	rm -f paper.dvi paper.log paper.ps paper.pdf paper.bbl paper.blg paper.aux paper.out paper.xcp
