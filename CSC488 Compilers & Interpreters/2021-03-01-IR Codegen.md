# 2021-03-01 IR Codegen

* LLVM IR Instructions
  * RISC-like instruction set
  * Only 31 opcodes
  * Most instructions are 3-address form
    * one or two operand, one result
  * Load/store architecture
    * memory accessed via load/store
    * computational instructions operate on registers
  * infinite, and typed virtregs
    * can declare new register any point
    * register mapped with primitive type
    * backend maps virtregs to physical registers
  * Static single assignment
    * each variable assigned exactly once
    * every variable defined before it's used
    * conversion:
      * for each defn, create new version of the target lvalue and replace with new variable
      * for each use, replace original referred variable with versioned variable reaching use point
    * memory/load stores are not affected by ssa
    * llvm::Value is the base class of all LLVM IR elements
      * each instruction is uniquely associated with the value it defines
    * Handling local variables being modified in different branches
      * Use alloca to allocate stack memory space to hold local variables and use memload/stores
      * Use phi instruction that merges different versions of SSA values depending on the branch
        * phi(x, y) returns either x or y **depending on which block was executed**
* LLVM Data Representation
  * primitives
  * constants
  * virtregs
  * variables
  * load/store instr
  * aggregated types (structs)
* Control Representation
* How to emit IR?