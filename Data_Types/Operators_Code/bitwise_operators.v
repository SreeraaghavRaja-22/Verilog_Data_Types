module bitwise_operators(
    // no inputs here 
);

    // 6bit variables
    reg [5:0] x = 0; 
    reg [5:0] y = 0; 
    reg [5:0] result = 0;

    // Procedure used to continuously monitor x, y, and result 
    initial begin 
        $monitor("MON x = %b, y = %b, result = %b", x, y, result);
    end 

    // Procedure used to generate stimulus 
    initial begin 
        #1; // wait some time between examples 
        x = 6'b11_0111; 
        y = 6'b01_0101; 
        result = x & y; // AND

        #1; // Used the same values for x and y from above (reg stroes the value)
        result = ~(x & y); // NAND
        
        // #1; // trying x ~& y to see something cool 
        // result = x ~& y; not supported :((

        #1; 
        x = 6'b01_0101; 
        y = 6'b10_1010; 
        result = x | y; // result 

        #1; 
        result = ~(x | y);

        // #1; 
        // result = x ~| y; not supported

        #1; 
        x = 6'b01_0110;
        y = 6'b01_1011; 
        result = x ^ y; // XOR 

        #1; //XNOR is used to check if x = y
        result = x ~^ y; // XNOR

        #1; 
        x = y; // This should make all bits 1; 
        result = ~(x ^ y); // XNOR
    end
endmodule