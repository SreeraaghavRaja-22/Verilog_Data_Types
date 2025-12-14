module relational_operators();
    reg result; 

    initial begin 
        $monitor("MON result = %1b", result);
    end 

    initial begin 
        #1; result = 3 < 0; 
        #1; result = 3 > 6'b00_0011; // 3 < 3??
        #1; result = 6 >= 115; 
        #1; result = 4'b0101 <= 4'b1010; 
    end 
endmodule