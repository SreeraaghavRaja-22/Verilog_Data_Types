module easy_vectors_example(); 

    reg [7:0] a = 0;    // 8bitregister (MSB position 7, LSB position = 0)
    reg [6:0] b = 0;    // 7bit register 
    reg [7:0] d = 0;    // 8bit register 

    wire [1:0] c;       // 2bit net

    // Continuous assignment between net and register 
    // c[1] = a[3];
    // c[0] = a[2];
    assign c[1:0] = a[3:2]; // this is called 'bit slicing'

    // Procedure used to monitor a, b, c, and d (have to change one variable -- needs another procedure to monitor the changes)
    initial begin 
        $monitor("PROC2 a = %b, b = %b, c = %b, d = %b", a, b, c, d);
    end 

    // PROCEDURE 2 to change variables 
    initial begin 
        // Change only teh value of 'a' to see the effect on c 
        #1 a = 1; 
        #1 a = 8'b1111_0101; 
        #1 a = 8'b1111_1001;
        #1 a = 8'b0001_1000;
        #1 a = 8'b0;

        #1 b = 7'b111_1111; // change the value of b
        #1 d[3:0] = a[3:0]; // change the value of d to be equal to some part of a 
        #1 d[7:4] = b[4:1]; // change the upper nibble of d to be some part of b 

        #1 a = 8'b0000_1110; // Change the value of a

        // Concatenation Examples
        #1 d = {a[3:0], b[3:0]}; 
        #1 d = {b[3:0], a[7:4]}; 
    end 
endmodule