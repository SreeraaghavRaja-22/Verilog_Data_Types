`timescale 1us/1ns

module demux_tb();

    reg x; 
    reg sel; 
    wire y0; 
    wire y1; 

    demux_1bit DMUX(
        .x(x), 
        .sel(sel), 
        .y0(y0), 
        .y1(y1)
    );

    // Toggle data source (x)
    initial begin 
        #1; x = 1; 
        #1; x = 0; 
        #2; x = 1; 
        #1.5; x = 0; 
        #0.5; x = 1; 
        #2; 
    end 

    // Toggle select line (sel)
    initial begin
        #1; sel = 0; 
        #1; sel = 1; 
        #2; sel = 1; 
        #1.8; sel = 0; 
        #1; sel = 1; 
        #1; sel = 0;
        #5; 
    end 

endmodule
