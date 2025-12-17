`timescale 1us/1ns
module counter_nbit_tb();

    parameter N = 8; 
    reg clk = 0; 
    reg reset_n; 
    wire [N-1:0] counter;
    integer i; 
    parameter MAX = 2**N; 
    parameter integer CLK_HALF_PERIOD = 0.5; 

    counter_nbit 
    #(.N(N))
    CNBIT  
    (
        .clk(clk), 
        .reset_n(reset_n), 
        .counter(counter)
    );

    always begin #CLK_HALF_PERIOD; clk = ~clk; end

    initial begin
        $monitor($time, ": clk = %0b, reset_n = %0b, counter = %d", clk, reset_n, counter);

        #1; reset_n = 0;
        #1.3; reset_n = 1;  
        repeat(20) @(posedge clk); reset_n = 0; 
        repeat(20) @(posedge clk); reset_n = 1; 
    end 

    initial begin
        #50; $stop;
    end
endmodule 
