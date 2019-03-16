# Week 8 Review
* What re instructions
  
* Given a RAM unit with 6 bit addresses and a 32-bit architecture, how many integers is your RAM unit abe to stores.
  * Assuming byte-addressable memory, there are \(2^6 = 64\) bytes. If we assume word-sized **(32-bit)** integers, we have space for \(2^{6-2} = 16\) integers.
* Registers are local to the processor, memory is external to the processor
* Why are the intervals shown necessary when performing a memory write operation?
  * We need an address to write to
  * We need to signal the start of the write
  * We need to deliver the data.
    * Some of these signals needs to come first
      * Load the address first (so we don't spew data everywhere)
      * Load the data (so we don't write garbage)
      * Write the data
      * Hold the data, but turn off the write
      * Flush the data
    * If the write signal shows up first, we will write to garbage
* Given a datapath
  * Identify the components in the datapath above?

* Decoding Instruction
  * `00000000 00000001 00111000 00100011`
  * WHat does this instruction do?
  * `subu $d,$s,$t`
  * We need to look at the first 6 bits.
  * The instruction register decomposes the instruction into little pieces, and sends it to the control unit.
  * first 6 bit indicates the operation
  * `00000` Takes the arithmatic op
  * `100011` Does a subtraction

### MIPS instruction types

**R-type**
```
OOOOOO SSSSS TTTT DDDDDD MMMMM FFFFF
```
Usually an ALU op. For ALU operations, the first siz bits are 0.

Where `O` is the opcode, `S, T` are source registers, `D` is the destination register, `M` is `shamt` shift amount if `F` is a shift, and `F` is `funct`.


**I-type**
````
OOOOOO SSSSS TTTTT IIIIIIIIIIIIIIII
````

The field is a constant value used for an immediate operand, a branch target offset, or a displacement. An *I-type* operation does something with the source and the constant on `S`, and puts the result into `T`.

**J-type**

````
OOOOOO AAAAAAAAAAAAAAAAAAAAAAAA
````
`A` is the address to the jump. `ja` and `jal` are the only two jump instructions again
