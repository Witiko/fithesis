.PHONY: all implode bootstrap all
FAKETIME=faketime '2000-01-01 01:01:01'
COMPARE=../comparepdf.sh
SOURCES=base-digital.tex base-printed.tex base-10pt.tex \
	base-11pt.tex base-12pt.tex econ-czech.tex econ-english.tex \
	econ-oldtable.tex econ-slovak.tex econ-table.tex fi-color.tex \
	fi-czech.tex fi-english.tex fi-czech-male.tex \
	fi-czech-female.tex fi-slovak-male.tex fi-slovak-female.tex \
	fi-oldtable.tex fi-rigorous.tex fi-slovak.tex fi-table.tex \
	fsps-czech.tex fsps-english.tex fsps-oldtable.tex \
	fsps-slovak.tex fsps-table.tex fss-czech.tex fss-english.tex \
	fss-oldtable.tex fss-slovak.tex fss-table.tex \
	fss-czech-male.tex fss-czech-female.tex \
	fss-slovak-male.tex fss-slovak-female.tex law-czech.tex \
	law-english.tex law-oldtable.tex law-slovak.tex law-table.tex \
	med-czech.tex med-english.tex med-oldtable.tex med-slovak.tex \
	med-table.tex ped-czech.tex ped-english.tex ped-oldtable.tex \
	ped-slovak.tex ped-table.tex phil-czech.tex phil-english.tex \
	phil-kisk-english.tex phil-kisk-czech.tex phil-kisk-slovak.tex \
	phil-oldtable.tex phil-slovak.tex phil-table.tex sci-color.tex \
	sci-czech.tex sci-czech-male.tex sci-czech-female.tex \
	sci-slovak-male.tex sci-slovak-female.tex sci-english.tex \
	sci-oldtable.tex sci-rigorous.tex sci-slovak.tex sci-table.tex \
	phil-kisk-czech-male.tex phil-kisk-czech-female.tex \
	phil-kisk-slovak-male.tex phil-kisk-slovak-female.tex \
	phil-czech-female.tex phil-czech-male.tex \
	phil-slovak-female.tex phil-slovak-male.tex \
	toc-01.tex toc-02.tex toc-03.tex toc-04.tex toc-05.tex \
	toc-06.tex toc-07.tex toc-08.tex toc-09.tex toc-10.tex \
	toc-11.tex toc-12.tex toc-13.tex toc-14.tex toc-15.tex \
	toc-16.tex toc-17.tex toc-18.tex toc-19.tex toc-20.tex \
	toc-21.tex toc-22.tex toc-23.tex toc-24.tex toc-25.tex \
	toc-26.tex toc-27.tex toc-28.tex $(BIB) \
	fi-digital-emptyassignment.tex fi-digital-noassignment.tex \
	fi-digital-someassignment.tex fi-printed-emptyassignment.tex \
	fi-printed-noassignment.tex \
	fi-printed-someassignment-oneside.tex \
	fi-printed-someassignment-twoside.tex \
	sci-digital-emptyassignment.tex sci-digital-noassignment.tex \
	sci-digital-someassignment-oneside.tex \
	sci-digital-someassignment-twoside.tex \
	sci-printed-emptyassignment.tex sci-printed-noassignment.tex \
	sci-printed-someassignment-oneside.tex \
	sci-printed-someassignment-twoside.tex fi-proposal
BIB_UNSOLICITED=econ-bibliography-unsolicited.tex \
	fi-bibliography-unsolicited.tex \
	fsps-bibliography-unsolicited.tex \
	fss-bibliography-unsolicited.tex \
	law-bibliography-unsolicited.tex \
	med-bibliography-unsolicited.tex \
	ped-bibliography-unsolicited.tex \
	phil-bibliography-unsolicited.tex \
	sci-bibliography-unsolicited.tex
BIB_SOLICITED=econ-bibliography-solicited.tex \
	fi-bibliography-solicited.tex \
	fsps-bibliography-solicited.tex \
	fss-bibliography-solicited.tex \
	law-bibliography-solicited.tex \
	med-bibliography-solicited.tex \
	ped-bibliography-solicited.tex \
	phil-bibliography-solicited.tex \
	sci-bibliography-solicited.tex
BIB=$(BIB_UNSOLICITED) $(BIB_SOLICITED)
TESTS=$(addsuffix -pdflatex.pdf,$(basename $(SOURCES))) \
	$(addsuffix -lualatex.pdf,$(basename $(SOURCES)))
PROTOTYPES=$(addprefix expected-,$(TESTS))

# This target typesets all the test documents,
# compares them with the prototypes, and cleans
# up afterwards.
all: $(TESTS) implode

# This target typesets all the prototypes.
bootstrap: $(PROTOTYPES) clean

# This target typesets a pdfLaTeX prototype.
expected-%-pdflatex.pdf: %.tex
	rm -f $@
	make $(basename $<)-pdflatex.pdf
	mv   $(basename $<)-pdflatex.pdf $@

# This target typesets a LuaLaTeX prototype.
expected-%-lualatex.pdf: %.tex
	rm -f $@
	make $(basename $<)-lualatex.pdf
	mv   $(basename $<)-lualatex.pdf $@

# This target typesets a pdfLaTeX test file and compares
# it against a prototype.
%-pdflatex.pdf: %.tex
	@# The first run.
	$(FAKETIME) pdflatex -jobname          $(basename $@) $<
	@# Prepare bibliography, if necessary.
	! [ -e $(basename $<)-pdflatex.bcf ] || \
		(biber  $(basename $<)-pdflatex.bcf && \
	$(FAKETIME) pdflatex -jobname          $(basename $@) $<)
	@# Prepare index, if necessary.
	! [ -e $(basename $<)-pdflatex.idx ] || \
		(texindy -I latex -C utf8 -L english \
		$(basename $<)-pdflatex.idx && \
	$(FAKETIME) pdflatex -jobname          $(basename $@) $<)
	@# The second run.
	$(FAKETIME) pdflatex -jobname          $(basename $@) $<
	@# Compare the result with the prototype.
	! [ -e expected-$@ ] || $(COMPARE) expected-$@ $@ || \
	{ [ "$(UPDATE_FAILED)" = true ] && mv $@ expected-$@; }

# This target typesets a LuaLaTeX test file and compares
# it against a prototype.
%-lualatex.pdf: %.tex
	@# The first run.
	$(FAKETIME) lualatex -jobname          $(basename $@) $<
	@# Prepare bibliography, if necessary.
	! [ -e $(basename $<)-lualatex.bcf ] || \
		(biber  $(basename $<)-lualatex.bcf && \
	$(FAKETIME) lualatex -jobname          $(basename $@) $<)
	@# Prepare index, if necessary.
	! [ -e $(basename $<)-lualatex.idx ] || \
		(texindy -I latex -C utf8 -L english \
		$(basename $<)-lualatex.idx && \
	$(FAKETIME) lualatex -jobname          $(basename $@) $<)
	@# The second run.
	$(FAKETIME) lualatex -jobname          $(basename $@) $<
	@# Compare the result with the prototype.
	! [ -e expected-$@ ] || $(COMPARE) expected-$@ $@ || \
	{ [ "$(UPDATE_FAILED)" = true ] && mv $@ expected-$@; }

# This target removes any auxiliary files.
clean:
	rm -f *.aux *.log *.out *.toc *.lot *.lof *.bcf *.blg *.run.xml \
		*.bbl *.idx *.ind *.ilg

# This target removes any auxiliary files and the output PDF files.
implode: clean
	rm -f $(TESTS)
