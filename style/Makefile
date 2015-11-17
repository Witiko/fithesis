LOGS=base.log
OUTPUT=fithesis-base.sty
.PHONY: explode implode all

# These targets create all the locale files.
all: explode
explode: $(LOGS)

# This target creates the locale files from
# one DTX file.
%.log: %.ins %.dtx
	xetex $<

# This target removes all the locale files.
implode:
	rm -f $(OUTPUT) $(LOGS)
