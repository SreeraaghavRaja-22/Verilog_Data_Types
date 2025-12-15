# Design Styles

## Design Styles Information

- HDL code written in a specific manner that achieves the desired behavior
- Structural
- Dataflow
- Behavioral

## Structural

- Connected to different modules to obtain desired functionality (top-level integration)
- Inputs and outputs od different modules are connected to each other using nets

### More on Structural Design

- Used in design and verification
- Connect modules (components) for **top-level integration**
- Introduces the concept of heirarchy in a design
- Simple modules can be designed using **Verilog Built-In Primitives**

### Verilog Built-In Primitives

- Provide a way for gate and switch modeling (transistor circuits)
- Have 1 output and n inputs depending on the type of gate
- used to describe the concent of a Verilog **netlist** (a list of interconnected logic gates - the digital circuit)
- **Logic Gates:** and, nand, or, nor, xor, xnor, buf, not
- **Buffer / Inverter:** bufif0, bufif1, notif0, notif1
- **MOS / CMOS / Bidirectional Pass:** nmos, pmos, rnmos, rpmos, cmos, rcmos, rtranif0, rtranif1, tranif1, tran, rtran
- **Pullup / Pulldown:** pullup, pulldown
- Syntax:
  - gate(drive_strength) #(delays) instance_name[range] (list of ports);

### Multiplexer

- Circuit used to route multiple data sources to the same destination (on the same line)
- Similar to a switch that selects between sources
- Has at least 1 select line
- 1bit can switch between 2 data sources
- A multiplexer with 2^n inputs requires n select bits

- Can be implmeneted with Tristate Buffers
- Output has to be a net connected to both buffers

### Demultiplexer

- Circuit used to route one data source on multiple lines (decoder)
- Does the reverse operation as a mux
- Has at least 1 select line
- 1bit select can switch between 2 data destinations
- A demux with n select bits and 2^n outputs

### Tri-State Buffer

- Like a switch, it disconnects a circuit output from the destination net
- 1 data input DIN
- 1 select bit SEL (active-low or active-high depending on design)
- 1 output line DOUT

### Comparator (magnitude comparator)

- Looking at 1 bit case
- compares 2 binary numbers
- only one of the outputs will be asserted (1'b1)
- 3 outputs:
  - A < B
  - A == B
  - A > B

## Dataflow

- Write logic oprations (boolean) using bit-wise / reduction / shift / arithmetic operators
- Used to model **combinational logic** (boolean expression or circuit)
- Uses the **assign** keyword (continuous assignment)
  - LEFT HAND SIDE MUST BE A NET

```verilog
assign y = a & b; \\ dataflow style AND gate
```

## Behavioral

- Describes the module's behavior with Verilog keywords using **processes (procedures)**
- Process relies on **input events** to generate **output events**
- A process can contain on or more statements which are executed sequentially or in parallel
- All processes **executed in parallel** and communicate using variables (wire / reg / int)
- Does not care how the circuit is synthesized (leaves that for the synthesis tool)

```verilog
always @(a or b) begin 
    sum = a + b;
end
```

- **Initial Keyword:** starts a process at the beginning of a simulation
  - Process terminates when all statements are sequentially executed
  - used by testbenches to create stimulus
  - Executed only once
  - All initial blocks are executed in parallel starting from simulation time 0
  - Executes the code between "begin" / "end" keywords like ({} in C)
  
- **Always Keyword:** starts executing at the start of a simulation
  - The events that condition procedure execution are called a "sensitivity list" (control events)
  - After all the internal statements are executed, the process will start again after any signal from the sensitivity list changes
  - Procedure's execution is **concurrent** (parallel)
  - Event Control Examples:
    - Single Event
    - Multiple Events
    - Any change on a RHS variable **"*"** operator
      - **always @(*) block**
  
## Data Types for all Design Styles

- **Behavioral Design Style** use the **reg** variable type
  - @always(*) blocks use reg variables
- **Structural/Dataflow Design Styles** use the **wire** type
  - wire a;
  - assign a = b & d;
- Reg and Wire
  - can be scalar or vector
  - use for synthesizable code (transalte as logic gates and nets on silicon die)
  - @always block used for combinational **and** sequential design
  
## Full-Adder

- Half-Adder cannot process input carry from previous adder
  - Full-Adder solves it
- Full-Adder is a **cascade** of 2 half-adders
- If we want to add 2 n-bit numbers, we can cascade n FULL ADDERS (ripple carry adder)

```verilog
S = A xor B xor Cin;
Cout = (A and B) or Cin and (A xor B);
```
