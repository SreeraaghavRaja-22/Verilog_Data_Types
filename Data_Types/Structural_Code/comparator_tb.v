module comparator_tb();

    reg a; 
    reg b; 
    wire altb;
    wire aeqb; 
    wire agtb; 

    integer i, j;
    parameter LOOP_LIM = 2;

    comparator_1bit COMP(
        .a(a), 
        .b(b),
        .altb(altb), 
        .aeqb(aeqb),
        .agtb(agtb)
    );

    initial begin 
        $monitor($time, ": a = %b, b = %b, altb = %b, aeqb = %b, agtb = %b", a, b, altb, aeqb, agtb);

        for(i = 0; i < LOOP_LIM; i = i + 1) begin 
            for(j = 0; j < LOOP_LIM; j = j + 1) begin 
                  #1; a = i; b = j;
            end 
        end
        #5; $stop; 
    end 
endmodule