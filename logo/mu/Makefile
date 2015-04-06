PDFFILES=econ.pdf fsps.pdf law.pdf med.pdf ped.pdf phil.pdf sci.pdf fi.pdf fss.pdf
.PHONY: all implode

all: $(PDFFILES)

%.pdf: %.eps
	epstopdf $<

implode:
	rm -f $(PDFFILES)