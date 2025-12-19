`timescale 1us/1ns
module seq_det_non_overlap_tb();
    
    reg clk = 0; 
    reg rst_n; 
    reg seq_in; 
    wire detected; 
    wire [1:0] state_out; 

    reg [0:13] test_vect = 14'b00_1100_0101_0101;
    integer i; 

    seq_det_non_overlap SEQ_DET0(
        .clk(clk),
        .rst_n(rst_n),
        .seq_in(seq_in),
        .detected(detected),
        .state_out(state_out)
    );

    always begin #1; clk = ~clk; end

    initial begin 
        $monitor($time, ": seq_in = %b, detected = %b", seq_in, detected);

        rst_n = 0; #2.5; rst_n = 1; 

        repeat(2) @(posedge clk);

        for(i = 0; i < 14; i = i + 1) begin 
            seq_in = test_vect[i]; 
            @(posedge clk);
        end

        for(i = 0; i < 15; i = i + 1) begin
            seq_in = $random; 
            @(posedge clk);
        end

        repeat(10) @(posedge clk);
        @(posedge clk);

        #50; $stop;
    end

endmodule