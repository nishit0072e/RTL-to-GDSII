# read modules from Verilog file
read_verilog Mycounter.v
# translate processes to netlists
proc
# remove unused cells and wires
clean
# show the generic netlist
show

#perform optimization
opt
#resource sharing optimization
share -aggressive


# show the generic netlist
show

# mapping to internal cell library
techmap
# mapping flip-flops to Nangate45_typ.lib 
dfflibmap -liberty Nangate45_typ.lib
# mapping logic to Nangate45_typ.lib 
abc -liberty Nangate45_typ.lib
# remove unused cells and wires
clean
#report design statistics
stat -liberty Nangate45_typ.lib

# Write the current design to a Verilog file
write_verilog -noattr -noexpr -nohex -nodec netlist_final_opt.v 
