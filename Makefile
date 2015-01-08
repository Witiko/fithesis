all: fithesis.cls fithesis.pdf example.pdf
	cd loga && make all

fithesis.cls: fithesis.ins fithesis.dtx
	yes | tex fithesis.ins

fithesis.pdf: fithesis.dtx
	pdfcslatex fithesis.dtx

example.pdf: example.tex fithesis.cls
	pdflatex example.tex

clean:
	rm -f example.aux example.log example.out example.pdf example.toc
	rm -f fithesis.toc fithesis.pdf fithesis.aux fithesis.idx fithesis.log

clean-all: clean
	rm -f fit1[012].clo fithesis.cls
