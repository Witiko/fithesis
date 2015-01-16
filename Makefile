.PHONY: all clean clean-all

all: fithesis3.cls fithesis.pdf example.pdf clean
	cd loga && make all

fithesis.dtx: fithesis.raw.dtx
	./fithesis.raw.sh $< $@

fithesis3.cls: fithesis.ins fithesis.dtx
	yes | tex $<

fithesis.pdf: fithesis.dtx
	pdflatex $<
	makeindex fithesis
	pdflatex $<

example.pdf: example.tex fithesis3.cls
	pdflatex $<
	pdflatex $<

clean:
	rm -f example.aux example.log example.out example.toc example.lot example.lof
	rm -f fithesis.aux fithesis.log fithesis.toc fithesis.ind fithesis.idx fithesis.out fithesis.ilg

clean-all: clean
	rm -f example.pdf
	rm -f fit1[012].clo fithesis.cls fithesis[23] fithesis.dtx fithesis.pdf
