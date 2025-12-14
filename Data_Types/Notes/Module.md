# Module

## Module Definition

- **Module:** a block of Verilog code that implements a certain functionality (sum, product, digital signal processing, encryption, ALU, testbench, etc);

## Module Basic Rules

- Each module should be written in a file with the same name
- All verilog code is encapsulated within a module (for the class)

## Module Port Types

- Inputs: net(wire)
- Outputs: net / register (wire / register)
- Inouts: net(wire)

## Module Information

- Modules communicate with other modules using their ports
- - Modules can be embedded in other modules and establish heirarchy
- **Top-level module** instantiates all other submodules
- Modules can be cascaded with other modules to obtain complex functionality
  - easier to develop, test, and maintain

## Testbench

- A module without ports
- Instantiates the TOP level of the design
- DUT = design under test
- Generates stimulus for input ports
- Monitors the result on the output ports
- **Reg** type variables are input ports
- **Wire** type variables are used for output ports
- Should perform automatic validation of the output data

## Time and Timescale

- One of the most important parts for simulations is the concept of **time**
- We need a timescale to define how much a #1 (1 time unit) means
- The compiler directive `timescale (time_unit) / (time_precision)
- Example: `timescale 1ns/1ps
