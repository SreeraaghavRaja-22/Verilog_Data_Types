// Single port RAM with asynchronous read
// The size of the RAM is 16 x 8bit words
module ram_sp_async_read(
    input clk, 
    input [7:0] data_in,    // 8bit input word
    input [3:0] address,    // for 16 locations
    input write_en,         // active high
    output [7:0] data_out   // 8bit output word
);

    // declare a bidimensional array for RAM
    reg [7:0] ram [0:15]; // each  row is 8 bits wide and there are 16 rows in matrix == ram[address][bit]

    // Rams don't have reset 
    // The default value from each location is X
    // The write is synchronous
    always @(posedge clk) begin 
        if(write_en) begin 
            ram[address] <= data_in; 
        end
    end

    // Asynchronous Read
    assign data_out = ram[address];

endmodule