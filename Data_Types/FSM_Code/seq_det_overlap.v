module seq_det_overlap(
    input clk, 
    input rst_n, 
    input seq_in, 
    output reg detected, 
    output [1:0] state_out // used for debug
);


    // Declare the state values as parameters
    parameter [1:0] S1      = 2'd0, 
                    S10     = 2'd1, 
                    S101    = 2'd2;

    // Declare the logic for the state machine
    reg [3:0] state, next_state; 

    always @(*) begin
        detected = 1'b0; // area optimization
        case(state) 
            S1  :   begin // wait for the first 1
                        if (seq_in == 1) begin
                            next_state = S10;
                        end else begin
                            next_state = S1;
                        end
                    end
            S10 :   begin // wait for a 0
                        if (seq_in == 0) begin
                            next_state = S101; 
                        end else begin 
                            next_state = S10; 
                        end 
                    end
            S101:   begin // wait for a 1
                        if(seq_in == 1) begin
                            next_state = S10; // overlapping part
                            detected = 1'b1;
                        end else begin
                            next_state = S1; // go back to S1 if we detect a 0 (can't overlap)
                        end
                    end
            default: next_state = S1; // Best practice
        endcase
    end 

    always @(posedge clk or negedge rst_n) begin 
        if(!rst_n) begin 
            state <= S1; 
        end else begin
            state <= next_state; 
        end
    end

    assign state_out = state; // connect with output port

endmodule

                    