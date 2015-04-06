LOGS=czech.log slovak.log english.log
DIRECTORIES=mu/law mu/fsps mu/fss mu/econ mu/med mu/fi mu/phil mu/ped mu/sci mu
OUTPUT=czech.tex slovak.tex english.tex mu/czech.tex mu/law/czech.tex mu/law/slovak.tex mu/law/english.tex mu/fsps/czech.tex mu/fsps/slovak.tex mu/fsps/english.tex mu/slovak.tex mu/english.tex mu/fss/czech.tex mu/fss/slovak.tex mu/fss/english.tex mu/econ/czech.tex mu/econ/slovak.tex mu/econ/english.tex mu/med/czech.tex mu/med/slovak.tex mu/med/english.tex mu/fi/czech.tex mu/fi/slovak.tex mu/fi/english.tex mu/phil/czech.tex mu/phil/slovak.tex mu/phil/english.tex mu/ped/czech.tex mu/ped/slovak.tex mu/ped/english.tex mu/sci/czech.tex mu/sci/slovak.tex mu/sci/english.tex

.PHONY: explode implode clean all
all:
	mkdir --parents $(DIRECTORIES)
	make explode clean

explode: $(LOGS)

%.log: %.ins %.dtx
	tex $<

implode:
	rm -f $(OUTPUT) $(LOGS)
	@-rmdir $(DIRECTORIES)
