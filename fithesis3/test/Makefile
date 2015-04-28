.PHONY: all clear
all: clear
	for file in *.tex; do \
		ln -s "$$file" current.tex && \
		pdflatex current && \
		pdflatex current && \
		rm current.*; \
	done

clear:
		rm -f current.*
