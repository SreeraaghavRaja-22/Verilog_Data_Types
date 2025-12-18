`timescale 1us/1ns
module func_ex1();

    // This fucntion returns the sum of 2 8-bit numbers 
    // AN internal variable witht he same name as the function is 
    // created inside it and is used for returning the value
    function [8:0] sum (input[7:0] a, input [7:0]b);
        begin 
            sum = a + b; 
        end 
    endfunction

    // Variables used for stimulus 
    reg [7:0] a, b; 

    initial begin 
        $monitor($time,": a = %d, b = %d, sum = %d", a, b, sum(a, b));
        #1; a = 1; b = 66; 
        #1; a = 2; b = 65; 
        #1; a = 24; b = 43; 
        #1; a = 244; b = 12; 
        #1; a = 255; b = 255; 
        #1;
    end 

endmodule 