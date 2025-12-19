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

### Single-Port Asynchronous Read SRAM

- The SRAM will have 16 x 8bit words
- The data write is active on the positive edge of clk if write_en = 1 (synchronous write)
- Read is immediate after the address is changed (asynchronous)
- I/O Pins
  - clk: positive edge of clock
  - data_in[7:0]: 8bit data input bus
  - address [3:0]: 4bit address bus (for r/w)
  - write_en: synchronous write enable (active-high)
  - data_out[7:0]: 8bit data output bus
  
### Single-Port Synchronous Read SRAM

- The SRAM will have 16 x 8bit words
- Data write is active on the positive edge of clk if write_en = 1 (synchronous write)
- Read is done 1 clock after the addrss is changed (synchronous read)
- I/O Pins
  - clk: positive edge of clock
  - data_in[7:0]: 8bit data input bus
  - address [3:0]: 4bit address bus (for r/w)
  - write_en: synchronous write enable (active-high)
  - data_out[7:0]: 8bit data output bus

### Dual-Port Asynchronous Read SRAM

- The SRAM will have 16 x 8bit words
- Data write is active on the positive edge of clk if write_en = 1 (synchronous write)
- Read is done asynchronously after address_rd is changed (async_read)
- Write / Read Operation can be done in parallel
- - I/O Pins
  - clk: positive edge of clock
  - data_in[7:0]: 8bit data input bus
  - address_wr [3:0]: 4bit address bus for write
  - address_rd [3:0]: 4bit address bus for read
  - write_en: synchronous write enable (active-high)
  - data_out[7:0]: 8bit data output bus

### Synchronous Read Only Memory (ROM)

- The ROM will have 16 x 8bit words
- At each clock, the address information will be processed and data from that location will be shown at the output
- The ROM will be loaded with data from **rom_init.hex** (**synthesizable in FPGA**)
- ROM can be used to store the program memory for a **CPU**
  - **readmemb**("initialization file with binary data", destination_memory, start_addr, stop_addr)
  - **readmemh**("initialization file with hex data", destination memory, start_addr, stop_addr)
- I/O Pins
  - clk: positive edge of clock
  - address_rd[3:0]: 4bit address bus for read
  - data_out[7:0]: 8bit data output bus
  