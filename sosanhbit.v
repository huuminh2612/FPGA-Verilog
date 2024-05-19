module eq_four_bit(input wire [3:0] a,b,
  output wire aeqb);
  wire p0,p1,p2,p3;
  eq1 eq_bit0_unit(.a(a[0]),.b(b[0]),.eq(p0));
  eq1 eq_bit1_unit(.a(a[1]),.b(b[1]),.eq(p1));
  eq1 eq_bit2_unit(.a(a[2]),.b(b[2]),.eq(p2));
  eq1 eq_bit3_unit(.a(a[3]),.b(b[3]),.eq(p3));
  assign aeqb = e0 & e1 & e2 & e3; 
endmodule
module eq1(
input wire a,b,
  output wire eq );
  wire p0,p1;
  assign eq = p0|p1;
  assign p0 = ~a&~b;
  assign p1 = a&b;
endmodule
module eq4_testbench();
  reg [3:0] test_in0,test_in1;
  wire test_out;
  eq_four_bit uut(.a(test_in0),.b(test_in1),.aeqb(test_out));
  initial
  begin
    test_in0=4'b0000;
    test_in1=4'b0000;
    #200;
    test_in0=4'b0001;
    test_in1=4'b0000;
    #200;
    test_in0=4'b0010;
    test_in1=4'b0001;
    #200;
    test_in0=4'b0101;
    test_in1=4'b0011;
    #200;
    $stop;
  end
endmodule