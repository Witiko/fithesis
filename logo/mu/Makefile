FACULTIES=base econ fi fsps fss law med ped pharm phil sci
LANGUAGES=czech slovak english
SUFFIXES=-color.pdf .pdf
PDFFILES=$(foreach SUFFIX,$(SUFFIXES),$(foreach FACULTY,$(FACULTIES),fithesis-$(FACULTY)$(SUFFIX) $(foreach LANGUAGE,$(LANGUAGES),fithesis-$(FACULTY)-$(LANGUAGE)$(SUFFIX))))
.PHONY: all implode

# This target converts all the EPS logos to PDF.
all: $(PDFFILES)

# This target converts a single EPS logo to PDF.
%.pdf: %.eps
	epstopdf $<

# This target removes all PDF logos.
implode:
	rm -f $(PDFFILES)
