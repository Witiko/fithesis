.PHONY: all
all:
	rm -f current.tex
	for file in *.tex; do \
		ln -s "$$file" current.tex && \
		pdflatex current && \
		pdflatex current && \
		rm current.*; \
	done
