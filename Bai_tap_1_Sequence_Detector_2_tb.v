`timescale 1ns/10ps
`include "Bai_tap_1_Sequence_Detector_2.v"

module Bai_tap_1_Sequence_Detector_2_tb;

  reg w, clk, reset;
  wire z;
  localparam T = 20;
  Bai_tap_1_Sequence_Detector_2 uut.(.w(w), .z(z), .clk(clk),.reset(reset));
  
  // Clock
  always begin 
    clk = 1'b1;
    #(T/4);
    clk = 1'b0;
    #(T/4);
  end
  
  // Reset
  initial begin
    reset = 1'b1;
    #(T);
    #(T/2);
    reset = 1'b0;
  end
  
  // Stimulus
  initial begin
    #(T/2);
    w = 1;
    #(T/2);
    w = 0;    
    #(T/2);
    w = 0;
    #(T/2);
    w = 1;
    #(T/2);
    w = 1;
    #(T/2);
    w = 0;
    #(T/2);
    w = 1;
    #(T/2);
    w = 0;
    #(T/2);
    w = 0;
    #(T/2);
    w = 1;
    #(T/2);
    w = 1;
    #(T/2);
    w = 0;
    #(T/2);
    $stop;
  end
endmodule
