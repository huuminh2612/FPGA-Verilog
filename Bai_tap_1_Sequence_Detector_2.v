
module Bai_tap_1_Sequence_Detector_2(
  input wire w, clk, reset,
  output reg z
);
  localparam [2:0] a = 3'b000, //00
                   b = 3'b001, // 01
                   c = 3'b010, // 10
                   d = 3'b011, // 11
                   e = 3'b100; // 100

  reg [2:0] state_reg, state_next;

  // State register
  always @(posedge clk or posedge reset) begin
    if (reset)
      state_reg <= a;
    else
      state_reg <= state_next;
  end

  // Next state logic
  always @(state_reg or w) begin
    case(state_reg)
      a: begin
        z=1'b0;
        if (w)
          state_next = b;
        else
          state_next = a;
      end
      b: begin
        z=1'b0;
        if (w)
          state_next = b;
        else
          state_next = c;
      end
      c: begin
        z=1'b0;
        if (w)
          state_next = e;
        else
          state_next = d;
      end
      d: begin
        z=1'b0;
        if (w)
          state_next = e;
        else
          state_next = a;
      end
      e: begin
        z=1'b1;
        if(w)
          state_next = b;
        else
          state_next = c;
      end
    endcase
    case (state_reg)
      e: z = 1'b1;
      default: z = 1'b0;
    endcase

  end
 //more out
  //assign z = (state_reg == e);
endmodule
//testbench
`timescale 1ns/10ps
module Bai_tap_1_Sequence_Detector_2_tb;

  reg w, clk, reset;
  wire z;
  localparam T = 20;
  Bai_tap_1_Sequence_Detector_2 uut(.w(w), .z(z), .clk(clk),.reset(reset));
  
  // Clock
  always begin 
    clk = 1'b1;
    #(T/2);
    clk = 1'b0;
    #(T/2);
  end
  
  // Reset
  initial begin
    reset = 1'b1;
    #(T); // ?? dài xung reset là 20 ns
    reset = 1'b0;
    #(T);
  end
  // Stimulus
  initial begin
   #(T/2); // Delay ban ??u tr??c khi b?t ??u g?i tín hi?u w
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
    w = 1;
   #(T/2);
    w = 1;
   #(T/2);
    $stop;
  end
endmodule