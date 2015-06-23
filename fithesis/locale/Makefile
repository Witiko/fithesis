LOGS=czech.log slovak.log english.log
DIRECTORIES=mu/law mu/fsps mu/fss mu/econ mu/med mu/fi mu/phil mu/ped mu/sci mu
OUTPUT=czech.def mu/law/czech.def mu/law/slovak.def mu/law/english.def mu/czech.def mu/fsps/czech.def mu/fsps/slovak.def mu/fsps/english.def mu/fss/czech.def mu/fss/slovak.def mu/fss/english.def mu/econ/czech.def mu/econ/slovak.def mu/econ/english.def mu/med/czech.def mu/med/slovak.def mu/med/english.def mu/fi/czech.def mu/fi/slovak.def mu/fi/english.def mu/phil/czech.def mu/phil/slovak.def mu/phil/english.def mu/slovak.def mu/ped/czech.def mu/ped/slovak.def mu/ped/english.def mu/english.def mu/sci/czech.def mu/sci/slovak.def mu/sci/english.def slovak.def english.def

.PHONY: explode implode all
all:
	mkdir --parents $(DIRECTORIES)
	make explode

explode: $(LOGS)

%.log: %.ins %.dtx
	xetex $<

implode:
	rm -f $(OUTPUT) $(LOGS)
	-rmdir $(DIRECTORIES)
