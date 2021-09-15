# 2021-09-15 Single processor optimizations

* Motivation
  * Most applications run at < 10% of "peak" performance
  * Much performance lost on a single processor in the memory system
    * Code running on one processor often runs at only 10-20% of processor peak
  * Moving data takes much longer than arithmetic and logic
  * Need to look under the hood of a modern processor
  * Important to optimize your code for the memory hierarchy of a single core
    * Problem of memory boundness will scale to more cores
* Idealized Uniprocessor Model
  * Processor names variables and performs operations on those variables, in the order specified by program
    * Variables are really **word sized!**. Bytes have to be fetched from RAM at cache line granularity
    * Operations are performed on register values that have to be loaded and stored back into memory
  * Ideally each operation (add/mult/etc) has the same cost.
    * **If control, load, and store are free**
  * `[Processor [Control] [Arithmetic [Registers]]] [Memory [Main Memory]]`
  * When computing theoretical bound, we assume that control flow, ld, and st are zero cost
* Compilers
  * Compilers check for semantic/syntactic legality
  * Translate into asm
  * Manage memory and register allocation
  * Perform some optimizations
    * can improve register reuse and reorder instructions to optimize
    * interchange (reorder) loops
    * loop unrolling
      * compiler doesn't unroll loops fully because instruction cache space is limited
    * loop fusion
    * dead code elimination
    * instruction strength reduction
    * autovectorization
  * How do we know that the compiler has optimized your code?
    * Profile
    * Check assembly
  * Why not just leave the compiler to optimize all your code?
    * Compilers often give up on optimizing complex code to preserve correctness
    * Compiler applies optimizations with general policies
      * Sometimes you can outsmart a compiler because you know specifics of your code
* Memory
* Cache coherency
  * On multi-core processors it could be possible that two processors are working on the same cache line
  * Whenever a cache line exists in cache of 2 different cores, whenever a write occurs on one processor, the other cache lines are notified and that cache line is invalidated 
  * Some added complexity that could contribute to perf decrease
    * Consider 2 processors that have the samee cache line loaded
    * P1 reads X and P2 reads Y on the same line
    * When P1 writes X and P2 writes Y, cache line is bounced because X and Y are on the same cache line.
      * This is called **false sharing**
