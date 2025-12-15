module demux_1bit(
    input x, sel, 
    output y0, y1
);

    wire sel_not;

    not NOT1 (sel_not, sel);
    and AND1 (y0, sel_not, x);
    and AND2 (y1, sel, x);

endmodule