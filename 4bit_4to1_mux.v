module four_bit_4to1_mux
(
input wire [3:0] a,b,c,d,
input wire [1:0] x,
output reg [3:0] e
);
always @*
  if (x==2'b00)
	e=a;
  else if(x==2'b01)
	e=b;
  else if (x==2'b10)
	e=c;
  else if (x==2'b11)
	e=d;
endmodule
module tb_4bit_4to1_mux;
reg [3:0] j,k,l,m;
reg [1:0] n;
wire [3:0] testout;
four_bit_4to1_mux uut(.a(j),.b(k),.c(l),.d(m),.x(n),.e(testout));
initial
begin
	j=4'b0000;
	k=4'b0001;
	l=4'b0010;
	m=4'b0011;
	n=2'b00;
	#200;
	j=4'b0100;
	k=4'b0101;
	l=4'b0110;
	m=4'b0111;
	n=2'b01;
	#200;
	j=4'b0000;
	k=4'b0001;
	l=4'b0010;
	m=4'b0011;
	n=2'b10;
	#200;
	j=4'b1100;
	k=4'b1101;
	l=4'b1010;
	m=4'b0011;
	n=2'b11;
	#200;
	j=4'b1111;
	k=4'b1001;
	l=4'b0110;
	m=4'b1011;
	n=2'b00;
	#200;
	$stop;
end
endmodule