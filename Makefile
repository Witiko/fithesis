SUBMAKES_REQUIRED=logo/mu locale style style/mu
SUBMAKES_EXTRA=example/mu
SUBMAKES=$(SUBMAKES_REQUIRED) $(SUBMAKES_EXTRA)

.PHONY: all base complete docs clean dist dist-implode implode \
	install install-base install-docs uninstall $(SUBMAKES)

CLASSFILES=fithesis.cls fithesis2.cls fithesis3.cls fithesis4.cls
STYLEFILES=style/*.sty style/*/*.sty style/*/*.clo
EPSLOGOS=logo/*/*.eps
PDFLOGOS=logo/*/*.pdf
LOGOS=$(EPSLOGOS) $(PDFLOGOS)
LOCALES=locale/*.def locale/*/*.def locale/*/*/*.def
DTXFILES=*.dtx locale/czech.dtx locale/english.dtx \
	locale/slovak.dtx style/*.dtx style/*/*.dtx
INSFILES=*.ins locale/czech.ins locale/english.ins \
	locale/slovak.ins style/*.ins style/*/*.ins
MAKES=locale/Makefile logo/mu/Makefile Makefile style/Makefile \
	style/mu/Makefile
USEREXAMPLE_SOURCES=example/mu/Makefile example/mu/example.dtx \
	example/mu/*.ins example/mu/latexmkrc \
	example/mu/example-terms-abbrs.tex
USEREXAMPLES=example/mu/econ-lualatex.pdf \
	example/mu/econ-pdflatex.pdf example/mu/fi-lualatex.pdf \
	example/mu/fi-pdflatex.pdf example/mu/fsps-lualatex.pdf \
	example/mu/fsps-pdflatex.pdf example/mu/fss-lualatex.pdf \
	example/mu/fss-pdflatex.pdf example/mu/law-lualatex.pdf \
	example/mu/law-pdflatex.pdf example/mu/med-lualatex.pdf \
	example/mu/med-pdflatex.pdf example/mu/ped-lualatex.pdf \
	example/mu/ped-pdflatex.pdf example/mu/phil-lualatex.pdf \
	example/mu/phil-pdflatex.pdf example/mu/sci-lualatex.pdf \
	example/mu/sci-pdflatex.pdf example/mu/pharm-lualatex.pdf \
	example/mu/pharm-pdflatex.pdf
DEVEXAMPLES=locale/DESCRIPTION locale/EXAMPLE.dtx locale/EXAMPLE.ins \
	logo/EXAMPLE/DESCRIPTION logo/mu/DESCRIPTION \
	logo/DESCRIPTION style/EXAMPLE/DESCRIPTION style/mu/DESCRIPTION \
	style/DESCRIPTION example/EXAMPLE/DESCRIPTION example/mu/DESCRIPTION \
	example/DESCRIPTION
EXAMPLES=$(USEREXAMPLES) $(DEVEXAMPLES)
MISCELLANEOUS=example/mu/example.bib $(USEREXAMPLES:.pdf=.tex) \
	README.md
RESOURCES=$(STYLEFILES) $(LOGOS) $(LOCALES)
SOURCES=$(DTXFILES) $(INSFILES) LICENSE.tex VERSION.tex
AUXFILES=fithesis.aux fithesis.log fithesis.toc fithesis.ind \
	fithesis.idx fithesis.out fithesis.ilg fithesis.gls \
	fithesis.glo fithesis.hd fithesis.lot
MANUAL=fithesis.pdf
PDFSOURCES=fithesis.dtx
PDFS=$(MANUAL) $(USEREXAMPLES)
DOCS=$(MANUAL)
MAKEABLES=$(PDFS) $(CLASSFILES) $(VERSION)
TDSARCHIVE=fithesis.tds.zip
CTANARCHIVE=fithesis.ctan.zip
DISTARCHIVE=fithesis.zip
ARCHIVES=$(TDSARCHIVE) $(CTANARCHIVE) $(DISTARCHIVE)
LATEXFILES=$(CLASSFILES) $(RESOURCES)

TEXLIVEDIR=$(shell kpsewhich -var-value TEXMFLOCAL)

# This is the default pseudo-target.
all: base

# This pseudo-target expands all the docstrip files, converts the
# logos and creates the class files.
base: $(SUBMAKES_REQUIRED)
	make $(CLASSFILES)

# This pseudo-target creates the class files and typesets the
# technical documentation and the user examples.
complete: base
	make $(PDFS) clean

# This pseudo-target typesets the technical documentation.
docs:
	make $(DOCS) clean

# This pseudo-target calls a submakefile.
$(SUBMAKES):
	make -C $@ all

# This pseudo-target creates the distribution archive.
dist: dist-implode complete
	make $(TDSARCHIVE) $(DISTARCHIVE) $(CTANARCHIVE)

# This target creates the class files.
$(CLASSFILES): fithesis.ins fithesis.dtx
	xetex $<

# This target typesets the user examples.
$(USEREXAMPLES): $(CLASSFILES) $(RESOURCES)
	make -BC $(dir $@)

# This target typesets the technical documentation.
$(MANUAL): $(DTXFILES)
	pdflatex $<
	pdflatex $<
	makeindex -s gind.ist                       $(basename $@)
	makeindex -s gglo.ist -o $(basename $@).gls $(basename $@).glo
	pdflatex $<
	pdflatex $<

# This target generates a TeX directory structure file.
$(TDSARCHIVE):
	DIR=`mktemp -d` && \
	make install to="$$DIR" nohash=true && \
	(cd "$$DIR" && zip -r -v -nw $@ *) && \
	mv "$$DIR"/$@ $@ && rm -rf "$$DIR"

# This target generates a distribution file.
$(DISTARCHIVE): $(SOURCES) $(LATEXFILES) $(MAKES) \
	$(USEREXAMPLE_SOURCES) $(DOCS) $(PDFSOURCES) $(MISCELLANEOUS) \
	$(EXAMPLES)
	DIR=`mktemp -d` && \
	cp -v $(TDSARCHIVE) "$$DIR" && \
	tar c $^ | tar xvC "$$DIR" && \
	(cd "$$DIR" && zip -r -v -nw $@ *) && \
	mv "$$DIR"/$@ . && rm -rf "$$DIR"

# This target generates a CTAN distribution file.
$(CTANARCHIVE): $(LOGOS) $(SOURCES) $(DOCS) README.md
	DIR=`mktemp -d` && mkdir -p "$$DIR/fithesis" && \
	cp -v $(TDSARCHIVE) "$$DIR" && \
	tar c $^ | tar xvC "$$DIR/fithesis" && \
	(cd "$$DIR" && zip -r -v -nw $@ *) && \
	mv "$$DIR"/$@ . && rm -rf "$$DIR"

# This pseudo-target installs the class, locale, style, and logo
# files - as well as the technical documentation -
# into the TeX directory structure, whose root directory is
# specified within the "to" argument. Specify "nohash=true", if you
# wish to forgo the reindexing of the package database.
install: install-base install-docs

# This pseudo-target installs the class, locale, style, and logo
# files into the TeX directory structure, whose root directory is
# specified within the "to" argument. Specify "nohash=true", if you
# wish to forgo the reindexing of the package database.
install-base:
	@if [ -z "$(to)" ]; then \
		printf "Usage: make install-base to=DIRECTORY\n"; \
		printf "Detected TeXLive directory: %s\n" $(TEXLIVEDIR); \
		exit 1; \
	fi
	
	@# Class, locale, style and logo files
	mkdir -p "$(to)/tex/latex/fithesis"
	tar c $(LATEXFILES) | tar xvC "$(to)/tex/latex/fithesis"
	
	@# Source files
	mkdir -p "$(to)/source/latex/fithesis"
	tar c $(SOURCES) | tar xvC "$(to)/source/latex/fithesis"
	
	@# Rebuild the hash
	[ "$(nohash)" = "true" ] || texhash

# This pseudo-target installs the the technical and user
# documentation into the TeX directory structure, whose root
# directory is specified within the "to" argument. Specify
# "nohash=true", if you wish to forgo the reindexing of the package
# database.
install-docs:
	@if [ -z "$(to)" ]; then \
		printf "Usage: make install-docs to=DIRECTORY\n"; \
		printf "Detected TeXLive directory: %s\n" $(TEXLIVEDIR); \
		exit 1; \
	fi
	
	@# Documentation
	mkdir -p "$(to)/doc/latex/fithesis"
	tar c $(DOCS) README.md | tar xvC "$(to)/doc/latex/fithesis"

	@# Rebuild the hash
	[ "$(nohash)" = "true" ] || texhash


# This pseudo-target uninstalls the class, locale, style, and logo
# files - as well as the technical documentation -
# from the TeX directory structure, whose root directory is
# specified within the "from" argument. Specify "nohash=true", if
# you wish to forgo the reindexing of the package database.
uninstall:
	@if [ -z "$(from)" ]; then \
		printf "Usage: make uninstall from=DIRECTORY\n"; \
		printf "Detected TeXLive directory: %s\n" $(TEXLIVEDIR); \
		exit 1; \
	fi
	
	@# Class, locale, style and logo files
	rm -rf "$(from)/tex/latex/fithesis"
	
	@# Source files
	rm -rf "$(from)/source/latex/fithesis"
	
	@# Documentation
	rm -rf "$(from)/doc/latex/fithesis"
	
	@# Rebuild the hash
	[ "$(nohash)" = "true" ] || texhash

# This pseudo-target removes any existing auxiliary files.
clean:
	rm -f $(AUXFILES)

# This pseudo-target removes the distribution archives.
dist-implode:
	rm -f $(ARCHIVES)

# This pseudo-target removes any makeable files.
implode: clean dist-implode
	rm -f $(MAKEABLES)
	for dir in $(SUBMAKES); do make implode -C "$$dir"; done
