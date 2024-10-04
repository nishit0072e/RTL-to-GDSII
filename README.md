# RTL-to-GDSII flow

```
  title:
  RTL-GDSII flow Using OpenROAD
   ____________________________________________________
  |  ->Synthesis                                       |
  |      : Inputs  [RTL, SDC, .lib, .lef]              |
  |      : Logic Synthesis  (Yosys)                    |
  |      : Output files  [Netlist, SDC]                |
  |  ->Floorplan                                       |
  |      : Floorplan Initialization                    |
  |      : IO placement  (random)                      |
  |      : Timing-driven mixed-size placement          |
  |      : Macro placement                             |
  |      : Tapcell and welltie insertion               |
  |      : PDN generation                              |
  |  ->Placement                                       |
  |      : Global placement without placed IOs         |
  |      : IO placement  (optimized)                   |
  |      : Global placement with placed IOs            |
  |      : Resizing and buffering                      |
  |      : Detailed placement                          |
  |  ->CTS : Clock Tree Synthesis                      |
  |      : Timing optimization                         |
  |      : Filler cell insertion                       |
  |  ->Routing                                         |
  |      : Global Routing                              |
  |      : Detailed Routing                            |
  |  ->Finishing                                       |
  |      : Metal Fill insertion                        |
  |      : Signoff timing report                       |
  |      : Generate GDSII  (KLayout)                   |
  |      : DRC/LVS check (KLayout)                     |
  |____________________________________________________|
```

```
sudo apt-get update
sudo apt - get update
sudo apt - get install gperf
sudo apt - get install autoconf
sudo apt - get install gcc g ++
sudo apt - get install flex
sudo apt - get install bison
```
# installation of Icarus Verilog 
```
wget https://github.com/steveicarus/iverilog/archive/refs/tags/v12_0.tar.gz

tar -xvzf v12_0.tar.gz

cd iverilog-12_0
sh autoconf.sh
./configure

sudo make
sudo make install
```
test the installation: 
write 'iverilog' in terminal and press enter
successful installation should show this output:
    iverilog: no source files and would suggest -c , -y etc.

# installation of gtkwave
```
sudo apt install gtkwave
```
we will see how the signals are plotted using an example in gtkwave.

# installation of COVERED Verilog Code Coverage Analyzer
```
sudo apt update
sudo apt-get install zlib1g-dev
git clone https://git.savannah.gnu.org/git/libiconv.git

sudo apt-get install tcl8.6
sudo apt-get install tcl8.6-dev
sudo apt-get install tk8.6
sudo apt-get install tk8.6-dev
sudo apt-get install doxygen

git clone https://github.com/chiphackers/covered
cd covered
./configure
sudo make
sudo make install
```
if ‘Tcl Interp′ has no member named ‘result′ error occurred:
```
cd covered
cd src
gedit report.c
```
In the report.c file you will see a list of #include commands. Find #include <tcl.h> and
add the following command '#define USE_INTERP_RESULT 1' before #include <tcl.h>.

Your report will look like this:
```
#ifdef HAVE TCLTK
#define USE_INTERP_RESULT 1
#include <tcl.h>
```
Save the report.c file.
Run the make command again and proceed with the installation process as shown above.

# test
source verilog code:
```

// 4 bit synchronous counter
module Mycounter (CLK, RST , OUT );
 input CLK, RST;
 output [3:0] OUT ;
 reg [3:0] OUT;

 always @( posedge CLK )
 begin
 if (RST == 1'b1 )
    OUT <= 4'b0000 ;
 else
    OUT <=OUT+1;
 end
endmodule
```

Testbench verilog code:
```

// Testbench for a 4 bit synchronous counter
module Testbench ();
reg Clock , Reset ;
wire [3:0] Count ;

// instantiate the DUV and make connections
Mycounter I1(.CLK ( Clock ),. RST ( Reset ),.OUT( Count ) );

// initialize the Testbench
initial begin
$display (" Starting simulation ...");
Clock = 1'b0 ;
Reset = 1'b1 ; // reset the counter at t=0
# 100 Reset = 1'b0 ; // remove reset at t=100
# 2000 Reset = 1'b1 ; // remove reset at t= 2100
# 400 $finish ; // end the simulation after t= 2500
end

// generate stimulus (in this case clock signal )
always #50 Clock =∼Clock ;// clock period =100

// monitor the response and save it in a file

initial begin
$dumpfile ("count.vcd"); // specifies the VCD file
$dumpvars ; // dump all the variables
$monitor ("%d ,%b ,%b ,%d", $time , Clock , Reset , Count );
 end
endmodule
```
# Simulation and viewing the output waveform

