module comparator_1bit(
    input a, b,
    output altb, aeqb, agtb
);

    wire not_a;
    wire not_b; 

    not NOT1 (not_a, a);
    not NOT2 (not_b, b);
    and AND1 (altb, not_a, b);
    and AND2 (agtb, a, not_b);
    xnor XNOR1 (aeqb, a, b);
    
endmodule