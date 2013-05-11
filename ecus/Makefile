ECU=8D0907551M

$(ECU).ecu: $(ECU)-dist.ecu torque.ecu extras.ecu
	cat $(ECU)-dist.ecu torque.ecu extras.ecu > $(ECU).ecu

$(ECU)-dist.ecu: ../defs/me7_alias.map ../defs/me7_std.map
	../bin/ME7Info.exe -o 8D0907551M-dist.ecu ../images/$(ECU).bin
