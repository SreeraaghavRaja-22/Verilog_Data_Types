module fsm1(
    input clk, 
    input rst_n, 
    input validate_code, 
    input [3:0] access_code,    // 4bit metro access code
    output reg open_access_door, 
    output [1:0] state_out      // used for debug
);

    // Declare the state values as parameters
    parameter [1:0] IDLE            = 2'b00, 
                    CHECK_CODE      = 2'b01,
                    ACCESS_GRANTED  = 2'b10;
    
    // Declare the logic for the state machine
    reg[1:0] state;         // sequential part
    reg[1:0] next_state;    // combinational part
    reg[3:0] timer;         // the counter that keeps the gate open

    // Next state logic
    always @(*) begin 
        next_state = IDLE;      // default values
        open_access_door = 0;   // door is closed 
        case(state)
            IDLE:           begin 
                                if(validate_code) begin next_state = CHECK_CODE; end
                            end
            CHECK_CODE:     begin
                                if((access_code >= 4'd4) && (access_code <= 4'd11)) begin next_state = ACCESS_GRANTED; end
                            end
            ACCESS_GRANTED: begin 
                                open_access_door = 1; 
                                if(timer == 4'hF) begin 
                                    next_state = IDLE; 
                                end else begin
                                    next_state = ACCESS_GRANTED; 
                                end
                            end
            default: next_state = IDLE; // best practice
        endcase
    end

    // State sequencer logic
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            state <= IDLE;
        end else begin
            state <= next_state; 
        end
    end

    assign state_out = state; // connect with output port

    // Timer logic; 
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin 
            timer <= 0; 
        end else if(state == ACCESS_GRANTED) begin 
            timer <= timer + 1'b1; // only increment timer here
        end else
            timer <= 0; 
    end
endmodule 



                