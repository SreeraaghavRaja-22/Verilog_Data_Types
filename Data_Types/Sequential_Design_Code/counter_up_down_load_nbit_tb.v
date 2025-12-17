`timescale 1us/1ns
module counter_up_down_load_nbit_tb();

    parameter N = 4;
    reg clk = 0; 
    reg reset_n; 
    reg [N-1:0] counter_in; 
    reg up_down; 
    reg load_en; 
    wire [N-1:0] counter_out;

    parameter CLK_HALF_PERIOD = 0.5; 

    counter_up_down_load_nbit 
    #(.N(N))
    CUP
    (
        .clk(clk), 
        .reset_n(reset_n), 
        .counter_in(counter_in), 
        .up_down(up_down), 
        .load_en(load_en), 
        .counter_out(counter_out)
    );
    
    always begin #CLK_HALF_PERIOD; clk = ~clk; end

    initial begin 
        $monitor($time, ": counter_in = %d, counter_out = %d", counter_in, counter_out);

        #1; reset_n = 0; counter_in = 4'b0101; load_en = 0; up_down = 0;
        #1; load_en = 1; 
        #1; reset_n = 1; 
        #1; load_en = 0; 
        repeat(8) @(posedge clk); up_down = 1; 
        repeat(10) @(posedge clk); $stop;
    end 

endmodule

