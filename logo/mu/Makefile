PDFFILES=fithesis-econ.pdf fithesis-fsps.pdf fithesis-law.pdf \
	fithesis-med.pdf fithesis-ped.pdf fithesis-phil.pdf \
	fithesis-sci.pdf fithesis-fi.pdf fithesis-fss.pdf \
	fithesis-base.pdf fithesis-econ-color.pdf \
	fithesis-fsps-color.pdf fithesis-law-color.pdf \
	fithesis-med-color.pdf fithesis-ped-color.pdf \
	fithesis-phil-color.pdf fithesis-sci-color.pdf \
	fithesis-fi-color.pdf fithesis-fss-color.pdf \
	fithesis-base-color.pdf
.PHONY: all implode

# This target converts all the EPS logos to PDF.
all: $(PDFFILES)

# This target converts a single EPS logo to PDF.
%.pdf: %.eps
	epstopdf $<

# This target removes all PDF logos.
implode:
	rm -f $(PDFFILES)
