`timescale 1ns/10ps
`include "counter_to_100.v"

module counter_to_100_tb;

  reg clk;
  reg reset;
  reg d;
  wire [3:0] q0,q1;
  wire c;
  localparam T=20;

  counter_to_100 uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q0(q0),
    .q1(q1),
    .c(c)
  );

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
    d = 1'b0;
    #(7*T);
    d=1'b1;
    #(9*T);
    d=1'b0;
    #(7*T);
    $stop;
  end

endmodule

