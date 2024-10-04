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
always #50 Clock =~Clock ;// clock period =100

// monitor the response and save it in a file

initial begin
$dumpfile ("count.vcd"); // specifies the VCD file
$dumpvars ; // dump all the variables
$monitor ("%d ,%b ,%b ,%d", $time , Clock , Reset , Count );
 end
endmodule
