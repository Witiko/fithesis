.PHONY: all clean
all:
	make -C fithesis
	make pdflatex.pdf lualatex.pdf clean

# This target typesets the pdfLaTeX example.
pdflatex.pdf: pdflatex.tex
	pdflatex $<
	pdflatex $<

# This target typesets the LuaLaTeX example.
lualatex.pdf: lualatex.tex
	lualatex $<
	lualatex $<

# This target removes any auxiliary files.
clean:
	rm -f *.aux *.log *.out *.toc *.lot *.lof

# This target removes any auxiliary files
# and the output PDF file.
implode: clean
	rm -f pdflatex.pdf lualatex.pdf
