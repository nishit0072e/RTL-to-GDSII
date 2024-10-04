module ornor7(output wire O_OR, output wire O_NOR,
	      input wire I0, I1, I2, I3, I4, I5, I6);

   assign O_OR  =  | {I0, I1, I2, I3, I4, I5, I6};
   assign O_NOR = ~| {I0, I1, I2, I3, I4, I5, I6};

endmodule
