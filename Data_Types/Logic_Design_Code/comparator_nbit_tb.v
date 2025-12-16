`timescale 1us/1ns
module comparator_nbit_tb();

    parameter COMP_WIDTH = 10;
    reg [COMP_WIDTH-1:0] a, b; 
    wire altb, aeqb, agtb; 
    integer i, j; 
    parameter LOOP_LIM = 200;

    comparator_nbit 
    #(.N(COMP_WIDTH))
    COMP(
        .a(a), 
        .b(b), 
        .altb(altb), 
        .aeqb(aeqb),
        .agtb(agtb)
    );

    initial begin 
        $monitor($time, ": a = %d, b = %d, altb = %0b, aeqb = %0b, agtb = %0b", a, b, altb, aeqb, agtb);
    end

    initial begin 
        for(i = 0; i < LOOP_LIM; i = i + 1) begin 
            for(j = 0; j < LOOP_LIM; j = j + 1) begin 
                #1; a = i; b = j; 
            end 
        end
    #5; 
    $stop;
    end
endmodule

