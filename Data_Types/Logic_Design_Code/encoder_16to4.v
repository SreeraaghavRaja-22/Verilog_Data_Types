// this will be a WIP

module encoder_16to4(
    input [16:0] d,  
    input enable,
    output reg [3:0] y
);

    encoder_8to3 ENC1(
        .d(d[7:0])
        .enable(~enable);
        .y(y)
    );

    encoder_8to3 ENC2(
        .d(d[15:8])
        .enable(enable);
        .y(y)
    )

    encoder_2to1 ENC3(
        .d()
    )

    