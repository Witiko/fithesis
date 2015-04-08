LOGS=base.log fi.log
OUTPUT=base.sty fit1[012].clo fi.sty

.PHONY: explode implode all
all: explode

explode: $(LOGS)

%.log: %.ins %.dtx
	tex $<

implode:
	rm -f $(OUTPUT) $(LOGS)
