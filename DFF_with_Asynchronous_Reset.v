module d_ff_reset(
input wire d,
input wire clk,
input wire reset,
output reg q
);
always @(posedge clk,posedge reset)
  if(reset)
    q<=1'b0;
  else
    q<=d;
endmodule
module d_ff_reset_tb();
reg d,clk,reset;
wire q;
d_ff_reset dut(.d(d),.clk(clk),.reset(reset),.q(q));
initial
begin
  clk=1'b0;
  forever #10 clk=~clk;
end
initial begin
  d=1'b0;
  reset=1'b1;
  #100;
  d=1'b1;
  reset=1'b0;
  #100;
  d=1'b0;
  reset=1'b0;
  #100;
  d=1'b1;
  reset=1'b1;
  #100;
  $stop;
end
endmodule