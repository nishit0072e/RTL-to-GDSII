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
// SDW: readmemh function - comments in data file
//
//

module main ();

reg [7:0] array [0:7];
reg error ;
reg [3:0] count;

initial
  begin
    error = 0;
    $readmemh("ivltests/readmemh4.dat",array);

    for(count = 0; count <= 7; count = count + 1)
     begin
       if(array[count[2:0]] !== count)
          begin
             error = 1;
             $display("FAILED - array[count] == %h, s/b %h",
                       array[count],count);
          end
     end

    if(error == 0)
           $display("PASSED\n");
    $finish ;
  end
endmodule
