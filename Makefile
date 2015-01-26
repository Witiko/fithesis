.PHONY: all clean clean-all install

CLASSFILES=fit1[012].clo fithesis.cls fithesis[23].cls
AUXFILES=example.aux example.log example.out example.toc example.lot example.lof fithesis.aux fithesis.log fithesis.toc fithesis.ind fithesis.idx fithesis.out fithesis.ilg fithesis.gls fithesis.glo
PDFFILES=fithesis.pdf example.pdf
LOGOFILES=loga/phil-logo.eps loga/med-logo.pdf loga/fi-logo.pdf loga/ped-logo.pdf loga/med-logo.eps loga/sci-logo.eps loga/fsps-logo.pdf loga/fss-logo.pdf loga/color/phil-logo.eps loga/color/examples.pdf loga/color/med-logo.pdf loga/color/fi-logo.pdf loga/color/ped-logo.pdf loga/color/med-logo.eps loga/color/sci-logo.eps loga/color/fsps-logo.pdf loga/color/fss-logo.pdf loga/color/fsps-logo.eps loga/color/law-logo.eps loga/color/ped-logo.eps loga/color/sci-logo.pdf loga/color/law-logo.pdf loga/color/fi-logo.eps loga/color/fss-logo.eps loga/color/eco-logo.eps loga/color/eco-logo.pdf loga/color/phil-logo.pdf loga/fsps-logo.eps loga/law-logo.eps loga/ped-logo.eps loga/sci-logo.pdf loga/law-logo.pdf loga/fi-logo.eps loga/fss-logo.eps loga/eco-logo.eps loga/eco-logo.pdf loga/phil-logo.pdf
SOURCEFILE=fithesis.dtx
OTHERFILES=csquot.sty example.tex fithesis.ins Makefile
INSTALLFILES=$(CLASSFILES) $(LOGOFILES) $(PDFFILES) $(SOURCEFILE) $(OTHERFILES)

# This pseudo-target creates the class files, typesets both
# the example file and the technical documentation and
# removes any auxiliary files.
all: fithesis3.cls $(PDFFILES) clean
	cd loga && make all

# This target preprocesses the `fithesis.raw.dtx` file into
# the `fithesis.dtx` source file.
$(SOURCEFILE): fithesis.raw.dtx
	./fithesis.raw.sh $< $@

# This target creates the class files.
fithesis3.cls: fithesis.ins fithesis.dtx
	yes | tex $<

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
# into the directory provided as the "to" argument.
install:
	@if [ -z "$(to)" ]; then echo "Usage: make to=DIRECTORY install"; exit 1; fi
	mkdir --parents "$(to)/fithesis3"
	cp --parents --verbose $(INSTALLFILES) "$(to)/fithesis3"

# This pseudo-target removes any existing auxiliary files.
clean:
	rm -f $(AUXFILES)

# This pseudo-target removes any non-makeable files.
clean-all: clean
	rm -f $(PDFFILES) $(CLASSFILES) $(SOURCEFILE) 
