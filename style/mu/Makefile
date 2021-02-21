LOGS=base.log fi.log sci.log phil.log ped.log fss.log law.log \
	econ.log med.log fsps.log
OUTPUT=fithesis-mu-base.sty fithesis-mu-1[012].clo fithesis-mu-fi.sty \
	fithesis-mu-sci.sty fithesis-mu-phil.sty fithesis-mu-ped.sty \
	fithesis-mu-fss.sty fithesis-mu-law.sty fithesis-mu-econ.sty \
	fithesis-mu-med.sty fithesis-mu-fsps.sty

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
