LOGS=base.log
OUTPUT=base.sty

.PHONY: explode implode all
all: explode

explode: $(LOGS)

%.log: %.ins %.dtx
	tex $<

implode:
	rm -f $(OUTPUT) $(LOGS)
