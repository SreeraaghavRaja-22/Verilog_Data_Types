// fibonacci lfsr
module lfsr_16(
    input reset_n, 
    input clk, 
    input enable, 
    output reg [15:0] lfsr
);

    // Seed has to be non-zero at all times
    localparam RST_SEED = 16'h1001;
    wire feedback; 

    // x^16 + x^14 + x^13 + x^11 + 1
    assign feedback = lfsr[15] ^ lfsr[13] ^ lfsr[12] ^ lfsr[10];

    always @(posedge clk or negedge reset_n) begin 
        if(!reset_n) begin 
            lfsr <= RST_SEED; 
        end else if (enable == 1'b1) begin 
            lfsr <= {lfsr[14:0], feedback};
        end 
    end 
endmodule 