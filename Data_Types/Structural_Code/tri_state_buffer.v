module tri_state_buffer(
    input din, 
    input sel,
    output dout
);
    // Tri-state buffer, Active-High EN
    bufif1(dout, din, sel);

endmodule