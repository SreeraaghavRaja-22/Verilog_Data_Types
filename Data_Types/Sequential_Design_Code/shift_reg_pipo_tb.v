`timescale 1us/1ns

module shift_reg_pipo_tb();
    
    parameter BUS_WIDTH = 32; // don't use 32 because this will cause the MAX value to overflow and then i won't increment because MAX = 0;
    
    reg reset_n; 
    reg clk = 0; 
    reg [BUS_WIDTH-1:0] d; 
    wire [BUS_WIDTH-1:0] q;

    integer i; 
    parameter MAX = 1 << (BUS_WIDTH / 2);// 32'b1111_1111_1111_1111_1111_1111_1111_1111; 
    parameter CLK_POS_DUTY = 0.5; 

    shift_reg_pipo 
    #(.BUS_WIDTH(BUS_WIDTH))
    SRP(
        .clk(clk), 
        .reset_n(reset_n), 
        .d(d), 
        .q(q)
    );

    always begin 
        #CLK_POS_DUTY; clk = ~clk; 
    end


    initial begin 
        $monitor($time, ": d = %d, clk = %0b, reset_n = %0b, q = %d", d, clk, reset_n, q);

        #1; reset_n = 0; d = 29; 
        #10; reset_n = 1; d = 0; 

        for(i = 0; i < MAX; i = i + 1) begin 
            @(posedge clk); d = i; 
        end
    end

    initial begin
        #20000; $finish;
    end

endmodule