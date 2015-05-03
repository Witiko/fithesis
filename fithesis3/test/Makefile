.PHONY: all clean
all: clean
	for file in *.tex; do \
		ln -s "$$file" current.tex && \
		pdflatex current && \
		pdflatex current && \
		xelatex current && \
		xelatex current && \
		rm current.*; \
	done

clean:
		rm -f current.*
