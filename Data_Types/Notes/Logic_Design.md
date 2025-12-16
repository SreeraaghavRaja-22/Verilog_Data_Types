# Logic Design

## Combinational Logic

- Modern chip designs require **higher level of abstraction** than logic gates design
- Need more structural capabilities
- Digital Electronics inside a chip
  - Combinational Logic (logic gates and nets)
  - Sequential Logic (has memory and is time-dependent)

### Aspects of Combinational Logic

- Output = F(Input)
- Only the current input is important
- Considered as time-independent
  - previous inputs don't matter
- Consists of only logic gate
- Processing Speed is very face (only consider propogation delay)
- Indepent of clock signal
- No feedback is involved

### Continuous Assignments

- Only used for combinational logic design (logic gates)
- Must be written outside of procedural blocks
- Simulator continuously drives LHS net
- Can be written in any order
- **LHS** must be a **net (wire type)**
- **Do not use multiple continuous assignments on the same net**
- Syntax:
  - wire (net name);
  - assign (net_name) = operand1 (logic expression) operand2;
  - Ex: assign c = a & b;

### Procedural Assignments

- Long / Complex expressions in continuous assignments are hard to debug and maintain
- Procedural assignments can describe very complex combinational behavior
- Procedural blocks keywords:
  - **Initial:** only in testbench
  - **Always:** synthesizable code or in testbench
  - Syntax:
  
```verilog
    initial begin
        // many lines of sequential code
    end
```

- **Always** keyword has an event control list after it (**sensitivity list**)
- the code between **begin / end** is blocked from execution until an event occurs
- the code between **begin / end** is executed **sequentially** after the event occurs
- only **variable** types can be used between begin / end (**NO WIRE**)
- multiple **always / initial** blocks executed concurrently
- Syntax:

```verilog
    always @(event_control_signals_list) begin 
        // many sequential lines of code
    end
```

### N-Bit Adder

- has 2 x N-bit input busses
- Has 1 x (N+1)-bit output
- We can make a **generic adder** by creating a **paramterized module**
- **Parameters:** verilog constructs that allow modules to be reused for different specifications
- Paramters are constants and cannot be changed during **runtime**
- They are processed during compile time
- A parameter value can be changed on module instantiation

### Binary Encoder / Decoder
  
- A binary decoder **translates** binary encoded data from one format into another
- A binary encoder does the reverse of a binary decoder (transform some format to binary)
- Binary Decoder: n input bits are decoded to 2^n output bits
- Binary Decoder: **only one** of the 2^n outputs is active for each input code (**one-hot** codes)
- Simple example of a binary decoder (1bit to 2bit decoder)
  - NOT gate combined with the input itself
- A decoder is a like a demux or a unique address selector for memory
- A circuit can have an **enable** signal for the decoding function\
- Can use multiple decoders to make a larger decoder
- A 4to16 decoder can be built by using 2 3to8 decoders and an enable signal

## Sequential Logic
