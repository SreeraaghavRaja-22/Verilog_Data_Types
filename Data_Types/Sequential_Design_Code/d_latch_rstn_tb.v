module d_latch_rstn_tb();

    parameter BUS_WIDTH = 8; 
    reg [BUS_WIDTH-1:0] d;
    reg enable = 0; 
    reg reset_n; 
    wire [BUS_WIDTH-1:0] q, q_not;

    parameter HALF_PERIOD_ENABLE = 0.5; 
    integer i; 

    d_latch_rstn
    #(.BUS_WIDTH(BUS_WIDTH))
    DLR 
    (
        .d(d), 
        .enable(enable), 
        .reset_n(reset_n), 
        .q(q), 
        .q_not(q_not)
    );

    initial begin 
        $monitor($time, ": d = %d, enable = %0b, reset_n = %b, q = %d, q_not = %d", d, enable, reset_n, q, q_not);
        reset_n = 0; enable = 1; d = 20; 
        #10; reset_n = 1; enable = 1; d = 0; 

        for(i = 0; i < 2**BUS_WIDTH; i = i + 1) begin 
            #1; d = i; 
        end
    end 

    always begin 
        #HALF_PERIOD_ENABLE; enable = ~enable;
    end 

    initial begin 
        #40; $stop; // could use $finish, but that closes the simulator
    end

endmodule
