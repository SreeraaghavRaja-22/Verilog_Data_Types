module shift_reg_sipo_tb(); 

    reg clk = 0;  
    reg reset_n; 
    reg sdi; 
    wire [3:0] q; 
    integer i; 
    parameter MAX = 1 << 4; 
    parameter CLK_POS_DUTY = 0.5;

    shift_reg_sipo SRS(
        .clk(clk), 
        .reset_n(reset_n), 
        .sdi(sdi), 
        .q(q)
    );

    always begin 
        #CLK_POS_DUTY; clk = ~clk; 
    end

    initial begin 
        $monitor($time, ": clk = %0b, reset_n = %0b, sdi = %0b, q = %d", clk, reset_n, sdi, q);

        #1; reset_n = 0; sdi = 0; // apply reset to circuit
        #1.3; reset_n = 1; // release the reset 

        repeat(2) @(posedge clk); // wait for 2 clock cycles

        // Set sdi for 1 clock 
        @(posedge clk); sdi = 1'b1; @(posedge clk); sdi = 1'b0;

        // set sdi for 2 clock
        repeat(4) @(posedge clk);
        @(posedge clk); sdi = 1'b1; 
        repeat(2) @(posedge clk); sdi = 1'b0;

        repeat(3) @(posedge clk); sdi = 1'b1; 
        @(posedge clk); sdi = 1'b0; 
        @(posedge clk); sdi = 1'b1; 
        @(posedge clk); sdi = 1'b0; 
    end

    // this will stop the simulator when the time expires
    initial begin 
        #50; $finish; 
    end 
    
endmodule