.PHONY: all clean implode

# This target runs all the unit tests.
all: implode
	for file in *.tex; do \
		ln -s "$$file" current.tex && \
		pdflatex current && pdflatex current && make clean && \
		xelatex  current && xelatex  current && make clean && \
		lualatex current && lualatex current && make implode; \
	done

# This target removes any auxiliary files.
clean: 
	rm -f *.aux *.log *.out *.lot *.lof *.toc

# This target removes any files created during the testing.
implode: clean
	rm -f texput.log current.*
