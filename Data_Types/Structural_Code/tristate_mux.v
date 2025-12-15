module tristate_mux(
    input a, b, x,
    output y
);
    // x is the select line that is connected to the enable of the tri-state buffer
    bufif0(y, a, x); // active-low tri-state buffer connected to output (Y)
    bufif1(y, b, x); // active-high tri-state buffer connected to ouput (Y)

endmodule