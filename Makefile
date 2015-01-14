.PHONY: all clean clean-all

all: fithesis2.cls fithesis.pdf example.pdf clean
	cd loga && make all

fithesis.dtx: fithesis.raw.dtx
	./fithesis.raw.sh $< $@

fithesis2.cls: fithesis.ins fithesis.dtx
	yes | tex $<

fithesis.pdf: fithesis.dtx
	pdflatex $<

example.pdf: example.tex fithesis2.cls
	pdflatex $<
	pdflatex $<

clean:
	rm -f example.aux example.log example.out example.toc
	rm -f fithesis.toc fithesis.aux fithesis.idx fithesis.log

clean-all: clean
	rm -f example.pdf
	rm -f fit1[012].clo fithesis2.cls fithesis.dtx fithesis.pdf
