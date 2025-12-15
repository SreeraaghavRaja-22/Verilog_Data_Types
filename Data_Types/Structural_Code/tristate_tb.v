module tristate_tb();

    reg din;
    reg sel; 
    wire dout;

    tri_state_buffer TSB(
        .din(din), 
        .sel(sel),
        .dout(dout)
    );

    initial begin
        $monitor($time, ": din = %0b, sel = %0b, dout = %0b", din, sel, dout);
    end

    initial begin 
        #1; din = 0; sel = 0; // high-Z
        #1; din = 1; sel = 0; // high-Z
        #1; din = 0; sel = 1; // 0
        #1; din = 1; sel = 0; // high-Z
        #1; din = 1; sel = 1; // 1
        #2; din = 0;          // 0
        #5; $stop;
    end 

endmodule

        