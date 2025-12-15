module full_adder_tb();

    reg a; 
    reg b; 
    reg cin; 
    wire sum; 
    wire cout; 

    full_adder_behavioral FA(
        .a(a),
        .b(b), 
        .cin(cin), 
        .sum(sum), 
        .cout(cout)
    );

    initial begin 
        $monitor("MON a = %0b, b = %0b, c = %0b, sum = %0b, cout = %0b", a, b, cin, sum, cout);
    end

    initial begin 
        #1; a = 0; b = 0; cin = 0; 
        #1; a = 0; b = 0; cin = 1; 
        #1; a = 0; b = 1; cin = 0; 
        #1; a = 0; b = 1; cin = 1; 
        #1; a = 1; b = 0; cin = 0; 
        #1; a = 1; b = 0; cin = 1; 
        #1; a = 1; b = 1; cin = 0; 
        #1; a = 1; b = 1; cin = 1; 
        #1; a = 0; b = 0; cin = 0; 
        #1; 
    end
endmodule
