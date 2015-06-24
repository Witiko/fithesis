PDFFILES=econ-01.pdf fi-01.pdf fsps-01.pdf fss-01.pdf law-01.pdf \
	med-01.pdf ped-01.pdf phil-01.pdf sci-01.pdf 02.pdf
.PHONY: all clean
all: $(PDFFILES) clean

# This target typesets the a PDF file.
%.pdf: %.tex
	pdflatex $<
	pdflatex $<

# This target removes any auxiliary files.
clean:
	rm -f *.aux *.log *.out *.toc *.lot *.lof

# This target removes any auxiliary files
# and the output PDF files.
implode: clean
	rm -f $(PDFFILES)
