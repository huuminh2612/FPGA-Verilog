module mux21_4 (
  input wire [3:0] a,
  input wire [3:0] b,
  input en,
  output reg [3:0] c
);
assign c = (en == 0) ? a : b;
endmodule
module tb_mux4bit_2to1;
  reg [3:0] x, y;
  reg enl;
  wire [3:0] z;
  mux21_4 uut (.a(x), .b(y), .en(enl), .c(z));
  
  initial
  begin
    x = 4'b0000;
    y = 4'b0011;
    enl = 1'b0;
    #200;
    x = 4'b0110;
    y = 4'b1011;
    enl = 1'b0;
    #200;
    x = 4'b1001;
    y = 4'b1001;
    enl = 1'b1;
    #200;
    x = 4'b1011;
    y = 4'b1111;
    enl = 1'b1;
    #200;
    x = 4'b1111;
    y = 4'b0000;
    enl = 1'b1;
    #200;
    $stop;
  end
endmodule

