# Functions and Tasks

## Functions

### Facts About Testbenches in Verilog and Functions

- Complex circuits may have many inputs -> increased complexity for stimulus generation
- Observing the output data -> requires many variables that need to be logged
- Checking the output data -> outputs must be validated by comparing with an expected value for each relevant combination of the inputs
- Writing **inline code** -> scalability issues, prone to errors, hard to maintain and develop
- **Recurrent** pieces of code can be grouped into **functions and tasks**
  
### Verilog Functions Information

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

### Verilog Recursive Functions

- If function can call itself, then it is a **recursive** function (**re-entrant**)
- Recursive functions require the word "**automatic**" in the function prototype
- Factorial: Fn = N * Fn-1, F0 = 1;
- Fibonacci Sequence: Fn = Fn-1 + Fn-2, F1 = 1; F0 = 0;

## Tasks

### Tasks Information

- Is a procedure that has inputs and outputs
- Can have multiple **output** results, or **inout** type arguments
- Can "consume time" using @, wait(), posedge, etc...
- Can call other tasks/functions
- They are mostly used in testbenches
- Try to declare inputs and outputs inside task instantiation()

## Software Approach

- Why do we need this 'software' approach in a Hardware Description Language?
  - Modern SoC (System-on-a-Chip) designs are very complex and contain millions of transistors grouped in analog and digital blocks
  - To manually generate stimulus and observe the outputs for chips with hundreds of I/O ports it is simply an impossible task
  - The verification effort (time + talent) in modern chips is around 50-60% overall cost
  - It's best to have all the stimulus written in a scalable and easy-to-maintain way
  - If a **bug** ends in the final p[roduct, it's very hard to fix/mitigate, so you want to be sure that the chip behaves as the specification requires!
  - Verilog **Tasks** and **Functions** are highly used in the testbench side for **Functional Verification**

## Automated Verification

- It is a complex design with many combinational operations
- WE can do extensive exercise to gain more task/functions experience
- You will automatically generate stimulus and evaluate outputs for a circuit with 9 distinct functions
- The design has one small bnug that we are going to find using randomized automatic verification that uses a **GOLDEN** model

### Golden Model

- Unclocked **behavioral** model of a module / system that can be used to verify the functionality of an RTL / gate design
- it should have the expected behavior form the functional specification and is used to build the expected output results for any input stimulus combination
- It is used to build **self-checking** testbenches
