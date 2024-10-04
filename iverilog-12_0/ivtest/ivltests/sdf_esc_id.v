`timescale 1ns / 1ps

`celldefine

// Description : 2 input XOR

module XOR20 (input A, input B, output Q);

   xor   (Q,B,A);

   specify
      (A => Q) = (1,1);
      (B => Q) = (1,1);
   endspecify

endmodule

`endcelldefine

module tb;

   reg a, b;
   wire q;
   XOR20 \&dut[0] (.A(a), .B(b), .Q(q));

   initial begin
      $monitor($time,, "A=%b, B=%b, Q=%b", a, b, q);
      $sdf_annotate("ivltests/sdf_esc_id.sdf");

      #10 ;
      a = 1;
      b = 1;
      #10 ;
      b = 0;
      #10 $finish(0);
   end

endmodule // tb
