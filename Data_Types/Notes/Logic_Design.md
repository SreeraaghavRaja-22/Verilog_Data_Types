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

## Sequential Logic
