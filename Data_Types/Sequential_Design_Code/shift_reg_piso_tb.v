module shift_reg_piso_tb(); 

    // Testbench variables 
    reg sdi; 
    reg [3:0] d; 
    reg preload; 
    reg clk = 0; 
    reg reset_n; 
    wire sdo; 
    parameter CLK_POS_DUTY = 0.5;

    shift_reg_piso PISO0(
        .reset_n(reset_n), 
        .clk(clk), 
        .sdi(sdi), 
        .pl(preload), 
        .d(d), 
        .sdo(sdo)
    );

    // create the clock signal 
    always begin 
        #CLK_POS_DUTY; clk = ~clk; 
    end 

    initial begin 
        #1; // apply reset to the circuit; 
        reset_n = 0; sdi = 0; preload = 0; d = 0; 
        #1.3; // release the reset
        reset_n = 1; 

        // Preload the register with the value 4'b0101 and let it shift
        @(posedge clk); d = 4'b0101; preload = 1; @(posedge clk); preload = 0; 
        repeat (5) @(posedge clk);
    end

    // this will stop the simulator when the time expires
    initial begin 
        #20; $stop; 
    end 

endmodule 