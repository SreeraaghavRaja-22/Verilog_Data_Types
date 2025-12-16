`timescale 1us/1ns
module d_ff_sync_rstn_tb(); 

    parameter BUS_WIDTH = 16; 
    reg [BUS_WIDTH-1:0] d; 
    reg clk = 0;
    reg reset_n;
    wire [BUS_WIDTH-1:0] q, q_not;

    parameter HALF_PERIOD_CLK = 0.5; 
    integer i;
    parameter MAX = 2**BUS_WIDTH; 

    d_ff_sync_rstn
    #(.BUS_WIDTH(BUS_WIDTH))
    DFF
    (
        .d(d), 
        .clk(clk), 
        .reset_n(reset_n), 
        .q(q),
        .q_not(q_not)
    );

    initial begin 
        $monitor($time,": d = %d, clk = %0b, reset_n = %0b, q = %d, q_not = %d", d, clk, reset_n, q, q_not);

        #1; reset_n = 0; d = 199; 
        #20; reset_n = 1; d = 0;
        for(i = 0; i < MAX; i = i + 1) begin 
            #1; d = i; 
        end 
    end

    always begin 
        #HALF_PERIOD_CLK; clk = ~clk; 
    end 

    initial begin 
        #55; $finish; 
    end

endmodule
