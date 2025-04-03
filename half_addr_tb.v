module half_addr_tb();
reg tb_a,tb_b;
wire c,s;
half_addr dut(.a(tb_a),.b(tb_b),.c(c),.s(s));
initial begin
tb_a = 1'b0;tb_b = 1'b0;
#10
tb_a = 1'b0;tb_b = 1'b1;
#10
tb_a = 1'b1;tb_b = 1'b0;
#10
tb_a = 1'b1;tb_b = 1'b1;
#10
$stop;
end
endmodule
