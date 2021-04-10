# 2021-04-09 Backend Codegen 3

* codegen
  * must correctly implement plang
  * individual codegen designs must lead to a complete and consistent whole
  * entire hardware state at any point must be correct
    * named regs
    * internal state
  * need to be careful opts dont introduce errors
    * be careful of side effects
    * backend pinhole usually involves replacing generic with optimized hardware instrs
* instruction selection
  * map IR to machine instr
  * interacts with reg alloc since some instrs only work with specific regs
* reg alloc
  * map virtregs to limited number of hardware regs
  * manage register spills
  * some registers are dedicated to specific purposes
  * optimizations
    * minimize registers
      * some hardware does not matter much
      * gpus have thousands of threads
        * registers become limiting factor
        * regs/thread is limited resource
        * try to keep regs/thread <= 64 
    * minimize spills
      * memory much slower than hardware
  * IR typically has infinite virtregs
  * perform live variable analysis on virtreg
    * register is live from where it is given a value to where it is last used
    * set of basic blocks that the virtregs are used
  * build interference graph
    * reg X interferes with Y if X lives at the point of definition for Y
    * graph has a node for each virtreg and edge between each pair of real reg that interfere
    * with there are N regs available, any node with less than N edges connected can be assigned
    * attempt to color grah with N colours where N is number of available regs
      * assign each reg according to colour
      * nodes in graph are connected by edge can not have the same colour
      * if N-colouring fails, we need to find a region with higher reg reqs, and *spill* some pseudo registers into memory
      * NP-hard, but have linear heuristics
  * what kind of things do you need to be careful of when you choose which virtregs to spill?
    * spill things that aren't run very often
      * shortest lifetime?
    * avoid putting spill regs in a loop
    * choose registers statically accessed less
    * avoid frequently called function vars
    * spill regs with most conflicts
    * spill regs with smallest number of def'ns and uses
  * spilling
    * pick register R to be spilled
    * allocate memory location on stack frame
    * before each op that reads R, load from stack frame
    * after each op that writes R, store
    * recalculate interferance graph
    * multiple spills might be needed to achieve colourability
    * don't need to spill virtreg for entire lifetime, only spill on hot areas
      * "partial" reg spilling
* codegen process
  * for each IR instr, design template describing target machine instr for triple.
  * template will have substitutable params for operand and results
  * expansion mech uses conditional selection to deal with possible operand/result locations
  * conditiional selection to generate special code for local vars
  * instr selection can involve decision trees
    * large IBM mainframes have 17 instr that add
* template
  * IR: `%dest = add nsw %left %right`
  * `%left` and `%right` could be
    * literals
    * virtregs
    * memory (spilled regs)
  * `%dest` could be
    * virtreg
    * memory (spilled)
  * choose table for lit x reg x memory
* code selection impl
  * RISC is easy, but instruction ordering matters
    * branch latency and load/store
    * need to optimize for pipeline structure and reduce data dependencies for out-of-order
  * CISC machines may be very complicated
  * peephole optimization for local opt on the fly
* branch prediction
  * some hardware will always try to decide which branch is more likely
  * try to execute instruction
  * will not commit until branch is committed
* optimizations
  * locally good codegen is always a good strat
  * take advantage of constant info known to compiler
  * use targeting to encourate results to end up in desireable locations
  * use special instructions whenever possible
    * literal
    * reg2reg
    * vectorization
* peephole optimizations
  * look at window of 2-5 instructions
  * see if there are patterns that can be optimized
    * usually table/template driven
  * optimizer must be aware of control flow
    * careful of jump points and branches
  * mov + add + mov could be changed to an inc, etc.
  * some instrs can be noopd
