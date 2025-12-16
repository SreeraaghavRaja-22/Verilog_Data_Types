module hex_7seg_decoder_tb();

    reg [3:0] in; 
    wire a, b, c, d, e, f, g; 
    wire dp;

    integer i; 
    parameter MAX = 1 << 4;

    hex_7seg_decoder HEX(
        .in(in), 
        .a(a), 
        .b(b), 
        .c(c),
        .d(d),
        .e(e), 
        .f(f), 
        .g(g), 
        .dp(dp)
    );

    initial begin 
        $monitor($time, ": in = %d, a = %0b, b = %0b, c = %0b, d = %0b, e = %0b, f = %0b, g = %0b, dp = %0b", in, a, b, c, d, e, f, g, dp);

        for(i = 0; i < MAX; i = i + 1) begin 
            #1; in = i; 
        end 
        
        #10;
    end 
endmodule 