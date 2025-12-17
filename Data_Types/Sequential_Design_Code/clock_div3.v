module clock_div3(
    input clk, 
    input reset_n, 
    output clock_out
);

    // Internal variables for FFs
    reg qa, qb, qc;

    always @(posedge clk or negedge reset_n) begin 
        if(!reset_n) begin 
            qa <= 1'b0; 
            qb <= 1'b0;
        end else begin 
            qa <= ~(qa) & ~(qb); 
            qb <= qa;
        end 
    end 

    // always @(posedge clk or negedge reset_n) begin 
    //     if(!reset_n) begin 
    //         qb <= 0; 
    //     end else begin 
    //         qb <= qa; 
    //     end 
    // end

    always @(negedge clk or negedge reset_n) begin 
        if(!reset_n) begin 
            qc <= 0; 
        end else begin 
            qc <= qb; 
        end
    end 

    assign clock_out = qb | qc; 

endmodule 