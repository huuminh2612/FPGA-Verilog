
module sequence_detector_1 (
   input wire w, rst, clk,
   output reg z
);
   localparam [1:0] s0 = 2'b00,
                    s1 = 2'b01,
                    s2 = 2'b10;
   reg [1:0] state_reg, state_next;
   
   always @(posedge clk, posedge rst)
   begin
      if (rst)
         state_reg <= s0;
      else
         state_reg <= state_next;
   end
   
   always @*
   begin
      case (state_reg)
         s0:
         begin
            if (w)
               state_next = s1;
	    else 
	       state_next = state_reg;
         end
         
         s1:
         begin
            if (w)
               state_next = s2;
            else
               state_next = s0;
         end
         
         s2:
         begin
            if (w)
               state_next = state_reg;
	    else
	       state_next = s0;
         end
      endcase
   end
   
  assign z = (state_reg == s2) ? 1 : 0;
   
endmodule
`timescale 1ns/10ps
module sequence_detector_1_tb();
	localparam T=20;
	reg clk,rst,w;
	wire z;
sequence_detector_1 uut(.rst(rst),.clk(clk),.w(w),.z(z));
	always 
	begin
	   clk=1'b1;
	   #(T/4);
	   clk=1'b0;
	   #(T/4);
	end
	initial 
	begin
	   rst = 1'b1;
	   #(T/2); #(T/2);
	   rst= 1'b0;
	end
	initial
	begin
		w = 0;
		#(T/2);
		w = 0;
		#(T/2);
		w = 0;
		#(T/2);
		w = 1;
		#(T/2);
		w = 0;
		#(T/2);
		w = 1;
		#(T/2);
		w = 1;
		#(T/2);
		w = 0;
		#(T/2);
		w = 1;
		#(T/2);
		w = 1;
		#(T/2);
		w = 1;
		#(T/2);
                w=0;
                #(T/2);
	   	$stop;
	end
endmodule