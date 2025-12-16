`timescale 1us/1ns
module bus_4x_nbit_tb();

    parameter BUS_WIDTH = 8;
    reg [BUS_WIDTH-1:0] a, b, c, d; 
    reg [1:0] sel; 
    wire [BUS_WIDTH-1:0] y; 
    integer i; 


    bus_4x_nbit
    #(.BUS_WIDTH(BUS_WIDTH))
    MUX4 (
        .a(a),
        .b(b), 
        .c(c),
        .d(d),
        .sel(sel), 
        .y(y)
    );

    initial begin 
        $monitor($time,": a = %d, b = %d, c = %d, d = %d, sel = %d, y = %d", a, b, c, d, sel, y);

        #1; a = 0; b = 0; c = 0; d = 0; sel = 0; 
        for(i = 0; i < 8; i = i+1) begin 
            #1; sel = i % 4; a = i % 2; b = i % 3; c = i % 4; d = i % 5; 
        end
        #10; $stop;
    end 
endmodule