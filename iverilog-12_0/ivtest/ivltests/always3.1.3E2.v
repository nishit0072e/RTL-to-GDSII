//
// Copyright (c) 1999 Steven Wilson (stevew@home.com)
//
//    This source code is free software; you can redistribute it
//    and/or modify it in source code form under the terms of the GNU
//    General Public License as published by the Free Software
//    Foundation; either version 2 of the License, or (at your option)
//    any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program; if not, write to the Free Software
//    Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
//
//  SDW - always force reg_lvalue = boolean_expr ;
//  D:    This is an infinite loop - thus compile only
//  SJW - rework from akways3.1.3E to make it runnable.

module main ;

reg [3:0] value1 ;

initial
  begin
    #15;
    if(value1 !== 4'b1)
      $display("FAILED - 3.1.3E always force reg_lvalue = boolean_expr;");
    else
      $display("PASSED");
     $finish;
  end

always #10 force value1 = 1'b1 & 1'b1 ;

endmodule
