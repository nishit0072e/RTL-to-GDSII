
module test_mux
   (input wire [1:0] D0, D1,
    input wire [1:0] S,
    output reg [1:0] Q);

   always @(*) begin
      if (S[1]==1'b0)
	case (S[0])
	  1'b0: Q = D0;
	  1'b1: Q = D1;
	endcase // case (S[0])
      else
	Q = 2'b0;
   end

endmodule // test_mux
