module counter_to_10 (
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


