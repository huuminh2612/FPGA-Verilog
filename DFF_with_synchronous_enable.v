`timescale 1ns/10ps
module d_ff_en_reset(
input wire d,clk,en,reset,
output reg q
);
always @(posedge clk,posedge reset)
if(reset)
  q<=1'b0;
else if(en)
  q<=d;
endmodule

module d_ff_en_reset_tb();
reg d,reset,en,clk;
wire q;
d_ff_en_reset dut(.d(d),.en(en),.reset(reset),.clk(clk),.q(q));
initial begin
  clk=1'b0;
  forever #10 clk=~clk;
end
initial begin
  d=1'b0;
  en=1'b0;
  reset=1'b1;
  #100;
  d=1'b0;
  en=1'b1;
  reset=1'b0;
  #100;
  d=1'b1;
  en=1'b1;
  reset=1'b0;
  #100;
  d=1'b1;
  en=1'b1;
  reset=1'b0;
  #100;
  $stop;
end
endmodule
