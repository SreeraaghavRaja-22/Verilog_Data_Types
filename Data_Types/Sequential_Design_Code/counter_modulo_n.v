// counter that clears counter value to 0 whenever max value is reached (max number of states)
module counter_modulo_n
#(parameter N = 10,
  parameter CNT_WIDTH = 4)
(
    input clk, 
    input reset_n, 
    input enable,
    output reg [CNT_WIDTH-1:0] counter_out
);

    always @(posedge clk or negedge reset_n) begin 
        if(!reset_n) begin 
            counter_out <= 0; 
        end else if(enable) begin 
            if(counter_out == (N-1)) begin 
                counter_out <= 0; 
            end else begin 
                counter_out <= counter_out + 1'b1; 
            end 
        end 
    end
endmodule 