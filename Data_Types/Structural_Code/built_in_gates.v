`timescale 1us / 1ns // mandatory because of the delays

module built_in_gates(
    input a, b, c, d, 
    output o1, o2, o3, o4, o5, o6, o7, o8, o9, o10
);

and     and1    (o1, a, b); 
nand    nand1   (o2, c, d);
or      or1     (o3, a, b, c, d);
nor     nor1    (o4, c, d);
xor     xor1    (o5, a, b, c);
xnor    xnor1   (o6, b, d); 
buf     buf1    (o7, c);
not     not1    (o8, d);

// Gates with delays
buf #0.1 buf_dly (o9, c); // this delay requires timescale 
and #0.2 and_dly (o10, a, b); // compare this wave with and1

endmodule