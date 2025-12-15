module some_logic_tb();

    reg a; 
    reg b; 
    wire c; 

    some_logic SOME(.a(a), .b(b), .c(c));

    initial begin 
        $monitor($time, ": a = %b, b = %b, c = %b", a, b, c);
        #1; a = 0; b = 0; 
        #1; a = 1; b = 0; 
        #1; a = 0; b = 1; 
        #1; a = 1; b = 1; 
        #1; 
    end 
    
endmodule