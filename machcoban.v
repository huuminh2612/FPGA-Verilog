module machcoban
(
  input wire a,b,c,d,
  output reg y
); 
   wire  t1,t2,t3;
   assign t2 =!a;
   assign t1 = ~(b&c);
   assign t3 = t1 | d;
endmodule

module tb_machcoban;
   reg x1,x2,x3,x4;
   reg a1,a2,a3;
   wire testout;
machcoban uut(.a(x1),.b(x2),.c(x3),.d(x4),.t1(a1),.t2(a2),.t3(a3),.y(testout));
   initial
   begin
	x1=1'b0; x2=1'b0; x3=1'b0; x4=1'b0;
	#200;
	x1=1'b0; x2=1'b0; x3=1'b1; x4=1'b1;
	#200;
	x1=1'b1; x2=1'b1; x3=1'b0; x4=1'b1;
	#200;
	x1=1'b1; x2=1'b1; x3=1'b0; x4=1'b0;
	#200;
	$stop;
    end
endmodule