module fourbit_4to2to1_mux
(
input wire [3:0] a,b,c,d,
input wire s1,s2,
output reg [3:0] e
);
always @*
	if (s1==1'b0 & s2==1'b0)
	e=a;
	else if(s1==1'b0 & s2==1'b1)
	e=c;
	else if(s1==1'b1 & s2==1'b0)
	e=b;
	else if(s1==1'b0 & s2==1'b1)
	e=d;
endmodule
module tb_fourbit_4to2to1_mux;
   reg [3:0] x,y,z,t;
   reg f1,f2;
   wire [3:0] testout;
   fourbit_4to2to1_mux uut(.a(x),.b(y),.c(z),.d(t),.s1(f1),.s2(f2),.e(testout));
   initial 
   begin
	x=4'b0000;y=4'b0001;z=4'b0010;t=4'b0011;
	f1=1'b0;f2=1'b0;
	#200;
	x=4'b0100;y=4'b0101;z=4'b0110;t=4'b0111;
	f1=1'b0;f2=1'b1;
	#200;
	x=4'b1000;y=4'b1001;z=4'b1010;t=4'b1011;
	f1=1'b1;f2=1'b0;
	#200;
	x=4'b1100;y=4'b1101;z=4'b1110;t=4'b1111;
	f1=1'b1;f2=1'b1;
	#200;
	$stop;
    end
endmodule
