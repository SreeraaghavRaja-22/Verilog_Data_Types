`timescale 1us/1ns

module counter_modulo_n_tb(); 

    parameter N = 10;
    parameter CNT_WIDTH = 4; 
    reg clk = 0; 
    reg reset_n; 
    reg enable; 
    wire [CNT_WIDTH-1:0] counter_out; 
    parameter CLK_HALF_PERIOD = 0.25; // get a 2 MHz clock


    counter_modulo_n 
    #(.N(N), .CNT_WIDTH(CNT_WIDTH))
    MOD0(
        .clk(clk),
        .reset_n(reset_n), 
        .enable(enable), 
        .counter_out(counter_out)
    );

    always begin #CLK_HALF_PERIOD; clk = ~clk; end 

    initial begin
        $monitor($time, ": counter_out = %d", counter_out);

        #1; reset_n = 0; enable = 0; 
        #1.3; enable = 1; 
        #1; reset_n = 1; enable = 1;
        repeat(10) @(posedge clk); reset_n = 0; 
        repeat(2) @(posedge clk); reset_n = 1; 
        repeat(20) @(posedge clk); $stop; 
    end 
endmodule