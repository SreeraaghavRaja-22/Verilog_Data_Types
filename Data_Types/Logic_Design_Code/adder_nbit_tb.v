`timescale 1us/1ns
module adder_nbit_tb();

    parameter ADDER_WIDTH = 10; 
    reg [ADDER_WIDTH-1:0] a; 
    reg [ADDER_WIDTH-1:0] b;
    wire [ADDER_WIDTH:0] sum;

    adder_nbit 
    // generic map
    #(.N(ADDER_WIDTH))

    // port map
    ADDER10(
        .a(a), 
        .b(b),
        .sum(sum)
    );

    initial begin 
        $monitor($time, " a = %d, b = %d, sum = %d", a, b, sum);
    end

    initial begin 
        #1; a = 0; b = 0; 
        #1; a = 1; b = 99; 
        #1; a = 33; b = 66; 
        #1; a = 100; b = 47;
        #1; $stop;
    end
    
endmodule