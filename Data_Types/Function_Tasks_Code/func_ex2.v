module func_ex2(); 

    // Function to compare two integer number and outputs if they are equal
    // The result is either 0 (False) or 1 (True)
    function compare (input integer a, input integer b);
        begin 
            compare = (a == b);
        end
    endfunction

    // variables used for stimulus 
    integer a, b; 

    initial begin 
        $monitor($time,": a = %d, b = %d, compare = %d", a, b, compare(a,b));

        #1; a = 1; b = 2; 
        #1; a = 33; b = 44; 
        #1; a = 67; b = 67; 
        #1; a = 0; b = 256; 
        #1; a = 1<<31; b = 1<<31; 
        #1; 
    end

endmodule 