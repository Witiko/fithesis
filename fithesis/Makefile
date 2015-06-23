SUBMAKES_REQUIRED=logo/mu logo/mu/color locale style style/mu
SUBMAKES_MISCELLANEOUS=guide/mu
SUBMAKES=$(SUBMAKES_REQUIRED) $(SUBMAKES_MISCELLANEOUS)
.PHONY: all complete clean dist dist-implode implode install uninstall test $(SUBMAKES_REQUIRED)

CLASSFILES=fithesis.cls fithesis2.cls fithesis3.cls
STYLEFILES=style/*.sty style/*/*.sty style/*/*.clo
LOGOSOURCEFILES=logo/*/*.eps logo/*/color/*.eps
LOGOPDFFILES=logo/*/*.pdf logo/*/color/*.pdf
LOGOFILES=$(LOGOSOURCEFILES) $(LOGOPDFFILES)
LOCALEFILES=locale/*.def locale/*/*.def locale/*/*/*.def
DTXFILES=*.dtx locale/*.dtx style/*.dtx style/*/*.dtx
INSFILES=*.ins locale/*.ins style/*.ins style/*/*.ins
TESTFILES=test/*.tex
MAKES=Makefile */Makefile */*/Makefile */*/*/Makefile
READMES=README
EXAMPLES=../*.tex ../Makefile
MISCELLANEOUS=$(READMES) guide/*/*.tex guide/*/*/*.tex guide/*/*.bib
RESOURCES=$(STYLEFILES) $(LOGOFILES) $(LOCALEFILES)
SOURCEFILES=$(DTXFILES) $(INSFILES) docstrip.cfg
AUXFILES=fithesis.aux fithesis.log fithesis.toc fithesis.ind fithesis.idx fithesis.out fithesis.ilg fithesis.gls fithesis.glo fithesis.hd
MANUAL=fithesis.pdf
PDFSOURCES=fithesis.dtx
GUIDES=guide/mu/econ.pdf guide/mu/fi.pdf guide/mu/fsps.pdf guide/mu/fss.pdf guide/mu/law.pdf guide/mu/med.pdf guide/mu/ped.pdf guide/mu/phil.pdf guide/mu/sci.pdf
PDFFILES=$(MANUAL) $(GUIDES)
TDSFILE=fithesis.tds.zip
CTANFILE=fithesis.ctan.zip
DISTFILE=fithesis.zip
DISTFILES=$(TDSFILE) $(CTANFILE) $(DISTFILE)
LATEXFILES=$(CLASSFILES) $(RESOURCES)
TEXLIVEDIR=$(shell kpsewhich -var-value TEXMFLOCAL)

# This pseudo-target expands all the docstrip
# files, converts the logos and creates the
# class files.
all: $(SUBMAKES_REQUIRED)
	make $(CLASSFILES)

# This pseudo-target creates the class files
# and typesets the technical documentation and
# the guides.
complete: all
	make $(PDFFILES) clean

# This pseudo-target calls a submakefile
$(SUBMAKES_REQUIRED):
	make -C $@ all

# This pseudo-target performs the unit tests
test: all
	make -C test

# This pseudo-target creates the distribution archive.
dist: complete
	make $(TDSFILE) $(DISTFILE) $(CTANFILE)

# This target creates the class files.
$(CLASSFILES): fithesis.ins fithesis.dtx
	tex $<

# This target typesets the guide.
$(GUIDES): $(CLASSFILES) $(RESOURCES)
	make -BC $(dir $@)

# This target typesets the technical documentation.
fithesis.pdf: $(DTXFILES)
	pdflatex $<
	makeindex -s gind.ist fithesis
	makeindex -s gglo.ist -o fithesis.gls fithesis.glo
	pdflatex $<
	pdflatex $<

# This target generates a TeX directory structure file
$(TDSFILE): $(LATEXFILES) $(SOURCEFILES) $(PDFFILES) $(PDFSOURCES)
	DIR=`mktemp -d` && \
	make install to="$$DIR" nohash=true && \
	(cd "$$DIR" && zip -r -v -nw $@ *) && \
	mv "$$DIR"/$@ $@ && rm -rf "$$DIR"

# This target generates a distribution file
$(DISTFILE): $(LATEXFILES) $(SOURCEFILES) $(MAKES) $(TESTFILES) $(PDFFILES) $(PDFSOURCES) $(MISCELLANEOUS) $(EXAMPLES)
	DIR=`mktemp -d` && mkdir --parents "$$DIR/fithesis" && \
	cp --verbose $(TDSFILE) "$$DIR"/fithesis && \
	cp --parents --verbose $^ "$$DIR/fithesis" && \
	(cd "$$DIR" && zip -r -v -nw $@ *) && \
	mv "$$DIR"/$@ . && rm -rf "$$DIR"

# This target generates a CTAN distribution file
$(CTANFILE): $(SOURCEFILES) $(MAKES) $(TESTFILES) $(MISCELLANEOUS) $(LOGOSOURCEFILES) $(PDFFILES)
	DIR=`mktemp -d` && mkdir --parents "$$DIR/fithesis" && \
	cp --verbose $(TDSFILE) "$$DIR" && \
	cp --parents --verbose $^ "$$DIR/fithesis" && \
	(cd "$$DIR" && zip -r -v -nw $@ *) && \
	mv "$$DIR"/$@ . && rm -rf "$$DIR"

# This pseudo-target installs the class files and
# the technical documentation into the TeX directory
# structure, whose root directory is specified within
# the "to" argument. Specify "nohash=true", if you wish
# to forgo the reindexing of the package database.
install:
	@if [ -z "$(to)" ]; then \
		printf "Usage: make install to=DIRECTORY\nDetected TeXLive directory: %s\n" $(TEXLIVEDIR); \
		exit 1; \
	fi
	
	# Class, locale, style and logo files
	mkdir --parents "$(to)/tex/latex/fithesis"
	cp --parents --verbose $(LATEXFILES) "$(to)/tex/latex/fithesis"
	
	# Source files
	mkdir --parents "$(to)/source/latex/fithesis"
	cp --parents --verbose $(SOURCEFILES) "$(to)/source/latex/fithesis"
	
	# Documentation
	mkdir --parents "$(to)/doc/latex/fithesis"
	cp --verbose $(MANUAL) "$(to)/doc/latex/fithesis/manual.pdf"
	cp --parents --verbose $(GUIDES) "$(to)/doc/latex/fithesis"
	
	# Rebuild the hash
	[ "$(nohash)" = "true" ] || texhash

# This pseudo-target installs the class files and
# the technical documentation into the TeX directory
# structure, whose root directory is specified within
# the "to" argument. Specify "nohash=true", if you wish
# to forgo the reindexing of the package database.
uninstall:
	@if [ -z "$(from)" ]; then \
		printf "Usage: make uninstall from=DIRECTORY\nDetected TeXLive directory: %s\n" $(TEXLIVEDIR); \
		exit 1; \
	fi
	
	# Class, locale, style and logo files
	rm -rf "$(from)/tex/latex/fithesis"
	
	# Source files
	rm -rf "$(from)/source/latex/fithesis"
	
	# Documentation
	rm -rf "$(from)/doc/latex/fithesis"
	
	# Rebuild the hash
	[ "$(nohash)" = "true" ] || texhash

# This pseudo-target removes any existing auxiliary files.
clean:
	rm -f $(AUXFILES)

# This pseudo-target removes the distribution archives.
dist-implode:
	rm -f $(DISTFILES)

# This pseudo-target removes any makeable files.
implode: clean dist-implode
	rm -f $(PDFFILES) $(CLASSFILES)
	for dir in $(SUBMAKES); do make implode -C "$$dir"; done
