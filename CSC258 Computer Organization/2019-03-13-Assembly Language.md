# 2019-03-13
* Where do the instructions come from?
* The processor is done
* How does the process understand your programs
  

* How machine code signals

```
ASM---[Converted]-->Machine Code---[First 6 bits]-->OpCode---[Inputs to]-->Control Unit---[Produces]-->Datapath Signals
```

How can we specify Machine code?

## Assembly
Example `C = A + B`
This would look like `add $dst $ra $rb`
However, the machine code encoded string looks like this: `000000 01001 01010 01011 XXXXX 100000`

There is a 1-1 mapping from machine code to asm code.

**R-type** instructions only involves registers. For example adding 2 registers together, and store int he third.

eg. `add $t3 $t1 $t2` 
where `add = 000000` and `100000` (at the end)

`t3 = 01001`, `t1 = 01010` `t2 = 01011`

**I-type** instructions operate on a register and a constant
  * The constant is encoded in the last 16 bits of the instruction
`addi $t2, $t1, 42`

## MIPS
* MIPS is register to register
  * Nearly all operations rely on register data.
* There are 32 Registers
  * Register `$0` or `$zero`, always has the value 0
  * Register `$1` or `$at` is reserved for the assembler
  * Registers `$28-31` (`$gp`, `$sp`, `$fp`, `$ra`) memory and function support
  * Registers `$26-27` are reserved for the OS kernel
  * Registers `$2-$2` (`$v0, $v1`) are used to return values
  * Registers `$4-$7` (`$a0-$a3`) are used for function arguments
  * Registers `$8-$15`, `$24-$25` (`$t0-$t9`) are temporaries
  * Registers `$16-$23` (`$s0-$s7`) are saved temporaries
  * Three special registers `PC, HI, LO` are not directly accessible, used in multiplication and division.
  * 