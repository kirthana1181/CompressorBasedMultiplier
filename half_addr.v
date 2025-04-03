module half_addr(a,b,s,c);
input a,b;
output s,c;
xor x1(s,a,b);
and a1(c,a,b);
/*assign s = a ^ b;
assign c = a & b;*/
endmodule