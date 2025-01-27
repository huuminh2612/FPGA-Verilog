
module lamlai
(
  input wire a,b,c,d,
  output reg y
); 
   reg  t1,t2,t3;
   always @*
   begin
	 t2 = ~a;
   	 t1 = ~(b&c);
    	 t3 = t1 | d;
   	 y= t2 & t3;
   end
endmodule

module tb_lamlai;
   reg x1,x2,x3,x4;
   reg a1,a2,a3;
   wire testout;
lamlai uut(.a(x1),.b(x2),.c(x3),.d(x4),.y(testout));
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
