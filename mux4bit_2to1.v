//code module
module mux4bit_2to1(
  input wire [3:0] a,b,
  input wire en,
  output reg [3:0] c
);
assign c = (en == 0) ? a : b;
endmodule 
//code testbench
module testbench_mux4bit_2to1;
   reg [3:0] x,y;
   reg s;
   wire [3:0] z;
mux4bit_2to1 uut(.a(x),.b(y),.en(s),.c(z));
   initial 
   begin
	x=4'b0000; y=4'b0001;
	s=1'b0;
	#200;
	x=4'b0010; y=4'b0011;
	s=1'b0;
	#200;	
	x=4'b0100; y=4'b0101;
	s=1'b1;
	#200;
	x=4'b0000; y=4'b1111;
	s=1'b0;
	#200;
	$stop;
    end
endmodule