// led 7 doan katot chung (antot thi doi 0 vs 1)
module Katot7_segmentDecoder (
  input wire [3:0] x,
  output reg [6:0] seg
);
  always @*
     case(x)
	4'b0000: seg = 7'b1111110; //0
	4'b0001: seg = 7'b0110000; //1
	4'b0010: seg = 7'b1101101; //2
	4'b0011: seg = 7'b1111001; //3
	4'b0100: seg = 7'b0110011; //4
	4'b0101: seg = 7'b1011011; //5
	4'b0110: seg = 7'b1011111; //6
	4'b0111: seg = 7'b1110000; //7
	4'b1000: seg = 7'b1111111; //8
	4'b1001: seg = 7'b1111011; //9
	4'b1010: seg = 7'b1110111; //a
	4'b1011: seg = 7'b0011111; //b
	4'b1100: seg = 7'b1001110; //c
	4'b1101: seg = 7'b0111101; //d
	4'b1110: seg = 7'b1001111; //e
	4'b1111: seg = 7'b1000111; //f
     endcase
endmodule
//testbench led 7 doan katot
module tetsbench_Katot7_segmentDecoder;
   reg [3:0] a;
   wire [6:0] b;
  Katot7_segmentDecoder uut(.x(a),.seg(b));
    initial
    begin
	a=4'b0000;
	#200;
	a=4'b0001;
	#200;
	a=4'b0010;
	#200;
	a=4'b0011;
	#200;
	a=4'b0100;
	#200;
	a=4'b0101;
	#200;
	a=4'b0110;
	#200;
	a=4'b0111;
	#200;
	a=4'b1000;
	#200;
	a=4'b1001;
	#200;
	a=4'b1010;
	#200;
	a=4'b1011;
	#200;
	a=4'b1100;
	#200;
	a=4'b1101;
	#200;
	a=4'b1110;
	#200;
	a=4'b1111;
	#200;
	$stop;
    end
endmodule
