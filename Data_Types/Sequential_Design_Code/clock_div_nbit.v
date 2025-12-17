module clock_div_nbit
#(parameter CNT_WIDTH = 4)
(
    input clk, 
    input reset_n, 
    output reg clk_div2,
    output [CNT_WIDTH-1:0] counter
);

    always @(posedge clk or negedge reset_n) begin 
        if(!reset_n) begin 
            clk_div2 <= 0; 
        end else begin 
            clk_div2 <= ~clk_div2; 
        end
    end

    // instantiate a parameterizable module 
    // with a new parameter volue 
    counter_nbit
    #(.N(CNT_WIDTH))
    CNT_NBIT0
    (.clk(clk_div2),
     .reset_n(reset_n),
     .counter(counter)
    );
endmodule 