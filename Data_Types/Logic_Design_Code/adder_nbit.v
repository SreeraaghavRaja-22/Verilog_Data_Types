module adder_nbit
    // parameter selection
    #(parameter N = 3)

    // ports selection
    (input [N-1:0] a, 
     input [N-1:0] b, 
     output reg [N:0] sum
    );

    // Wildcard operator for the procedure's sensitivity list 
    always @(*) begin
        // sum = a + b; 
        sum[N:0] = a[N-1:0] + b[N-1:0];
    end
endmodule
