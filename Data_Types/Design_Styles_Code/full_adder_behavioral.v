module full_adder_behavioral(
    input a, 
    input b, 
    input cin, 
    // must use reg because it is used in an always block
    output reg sum,
    output reg cout
);

    // always @(a or b or cin) begin 
    //     sum = a ^ b ^ cin ; 
    //     cout = a & b | (cin & (a ^ b));
    // end 

     
    always @(*) begin 
        {cout, sum} = a + b + cin; 
    end
    

endmodule 
