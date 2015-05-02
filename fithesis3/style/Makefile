LOGS=base.log
OUTPUT=fithesis3-base.sty

.PHONY: explode implode all
all: explode

explode: $(LOGS)

%.log: %.ins %.dtx
	xetex $<

implode:
	rm -f $(OUTPUT) $(LOGS)
