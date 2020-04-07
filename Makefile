
all: cv.pdf

cv.pdf: cv.tex references.bib
	pdflatex cv.tex
	bibtex cv
	pdflatex cv.tex
	htlatex cv.tex
	mv cv.html x
#	cat x | sed 's/"indent"/"noindent"/g' | grep -v 'phvr7t-x-x-60' | grep -v '^href="#X' >cv.html
	cat x | sed 's%<title></title>%<title>Erik Garrison</title>%' | sed 's/"indent"/"noindent"/g' | sed 's%<link rel="stylesheet" type="text/css" href="cv.css">%<link rel="stylesheet" type="text/css" href="cv.css"><link rel="stylesheet" type="text/css" href="w3.css">%' | sed 's%<div class="flushleft"%<div class="w3-main"><div class="w3-container w3-quarter"></div><div class="w3-container w3-half"><div class="flushleft"%' >cv.html
	mv cv.css x
	(cat x ; echo 'body { font-family: sans-serif;}'; echo 'span.cite { visibility: hidden; }') >cv.css

#proposal.pdf: proposal.tex references.bib
#	pdflatex proposal.tex
#	bibtex proposal
#	pdflatex proposal.tex
#	pdflatex proposal.tex

#.PHONY: clean
#clean:
#	rm -f 
