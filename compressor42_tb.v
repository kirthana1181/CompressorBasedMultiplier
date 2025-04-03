`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2025 14:03:24
// Design Name: 
// Module Name: compressor_tb
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


module compressor_tb();
wire s_tb,cout_tb;
reg x1_tb,x2_tb,x3_tb,x4_tb,cin_tb;
compressor dut(.x1(x1_tb),.x2(x2_tb),.x3(x3_tb),.x4(x4_tb),.cin(cin_tb),.s(s_tb),.cout(cout_tb));
initial begin
x1_tb = 1; x2_tb = 1; x3_tb = 1; x4_tb = 0; cin_tb = 0;
#10 x1_tb = 0; x2_tb = 0; x3_tb = 0; x4_tb = 1; cin_tb = 1;
#10 x1_tb = 0; x2_tb = 1; x3_tb = 1; x4_tb = 0; cin_tb = 0;
$stop;
end
endmodule
