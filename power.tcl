read_liberty Nangate45_typ.lib
read_verilog synth_Mycounter.v
link_design Mycounter
read_sdc top.sdc
set_power_activity -global -activity 0.1

report_power
