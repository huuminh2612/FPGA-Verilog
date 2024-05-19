module onebit_fulladd
( input wire a,b,cin,
  output reg s,cout
);
  reg x,y,z;
 assign s = a ^ b ^ cin;   // XOR of inputs gives the sum bit
 assign x = (a & b);   //AND 
 assign y = (a | b);   // OR
 assign z = (y & cin); // AND
 assign cout= (x | z);  // OR
endmodule
// Bo cong toan phan truc tiep
//testbench 

module tb_1bit_fulland;
  reg j,k,l;
  wire sout,c1out;
  onebit_fulladd uut(.a(j),.b(k),.cin(l),.s(sout),.cout(c1out));
  initial 
  begin
	j=1'b0; k=1'b0; l=1'b0;
	#200;
  	j=1'b0; k=1'b1; l=1'b0;
	#200;	
	j=1'b1; k=1'b0; l=1'b0;
	#200;
	j=1'b1; k=1'b1; l=1'b0;
	#200;
	j=1'b0; k=1'b0; l=1'b1;
	#200;
	j=1'b0; k=1'b1; l=1'b1;
	#200;
	j=1'b1; k=1'b0; l=1'b1;
	#200;
	j=1'b1; k=1'b1; l=1'b1;
	#200;
	$stop;
  end
endmodule
