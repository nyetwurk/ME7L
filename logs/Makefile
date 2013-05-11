all: typical.cfg adaptation.cfg

ECU=8D0907551M
COMMON=$(ECU)_template.cfg gen-cfg Makefile

typical.cfg: typical.lst $(COMMON)
adaptation.cfg: adaptation.lst $(COMMON)

$(ECU)_template.cfg: ../ecus/$(ECU).ecu
	../bin/ME7Info.exe -t ../images/$(ECU).bin

%.cfg: %.lst
	./gen-cfg -t $(ECU)_template.cfg $*.lst
