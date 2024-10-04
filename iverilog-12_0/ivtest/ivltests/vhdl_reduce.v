// Copyright (c) 2015 CERN
// Maciej Suminski <maciej.suminski@cern.ch>
//
// This source code is free software; you can redistribute it
// and/or modify it in source code form under the terms of the GNU
// General Public License as published by the Free Software
// Foundation; either version 2 of the License, or (at your option)
// any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA


// Test for or_reduce/and_reduce functions.

module vhdl_reduce_test;
logic [4:0] inp;
logic and_reduced, or_reduced;

vhdl_reduce test(inp, and_reduced, or_reduced);

initial begin
    inp = 5'b00000;
    #1 if(and_reduced !== 1'b0 || or_reduced !== 1'b0) begin
        $display("FAILED 1");
        $finish();
    end

    inp = 5'b00010;
    #1 if(and_reduced !== 1'b0 || or_reduced !== 1'b1) begin
        $display("FAILED 2");
        $finish();
    end

    inp = 5'b11111;
    #1 if(and_reduced !== 1'b1 || or_reduced !== 1'b1) begin
        $display("FAILED 3");
        $finish();
    end

    inp = 5'bzz1xx;
    #1 if(and_reduced !== 1'bx || or_reduced !== 1'b1) begin
        $display(and_reduced);
        $display(or_reduced);
        $display("FAILED 4");
        $finish();
    end

    inp = 5'bzz0xx;
    #1 if(and_reduced !== 1'b0 || or_reduced !== 1'bx) begin
        $display(and_reduced);
        $display(or_reduced);
        $display("FAILED 5");
        $finish();
    end

    inp = 5'bzzzxx;
    #1 if(and_reduced !== 1'bx || or_reduced !== 1'bx) begin
        $display(and_reduced);
        $display(or_reduced);
        $display("FAILED 6");
        $finish();
    end

    $display("PASSED");
end
endmodule
