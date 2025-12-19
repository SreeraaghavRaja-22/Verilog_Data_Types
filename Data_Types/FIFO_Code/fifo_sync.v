module fifo_sync
#(
    parameter FIFO_DEPTH = 8, 
    parameter DATA_WIDTH = 32)
(
    input clk, 
    input rst_n, 
    input cs, 
    input wr_en, 
    input rd_en, 
    input [DATA_WIDTH-1:0] data_in, 
    output reg [DATA_WIDTH-1:0] data_out,
    output empty, 
    output full
);

    localparam [DATA_WIDTH-1:0] FIFO_DEPTH_LOG = $clog2(FIFO_DEPTH);

    // Declare a by-dimensional arary to store the data 
    reg [DATA_WIDTH-1:0] fifo [0:FIFO_DEPTH-1];

    // Wr/Rd pointer have 1 extra bits at MSB
    reg [FIFO_DEPTH_LOG:0] write_pointer; 
    reg [FIFO_DEPTH_LOG:0] read_pointer; 

    always @(posedge clk or negedge rst_n) begin 
        if(!rst_n) begin
            write_pointer <= 0; 
        end else if(cs & wr_en && !full) begin
            write_pointer <= write_pointer + 1'b1; 
        end 
    end

    
    always @(posedge clk or negedge rst_n) begin 
        if(!rst_n) begin
            read_pointer <= 0; 
        end else if(cs & rd_en && !empty) begin
            read_pointer <= read_pointer + 1'b1; 
        end 
    end

    // Declare the empty/full logic
    assign empty = (read_pointer == write_pointer);
    assign full = (read_pointer == {~write_pointer[FIFO_DEPTH_LOG], write_pointer[FIFO_DEPTH_LOG-1:0]});

    always @(posedge clk) begin 
        if(cs && wr_en && !full) begin 
            fifo[write_pointer[FIFO_DEPTH_LOG-1:0]] <= data_in; 
        end 
    end

    always @(posedge clk or negedge rst_n) begin 
        if(!rst_n) begin
            data_out <= 0; 
        end else if(cs && rd_en && !empty) begin
            data_out <= fifo[read_pointer[FIFO_DEPTH_LOG-1:0]];
        end 
    end
endmodule