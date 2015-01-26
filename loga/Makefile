.PHONY: all

all: eco-logo.pdf fsps-logo.pdf law-logo.pdf med-logo.pdf ped-logo.pdf phil-logo.pdf sci-logo.pdf fi-logo.pdf fss-logo.pdf
	cd color; make all

%.pdf: %.eps
	epstopdf $<
