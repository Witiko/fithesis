LOGS=czech.log slovak.log english.log
DIRECTORIES=mu/law mu/fsps mu/fss mu/econ mu/med mu/fi mu/phil \
	mu/ped mu/sci mu
OUTPUT=fithesis-czech.def mu/law/fithesis-czech.def \
	mu/law/fithesis-slovak.def mu/law/fithesis-english.def \
	mu/fithesis-czech.def mu/fsps/fithesis-czech.def \
	mu/fsps/fithesis-slovak.def mu/fsps/fithesis-english.def \
	mu/fss/fithesis-czech.def mu/fss/fithesis-slovak.def \
	mu/fss/fithesis-english.def mu/econ/fithesis-czech.def \
	mu/econ/fithesis-slovak.def mu/econ/fithesis-english.def \
	mu/med/fithesis-czech.def mu/med/fithesis-slovak.def \
	mu/med/fithesis-english.def mu/fi/fithesis-czech.def \
	mu/fi/fithesis-slovak.def mu/fi/fithesis-english.def \
	mu/phil/fithesis-czech.def mu/phil/fithesis-slovak.def \
	mu/phil/fithesis-english.def mu/fithesis-slovak.def \
	mu/ped/fithesis-czech.def mu/ped/fithesis-slovak.def \
	mu/ped/fithesis-english.def mu/fithesis-english.def \
	mu/sci/fithesis-czech.def mu/sci/fithesis-slovak.def \
	mu/sci/fithesis-english.def fithesis-slovak.def \
	fithesis-english.def

.PHONY: explode implode all

# This target creates the locale file directory
# structure and creates the locale files.
all:
	mkdir -p $(DIRECTORIES)
	make explode

# This target creates all locale files.
explode: $(LOGS)

# This target creates the locale files from one
# DTX file.
%.log: %.ins %.dtx
	xetex $<

# This target tears down the locale file directory
# structure along with the locale files.
implode:
	rm -f $(OUTPUT) $(LOGS)
	-rmdir $(DIRECTORIES)
