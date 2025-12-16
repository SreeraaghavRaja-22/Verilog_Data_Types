`timescale 1us/1ns
module alu_tb(); 

    // TESTBENCH VARIABLES
    parameter BUS_WIDTH = 8; 
    reg [BUS_WIDTH - 1:0] a, b;  
    reg carry_in;
    reg [3:0] opcode; 
    wire [BUS_WIDTH -1:0] y; 
    wire carry_out, borrow, zero, parity, invalid_op; 

    alu 
    #(.BUS_WIDTH(BUS_WIDTH))
    ALU1(
        .a(a),
        .b(b), 
        .carry_in(carry_in), 
        .opcode(opcode),
        .y(y),
        .carry_out(carry_out), 
        .borrow(borrow), 
        .zero(zero), 
        .parity(parity), 
        .invalid_op(invalid_op)
    ); 

    initial begin 
        $monitor($time, ": a = %d, b = %d, carry_in = %b, opcode = %d, y = %d, carry_out = %b, borrow = %b, zero = %b, parity = %b, invalid_op = %0b", a, b, carry_in, opcode, y, carry_out, borrow, zero, parity, invalid_op);

        #1; $display("\nInvalid OP Test");
        opcode = 10; a = 10; b = 10; carry_in = 0; 

        #1; $display("\nOP_ADD Test"); 
        opcode = 1;

        #1; $display("\nOP_ADD_CARRY Test");
        opcode = 2; carry_in = 1; 

        #1; $display("\nOP_SUB Test");
        opcode = 3; a = 11; b = 12; // borrow = 1; 
        #1; opcode = 3; a = 12; b = 11; // borrow = 0;

        #1; $display("\nOP_INC Test");
        opcode = 4; a = 15; 

        #1; $display("\nOP_DEC Test");
        opcode = 5;

        #1; $display("\nOP_AND Test");
        opcode = 6; a = 8'b0101_0101; b = 8'b0101_0101; 

        #1; $display("\nOP_NOT Test");
        opcode = 7; 

        #1; $display("\nOP_ROL Test");
        opcode = 8; a = 8'b0000_0001; 

        #1; $display("\nOP_ROR TEST");
        opcode = 9; 
        #5; 
    end 
endmodule

