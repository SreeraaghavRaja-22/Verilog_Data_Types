`timescale 1us/1ns
module lfsr_tb();

    reg clk = 0; 
    reg reset_n; 
    reg enable; 
    wire [15:0] lfsr; 

    // Instantiate the DUT
    lfsr_16 LFSR(
        .clk(clk), 
        .reset_n(reset_n), 
        .enable(enable), 
        .lfsr(lfsr)
    );

    // Create the 1MHz clock signal 
    always begin #0.5 clk = ~clk; end 

    // Create stimulus 
    initial begin 
        $monitor($time,": enable = %b, lfsr = 0x%x", enable, lfsr);
        #1; reset_n = 0; enable = 0; // apply reset
        #1.2; reset_n = 1; // release reset  
        repeat(2) @(posedge clk);
        enable = 1; 

        repeat(10) @(posedge clk);
        enable = 0; 
    end 


    // This will stop teh simulator when the time expires
    initial begin 
        #20; $stop; 
    end 

endmodule 