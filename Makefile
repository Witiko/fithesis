.PHONY: all explode clean clean-all install

SUBMAKEFILES=logo/mu logo/mu/color locale style style/mu
CLASSFILES=fithesis.cls fithesis[23].cls
STYLEFILES=style/*.sty style/*/*.sty style/*/*.clo
LOGOFILES=logo/*/*.eps logo/*/color/*.eps logo/*/*.pdf logo/*/color/*.pdf
LOCALEFILES=locale/*.tex locale/*/*.tex locale/*/*/*.tex
DTXFILES=*.dtx locale/*.dtx style/*.dtx style/*/*.dtx
RESOURCES=$(STYLEFILES) $(LOGOFILES) $(LOCALEFILES)
AUXFILES=example.aux example.log example.out example.toc example.lot example.lof example.bib fithesis.aux fithesis.log fithesis.toc fithesis.ind fithesis.idx fithesis.out fithesis.ilg fithesis.gls fithesis.glo fithesis.hd
MANUAL=fithesis.pdf
PDFFILES=$(MANUAL) example.pdf
TEXLIVEFILES=$(CLASSFILES) $(RESOURCES)
TEXLIVEDIR=$(shell kpsewhich -var-value TEXMFLOCAL)

# This pseudo-target creates the class files, typesets both
# the example file and the technical documentation, makes
# the style and locale files and removes any auxiliary files.
all:
	for dir in $(SUBMAKEFILES); do make all -C "$$dir"; done
	make explode clean

# This pseudo-target creates the class files and typesets
# both the example file and the technical documentation
explode: fithesis3.cls $(PDFFILES)

# This target creates the class files.
fithesis3.cls: fithesis.ins fithesis.dtx
	tex $<

# This target typesets the technical documentation.
fithesis.pdf: $(DTXFILES)
	pdflatex $<
	makeindex -s gind.ist fithesis
	makeindex -s gglo.ist -o fithesis.gls fithesis.glo
	pdflatex $<
	pdflatex $<

# This target typesets the example.
example.pdf: example.tex fithesis3.cls
	pdflatex $<
	pdflatex $<

# This pseudo-target installs the class files and
# the technical documentation into the folder structure
# of the TeXLive package, whose root directory is
# specified within the "to" argument.
install:
	@if [ -z "$(to)" ]; then \
	  printf "Usage: make to=DIRECTORY install-texlive\nDetected TeXLive directory: %s\n" $(TEXLIVEDIR); \
	  exit 1; \
  fi
	mkdir --parents "$(to)/tex/latex/fithesis3"
	cp --parents --verbose $(TEXLIVEFILES) "$(to)/tex/latex/fithesis3"
	mkdir --parents "$(to)/doc/latex/fithesis3"
	cp $(MANUAL) "$(to)/doc/latex/fithesis3/manual.pdf"
	texhash

# This pseudo-target removes any existing auxiliary files.
clean:
	rm -f $(AUXFILES)

# This pseudo-target removes any makeable files.
implode: clean
	rm -f $(PDFFILES) $(CLASSFILES)
	for dir in $(SUBMAKEFILES); do make implode -C "$$dir"; done
