module ripple_adder_tb();

    reg [3:0] a;
    reg [3:0] b; 
    reg cin;
    wire [3:0] sum; 
    wire cout; 
    
    integer i, j; 
    parameter LOOP_LIM = 16; 

    ripple_adder_behavioral RAB(
        .a(a), 
        .b(b), 
        .cin(cin), 
        .sum(sum), 
        .cout(cout)
    );

    initial begin 
        for(i = LOOP_LIM; i > 0; i = i-1) begin 
            for(j = LOOP_LIM; j > 0; j = j - 1) begin 
                a =  i; b = j; cin = i % 2; 
                #1; $display($time, ": a = %d, b = %0d, cin = %0b, sum = %0d, cout = %b", a, b, cin, sum, cout);
            end
        end

        #10; $stop;
    end
endmodule
