module priority_encoder_4to2_tb();

    reg [3:0] d; 
    wire [1:0] q;
    wire v; 
    integer i; 
    parameter N = 2**4;

    priority_encoder_4to2_case PE1(
        .d(d), 
        .q(q), 
        .v(v)
    );

    initial begin 
        $monitor($time, ": d = %d, q = %d, v = %0b", d, q, v);

        #1; 
        for(i = 0; i < N; i = i + 1) begin 
            d = i; #1;
        end 
        #10; $stop;
    end 

endmodule