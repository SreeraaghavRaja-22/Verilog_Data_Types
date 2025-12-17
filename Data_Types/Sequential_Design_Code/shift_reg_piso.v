// most complicated because we need to have a mux at the input of every register so that we can parallel load or we can serially push out
module shift_reg_piso(
    input reset_n, 
    input clk, 
    input sdi, 
    input pl, //preload
    input [3:0] d, 
    output sdo
);

    // Internal 4 bits wide register 
    reg [3:0] piso; 
    wire [3:0] data_src; // nets after the muxes

    // if pl == 1 uses the parallel input as the data source (use conditional operators)
    assign data_src = pl ? d : {piso[2:0], sdi};

    // Async negative reset is used
    always @(posedge clk or negedge reset_n) begin 
        if (!reset_n) begin 
            piso <= 4'b0000; 
        end else begin 
            piso[3:0] <= data_src; 
        end 
    end

    // Connect the sdo net to the register MSB
    assign sdo = piso[3];

endmodule 