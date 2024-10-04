read_liberty Nangate45_typ.lib
read_verilog synth_Mycounter.v
link_design Mycounter
read_sdc top.sdc
report_checks -path_delay max -format full
report_checks -path_delay min -format full
