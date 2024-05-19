module DFF_with_asynchronous_reset(
   input wire clk,reset,d,
   output reg q
);
always @(posedge clk, posedge reset)
    if (reset)
	q <= 1'b0;
     else 
	q <= d;
endmodule
//test bench
`timescale 1ns / 1ps
module tb_DFF_with_asynchronous_reset;
  reg clk, rst_n;
  reg d;
  wire q;
  
  DFF_with_asynchronous_reset uut(.clk(clk),.reset(rst_n),.d(d), .q(q));
  
  always #2 clk = ~clk;
  initial begin
    clk = 0; rst_n = 0;
    d = 0;
    
    #3 rst_n = 1;
    
    repeat(6) begin
      d = $urandom_range(0, 1);
      #3;
    end
    rst_n = 0; #3;
    rst_n = 1;
    repeat(6) begin
      d = $urandom_range(0, 1);
      #3;
    end
    $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
endmodule
   
