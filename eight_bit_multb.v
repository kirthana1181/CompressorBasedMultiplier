`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Kirthana P. Rao & Nathanya A
// 
// Create Date: 01.04.2025 14:06:34
// Design Name: 
// Module Name: eight_bit_multb
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


module eight_bit_multb();
wire [15:0]mult_tb;
//wire [7:0]p1_tb[7:0];
reg [7:0]a_tb,b_tb;

eight_bit_mul dut(.a(a_tb),.b(b_tb),.mult(mult_tb));
initial begin
a_tb = 8'b10101010; b_tb = 8'b11110000; #10
$stop;
end
endmodule
