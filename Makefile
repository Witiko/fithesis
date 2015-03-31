.PHONY: all clean clean-all install

CLASSFILES=fithesis.cls fithesis[23].cls
STYLEFILES=style/*.sty style/*/*.sty style/*/*.clo
AUXFILES=example.aux example.log example.out example.toc example.lot example.lof example.bib fithesis.aux fithesis.log fithesis.toc fithesis.ind fithesis.idx fithesis.out fithesis.ilg fithesis.gls fithesis.glo
PDFFILES=fithesis.pdf example.pdf
LOGOFILES=logo/*/*.eps logo/*/color/*.eps logo/*/*.pdf logo/*/color/*.pdf
SOURCEFILE=fithesis.dtx
OTHERFILES=csquot.sty example.tex fithesis.ins Makefile
INSTALLFILES=$(CLASSFILES) $(STYLEFILES) $(LOGOFILES) $(PDFFILES) $(SOURCEFILE) $(OTHERFILES)
TEXLIVEFILES=$(CLASSFILES) $(STYLEFILES) $(LOGOFILES)

# This pseudo-target creates the class files, typesets both
# the example file and the technical documentation and
# removes any auxiliary files.
all: fithesis3.cls $(PDFFILES) clean
	@if ! kpsewhich scrreprt.cls > /dev/null; then echo "The scrreprt document class isn't installed."; exit 1; fi
	@if ! kpsewhich tex-gyre/qplr.pfb > /dev/null; then echo "The TeX Gyre Pagella font isn't installed."; exit 1; fi
	cd logo/mu; make all
	cd logo/mu/color; make all

# This target creates the class files.
fithesis3.cls: fithesis.ins fithesis.dtx
	yes | tex $< # TODO: Remove the `yes`

# This target typesets the technical documentation.
fithesis.pdf: fithesis.dtx
	pdflatex $<
	makeindex -s gind.ist fithesis
	makeindex -s gglo.ist -o fithesis.gls fithesis.glo
	pdflatex $<

# This target typesets the example.
example.pdf: example.tex fithesis3.cls
	pdflatex $<
	pdflatex $<

# This pseudo-target installs any non-auxiliary files
# into the directory provided within the "to" argument.
install:
	@if [ -z "$(to)" ]; then echo "Usage: make to=DIRECTORY install"; exit 1; fi
	mkdir --parents "$(to)/fithesis3"
	cp --parents --verbose $(INSTALLFILES) "$(to)/fithesis3"

# This pseudo-target installs the class files and
# the technical documentation into the folder structure
# of the TeXLive package, whose root directory is
# specified within the "to" argument.
install-texlive:
	@if [ -z "$(to)" ]; then echo "Usage: make to=DIRECTORY install-texlive"; exit 1; fi
	mkdir --parents "$(to)/tex/latex/fithesis3"
	cp --parents --verbose $(TEXLIVEFILES) "$(to)/texmf-local/tex/latex/fithesis2"
	mkdir --parents "$(to)/doc/latex/fithesis3"
	cp fithesis.pdf "$(to)/doc/latex/fithesis3/manual.pdf"
	texhash

# This pseudo-target removes any existing auxiliary files.
clean:
	rm -f $(AUXFILES)

# This pseudo-target removes any makeable files.
clean-all: clean
	rm -f $(PDFFILES) $(CLASSFILES)
