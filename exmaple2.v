module example2 (
  input wire a, b, c,
  output reg y
);
  reg t1;
  
  always @* begin
    t1 = a & b;
    y = t1 & c;
  end
endmodule

module tb_example;
  reg x1, x2, x3;
  reg d;
  wire testout;
  
  example2 uut (
    .a(x1),
    .b(x2),
    .c(x3),
    .y(testout)
  );
  
  initial begin
    x1 = 0; x2 = 0; x3 = 0;
    #200;
    x1 = 1; x2 = 1; x3 = 0;
    #200;
    x1 = 1; x2 = 0; x3 = 1;
    #200;
    x1 = 1; x2 = 1; x3 = 1;
    #200;
    $stop;
  end
endmodule