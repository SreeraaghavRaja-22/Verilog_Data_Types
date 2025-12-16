module d_latch
#(parameter BUS_WIDTH = 3)
(
    input [BUS_WIDTH-1:0] d, 
    input enable, 
    output [BUS_WIDTH-1:0] q, q_not
);

    reg [BUS_WIDTH-1:0] d_r; 

    // The D-Latch is level sensitive 
    always @(enable or d) begin 
        if(enable)
            d_r <= d; 
    end

    assign q = d_r;
    assign q_not = ~d_r;

endmodule
