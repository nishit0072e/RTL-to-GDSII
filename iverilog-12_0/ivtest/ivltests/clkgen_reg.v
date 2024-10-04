/*
 * Author: Oswaldo Cadenas <oswaldo.cadenas@gmail.com>
 *
 * The test checks the module reg ouput type accepts default
 * initialization value. If no default value is given to reg output
 * type then this test fails.
 */

module clkgen(output reg clk = 0);

initial begin
   #100;
   disable checking;
   disable gen;
   $display ("PASSED");
   $finish;
end

initial begin
  fork
    gen;
    checking;
  join
end

task gen;
   forever #10 clk = ~clk;
endtask

task checking;
   forever begin
      #1;
      if (clk === 1'bx ) begin
         $display ("FAILED!");
	     $finish;
      end
   end
endtask

endmodule
