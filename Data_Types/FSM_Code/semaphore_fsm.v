// Traffic Light Controller
module semaphore_fsm(
    input clk, 
    input rst_n, 
    input enable, 
    output reg red, 
    output reg yellow, 
    output reg green,
    output [3:0] state_out // used for debug
);

    // Declare the state values as parameeters using ONE-HOT encoding
    parameter [3:0] OFF     = 4'b0001, 
                   RED      = 4'b0010,
                   YELLOW   = 4'b0100,
                   GREEN    = 4'b1000;
    
    // declare the logic for the state machine 
    reg[3:0] state, next_state; 
    reg [5:0] timer; // the counter that keeps the gate open 
    reg timer_clear; // when set it resets the timer value

    // next state logic
    always @(*) begin 
        next_state = OFF; // make this next_state = state for registered behavior; 
        red = 0; 
        yellow = 0; 
        green = 0; 
        timer_clear = 0; 
        case (state) 
            OFF         :   begin 
                                if(enable) begin next_state = RED; end 
                            end 
            RED         :   begin 
                                red = 1; 
                                if(timer == 6'd50) begin 
                                    next_state = YELLOW; 
                                    timer_clear = 1; 
                                end else begin 
                                    next_state = RED; // don't do this ngl
                                end
                            end
            YELLOW      :   begin 
                                yellow = 1; 
                                if(timer == 6'd10) begin
                                    next_state = GREEN; 
                                    timer_clear = 1; 
                                end else begin 
                                    next_state = YELLOW;
                                end
                            end
            GREEN       :   begin 
                                green = 1; 
                                if(timer == 6'd30) begin // use == for area optimization
                                    next_state = RED;
                                    timer_clear = 1; 
                                end else begin 
                                    next_state = GREEN; 
                                end 
                            end
            default     :   begin next_state = OFF; end
        endcase

        // return from any state to off if enable == 0; 
        if(!enable) begin 
            next_state = OFF; 
        end 
    end

    // State Sequencer Logic
    always @(posedge clk or negedge rst_n) begin 
        if(!rst_n) begin
            state <= OFF; 
        end else begin 
            state <= next_state;
        end
    end

    assign state_out = state; 
    // Timer logic; 
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            timer <= 6'd0; 
        end else if((timer_clear == 1) || (!enable)) begin
            timer <= 6'd0; 
        end else if(state != OFF) begin 
            timer <= timer + 1'b1; 
        end 
    end 
endmodule 

