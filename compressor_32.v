`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2025 13:12:50
// Design Name: 3-2 Compressor
// Module Name: Compressor_full_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module three_to_two_comp(input a,b,cin, output s,c);

wire w0,w1;
xor xo1(w0,a,b);
xor xo2(s,w0,cin);
assign c = mux(a,b,w0);

function mux (input x0,x1,ws0);
	begin
		case(ws0)
            0: mux = x0;
            1: mux = x1;
        endcase
	end
endfunction
endmodule
