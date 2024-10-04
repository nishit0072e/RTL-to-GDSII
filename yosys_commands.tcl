#Read modules from verilog
read_verilog Mycounter.v

#Elaborate design hierarchy
hierarchy −check −top Mycounter

#Translate Processes to netlist
proc

#mapping to the internal cell library
techmap

#mapping flip-flops to Nangate45_typ.lib
dfflibmap −liberty Nangate45_typ.lib

#mapping logic to Nangate45_typ.lib
abc -liberty Nangate45_typ.lib

#remove unused cells
clean

#write the synthesized design in a verilog file
write_verilog −noattr synth_Mycounter.v