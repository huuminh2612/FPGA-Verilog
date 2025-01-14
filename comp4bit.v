module comparator4bit(w0, w1, less, equal, greater);
    input wire[3:0] w0, w1;
    output reg less, equal, greater;
    always @(w0 or w1) 
  begin
        if(w0 == w1) begin
            less = 0; 
            greater = 0;
            equal = 1;
            end
        else if(w0 > w1) begin
            less = 0;
            greater = 1;
            equal = 0;
            end
        else begin
            less = 1;
            greater = 0;
            equal = 0;
            end
    end
endmodule

//comparator4bit(w0, w1, less, equal, greater);
module comparator4bit_tb;
    reg[3:0] w0, w1;
    wire less, equal, greater;
    comparator4bit uut(.w0(w0),.w1(w1),.less(less),.equal(equal),.greater(greater));
    initial begin
        w0 = 4'b0001; w1 = 4'b0001;
        #200;
        w0 = 4'b0011; w1 = 4'b0001;
        #200;
        w0 = 4'b0101; w1 = 4'b0101;
        #200;
        w0 = 4'b1000; w1 = 4'b1000;
        #200;
        w0 = 4'b0110; w1 = 4'b1011;
        #200;
        w0 = 4'b1010; w1 = 4'b1010;
        #200;
        $stop;
    end
endmodule

