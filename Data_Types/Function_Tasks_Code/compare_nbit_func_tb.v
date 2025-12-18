module compare_nbit_func_tb(); 

    // testbench variables
    parameter CMP_WIDTH = 4; 
    reg [CMP_WIDTH-1:0] a, b; 
    wire greater, equal, smaller; 
    integer i, j; 
    parameter MAX = 1<<4; 

    // Instantiate the DUT
    compare_nbit_func
        #(.CMP_WIDTH(CMP_WIDTH))
    CMP0
    (.a(a), 
     .b(b), 
     .greater(greater),
     .equal(equal),
     .smaller(smaller)
    );

    initial begin 
        $monitor($time, ": a = %d, b = %d, greater = %0b, equal = %0b, smaller = %0b", a, b, greater, equal, smaller);

        for(i = 0; i < MAX; i = i + 1) begin 
            for(j = MAX; j >= 0; j = j - 1) begin
                #1; a = i; b = j; 
            end 
        end

    #1; $stop; 
    end 
endmodule 
