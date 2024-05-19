
module test_encoder_8_3
(
input wire [7:0] r,
output reg [3:0] y
);
always @*
 casez(r)
  8'b0??????? : y=4'b1111;
  8'b10?????? : y=4'b1110;
  8'b110????? : y=4'b1101;
  8'b1110???? : y=4'b1100;
  8'b11110??? : y=4'b1011;
  8'b111110?? : y=4'b1010;
  8'b1111110? : y=4'b1001;
  8'b11111110 : y=4'b1000;
  8'b11111111 : y=4'b0000;
 endcase
endmodule	

module test_prio8to3testbench();
reg [7:0] a;
 wire [3:0] b;
test_encoder_8_3 uut(.r(a),.y(b));
initial
begin
 a = 8'b01001000;
 #200;
 a = 8'b10001000;
 #200;
 a = 8'b11001000;
 #200;
 a = 8'b11101000;
 #200;
 a = 8'b11111000;
 #200;
 $stop;
end
endmodule

