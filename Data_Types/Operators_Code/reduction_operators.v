module reduction_operators(); 

    reg [4:0] my_val1 = 5'b1_1111;      // 5bit variable 
    reg [8:0] my_val2 = 9'b1_0101_1010; // 9bit variable
    reg result;

    // Procedure used to continuously monitor my_val1, my_val2, and result 
    initial begin 
        $monitor("MON my_val1 = %b, my_val2 = %b, result = %b", my_val1, my_val2, result);
    end 

    // Procedure used to generate stimulus 
    initial begin 
        #1; // would add a delay before reading the first signal, so output would be undefined
        result = &my_val1;  // AND Reduction 
        #1; 
        result = &my_val2; 

        #1; 
        result = ~&my_val1; // NAND Reduction 
        #1; 
        result = ~&my_val2;

        #1; 
        result = |my_val2;  // OR Reduction
        #1; 
        result = |my_val1; 

        #1; 
        result = ~|my_val1; // NOR Reduction
        #1; 
        result = ~|my_val2; 

        #1; 
        result = ^my_val1;  // XOR Reduction -- will get 1'b1 as the result here because there are 5 1s, so the parity is 1
        #1; 
        result = ^my_val2; 

        #1; 
        result = ~^my_val1; // XNOR Reduction 
        #1; 
        result = ~^my_val2;
    end 
endmodule