// ts more of a mux ngl
module encoder_2to1(
    input a[1:0],
    input enable,
    output reg y
);

    always @(*) begin 
        if (enable == 0) begin 
            y = a[0];
        end else begin 
            y = a[1];
        end
    end 
    
endmodule