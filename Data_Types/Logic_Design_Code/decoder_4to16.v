module decoder_4to16(
    input [3:0] a,
    output [15:0] y
);
    // wire enable_not;
    // assign enable_not = ~a[3];

    decoder_3to8 DEC1(
        .a(a[2:0]), 
        .enable(~a[3]),
        .y(y[7:0])
    );

    decoder_3to8 DEC2(
        .a(a[2:0]), 
        .enable(a[3]), 
        .y(y[15:8])
    );
endmodule