module fsm1_tb(); 

    reg clk = 0; 
    reg rst_n; 
    reg validate_code; 
    reg [3:0] access_code; 
    wire open_access_door;
    wire [1:0] state_out;

    fsm1 FSM0(
        .clk(clk),
        .rst_n(rst_n),
        .validate_code(validate_code),
        .access_code(access_code), 
        .open_access_door(open_access_door),
        .state_out(state_out)
    );

    always begin #1; clk = ~clk; end 

    initial begin 
        $monitor($time, " access_code = %4b, state_out = %2b, open_access_door = %b", access_code, state_out, open_access_door);

        rst_n = 0; #2.5; rst_n = 1; // reset sequence
        validate_code = 0; access_code = 0; 
        @(posedge clk);             // invalid access code
        validate_code = 1; access_code = 0; 
        @(posedge clk);             // invalid access code
        validate_code = 1; access_code = 0; 
        @(posedge clk);             // valid access code
        validate_code = 1; access_code = 9; 
        @(posedge clk);             // disable validate code
        validate_code = 0; access_code = 9; 
        #40; $stop;
    end
endmodule