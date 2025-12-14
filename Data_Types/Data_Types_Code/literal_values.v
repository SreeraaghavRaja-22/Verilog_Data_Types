module literal_values();

    reg[7:0] my_var; 

    // All assignments are grouped in an 'initial' procedure
    initial begin 
        my_var = 8'd144; 
        // decimal 144 as all data types
        $display("my_var = %d", my_var);
        $display("my_var = %b", my_var);
        $display("my_var = %x", my_var);
        $display("my_var = %o", my_var);
        $display("my_var = %h\n", my_var); // can also use %h for hexadecimal
        $display("-----------------------");

        my_var = 8'h89;
        $display("my_var = %h", my_var);

        my_var = 8'b1000_1001; 
        $display("my_var = %b", my_var);

        my_var = 8'o211;
        $display("my_var = %o", my_var);

        my_var = 8'hZ4;                 // zzzz_0100
        $display("my_var = %b", my_var);

        my_var = 1'b1;                  // 8 bit variable gets 1 bit value
        $display("my_var = %b", my_var);

        my_var = 12'b1111_1111_0000;    // 8 bit variable get 12 bit value
        $display("my_var = %b", my_var);
    end 
endmodule