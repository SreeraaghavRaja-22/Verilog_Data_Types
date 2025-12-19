module ram_dp_async_read
#(parameter WIDTH = 8, 
  parameter DEPTH = 16, 
  parameter DEPTH_LOG = $clog2(DEPTH))
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

    // Write is synchronous
    always @(posedge clk) begin 
        if(wr_n) begin
            ram[addr_wr] <= data_wr;
        end
    end

    // Read is asynchronous
    assign data_rd = ram[addr_rd];
endmodule