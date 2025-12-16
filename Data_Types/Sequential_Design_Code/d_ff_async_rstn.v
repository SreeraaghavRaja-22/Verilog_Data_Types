module d_ff_async_rstn
#(parameter BUS_WIDTH = 8)
(
    input [BUS_WIDTH-1:0] d, 
    input clk, 
    input reset_n, 
    output reg [BUS_WIDTH-1:0] q, 
    output [BUS_WIDTH-1:0] q_not
);

    // rising edge trigger ff can use an async reset_n (high to low transitions)
    always @(posedge clk or negedge reset_n) begin 
        if(!reset_n) begin 
            q <= 0; // non-blocking assignment for sequential logic
        end else begin 
            q <= d; 
        end
    end 

    assign q_not = ~q; 

endmodule