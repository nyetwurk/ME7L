ECU=8D0907551M
#ECU=006410010A0
#ECU=4Z7907551R
#ECU=06A906032LP
#ECU= 8E0909518AK-0003

all: $(ECU).ecu my_$(ECU)-5120.ecu

$(ECU).ecu: ../defs/me7_alias.map ../defs/me7_std.map
	../bin/ME7Info.exe -o $(ECU).ecu ../images/$(ECU).bin

torque_$(ECU).ecu extras_$(ECU).ecu:
	touch $@

my_$(ECU).ecu: Makefile $(ECU).ecu torque_$(ECU).ecu extras_$(ECU).ecu
	cat $(ECU).ecu torque_$(ECU).ecu extras_$(ECU).ecu | sed -e 's/ChargeLimitPID-I}       /BoostCorrectFactorPID-I}/g'> $@

my_$(ECU)-5120.ecu: Makefile my_$(ECU).ecu
	./5120.pl my_$(ECU).ecu > $@
