module decoder_3to8_tb();

    reg [2:0] a; 
    reg enable; 
    wire [7:0] y;
    integer i; 
    parameter LOOP_LIM = 8;

    decoder_3to8 DEC3(
        .a(a),
        .enable(enable), 
        .y(y)
    );

    initial begin 
        $monitor($time, ": a = %d, enable = %0b, y = %d", a, enable, y);
        #1; enable = 0; a = 4;
        #10; enable = 1; // ts a reg so only need to enable it once

        for(i = 0; i < LOOP_LIM; i = i + 1) begin 
            a = i; #1; 
        end 
    end
    
endmodule