`timescale 1us/1ns
module ram_sp_async_read_tb(); 

    // Testbench Variables
    reg clk = 0; 
    reg [7:0] data_in;
    reg [3:0] address;
    reg write_en; 
    wire [7:0] data_out; 
    reg[1:0] delay; 
    reg[7:0] wr_data; 

    integer success_count, error_count, test_count; 
    integer i; 

    parameter CLK_HALF_PERIOD = 0.25;
    parameter MAX_ADDRESSES = 16;


    // Instantiate the DUT
    ram_sp_async_read RAM0(
        .clk(clk), 
        .data_in(data_in),
        .address(address), 
        .write_en(write_en), 
        .data_out(data_out)
    );

    task write_data(input[3:0] address_in, input[7:0] d_in);
        begin 
            @(posedge clk); 
            write_en = 1; 
            address = address_in; 
            data_in = d_in; 
        end
    endtask

    task read_data(input[3:0] address_in);
        begin 
            @(posedge clk) // sync to posedge of clock (why?)
            write_en = 0; 
            address = address_in; 
        end
    endtask

    task compare_data(input[3:0] address, input[7:0] expected_data, input[7:0] observed_data);
        begin 
            if(expected_data === observed_data) begin 
                $display($time, " SUCCESS address = %0d, expected_data = %2x, observed_data = %2x", address, expected_data, observed_data);
                success_count = success_count + 1; 
            end else begin 
                $display($time, " ERROR address = %0d, expected_data = %2x, observed_data = %2x", address, expected_data, observed_data);
                error_count = error_count + 1; 
            end 
            test_count = test_count + 1; 
        end 
    endtask 

    // Create Clock Signal
    always begin #CLK_HALF_PERIOD; clk = ~clk; end 

    // Stimulus Generation
    initial begin
        #1; 
        // Clear the satatistics counter
        success_count = 0; error_count = 0; test_count = 0; 
    
        #1.3; 
        for(i = 0; i < MAX_ADDRESSES + 1; i = i + 1) begin 
            wr_data = $random; 
            write_data(i, wr_data); // Write random data to an address
            read_data(i);           // Read address back
            #0.1;                   // Wait for output to stabilize
            compare_data(i, wr_data, data_out);
            delay = $random; 
            #(delay);               // wait between tests
        end 

        read_data(7);   // Show the read behavior 
        read_data(8);

        // Print Statistics 
        $display($time, " TEST RESULTS success count = %0d, error_count = %0d, test_count = %0d", success_count, error_count, test_count);
        #40; $stop; 
    end 

endmodule 