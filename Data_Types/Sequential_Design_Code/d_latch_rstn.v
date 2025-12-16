module d_latch_rstn
#(parameter BUS_WIDTH = 8)
(
    input [BUS_WIDTH-1:0] d, 
    input enable,
    input reset_n, 
    output [BUS_WIDTH-1:0] q, q_not
);

    reg [BUS_WIDTH-1:0] d_r;

    always @(enable or d or reset_n) begin 
        if(!reset_n)
            d_r <= 0;   
        else 
            d_r <= d; 
    end 

    assign q = d_r; 
    assign q_not = ~d_r; 

endmodule