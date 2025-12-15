module half_adder_tb(); 

    reg a; 
    reg b; 
    wire sum; 
    wire carry; 
    reg i[2:0];

    // just change the entity so I don't need to make a separate TB for every type of half adder
    half_adder_dataflow HALF_ADD_STR(
        .a(a), 
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin 
        $monitor("a = %b, b = %b, sum = %b, carry = %b", a, b, sum, carry);
    end

    initial begin 
        #1; a = 0; b = 0;
        #1; a = 0; b = 1;
        #1; a = 1; b = 0;
        #1; a = 1; b = 1;
        #1; a = 0; b = 0;
    end 
endmodule
