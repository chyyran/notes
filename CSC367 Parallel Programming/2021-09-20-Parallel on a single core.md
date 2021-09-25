# 2021-09-20 Parallel on a single core

* Pipelining
  * Instructions are queued up on the ALU
  * Other units take care of executing other instrs like loads and stores
  * We do not wait for an instruction to clear the entire system, and instructions are loaded one after another
  * Bandwidth is limited by the slowest pipeline stage
  * Pipelining uses Bandwidth but not latency
  * The first and last 'people' will always have something wasted, so if we want to see max bandwidth we need to take a snapshot when pipeline is more saturated
* SIMD
  * Single Instruction, Multiple Data
  * ALU units can execute a single instruction on multiple data at the same time 
  * Some SIMD features can be on floats, bits, etc.
  * depends on architecture
  * challenges
    * need to be contiguous in memory and aligned
    * some instructions move data around from one part of register to another