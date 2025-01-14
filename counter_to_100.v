// Couter to 100
module counter_to_100(
  input wire clk, d, reset,
  output wire [3:0] q0, q1,
  output wire c
);
  wire c0,c1;
  
counter_to_10 uut1(.clk(clk),.d(d),.reset(reset),.q(q0),.c(c0));
counter_to_10 uut2(.clk(c0),.d(d),.reset(reset),.q(q1),.c(c1));
  
  assign c=c0&c1;
endmodule
