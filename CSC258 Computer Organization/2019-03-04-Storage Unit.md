# The Storage Unit

* What does RAM do
  * No access to registers from RAM
  * Meant to be upgradable
  * External

* Register is a small number of fast memory units (about 32)
* Main memory is a large grid of memory cells used to store the main info passed to the CPU
* Compared to the CPU, long term.
* Seems like it's external

Time
* Register
* Cache
* Main Memory
* Hard Disk
* Network

## Register File
* a collection of registers
* ... ... Data to write


```
                    +----+
-> RW               |    |
-> Dest Reg         |    |
-> Data             |    |
-> rax (n-bit addr) |    |-> rax
-> rbx (n-bit addr) |    |-> rbx
                    +----+
```
How do we access a register to an ALU?

```
                               +---+
|32 choices mux (register)| -> | A  \
                                \    |
                                /    |
|32 choices mux (register)| -> | B  /
                               +---+
```

We need 5 select bits for 32 registers.

We can now choose one of the 32 registers in each file to go into A or B. 

Then demux the result (from the ALU) back into one of the other 32 registers. (Again 5 select bits.)

Remember that registers have enable signals. The demux will feed garbage to the non-selected registers, so we need the enable signal to block the garbage from coming in. Only the selected signal from the demux will have the enable signal on to write the signal.

The addresses are 5 bits long, and are what we send into the demux select bits to choose which register to 


If you're doing a read, we need two addresses, one for A and B. Single enable signal (addr for write). 

Demux is a *decoder*, or a *one-hot* decoder. At any one time, given an address, one of the rows will write, and all the others will go low. Each row contains `n` bits, and `n` is the data-width. There are \(2^m\) rows.

What is the size of this memory?

Assume 16GB of memory on a 64-bit CPU (8 byte wide rows). We need 2 billion rows. Needs a decoder of 2 billion outputs. The address will be log_2 (2 billion)

Memory values are read to the registers then processed by the ALU.

* Why don't we have a set of address bits for reading and one for writing?
* We have a read-write bit that tells you whether if its the read or write bit.
* The data is either input or output.
* 