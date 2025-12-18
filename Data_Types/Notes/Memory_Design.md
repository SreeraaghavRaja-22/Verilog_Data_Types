# Memory Design

## Semiconductor Memory

- Digital electronic device used for storing digital data
- An array of memory cells (MOS/MOSFET) on silicon IC
- RAM = Random Access Memory
- Volatile RAM types: Static RAM and Dynamic RAM
- Non-Volatile RAM types: ROM (Read Only Memory), EEPROM, FLASH
- RAM is a memory cells array with individual bit access
- RAM has read/write capabilities (RW)
- RAM is a volatile which loses data when power is shut down
- SRAM is based on flip-flops while DRAM is based on a flip-flop and a capacitor
- SRAM is faster but consumes more silicon area
- DRAM requires periodic **refresh operation** -> consumes more power
- SRAM circuits are analog circuits that can be modeled behaviorally using Verilog
- They are synthesizable for FPGAs because they have internal distributed RAM
- SRAM/DRAM behavioral models are used for simulation and system level verification
- SRAMs are used in CPU designs, internal CPU caches, hard-disk buffers, and FPGAs
- 1bit memory cells are grouped in an N-bit unit called a **word**
- Multiple N-bit words are stacked in a matrix, and each can be accessed using a memory address
- A M-bit wide memory address bus can access 2^M distinct addresses
- The size of a memory is N * 2^M bits
