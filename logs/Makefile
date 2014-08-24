all: typical.cfg adaptation.cfg

ECU=8D0907551M
#ECU=4Z7907551R
COMMON=my_$(ECU)_template.cfg gen-cfg Makefile

typical.cfg: typical.lst $(COMMON)
adaptation.cfg: adaptation.lst $(COMMON)

$(ECU)_template.cfg: Makefile ../ecus/$(ECU).ecu
	../bin/ME7Info.exe -t ../images/$(ECU).bin

my_$(ECU)_template.cfg: Makefile $(ECU)_template.cfg
	sed 's/$(ECU).ecu/my_$(ECU).ecu/' < $(ECU)_template.cfg > $@

%.cfg: %.lst
	./gen-cfg -t my_$(ECU)_template.cfg -e ../ecus/my_$(ECU).ecu $*.lst
