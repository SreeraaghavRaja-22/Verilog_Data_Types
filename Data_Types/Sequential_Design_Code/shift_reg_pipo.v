module shift_reg_pipo
#(parameter BUS_WIDTH = 4)
(
    input reset_n,
    input clk, 
    input [BUS_WIDTH-1:0] d, 
    output reg [BUS_WIDTH-1:0] q
);

    // Async negative reset_n is used 
    // Input data is the same as the output data 
    // this can be used as a "pipeline register"
    always @(posedge clk or negedge reset_n) begin 
        if(!reset_n) begin 
            q <= 4'b0;
        end else begin 
            q[3:0] <= d[3:0];
        end
    end
endmodule 