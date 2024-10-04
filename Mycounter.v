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
