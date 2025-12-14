module shift_operators();

    reg [11:0] a = 12'b0101_1010_1101; // 12bit value (unsigned)
    reg [11:0] b; 

    // Procedure used to continuously monitor a and b 
    initial begin 
        $monitor("MON a = %b, b = %b, a = %d, b = %d", a, b, a, b);
    end 

    // Procedure used to generate stimulus 
    initial begin 
        b = a << 1; // b = a*2
        #1; // wait some time between samples 
        b = 0; 

        #1; 
        b = a * 2; 

        #1; b = a << 5; 
        #1; b = b >> 2; 
        #1; b = b >> 7; 
        #1; b = b << 1; 
        #1; b = (a << 1) >> 6; 
    end 
endmodule