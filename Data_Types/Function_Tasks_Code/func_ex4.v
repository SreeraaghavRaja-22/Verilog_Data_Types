`timescale 1us/1ns
module func_ex4(); 

    // Recursive Function Example
    function automatic integer fibonacci (input integer N);
        // Internal variable for intermediary results 
        // Have to be declared before "begin/end"
        integer result = 0; 
        begin 
            if(N==0) begin 
                result = 0; 
            end else if(N==1) begin 
                result = 1; 
            end else begin 
                result = fibonacci(N-1) + fibonacci(N-2);
            end 

            fibonacci = result;
        end 
    endfunction 

    initial begin
        #1; $display($time," fibonacci(2) = %d", fibonacci(2));
        #1; $display($time," fibonacci(12) = %d", fibonacci(12));
        #1; $display($time," fibonacci(22) = %d", fibonacci(22));
    end

endmodule