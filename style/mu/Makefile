LOGS=base.log fi.log sci.log
OUTPUT=fithesis3-base.sty fithesis3-1[012].clo fithesis3-fi.sty fithesis3-sci.sty

.PHONY: explode implode all
all: explode

explode: $(LOGS)

%.log: %.ins %.dtx
	tex $<

implode:
	rm -f $(OUTPUT) $(LOGS)
