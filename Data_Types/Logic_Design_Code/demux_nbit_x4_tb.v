module demux_nbit_x4_tb();
    
    parameter BUS_WIDTH = 8; 
    reg [BUS_WIDTH-1:0] y; 
    reg [1:0] sel; 
    wire [BUS_WIDTH-1:0] a, b, c, d; 
    integer i, j; 

    demux_nbit_x4 
    #(.BUS_WIDTH(BUS_WIDTH))
    DMUX (
        .y(y), 
        .sel(sel), 
        .a(a), 
        .b(b), 
        .c(c), 
        .d(d)
    );

    initial begin 
        $monitor($time, ": y = %d, sel = %d, a = %d, b = %d, c = %d, d = %d", y, sel, a, b, c, d);
    end 

    initial begin 
        for(i = 0; i < 2**BUS_WIDTH -1; i = i + 1) begin 
            #1; y = i;
        end 
    end 

    initial begin 
        for(j = 0; j < 4; j = j + 1) begin 
            #1; sel = j; 
        end 
    end

endmodule