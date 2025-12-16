module priority_encoder_4to2(
    input [3:0] d, 
    output reg [1:0] q,
    output reg v
);

    always @(d) begin 
        if (d[3]) begin 
            q = 2'd3;
        end else if(d[2]) begin 
            q = 2'd2;
        end else if(d[1]) begin 
            q = 2'd1;
        end else begin 
            q = 2'd0;
        end
    end

    always @(*) begin 
        if (!d)
            v = 0; 
        else
            v = 1; 
    end 

endmodule