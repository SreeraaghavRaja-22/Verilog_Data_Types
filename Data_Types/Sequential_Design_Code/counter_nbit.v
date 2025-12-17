module counter_nbit 
#(parameter N = 4)
(
    input clk, 
    input reset_n,
    output reg [N-1:0] counter
);

    // always use non-blocking assignments for sequential logic
    always @(posedge clk or negedge reset_n) begin 
        if (!reset_n) begin 
            counter <= 0; 
        end else begin 
            counter <= counter + 1'b1; // this works and the counter resets beacuse unsigned
        end 
    end 
endmodule 