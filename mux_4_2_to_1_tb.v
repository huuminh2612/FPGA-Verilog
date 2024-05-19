//testbench
`timescale 1ns/10ps
`include "mux_4_2_to_1.v"

module mux_4_2_to_1_tb();
    reg s1, s2, a, b, c, d;
    wire y;

    localparam T = 20;

    mux_4_2_to_1 uut (
        .s1(s1),
        .s2(s2),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .y(y)
    );

    initial begin
        s1 = 1'b0;
        s2 = 1'b0;
        a = 1'b0;
        b = 1'b1;
        c = 1'b1;
        d = 1'b0;
        #(T/2);

        s1 = 1'b0;
        s2 = 1'b1;
        a = 1'b0;
        b = 1'b1;
        c = 1'b0;
        d = 1'b0;
        #(T/2);

        s1 = 1'b1;
        s2 = 1'b0;
        a = 1'b1;
        b = 1'b1;
        c = 1'b0;
        d = 1'b0;
        #(T/2);

        s1 = 1'b1;
        s2 = 1'b1;
        a = 1'b0;
        b = 1'b0;
        c = 1'b1;
        d = 1'b0;
        #(T/2);

        $stop;
    end
endmodule