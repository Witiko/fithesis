.PHONY: all clear
all:
	cd fithesis3 && make
	make pdflatex.pdf xelatex.pdf clear

# This target typesets the pdfLaTeX example.
pdflatex.pdf: pdflatex.tex
	pdflatex $<
	pdflatex $<

# This target typesets the XeLaTeX example.
xelatex.pdf: xelatex.tex
	xelatex $<
	xelatex $<

# This target removes any auxiliary files.
clear:
	rm -f *.aux *.log *.out *.toc *.lot *.lof

# This target removes any auxiliary files
# and the output PDF file.
implode: clear
	rm -f pdflatex.pdf xelatex.pdf
