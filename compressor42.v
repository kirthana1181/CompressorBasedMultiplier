`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2025 09:18:52
// Design Name: 4-2 Compressor
// Module Name: compressor
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

module compressor(input x1,x2,x3,x4,cin, output s,cout,carry);
wire ws0,w1,w2;
xor xo0(ws0,x1,x2);
assign cout = mux(x1,x3,ws0);
xor xo1(w1,x3,x4);
xor xo2(w2,w1,ws0);
xor xo3(s,w2,cin);
assign carry = mux(x4,cin,w2);
function mux (input x0,x1,w0);
	begin
		case(w0)
            0: mux = x0;
            1: mux = x1;
        endcase
	end
endfunction
endmodule
