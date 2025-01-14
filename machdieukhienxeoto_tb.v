`timescale 1ns/10ps
`include "machdieukhienxeoto.v"

module machdieukhienxeoto_tb();
    reg brake, accelerate, clk, reset;
    wire [1:0] w;

    localparam T = 20;
    machdieukhienxeoto uut (.brake(brake), .accelerate(accelerate), .clk(clk), .reset(reset), .w(w));

    // Clock
    always begin
        clk = 1'b1;
        #(T/2);
        clk = 1'b0;
        #(T/2);
    end

    // Reset
    initial begin
        reset = 1'b1;
        #(T);
        reset = 1'b0;
    end

    // Simulation
    initial begin
        accelerate = 1'b0;
        brake = 1'b0;
        #(T/2);
        accelerate = 1'b1;
        brake = 1'b0;
        #(T/2);
        accelerate = 1'b1;
        brake = 1'b0;
        #(T/2);
        accelerate = 1'b1;
        brake = 1'b1;
        #(T/2);
        accelerate = 1'b0;
        brake = 1'b1;
        #(T/2);
        accelerate = 1'b0;
        brake = 1'b0;
        #(T/2);
        accelerate = 1'b0;
        brake = 1'b1;
        #(T/2);
        accelerate = 1'b1;
        brake = 1'b1;
        #(T/2);
        accelerate = 1'b0;
        brake = 1'b1;
        #(T/2);
        $stop;
    end

endmodule