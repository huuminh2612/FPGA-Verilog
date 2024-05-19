//code 
module mux_2_to_1(
   input wire a,b,s,
   output reg y
);
  always@(a or b)
     if (s)
        y = a;
     else 
        y = b;
endmodule


