all: typical.cfg typical-5120.cfg adaptation.cfg

ECU=8D0907551M
#ECU=4Z7907551R
#ECU=06A906032LP
#ECU= 8E0909518AK-0003

COMMON=my_$(ECU)_template.cfg gen-cfg Makefile ../ecus/my_$(ECU).ecu

typical.cfg: typical.lst $(COMMON)
adaptation.cfg: adaptation.lst $(COMMON)

$(ECU)_template.cfg: Makefile ../ecus/$(ECU).ecu
	../bin/ME7Info.exe -t ../images/$(ECU).bin

my_$(ECU)_template.cfg: Makefile $(ECU)_template.cfg
	sed 's/$(ECU).ecu/my_$(ECU).ecu/' < $(ECU)_template.cfg > $@

%.cfg: %.lst my_$(ECU)_template.cfg ../ecus/my_$(ECU).ecu
	./gen-cfg -t my_$(ECU)_template.cfg -e ../ecus/my_$(ECU).ecu $*.lst

typical-5120.cfg: typical.cfg
	sed -e 's/\([^[:space:]]\+\)\.ecu/\1-5120.ecu/' < $< > $@
