#ECU:=8D0907551L
ECU:=8D0907551M
#ECU:=06A906032LP
#ECU:=4Z7907551R
#ECU:= 8E0909518AK-0003
#ECU:= 8E0909518AK-0004

COMMON:=my_$(ECU)_template.cfg gen-cfg Makefile ../ecus/my_$(ECU).ecu

SYNCDIR:=~/BTSync/public/ME7L-ecu

all: adaptation.cfg my_$(ECU).cfg my_$(ECU)-5120.cfg
adaptation.cfg: adaptation.lst $(COMMON)

$(ECU)_template.cfg: Makefile ../ecus/$(ECU).ecu
	../bin/ME7Info.exe -t ../images/$(ECU).bin

my_$(ECU)_template.cfg: Makefile $(ECU)_template.cfg
	@echo Converting $(ECU)_template.cfg to $@
	@sed 's/$(ECU).ecu/my_$(ECU).ecu/' < $(ECU)_template.cfg > $@

%.cfg: typical.lst my_$(ECU)_template.cfg ../ecus/%.ecu
	./gen-cfg -t my_$(ECU)_template.cfg -e ../ecus/my_$(ECU).ecu typical.lst
	@cp typical.cfg $@
	@rsync -avP $@ $(SYNCDIR)/$(ECU)-$@

%-5120.cfg: %.cfg
	@echo Converting $< to $@
	@sed -e 's/\([^[:space:]]\+\)\.ecu/\1-5120.ecu/' < $< > $@
	@rsync -avP $@ $(SYNCDIR)/$(ECU)-$@
