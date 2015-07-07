.PHONY: all implode
all: implode
	for file in *.tex; do \
		ln -s "$$file" current.tex && \
		pdflatex current && pdflatex current && \
		xelatex current && xelatex current && \
		lualatex current && lualatex current && \
		rm current.*; \
	done

implode:
		rm -f current.* texput.log
