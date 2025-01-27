module fsm_eg_2_seg
   ( 
    input wire clk,reset,
    input wire a ,b, 
    output reg y0,y1
   );
   //symbolic sate dectaration
   localparam [1:0] s0=2'b00,
		    s1=2'b01,
		    s2=2'b10;
   reg [1:0] state_reg, state_next;
   //state register
   always @(posedge clk, posedge reset)
      if (reset)
	state_reg <= s0;
      else
	state_reg <= state_next;
   //next-state logic
   always @* 
     case (state_reg)
	s0: if(a) 
	      if (b)
	         state_next = s2;
	      else
		state_next = s1;
	     else
		state_next = s0;
	s1: if (a)
	      state_next = s0;
	    else
	       state_next = s1;
	s2: state_next = s0;
	default: state_next = s0;
      endcase
   //morre output logic
   assign y1 = (state_reg==s0) || (state_reg==s1) ;
   //mealy output logic
   assign y0= (state_reg==s0) & a & b ;
endmodule

 `timescale 1 ns/10 ps
module tb_fsm_eg_2_seg_tb ();
	// declaration
	localparam T=20; //clock period
	reg clk, reset;
	reg a, b;
	wire y0, y1;
	// design under test
	fsm_eg_2_seg dut (.clk(clk), 
	.reset(reset), .a(a), .b(b), 
	.y0(y0), .y1(y1));
	// clock
	always
	begin
		clk = 1'b1;
		#(T/2);
		clk = 1'b0;
		#(T/2);
	end
	//reset 
	initial 
	begin
		reset = 1'b1;
		#(T); #(T/2);
		reset = 1'b0;
	end

	// stimulus
	initial
	begin
		// wait for half cycle
		#(T/2);
		a = 1'b0;
		b = 1'b1;
		
		#(4*T);
		a = 1'b1;
		
		#(2*T);
		a = 1'b1;
		b = 1'b0;
		
		#(1*T);
		a = 1'b0;

		#(3*T);
		a = 1'b1;
		
		#(2*T);
	end
endmodule