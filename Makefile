.PHONY: all clean clean-all install

CLASSFILES=fit1[012].clo fithesis.cls fithesis[23].cls
AUXFILES=example.aux example.log example.out example.toc example.lot example.lof fithesis.aux fithesis.log fithesis.toc fithesis.ind fithesis.idx fithesis.out fithesis.ilg
PDFFILES=fithesis.pdf example.pdf
LOGOFILES=loga/eco-logo.pdf loga/fi-logo.pdf loga/fsps-logo.pdf loga/law-logo.pdf loga/med-logo.pdf loga/ped-logo.pdf loga/phil-logo.pdf loga/sci-logo.pdf loga/color/eco-logo.pdf loga/color/fi-logo.pdf loga/color/fsps-logo.pdf loga/color/law-logo.pdf loga/color/med-logo.pdf loga/color/ped-logo.pdf loga/color/phil-logo.pdf loga/color/sci-logo.pdf loga/eco-logo.eps loga/fi-logo.eps loga/fsps-logo.eps loga/law-logo.eps loga/med-logo.eps loga/ped-logo.eps loga/phil-logo.eps loga/sci-logo.eps loga/color/eco-logo.eps loga/color/fi-logo.eps loga/color/fsps-logo.eps loga/color/law-logo.eps loga/color/med-logo.eps loga/color/ped-logo.eps loga/color/phil-logo.eps loga/color/sci-logo.eps
SOURCEFILE=fithesis.dtx
INSTALLFILES=$(CLASSFILES) $(LOGOFILES) $(PDFFILES) $(SOURCEFILE)

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
	makeindex fithesis
	pdflatex $<

# This target typesets the example.
example.pdf: example.tex fithesis3.cls
	pdflatex $<
	pdflatex $<

# This pseudo-target installs any non-auxiliary files
# into the directory provided as the "to" argument.
install: all
	if [ -z "$(to)" ]; then echo "Usage: make to=DIRECTORY install"; exit 1; fi
	mkdir --parents "$(to)"
	cp --parents --verbose $(INSTALLFILES) "$(to)"

# This pseudo-target removes any existing auxiliary files.
clean:
	rm -f $(AUXFILES)

# This pseudo-target removes any non-makeable files.
clean-all: clean
	rm -f $(PDFFILES) $(CLASSFILES) $(SOURCEFILE) 
