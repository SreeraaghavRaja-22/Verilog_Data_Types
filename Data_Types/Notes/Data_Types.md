# Data Types

## Nets

- Physical Connections between objects and structures
  - wire/tri
  - supply0, supply1
  - tri0, tri1
  - triand/wand
  - trireg
  
## Variables

- Abstract elemts with specific purposes
  - reg (1 bit)
  - integer (32 bits)
  - real (64 bits)
  - time (32 bits)
  - realtime (64 bits)
  
## Parameters

- Run-time constants (similar to #defines in C)
  - parameter
  - localparam
  - specparam
  
## More on Data Types

- Most Commonly Used Types
  - net(wire), reg
    - both are 1 bits
    - can be made into an array
  - Net(wire)
    - receives the driver's value
      - driver is usually a reg
  - Reg
    - variables used to store a logic value (0 or 1) if certain conditions are met
    - converted to logic gates (RTL) in a process called **Synthesis**

## Rules for HDL Data Types

- **Constants:** for values that **do not** change over time
- **Variables (reg, integer, time):** can only be driven inside procedures
- **Nets(wire):** can be driven everywhere else (outside procedures)
- Procedures use **variables** to communicate with each other

## Literal Values

- represents data in a specific format: (size)'(base)(value)
  - **Size:** total number of bits of the detination variable (1bit, 10bit, Nbit);
  - **Base:** Binary(b), Octal(o), Decimal(d), Hexadecimal(h)
    - For sign add an "s" character before the base
  - **Value:** digits from the selected base
    - Unsigned number by default
    - Use "_" to separate between bit fields (8'b1111_01010)
    - Z and X values can be used in binary, octal, and hexadecimal (8'h0Z)

## Vectors

- used for multi-bit variables, constants, or port
  - Range [msb:lsb] or [lsb:msb]
    - Ex: reg [7:0] a / reg[0:7] a
  - Ascending or descending bounds
  - Can select individual bits - a[3]
  - Bounds must be constants (negative values are allowed)
    - 4bit vector: [3:0], [-2:1]
