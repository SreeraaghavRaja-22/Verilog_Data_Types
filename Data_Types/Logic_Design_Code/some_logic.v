// LOL this is basically an OR gate

module some_logic(
    input a, 
    input b,
    output c
);

    // Declare nets
    wire a_not; 
    wire a_or_b; 

    // Continuous Assignments (order of assignments isn't important but improves readability)
    assign a_not = ~a; 
    assign a_or_b = a | b; 
    assign c = a_or_b | (a_or_b & a_not);

endmodule