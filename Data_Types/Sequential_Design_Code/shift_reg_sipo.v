module shift_reg_sipo(
    input reset_n, 
    input clk,
    input sdi, // serial data in 
    output reg [3:0] q
);

    always @(posedge clk or negedge reset_n) begin 
        if (!reset_n) begin 
            q <= 4'b0000; 
        end else begin 
            q <= {q[2:0], sdi};
        end 
    end

endmodule