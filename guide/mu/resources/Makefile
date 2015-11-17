PDFFILES=empty.pdf
TEX=pdflatex
.PHONY: all clean
all: $(PDFFILES) clean

# This target typesets the a PDF file.
%.pdf: %.tex
	$(TEX) $<
	$(TEX) $<

# This target removes any auxiliary files.
clean:
	rm -f *.aux *.log *.out *.toc *.lot *.lof

# This target removes any auxiliary files
# and the output PDF files.
implode: clean
	rm -f $(PDFFILES)
