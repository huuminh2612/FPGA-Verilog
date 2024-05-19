module decoder_2_4_case(
input wire [1:0] a,
input wire en,
output reg[3:0] y
);
always @*
	case({en,a})
		3'b000, 3'b001, 3'b010, 3'b011: y= 4'b0000;
		3'b100: y=4'b0001;
		3'b101: y=4'b0010;
		3'b110: y=4'b0100;
		3'b111: y=4'b1000;
	endcase
endmodule
module testbench();
reg [1:0] test_in;
reg enl;
wire [3:0] test_out;
decoder_2_4_case uut(.a(test_in),.en(enl),.y(test_out));
initial
	begin
		enl=0; test_in=2'b00;
		#200;
		enl=1; test_in=2'b00;
		#200;
		enl=1; test_in=2'b10;
		#200;
		enl=1; test_in=2'b01;
		#200;
		enl=1; test_in=2'b11;
		#200;
		enl=0; test_in=2'b01;
		#200;
		$stop;
	end
endmodule



