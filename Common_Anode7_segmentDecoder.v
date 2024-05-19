module Common_Anode7_segment_Decoder
(
  input wire [3:0] x,
  output reg [6:0] y
);
  always @*
    case(x)
	4'b1010,4'b1011,4'b1100,4'b1101,4'b1110,4'b1111:
	  y=7'b1111111;
	4'b0000:
	  y=7'b0000001;
	4'b0001:
	  y=7'b1001111;
	4'b0010:
	  y=7'b0010010;
	4'b0011:
	  y=7'b0000110;
	4'b0100:
	  y=7'b1001100;
	4'b0101:
	  y=7'b0100100;
	4'b0110:
	  y=7'b0100000;
	4'b0111:
	  y=7'b0001111;
	4'b1000:
	  y=7'b0000000;
	4'b1001:
	  y=7'b0000100;
     endcase
endmodule

// mach led 7 doan
module tb_Common_Anode7_segment_Decoder;
  reg [3:0] a;
  wire [6:0] b;
  Common_Anode7_segment_Decoder uut(.x(a),.y(b));
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


	