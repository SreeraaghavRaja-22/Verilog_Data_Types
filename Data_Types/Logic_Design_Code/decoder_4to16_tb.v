`timescale 1us/1ns
module decoder_4to16_tb();

    reg [3:0] a; 
    wire [15:0] y; 
    integer i;
    parameter N = 8;

    decoder_4to16 DEC4(
        .a(a[3:0]), 
        .y(y)
    );

    initial begin 
        $monitor($time, ": a = %d, y = %d", a, y);
    end

    initial begin 
        #1; a[3] = 0; a[2:0] = 0;
        for(i = 0; i < N; i = i + 1) begin 
            #1; a[2:0] = i;
        end
        #1; a[2:0] = 0; a[3] = 1;

        for(i = 0; i < N; i = i + 1) begin 
            #1; a[2:0] = i; 
        end
        #10; $stop;
    end
endmodule

