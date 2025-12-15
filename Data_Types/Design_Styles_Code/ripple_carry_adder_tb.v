module ripple_carry_adder_tb();

    reg [3:0] a; 
    reg [3:0] b; 
    reg cin; 
    wire [3:0] sum;
    wire cout; 
    parameter LOOP_LIM = 16;

    integer i, j; // used for verification

    ripple_adder_dataflow RC(
        .a(a), 
        .b(b),
        .cin(cin), 
        .sum(sum), 
        .cout(cout)
    );

    initial begin 
        $monitor("MON a = %b, b = %b, cin = %0b, sum = %b, cout = %0b", a, b, cin, sum, cout);
    end 

    initial begin 
        #1; a = 4'b0000; b = 4'b0000; cin = 0; 
        #1; a = 4'b0001; b = 4'b0000; cin = 1; 
        #1; a = 4'b0001; b = 4'b0001; cin = 0; 
        #1; a = 4'b0001; b = 4'b0001; cin = 1; 
        #1; a = 4'd3;    b = 4'd6;    cin = 0; 
        #1; a = 4'b1111; b = 4'b1111; cin = 1; 

        // for loop to do the same thing as above. 
        for (i = 0; i < LOOP_LIM; i = i + 1) begin 
            for (j = 0; j < LOOP_LIM; j = j + 1) begin 
                #1; a = i; b = j; cin = cin % 2;
            end
        end
    end
endmodule