PDFFILES=fi-pdflatex.pdf fi-lualatex.pdf sci-pdflatex.pdf sci-lualatex.pdf \
	ped-pdflatex.pdf ped-lualatex.pdf med-pdflatex.pdf med-lualatex.pdf \
	fss-pdflatex.pdf fss-lualatex.pdf fsps-pdflatex.pdf fsps-lualatex.pdf \
	phil-pdflatex.pdf phil-lualatex.pdf law-pdflatex.pdf law-lualatex.pdf \
	econ-pdflatex.pdf econ-lualatex.pdf
TEXFILES=$(PDFFILES:.pdf=.tex)
OUTPUT=$(PDFFILES) $(TEXFILES)

.PHONY: all clean
all:
	make $(OUTPUT) clean

# This target prepares a TeX file.
%-pdflatex.tex: %.ins example.dtx
	xetex $<
	sed -ni '/%\{3,\}/,/\\end{document}/p' $@
%-lualatex.tex: %.ins example.dtx
	xetex $<
	sed -ni '/%\{3,\}/,/\\end{document}/p' $@

# This target typesets a pdfLaTeX example.
%-pdflatex.pdf: %-pdflatex.tex example.bib
	pdflatex $<
	biber                               $(basename $<).bcf
	texindy -I omega --language english $(basename $<).idx
	pdflatex $<
	pdflatex $<

# This target typesets a LuaLaTeX example.
%-lualatex.pdf: %-lualatex.tex example.bib
	lualatex $<
	biber                               $(basename $<).bcf
	texindy -I omega --language english $(basename $<).idx
	lualatex $<
	lualatex $<

# This target removes any auxiliary files.
clean:
	rm -f *.aux *.log *.out *.toc *.lot *.lof *.bcf *.blg *.run.xml \
		*.bbl *.idx *.ind *.ilg

# This target removes any auxiliary files
# and the output PDF files.
implode: clean
	rm -f $(OUTPUT)
