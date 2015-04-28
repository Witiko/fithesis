.PHONY: all clear
all:
	cd fithesis3 && make
	make example.pdf clear

# This target typesets the example.
example.pdf: example.tex
	pdflatex $<
	pdflatex $<

# This target removes any auxiliary files.
clear:
	rm -f example.aux example.log example.out \
	  example.toc example.lot example.lof

# This target removes any auxiliary files
# and the output PDF file.
implode: clear
	rm -f example.pdf
