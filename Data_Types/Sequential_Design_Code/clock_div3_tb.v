`timescale 1us/1ns
module clock_div3_tb();

    reg clk = 0;
    reg reset_n; 
    wire clock_out;

    parameter HALF_CLK_PERIOD = 0.25;

    clock_div3 CD3(
        .clk(clk),
        .reset_n(reset_n),
        .clock_out(clock_out)
    );

    always begin #HALF_CLK_PERIOD; clk = ~clk; end

    initial begin 
        #1; reset_n = 0; 
        #1.3; reset_n = 1;
        repeat(50) @(posedge clk); $stop;
    end 

endmodule  
