`timescale 1ns/ 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Kirthana P. Rao & Nathanya A
// 
// Create Date: 29.03.2025 22:08:42
// Design Name: 
// Module Name: eight_bit_mul
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

module eight_bit_mul(input wire [7:0]a,input wire [7:0]b, output [15:0]mult);
wire [16:0]carry;
//wire a,b;
wire p1[7:0][7:0] ; //array
wire [23:0]s;
wire [36:0]c;

genvar i, j;
generate
    for (i = 0; i < 8; i = i + 1)
      begin : row_gen
        for (j = 0; j < 8; j = j + 1)
          begin : col_gen
            assign p1[7-i][j] = a[j] & b[i];
          end
    end
endgenerate

assign mult[0] = p1[0][0];

//stage 1

half_addr ha1(p1[4][7], p1[6][3], s[7], c[7]);
compressor co1(p1[7][5], p1[6][4], p1[5][3], p1[4][2], c[7], s[0], c[0],carry[0]);
compressor co2(p1[7][6], p1[6][5], p1[5][4], p1[4][3], c[0], s[1], c[1],carry[1]);
compressor co3(p1[7][7], p1[6][6], p1[5][5], p1[4][4], c[1], s[2], c[2],carry[2]);
compressor co4(p1[3][3], p1[2][2], p1[1][1], p1[0][0], c[2], s[3], c[3],carry[3]);
compressor co5(p1[6][7], p1[5][6], p1[4][5], p1[3][4], c[3], s[4], c[4],carry[4]);
compressor co6(p1[5][7], p1[4][6], p1[3][5], p1[2][4], c[4], s[5], c[5],carry[5]);
compressor co7(p1[7][4], p1[3][6], p1[2][5], p1[1][4], c[5], s[6], c[6],carry[6]);

half_addr ha2(p1[3][2], p1[2][1], s[8], c[8]);
half_addr ha3(p1[3][7], p1[2][6], s[9], c[9]);
half_addr ha4(p1[1][3], p1[0][2], s[10], c[10]);
full_adder fa1(p1[2][3], p1[1][2], p1[0][1], s[11], c[11]);

//stage 2

half_addr ha5(p1[7][2], p1[6][1], s[12], c[12]); //,p1[5][0]
compressor co8(p1[7][3], p1[6][2] ,p1[5][1], p1[4][0],c[12], s[13],c[13], carry[7]);
compressor co9(s[7], p1[5][2], p1[4][1], p1[3][0], c[13], s[14],c[14],carry[8]);
compressor co10(c[7], s[0], p1[3][1], p1[2][0], c[14] , s[15],c[15],carry[9]);
compressor co11(s[1], s[8], c[0], p1[1][0], carry[0], s[16],c[16],carry[10]);
compressor co12(s[3], s[2], c[1], c[8], carry[1], s[17], c[17],carry[11]);
compressor co13(s[4], s[11], c[2]^c[3], carry[2],carry[3] ,s[18],c[18],carry[12]);
compressor co14(s[5], s[10], c[4], c[11], carry[4] ,s[19],c[19],carry[13]);
compressor co15(s[6], c[5], c[10], p1[0][3], carry[5] ,s[20],c[20],carry[14]);
compressor co16(s[9], c[6], p1[1][5], p1[0][4], carry[6] ,s[21],c[21],carry[15]);
compressor c017(c[9], p1[2][7], p1[1][6], p1[0][5], 0 ,s[22],c[22],carry[16]);
half_addr ha6(p1[1][7], p1[0][6], s[23], c[23]);

//stage 3

half_addr ha7(p1[7][1],p1[6][0],mult[1],c[24]);
full_adder fa2(s[12],p1[5][0],c[24], mult[2],c[25]);
full_adder fa3(s[13],c[12], c[25], mult[3],c[26]);
full_adder fa4(s[14],c[13], c[26]^carry[7], mult[4],c[27]);
full_adder fa5(s[15],c[14], c[27]^carry[8], mult[5],c[28]);
full_adder fa6(s[16],c[15], c[28]^carry[9], mult[6],c[29]);
full_adder fa7(s[17],c[16], c[29]^carry[10], mult[7],c[30]);
full_adder fa8(s[18],c[17], c[30]^carry[11], mult[8],c[31]);
full_adder fa9(s[19],c[18], c[31]^carry[12], mult[9],c[32]);
full_adder fa10(s[20],c[19],c[32]^carry[13], mult[10],c[33]);
full_adder fa11(s[21],c[20],c[33]^carry[14], mult[11],c[34]);
full_adder fa12(s[22],c[21],c[34]^carry[15], mult[12],c[35]);
full_adder fa13(s[23],c[22],c[35]^carry[16], mult[13],c[36]);
three_to_two_comp co014(c[23],p1[0][7],c[36], mult[14],mult[15]);

endmodule
