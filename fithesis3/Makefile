.PHONY: all clean dist dist-clean explode implode install uninstall test

SUBMAKEFILES=logo/mu logo/mu/color locale style style/mu
CLASSFILES=fithesis.cls fithesis2.cls fithesis3.cls
STYLEFILES=style/*.sty style/*/*.sty style/*/*.clo
LOGOFILES=logo/*/*.eps logo/*/color/*.eps logo/*/*.pdf logo/*/color/*.pdf
LOCALEFILES=locale/*.def locale/*/*.def locale/*/*/*.def
DTXFILES=*.dtx locale/*.dtx style/*.dtx style/*/*.dtx
INSFILES=*.ins locale/*.ins style/*.ins style/*/*.ins
MAKEFILES=Makefile */Makefile */*/Makefile */*/*/Makefile ../Makefile
READMES=../README
MISCELLANEOUS=$(READMES) ../example.tex
RESOURCES=$(STYLEFILES) $(LOGOFILES) $(LOCALEFILES)
SOURCEFILES=$(DTXFILES) $(INSFILES) docstrip.cfg
AUXFILES=fithesis.aux fithesis.log fithesis.toc fithesis.ind fithesis.idx fithesis.out fithesis.ilg fithesis.gls fithesis.glo fithesis.hd
MANUAL=fithesis.pdf
PDFSOURCES=fithesis.dtx
PDFFILES=$(MANUAL)
TDSFILE=fithesis3.tds.zip
DISTFILE=fithesis3.zip
LATEXFILES=$(CLASSFILES) $(RESOURCES)
TEXLIVEDIR=$(shell kpsewhich -var-value TEXMFLOCAL)

# This pseudo-target creates the class files, typesets the
# technical documentation, makes the style and locale files
# and removes any auxiliary files.
all:
	for dir in $(SUBMAKEFILES); do make all -C "$$dir"; done
	make explode clean

# This pseudo-target creates the class files and typesets
# the technical documentation.
explode: fithesis3.cls $(PDFFILES)

# This pseudo-target performs the unit tests
test: all
	cd test; make

# This pseudo-target creates the distribution archive.
dist: all
	make $(TDSFILE) $(DISTFILE)
	rm $(TDSFILE)

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

# This target generates a TeX directory structure file
$(TDSFILE): $(LATEXFILES) $(SOURCEFILES) $(PDFFILES) $(PDFSOURCES)
	DIR=`mktemp -d` && \
	make install to="$$DIR" nohash=true && \
  (cd "$$DIR" && zip -r -v -nw $@ *) && \
	mv "$$DIR"/$@ $@ && rm -rf "$$DIR"

# This target generates a distribution file
$(DISTFILE): $(LATEXFILES) $(SOURCEFILES) $(MAKEFILES) $(PDFFILES) $(PDFSOURCES) $(MISCELLANEOUS)
	DIR=`mktemp -d` && mkdir --parents "$$DIR/fithesis3/fithesis3" && \
	cp --verbose $(TDSFILE) "$$DIR" && \
	cp --parents --verbose $^ "$$DIR/fithesis3/fithesis3" && \
  (cd "$$DIR" && zip -r -v -nw $@ *) && \
	mv "$$DIR"/$@ $@ && rm -rf "$$DIR"

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
	mkdir --parents "$(to)/tex/latex/fithesis3"
	cp --parents --verbose $(LATEXFILES) "$(to)/tex/latex/fithesis3"
	
	# Source files
	mkdir --parents "$(to)/source/latex/fithesis3"
	cp --parents --verbose $(SOURCEFILES) "$(to)/source/latex/fithesis3"
	
	# Documentation
	mkdir --parents "$(to)/doc/latex/fithesis3"
	cp $(MANUAL) "$(to)/doc/latex/fithesis3/manual.pdf"

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
	rm -rf "$(from)/tex/latex/fithesis3"
	
	# Source files
	rm -rf "$(from)/source/latex/fithesis3"
	
	# Documentation
	rm "$(from)/doc/latex/fithesis3/manual.pdf"
	rmdir "$(from)/doc/latex/fithesis3/"

	# Rebuild the hash
	[ "$(nohash)" = "true" ] || texhash

# This pseudo-target removes any existing auxiliary files.
clean:
	rm -f $(AUXFILES)

# This pseudo-target removes the distribution archives.
dist-clean:
	rm -f $(DISTFILE)

# This pseudo-target removes any makeable files.
implode: clean dist-clean
	rm -f $(PDFFILES) $(CLASSFILES)
	for dir in $(SUBMAKEFILES); do make implode -C "$$dir"; done
