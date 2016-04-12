.PHONY: all implode bootstrap
FAKETIME=faketime '2000-01-01 01:01:01'
COMPARE=../comparepdf.sh
EXAMPLEDIR=../../../example/mu
PROTOTYPES=expected-econ-lualatex.pdf expected-fss-pdflatex.pdf \
	expected-phil-lualatex.pdf expected-econ-pdflatex.pdf \
	expected-law-lualatex.pdf expected-phil-pdflatex.pdf \
	expected-fi-lualatex.pdf expected-law-pdflatex.pdf \
	expected-sci-lualatex.pdf expected-fi-pdflatex.pdf \
	expected-med-lualatex.pdf expected-sci-pdflatex.pdf \
	expected-fsps-lualatex.pdf expected-med-pdflatex.pdf \
	expected-fsps-pdflatex.pdf expected-ped-lualatex.pdf \
	expected-fss-lualatex.pdf expected-ped-pdflatex.pdf

# This target typesets all the test documents and
# compares them with the prototypes.
all:
	make -C $(EXAMPLEDIR) implode
	$(FAKETIME) make -C $(EXAMPLEDIR) all
	for PROTOTYPE in $(PROTOTYPES); do \
		$(COMPARE) "$$PROTOTYPE" $(EXAMPLEDIR)/"$${PROTOTYPE##expected-}" || \
		{ [ "$(UPDATE_FAILED)" = true ] && \
			mv $(EXAMPLEDIR)/"$${PROTOTYPE##expected-}" "$$PROTOTYPE"; } || exit 1; \
	done
	make -C $(EXAMPLEDIR) implode

# This target typesets all the prototypes.
bootstrap:
	make -C $(EXAMPLEDIR) implode
	$(FAKETIME) make -C $(EXAMPLEDIR) all
	make $(PROTOTYPES)
	make -C $(EXAMPLEDIR) implode

# This target copies a single typeset prototype.
expected-%.pdf: $(EXAMPLEDIR)/%.pdf
	cp $< $@

# This is a dummy target.
implode:
	
