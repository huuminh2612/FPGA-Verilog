module encoder_4to_hight0(
   input wire [3:0] c,
   output reg [2:0] y
);
always @*
   casez(c)
	4'b1111: y=000;
	4'b0???: y=100;
	4'b10??: y=101;
	4'b110?: y=110;
	4'b1110: y=111;
    endcase
endmodule
// testbench
module testbench_encoder_4to_hight0;
    reg [3:0] a;
    wire [2:0] b;
encoder_4to_hight0 uut(.c(a),.y(b));
    initial
    begin
	 a=4'b1111;
	 #200;
	 a=4'b0001;
	 #200;
	 a=4'b0010;
	 #200;
	 a=4'b1000;
	 #200;
	 a=4'b1001;
	 #200;
	 a=4'b1100;
	 #200;
	 a=4'b1101;
	 #200;
	 a=4'b1110;
	 #200;
	 $stop;
     end
endmodule