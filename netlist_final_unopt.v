/* Generated by Yosys 0.45+148 (git sha1 1bf908dea, g++ 9.4.0-1ubuntu1~20.04.2 -fPIC -O3) */

module Mycounter(CLK, RST, OUT);
  wire [3:0] _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  input CLK;
  wire CLK;
  output [3:0] OUT;
  wire [3:0] OUT;
  input RST;
  wire RST;
  INV_X1 _10_ (
    .A(RST),
    .ZN(_01_)
  );
  AND3_X1 _11_ (
    .A1(OUT[2]),
    .A2(OUT[1]),
    .A3(OUT[0]),
    .ZN(_02_)
  );
  AOI21_X1 _12_ (
    .A(OUT[2]),
    .B1(OUT[1]),
    .B2(OUT[0]),
    .ZN(_03_)
  );
  NOR3_X1 _13_ (
    .A1(RST),
    .A2(_02_),
    .A3(_03_),
    .ZN(_00_[2])
  );
  OAI21_X1 _14_ (
    .A(_01_),
    .B1(OUT[0]),
    .B2(OUT[1]),
    .ZN(_04_)
  );
  AOI21_X1 _15_ (
    .A(_04_),
    .B1(OUT[0]),
    .B2(OUT[1]),
    .ZN(_00_[1])
  );
  NOR2_X1 _16_ (
    .A1(OUT[0]),
    .A2(RST),
    .ZN(_00_[0])
  );
  OAI21_X1 _17_ (
    .A(_01_),
    .B1(_02_),
    .B2(OUT[3]),
    .ZN(_05_)
  );
  AOI21_X1 _18_ (
    .A(_05_),
    .B1(_02_),
    .B2(OUT[3]),
    .ZN(_00_[3])
  );
  DFF_X1 _19_ (
    .CK(CLK),
    .D(_00_[0]),
    .Q(OUT[0]),
    .QN(_09_)
  );
  DFF_X1 _20_ (
    .CK(CLK),
    .D(_00_[1]),
    .Q(OUT[1]),
    .QN(_08_)
  );
  DFF_X1 _21_ (
    .CK(CLK),
    .D(_00_[2]),
    .Q(OUT[2]),
    .QN(_07_)
  );
  DFF_X1 _22_ (
    .CK(CLK),
    .D(_00_[3]),
    .Q(OUT[3]),
    .QN(_06_)
  );
endmodule