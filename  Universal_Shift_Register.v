module univ_shift_reg #(parameter N=8) (
    input wire clk, rst,
    input wire [1:0] ctrl,
    input wire [N-1:0] d,
    output reg [N-1:0] q
);

// Signal declaration
reg [N-1:0] r_reg, r_next;

// Body
// Register
always @ (posedge clk or posedge rst)
    if (rst) 
        r_reg <= 0;
    else
        r_reg <= r_next;

// Next_state logic
always @*
    case(ctrl)
        2'b00: r_next = r_reg;
        2'b01: r_next = {r_reg[N-2:0], d[0]};
        2'b10: r_next = {d[N-1], r_reg[N-1:1]};
        default: r_next = d;
    endcase

// Output logic
assign q = r_reg;

endmodule
module univ_shift_reg_tb();
   localparam T=50; // clock period
    reg clk, rst;
    reg [1:0] ctrl;
    reg [7:0] d; // Changed to match the width of N
    wire [7:0] q; // Changed to match the width of N
    univ_shift_reg #(.N(8)) uut(.clk(clk), .rst(rst), .ctrl(ctrl), .d(d), .q(q));
    always 
    begin 
        clk = 1'b0;
        #(T/2);
        clk = 1'b1;
        #(T/2);
    end
    initial 
    begin
        rst = 1'b1;
        ctrl = 2'b00;
        d = 8'b00001111;
        #(25);
        rst = 1'b1;
        ctrl = 2'b01;
        d = 8'b11110000;
        #(25);
        rst = 1'b1;
        ctrl = 2'b10;
        d = 8'b10101010;
        #(25);
        rst = 1'b1;
        ctrl = 2'b11;
        d = 8'b01010101;
        #(25);
        rst = 1'b0;
        ctrl = 2'b00;
        d = 8'b00001111;
        #(25);
        rst = 1'b0;
        ctrl = 2'b01;
        d = 8'b11110000;
        #(25);
        rst = 1'b0;
        ctrl = 2'b10;
        d = 8'b10101010;
        #(25);
        rst = 1'b0;
        ctrl = 2'b11;
        d = 8'b01010101;
        #(25);
        $stop;
    end
endmodule
