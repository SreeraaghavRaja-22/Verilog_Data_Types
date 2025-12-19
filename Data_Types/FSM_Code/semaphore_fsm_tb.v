`timescale 1us/1ns
module semaphore_fsm_tb(); 

    reg clk = 0; 
    reg rst_n; 
    reg enable; 
    wire red, yellow, green; 
    wire [3:0] state_out; 

    // Parameters used for testbench flow
    parameter[3:0] OFF      = 4'b0001, 
                   RED      = 4'b0010,
                   YELLOW   = 4'b0100,
                   GREEN    = 4'b1000;

    // Instantiate the module 
    semaphore_fsm SEM0(
        .clk(clk),
        .rst_n(rst_n), 
        .enable(enable),
        .red(red),
        .yellow(yellow),
        .green(green),
        .state_out(state_out)
    );

    initial begin
        forever begin
            #0.5; clk = ~clk; 
        end
    end

    initial begin
        $monitor($time, ": enable = %0b, red = %b, yellow = %0b, green = %b", enable, red, yellow, green);

        rst_n = 0; #2.5; rst_n = 1; // reset sequence
        enable = 0; 
        repeat(10) @(posedge clk);  // wait some time
        enable = 1; 

        // Let the semaphore cycle 2 times
        repeat(2) begin
            wait (state_out === GREEN);
            @(state_out); // wait for GREEN to be over
        end

        // Disable the semaphore during Yellow state 
        wait (state_out === YELLOW);
        @(posedge clk); enable = 0; 

        // Enable the semaphore again
        repeat (10) @(posedge clk); 
        @(posedge clk); enable = 1; 

        #50; $stop; 
    end

endmodule