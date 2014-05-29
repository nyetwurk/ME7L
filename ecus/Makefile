ECU=8D0907551M

all: $(ECU).ecu my_$(ECU).ecu

$(ECU).ecu: ../defs/me7_alias.map ../defs/me7_std.map
	../bin/ME7Info.exe -o $(ECU).ecu ../images/$(ECU).bin

my_$(ECU).ecu: Makefile $(ECU).ecu torque_$(ECU).ecu extras_$(ECU).ecu
	cat $(ECU).ecu torque_$(ECU).ecu extras_$(ECU).ecu > $@
