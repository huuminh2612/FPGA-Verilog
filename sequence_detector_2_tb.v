//testbench
`timescale 1ns/ 10ps
`include "sequence_detector_2.v"
module sequence_detector_2_tb;

  reg w, clk, reset;
  wire z;
  localparam T = 20;
  sequence_detector_2 uut(.w(w), .z(z), .clk(clk),.reset(reset));

  always
  begin 
  clk = 1'b1;
  #(T/4);
  clk = 1'b0;
  #(T/4);
  end

  initial
  begin
     reset = 1'b1;
     #(T); 
     reset = 1'b0;
   end

  initial
  begin 
    w =1'b0;
    #(T/2); w =1'b1; 
    #(T/2); w =1'b1;
    #(T/2); w =1'b0;
    #(T/2); w =1'b0;
    #(T/2); w =1'b1;

    #(T/2); w =1'b1;
    #(T/2); w =1'b0;
    #(T/2); w =1'b1;

    #(T/2); w =1'b0;
    #(T/2); w =1'b0;
    #(T/2); w =1'b1;


    #(T/2); w =1'b0;
    #(T/2); w =1'b1;
    #(T/2); w =1'b0;

    #(T/2); w =1'b0;
    #(T/2); w =1'b0;
    #(T/2); w =1'b1;
    #(T/2); w =1'b0;
    #(T/2); w =1'b0;
    #(T/2); w ='b1;
    #(T*4); $stop;
  end 
endmodule
