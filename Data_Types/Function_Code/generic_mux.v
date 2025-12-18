// function to choose the number of the selects based on the number of inputs that a mux has
function integer clogb2; 
    input [31:0] value; 
    integer i; 
    begin 
        clogb2 = 0; 
        for(i = 0; 2**i < value; i = i + 1) begin
            clogb2 = i + 1; 
        end
    end
endfunction


module generic_mux
#(
    parameter BUS_WIDTH = 8; 
    parameter NUM_SEL = 4; 
    parameter NUM_SEL_LOG = clogb2(NUM_SEL)
)
(
    // Module ports 
)

reg [NUM_SEL-1:0] sel; 
endmodule