module comparator_nbit
#(parameter N = 3)
(
    input [N-1:0] a, 
    input [N-1:0] b, 
    output reg altb, 
    output reg aeqb, 
    output reg agtb
);

    always @(*) begin 
        altb = (a < b);
        aeqb = (a == b); 
        agtb = (a > b);
    end
endmodule