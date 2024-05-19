//code
module mux_4_2_to_1(
    input wire s1,a,b,c,d,s2,
    output reg y
);
     reg e1,e2;
mux_2_to_1 uut1(.a(a),.b(b),.s1(s),.y(e1));
mux_2_to_1 uut2(.c(a),.d(b),.s1(s),.y(e2));
mux_2_to_1 uut3(.e1(a),.e2(b),.s2(s),.y(y));

endmodule