// Single Port RAM with synchronous read
// The size of the RAM is 16 x 8bit words
module ram_sp_sync_read(
    input clk, 
    input [7:0] data_in, 
    input [3:0] address, 
    input write_en, 
    output [7:0] data_out
);

    // Declare a bidimensional array for the RAM
    reg [7:0] ram [0:15];
    reg [3:0] addr_buff; // address buffer

    // RAMs don't have reset 
    // The default value of from each location is X
    // The write is synchronous 
    always @(posedge clk) begin 
        if(write_en) begin 
            ram[address] <= data_in;
        end 
        addr_buff <= address; 
    end

    // The read is synchronous as the address was buffered on the clk using addr_buff (just a register between RAM and address)
    assign data_out = ram[addr_buff];
endmodule 