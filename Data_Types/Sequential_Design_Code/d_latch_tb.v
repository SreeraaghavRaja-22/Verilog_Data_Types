`timescale 1us/1ns
module d_latch_tb(); 

    parameter BUS_WIDTH = 8; 
    reg [BUS_WIDTH-1:0] d;
    reg enable; 
    wire [BUS_WIDTH-1:0] q, q_not; 
    integer i; 
    parameter PERIOD_CLK1_DUTY = 0.3; 


    d_latch
    #(.BUS_WIDTH(BUS_WIDTH))
    DL
    (
        .d(d),
        .enable(enable),
        .q(q),
        .q_not(q_not)
    );

    initial begin 
        $monitor($time, ": d = %d, enable = %0b, q = %d, q_not = %d", d, enable, q, q_not);

        for(i = 0; i < (1 << BUS_WIDTH); i = i + 1) begin 
            #1; d = i; 
        end
    end

    // toggle enable with 0.7 high and 0.3 low
    initial begin 
        enable = 0; 
        forever begin 
            enable = 0; #(1-PERIOD_CLK1_DUTY);
            enable = 1; #(PERIOD_CLK1_DUTY);
        end
    end

    initial begin 
        #40; $stop;
    end

endmodule
