module prio_encoder
(
input wire [3:0] r,
output reg [2:0] y
);
always @*
	casez(r)
	4'b1???: y= 3'b100;
	4'b01??: y= 3'b011;
	4'b001?: y= 3'b010;
	4'b001?: y= 3'b001;
	4'b0000: y= 3'b000;
	endcase
endmodule
module prio_testbench();
 reg [3:0] a;
 wire [2:0] testout;
 prio_encoder uut(.r(a),.y(testout));
 initial 
 begin
 	a=4'b1000;
	#200;
	a=4'b0100;
	#200;
	a=4'b0110;
	#200;
	a=4'b0010;
	#200;
	a=4'b0001;
	#200;
	a=4'b0000;
	#200;
	$stop;
 end
endmodule
