`timescale 1us/1ns
module clock_div_nbit_tb();

    parameter CNT_WIDTH = 4; 
    reg clk = 0;
    reg reset_n; 
    wire clk_div2; 
    wire [CNT_WIDTH-1:0] counter; 
    parameter HALF_CLK_PERIOD = 0.5; 


    // Instantiate the DUT
    clock_div_nbit
    #(.CNT_WIDTH(CNT_WIDTH))
    CDN0
    (.clk(clk),
     .reset_n(reset_n),
     .clk_div2(clk_div2),
     .counter(counter)
    );

    // Create the clock 
    always begin #HALF_CLK_PERIOD; clk = ~clk; end

    // Generate stimulus 
    initial begin 
        $monitor($time,": counter = %d", counter);

        #1; reset_n = 0; 
        #1.3; reset_n = 1; 
        repeat(40) @(posedge clk); $stop;
    end
endmodule 