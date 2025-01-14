//code
module test_counter_to_10 (
  input clk, reset, d,
  output reg [3:0] q,
  output reg c
);

  always @(posedge clk, posedge reset) begin
    if (reset) begin
      q <= 4'b0000;
      c <= 1'b0;
    end
    else begin
      if (d) begin // Count down
        if (q == 4'b0000) begin
          q <= 4'b1001;
          c <= 1'b1;
        end
        else begin
          q <= q - 1;
          c <= 1'b0;
        end
      end
      else begin // Count up
        if (q == 4'b1001) begin
          q <= 4'b0000;
          c <= 1'b1;
        end
        else begin
          q <= q + 1;
          c <= 1'b0;
        end
      end
    end
  end
endmodule
// Couter to 100
module counter_to_100(
  input wire clk, d, reset,
  output wire [3:0] q0, q1,
  output wire c
);
  wire c0_reg,c1_reg;
  
  test_counter_to_10 uut1(.clk(clk),.d(d),.reset(reset),.q(q0),.c(c0_reg));
  test_counter_to_10 uut2(.clk(c0_reg),.d(d),.reset(reset),.q(q1),.c(c1_reg));
  
  assign c=c0_reg&c1_reg;
endmodule


