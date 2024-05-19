//tb
`timescale 1ns/10ps
`include "counter_to_10.v"
module counter_to_10_tb();
  reg clk,reset,d;
  wire [3:0] q;
  wire c;
  localparam T=20;
    //design under test
  counter_to_10 uut(.clk(clk),.reset(reset),.d(d),.q(q),.c(c));
  //clock
  always 
  begin
    clk=1'b1;
    #(T/4);
    clk=1'b0;
    #(T/4);
  end
  
  ////reset
  initial 
  begin
    reset=1'b1;
    #(T/2);
    reset=1'b0;
  end
  
  initial 
  begin
    d = 1'b1;
    #(3*T);
    d=1'b0;
    #(4*T);
    d=1'b1;
    #(5*T);
    d=1'b0;
    #(2*T);
    $stop;
  end
  
endmodule