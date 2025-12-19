module ram_dp_sync_read
#(parameter WIDTH = 8, 
  parameter DEPTH = 16, 
  parameter DEPTH_LOG = $clog(DEPTH))
(
 input clk, 
 input wr_n,
 input [DEPTH_LOG-1:0] addr_wr, 
 input [DEPTH_LOG-1:0] addr_rd,
 input [WIDTH-1:0] data_wr, 
 output [WIDTH-1:0] data_rd 
);

    // declare the RAM array
    reg [WIDTH-1:0] ram [0:DEPTH-1];
    reg [DEPTH_LOG-1:0] addr_buff;

    // Write is synchronous
    always @(posedge clk) begin 
        if(we_n) begin
            ram[addr_wr] <= data_wr;
        end
        addr_buff <= addr_rd;
    end

    // Read is asynchronous
    assign data_rd = ram[addr_buff];
endmodule