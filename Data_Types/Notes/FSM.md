# FSM

## Finite State Machines (FSM)

- Most electronic devices may have a complex behavior in time depending on the applied stimulus
- A finite state machine is a mathematical model that can process a sequence of input in time and have an exact output based on them
- Can model scircuits starting from a turnstil to a modern CPU
- They can be implemented in software (C) or in hardware (an actual circuit)
- State Machine: a sequential circuit having a finite number of states occurring in a pre-defined order
- Most common FSM types are **Mealy** and **Moore**

### Sequence Detector FSM

- A sequential state machine which takes an input sequence of bits and generates a value of 1 whenever the targe sequence is detected
- Overlapping: last bit of any sequence becomes first bit of next sequence
- Non-Overalapping: last bit of detected sequence becomes first bit of next sequence

### FSM Optimization

- Use **parameters** instead of **defines** for declaring the values of the FSM states (better synthesis) results
- Use **one-hot encoding** for **better performance**
- Use **Gray codes** for **better power efficiency** and **noise reduction**
