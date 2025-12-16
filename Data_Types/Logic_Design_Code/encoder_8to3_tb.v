module encoder_8to3_tb();
    
    reg [7:0] d;
    reg enable;
    wire [2:0] y;
    integer i; 
    parameter N = 2**7+1; 

    encoder_8to3 ENC(
        .d(d), 
        .enable(enable), 
        .y(y)
    );

    initial begin 
        $monitor($time, ": d = %d, enable = %0b, y = %d", d, enable, y);
        #1; enable = 0; d = 1 << 5;
        #10; enable = 1; 
        for(i = 1; i < N; i = i << 1) begin 
            d = i; #1; 
        end 

        #10; $stop; 
    end 

endmodule