PDFFILES=fi.pdf sci.pdf ped.pdf med.pdf fss.pdf fsps.pdf phil.pdf \
	law.pdf econ.pdf
TEXFILES=fi.tex sci.tex ped.tex med.tex fss.tex fsps.tex phil.tex \
	law.tex econ.tex
TEMPLATE=guide.tex
BIB=guide.bib
.PHONY: all clean
all:
	make all -C examples
	make $(PDFFILES) clean

# This target typesets the a PDF file.
$(PDFFILES): $(TEMPLATE) $(BIB)
	sed s/faculty=?/faculty=$(basename $@)/ $(TEMPLATE) > $(basename $@).tex
	pdflatex -shell-escape $(basename $@).tex
	biber $(basename $@)
	pdflatex -shell-escape $(basename $@).tex
	pdflatex -shell-escape $(basename $@).tex

# This target removes any auxiliary files.
clean:
	rm -f $(TEXFILES) *.aux *.log *.out *.toc *.lot *.lof *.bbl \
		*.blg *.pyg *.bcf *-blx.bib *.run.xml
	rm -rf _minted-*

# This target removes any auxiliary files
# and the output PDF files.
implode: clean
	make implode -C examples
	rm -f $(PDFFILES)
