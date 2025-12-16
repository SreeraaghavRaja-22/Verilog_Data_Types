module hex_7seg_decoder(
    input [3:0] in, 
    output reg a, b, c, d, e, f, g,
    output dp
);

    always @(*) begin 
        case(in) 
            4'd0    : begin {a, b, c, d, e, f, g} = 7'b1111110; end // 7E
            4'd1    : begin {a, b, c, d, e, f, g} = 7'b0110000; end // 30
            4'd2    : begin {a, b, c, d, e, f, g} = 7'b1101101; end // 6d
            4'd3    : begin {a, b, c, d, e, f, g} = 7'b1111001; end // 79
            4'd4    : begin {a, b, c, d, e, f, g} = 7'b0110011; end // 33
            4'd5    : begin {a, b, c, d, e, f, g} = 7'b1011011; end // 5b
            4'd6    : begin {a, b, c, d, e, f, g} = 7'b1011111; end // 5F
            4'd7    : begin {a, b, c, d, e, f, g} = 7'b1110000; end // 70
            4'd8    : begin {a, b, c, d, e, f, g} = 7'b1111111; end // 7F
            4'd9    : begin {a, b, c, d, e, f, g} = 7'b1111011; end // 7b
            4'd10   : begin {a, b, c, d, e, f, g} = 7'b1110111; end // 77
            4'd11   : begin {a, b, c, d, e, f, g} = 7'b0011111; end // 1F
            4'd12   : begin {a, b, c, d, e, f, g} = 7'b1001110; end // 4E
            4'd13   : begin {a, b, c, d, e, f, g} = 7'b0111101; end // 3d
            4'd14   : begin {a, b, c, d, e, f, g} = 7'b1001111; end // 4F
            4'd15   : begin {a, b, c, d, e, f, g} = 7'b1000111; end // 47
            default : begin {a, b, c, d, e, f, g} = 7'b1111111; end // 7F
        endcase
    end 
    
    // could be either 0 or 1 depending on if we want it on or off
    assign dp = 1'b1; 

endmodule