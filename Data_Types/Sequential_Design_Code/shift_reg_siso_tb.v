`timescale 1us/1ns

module shift_reg_siso_tb();

    reg clk = 0;
    reg reset_n;
    reg sdi;
    wire sdo;


    shift_reg_siso SISO0(
        .clk(clk),
        .reset_n(reset_n),
        .sdi(sdi),
        .sdo(sdo)
    );

    always begin 
        #0.5; clk = ~clk;
    end

    initial begin 

        #1; reset_n = 0; sdi = 0; 
        #5; reset_n = 1; 
        
        repeat(6) @(posedge clk); sdi= 1'b1; 
        repeat(4) @(posedge clk); sdi = 1'b0; 

        repeat(3) @(posedge clk); sdi = 1'b1; 
        repeat(2) @(posedge clk); sdi = 1'b0; 
        @(posedge clk); sdi = 1'b1; 

    end

    initial begin 
        #30; $stop; 
    end
endmodule
