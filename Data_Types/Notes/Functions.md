# Functions

## Facts About Testbenches in Verilog

- Complex circuits may have many inputs -> increased complexity for stimulus generation
- Observing the output data -> requires many variables that need to be logged
- Checking the output data -> outputs must be validated by comparing with an expected value for each relevant combination of the inputs
- Writing **inline code** -> scalability issues, prone to errors, hard to maintain and develop
- **Recurrent** pieces of code can be grouped into **functions and tasks**
  
## Verilog Functions Information

- Used to get the result of some operations performed between variables
- Does NOT consume simulation time
- Has at least one input
- Can be used to model combinational circuits (synthesizable)
- CANNOT contain time-dependent statements (#, wait, @, posedge, etc...)
- Can have multiple inputs
- CANNOT have **output** or **inout** arguments
- CANNOT call tasks
- The **name of the function** is the output
- Makes code reusable annd maintainable


## Verilog Recursive Functions