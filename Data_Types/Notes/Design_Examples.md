# Design Examples

## FIFOs

### Information

- Commonly used for **buffering, flow control, and synchronization** between hardware and software or between internal modules of a chip
- It is a **read/write memory array** that keeps track of the data arrival order and preserves it when the data is read
- A FIFO can be seens as a **circular buffer** (2 pointers):
  - Read pointer (address)
  - Write Pointer (address)
- FIFO Pattern:
  - Initial read_pointer = write_pointer = 0 and the FIFO queue is **Empty**
  - When the difference between read_pointer and write_pointer is equal with the size of the queue then the FIFO is **full**
  - If the data is read/write on the same clock the FIFO is **synchronous**
  - If the data is read/write on different clocks the FIFO is **asynchronous** (transmits data between 2 clock domains)
  - For both FIFO empty and FIFO Full cases the read_pointer = write_pointer
    - One simple solution is to add 1 extra bit that is inverted when the r/w address wraps
    - A. {extra_bitr, read_pointer} == {extra_bitw, write_pointer} -> FIFO Empty
    - B. {extra_bitr, read_pointer} == {~extra_bitw, write_pointer} -> FIFO Full

### Synchronous FIFO

- Design a 32bit x 8 depth Synchronous FIFO
- I/O Ports:
  - clk: clock signal
  - rst_n: asynchronous active-low reset
  - cs: chip select
  - wr_en: write enable (active-high)
  - data_in: data input bus
  - rd_en: read enable (active-high)
  - data_out: data output bus
  - full: when all FIFO locations are full (write_pointer = 8)
  - empty: when all FIFO locations are empty (read_pointer = write_pointer)

## Data Transfer FSM

### Transfer Data Between 2 SRAMs of Different Sizes

- Module 1 processes data and stores the result inside a SRAM 8bit x 32 locations
- Module 1 signals that it finished operating and data must be resized and stored in a SRAM 16bit x 16 locations to be processed by Module 2
- The module from the red rectangle (our design) behaves as a data transfer bridge between two sub-systems
- FSM rearranges data and group byte_addr0 and byte_addr1 from SRAM_IN to word_addr0 in SRAM_OUT
- The same process continues until all addresses in SRAM_IN are processed
- The FSM signals that it finished transferring and resizing data so Module 2 can start reading it from the SRAM
- I/O Ports
  - CLK: clock signal
  - rst_n: active-low reset
  - ram_in_we: write_enable for 8bit RAM
  - ram_in_addr_wr: write address for input 8bit RAM
  - ram_in_data_wr: write data bus for input 8bit RAM
  - op_mode_in: if 0 data is stored in input 8bit RAM. If 1 for at least 1 clock cycle, then the FSM will start the data transfer and resize process
  - ram_out_addr_rd: read address for 8bit RAM
  - ram_out_data_rd: read data bus for output 16bit RAM
  - done_out: If 1 it means that the FSM finished operation. Cleared by op_mode in toggle.

## Data Encryption

### Uses

- Converting data from a readable format into an encoded format that can only be read / processed / decoded only after it's be encrypted
- Used daily in online traffic, telecommunications, banking, etc...
- It keeps our data safe from being decoded by malicious third parties
- Symmetric-Key Algorithm: the same cyrptographic key is used to encrypt the plaintext and to decrypt the ciphertext
- Symmetic-Key encryption can be done using stream cyphers and block cyphers
- Stream Cypher: encrypts/decrypts 1byte at a time (ex: A5/1)
- Block Cypher: ecrypts/decrypts multiple bytes at a time (ex: 128bit AES)
- Easiest way to encrypt data is to XOR each character (byte) with a key