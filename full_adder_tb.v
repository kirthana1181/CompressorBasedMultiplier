module full_adder_tb();
wire s,cout;
reg a,b,cin;
full_adder dut(.a(a),.b(b),.cin(cin),.cout(cout),.s(s));
initial begin 
cin = 1'b0; a = 1'b0; b = 1'b0;
#10
cin = 1'b0; a = 1'b0; b = 1'b1;
#10
cin = 1'b0; a = 1'b1; b = 1'b0;
#10
cin = 1'b0; a = 1'b1; b = 1'b1;
#10

cin = 1'b1;a = 1'b0; b = 1'b0;
#10
cin = 1'b1; a = 1'b0; b = 1'b1;
#10
cin = 1'b1; a = 1'b1; b = 1'b0;
#10
cin = 1'b1; a = 1'b1; b = 1'b1;
#10
$stop;
end
endmodule