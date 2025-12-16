`timescale 1us/1ns
module decoder_nbit_tb();

    parameter DEC_WIDTH = 5; 
    reg [DEC_WIDTH-1:0] a; 
    reg enable; 
    wire [2**DEC_WIDTH-1:0] y;
    integer i; 
    parameter LOOP_LIM = 2**DEC_WIDTH;

    decoder_nbit 
    #(.N(DEC_WIDTH))
    DECO (
        .a(a),
        .enable(enable),
        .y(y)
    );

    initial begin 
        $monitor($time, ": a = %d, enable = %0b, y = %d", a, enable, y);

        enable = 0; a = 1;
        for(i = 0; i < LOOP_LIM; i = i + 1) begin 
            #1; a = i; 
        end
        #1; a = 0;
        #10;
        enable = 1; 
    
        for(i = 0; i < LOOP_LIM; i = i + 1) begin 
            #1; a = i; 
        end
        
    end
endmodule