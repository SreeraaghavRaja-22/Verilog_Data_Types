module shift_left_right_reg(
    input reset_n, 
    input clk, 
    input [7:0] i, 
    input load_enable, // 0 for load and 1 for enable shifting 
    input shift_left_right, 
    output reg [7:0] q
); 

    // Async negative reset is used 
    always @(posedge clk or negedge reset_n) begin 
        if(!reset_n) begin 
            q <= 8'b0; 
        end else if(load_enable == 1'b0) begin// load register (active low)
            q <= i; 
        end else begin 
            if (shift_left_right == 1'b0) begin 
                q <= {q[6:0], 1'b0};
            end else begin 
                q <= {1'b0, q[7:1]};
            end 
        end
    end
endmodule 