module full_adder_dataflow(
    input a, 
    input b, 
    input cin, 
    output sum, 
    output cout
);

    wire sum1; 
    wire and1;
    wire and2; 

    // intermediate signals
    assign sum1 = a ^ b; 
    assign and1 = sum1 & cin; 
    assign and2 = a & b; 

    // assign sum and cout
    assign sum = sum1 ^ cin; 
    assign cout = and1 | and2; 

endmodule