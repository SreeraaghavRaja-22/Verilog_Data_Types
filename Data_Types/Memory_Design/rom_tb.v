`timescale 1us/1ns
module rom_tb();
    localparam WIDTH = 8; // localparam cannot be overridden while parameter can be overridden
    localparam DEPTH = 16; 
    localparam DEPTH_LOG = $clog2(DEPTH);

    reg clk = 0; 
    reg [DEPTH_LOG-1:0] addr_rd; 
    wire [WIDTH-1:0] data_out; 

    integer i; 

    rom #(.WIDTH(WIDTH), .DEPTH(DEPTH), .DEPTH_LOG(DEPTH_LOG))
    ROM0
    (
        .clk(clk), 
        .addr_rd(addr_rd), 
        .data_out(data_out)
    );

    always begin #0.5; clk = ~clk; end 

    initial begin 
        #1; 
        $display($time, " ROM Content: ");
        for(i = 0; i < DEPTH; i = i + 1) begin
            read_data(i); 
        end
        #40; $stop; 
    end

    // Read the data asynchronously
    task read_data(input[DEPTH_LOG-1:0] address_in);
        begin 
            @(posedge clk);
            addr_rd = address_in; 
            @(posedge clk);
            #0.1; // Wait for the data to propogate
            $display($time, ": address = %2d, data_rd = %x", addr_rd, data_out);
        end 
    endtask
endmodule