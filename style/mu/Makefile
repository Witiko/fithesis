LOGS=base.log fi.log sci.log phil.log ped.log fss.log law.log econ.log med.log
OUTPUT=fithesis3-base.sty fithesis3-1[012].clo fithesis3-fi.sty fithesis3-sci.sty fithesis3-phil.sty fithesis3-ped.sty fithesis3-fss.sty fithesis3-law.sty fithesis3-econ.sty fithesis3-med.sty

.PHONY: explode implode all
all: explode

explode: $(LOGS)

%.log: %.ins %.dtx
	tex $<

implode:
	rm -f $(OUTPUT) $(LOGS)
