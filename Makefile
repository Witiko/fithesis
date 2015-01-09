all: fithesis.cls fithesis.pdf example.pdf
	cd loga && make all

fithesis.dtx: fithesis.raw.dtx
	./fithesis.raw.sh $< $@

fithesis.cls: fithesis.ins fithesis.dtx
	yes | tex $<

fithesis.pdf: fithesis.dtx
	pdflatex $<

example.pdf: example.tex fithesis.cls
	pdflatex $<
	pdflatex $<

clean:
	rm -f example.aux example.log example.out example.toc
	rm -f fithesis.toc fithesis.aux fithesis.idx fithesis.log

clean-all: clean
	rm -f example.pdf
	rm -f fit1[012].clo fithesis.cls fithesis.dtx fithesis.pdf