• Launch the Linux distribution and make a directory
$ mkdir icarus_codes

where icarus codes is the name of the directory.

• Change directory to icarus codes. For simulation, you require a Verilog code for the
implemented functionality and a test bench in .v format. Include those in the working
directory. Let’s say my verilog code is named ```Mycounter.v``` and the Testbench is ```Testbench.v```. To simulate:
```
$ iverilog -o Mycounter Mycounter.v Testbench.v
$ vvp Mycounter
```
A dump file, which I have named as count.vcd in the test bench, is created, and you can
see the output on the terminal as well. You can also view the output in the GTKWave

```$ gtkwave count.vcd```
This command launches the GTKWave analyzer application. In the left panel, expand
the Testbench and click on the subfolder. It will expand to show input Clock, Reset and
output waveform OUT[3:0]. Drag those to the Signals panel and analyze the results.

# Generate the code coverage report
To estimate the percentage of RTL design tested by the test bench, COVERED Verilog Code
Coverage Analyzer tool is used.
• Generate the code coverage report in the same directory i.e., icarus codes by executing
the following command
```
$ covered score -t Testbench -v Testbench.v -v Mycounter.v -vcd count.vcd -o Mycounter.cdd
```
• To view the coverage report, execute
```
$ covered report -d v Mycounter.cdd
```
The coverage report is displayed in the terminal.

if encountered any error called "segmentation fault"
try this:
```
sudo apt-get install gedit
```
open the generated vcd file in gedit, find the line "$comment Show the parameter values. $end" and delete it.

save the vcd file then agin run the flow, it should work now.

# install dependencies for yosys synthesys tool
```
sudo apt-get install -y build-essential clang bison flex libreadline-dev gawk tcl-dev libffi-dev git graphviz xdot pkg-config python3 libboost-system-dev libboost-python-dev libboost-filesystem-dev zlib1g-dev
```

# install yosys
```
git clone https://github.com/YosysHQ/yosys.git
git submodule update --init
cd yosys
sudo make 
sudo make install
```
after install try invoking yosys like: ```./yosys```
The tool launches, and the command prompt changes to
```yosys>```

# Using yosys to synthsize design 

Here i have given the library file named ```Nangate45_typ.lib```

to synthesize any verilog source file using yosys this library file must be included in the tcl automation script.

make a file named ```yosys_commands.tcl``` and put this lines into the file and save.
```
#Read modules from verilog
read_verilog counter.v

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
``` 
This TCL script should be run, after yosys is invoked. This will automate the synthesize process and write the synthesized netlist from the source verilog file

# Steps to perform the logic synthesis & optimization
Launch the yosys tool
```$ yosys```
I am using a yosys_commands.tcl file.
```yosys> script yosys_commands.tcl```

similarly run the given ```not_opt.tcl``` and ```opt.tcl``` scripts for viewing the non-optimized block diagram and optimized block diagrams respectively in graphviz(xdot) window
 
# installation OpenSTA tool for timing and power analysis
```
sudo apt-get update
sudo apt-get install build-essential tcl-dev tk-dev cmake git

git clone https://github.com/The-OpenROAD-Project/OpenSTA.git
cd OpenSTA
mkdir build
cd build
cmake ..
```
If error comes like ```Cmake error at CMakelists.txt``` then move to home directory using "cd" command and install
 ```
 sudo apt-get install libeigen3-dev
 ```
again move to the build directory in OpenSTA and Configure the build by executing the
following command:
```
cmake ..
```
If again any CMake error then again move to home directory and install cudd.
```
git clone https://github.com/ivmai/cudd.git
sudo apt-get install automake
sudo apt-get install autoconf m4 perl

cd cudd
autoreconf -i
mkdir build
cd build
../configure --prefix=$HOME/cudd
sudo make
sudo make install

```
Now cudd is installed successfully.
Now move to opensta directory
```
cd OpenSTA
cd build
cmake .. -DUSE_CUDD=ON -DCUDD_DIR=$HOME/cudd
sudo make
sudo make install 
```

Now invoke opensta from the terminal by simply type "sta" and press enter it changed the prompt to 
```
sta [~/working_directory]

or, 
it will be shown like 

%
```

# using opensta for timing and power analysis
after successful installation of opensta run the ```time.tcl``` to analyse the timing of inputs and outputs. After that run ```power.tcl``` to analyse the power dissipation by the designed circuit

# installation of OpenROAD tool for Generation of final GDS 
