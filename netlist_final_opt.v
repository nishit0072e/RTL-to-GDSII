/* Generated by Yosys 0.45+148 (git sha1 1bf908dea, g++ 9.4.0-1ubuntu1~20.04.2 -fPIC -O3) */

module Mycounter(CLK, RST, OUT);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  input CLK;
  wire CLK;
  output [3:0] OUT;
  wire [3:0] OUT;
  input RST;
  wire RST;
  INV_X1 _13_ (
    .A(RST),
    .ZN(_04_)
  );
  AND3_X1 _14_ (
    .A1(OUT[2]),
    .A2(OUT[1]),
    .A3(OUT[0]),
    .ZN(_05_)
  );
  AOI21_X1 _15_ (
    .A(OUT[2]),
    .B1(OUT[1]),
    .B2(OUT[0]),
    .ZN(_06_)
  );
  NOR3_X1 _16_ (
    .A1(RST),
    .A2(_05_),
    .A3(_06_),
    .ZN(_00_)
  );
  OAI21_X1 _17_ (
    .A(_04_),
    .B1(OUT[0]),
    .B2(OUT[1]),
    .ZN(_07_)
  );
  AOI21_X1 _18_ (
    .A(_07_),
    .B1(OUT[0]),
    .B2(OUT[1]),
    .ZN(_01_)
  );
  NOR2_X1 _19_ (
    .A1(OUT[0]),
    .A2(RST),
    .ZN(_02_)
  );
  OAI21_X1 _20_ (
    .A(_04_),
    .B1(_05_),
    .B2(OUT[3]),
    .ZN(_08_)
  );
  AOI21_X1 _21_ (
    .A(_08_),
    .B1(_05_),
    .B2(OUT[3]),
    .ZN(_03_)
  );
  DFF_X1 _22_ (
    .CK(CLK),
    .D(_02_),
    .Q(OUT[0]),
    .QN(_10_)
  );
  DFF_X1 _23_ (
    .CK(CLK),
    .D(_01_),
    .Q(OUT[1]),
    .QN(_11_)
  );
  DFF_X1 _24_ (
    .CK(CLK),
    .D(_00_),
    .Q(OUT[2]),
    .QN(_12_)
  );
  DFF_X1 _25_ (
    .CK(CLK),
    .D(_03_),
    .Q(OUT[3]),
    .QN(_09_)
  );
endmodule