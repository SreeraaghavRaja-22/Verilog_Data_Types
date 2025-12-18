`timescale 1us/1ns
module tasks_meters_to_feet();

// Testbench variables 
real meters, feet; 
reg clk = 0; 
integer i; 
parameter MAX = 67;

    // Inputs and outputs can be real numbers
    task meters_to_feet (input real meters, output real feet);
        begin 
            feet = meters * 3.2808; 
        end 
    endtask

    // Create a clock signal
    always begin #0.5; clk = ~clk; end 

    // Call the task
    initial begin 
        $monitor($time, ": meters = %0.4f, feet = %0.4f", meters, feet);

        for(i = 0; i < MAX; i = i + 1) begin 
            @(posedge clk) meters = i; meters_to_feet(meters, feet);
        end 

        repeat(10) @(posedge clk); $finish; 
    end 

endmodule 