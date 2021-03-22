# 2021-03-16 Optimization

* Make object program faster **without changing meaning of the program**
* optimal object code: minimal exec time or minimal space
  * undecidable problem
* small optimizations on IR may make code 2/3x faster
* why?
  * improve inefficient impl of language constructs
  * mitigate mismatch between high level constructs and low level insts
  * compensate for sloppy code
  * improve code in ways not expressible at a high level
* optimization not substitute for algorithm selection
* types of optimiation
  * Machine independent
    * operate on IR
    * architecture independent
    * reusable for diff backends
  * machine dependent
    * operate on generated asm
    * more finegrained
    * optimized for a certain ISA
    * needs to be done on each ISA
    * asm loses a lot of information
      * only happens locally
      * uses pattern matching
      * hard to do global level optimization
* scope
  * peephole: over a few machine instr
  * local: over a few statements
  * intraprocedural: over the body of one routine
  * interprocedural: over collection of routines
    * all member functions in a class
  * global: over an entire program (maybe at link time)
* when is it woth?
  * most exprs are very simple
  * optimizing loops and subscript exec
  * locally good code to begin with always wins
  * most problems are NP complete, but we have heuristics
  * optimizations often introduce bugs in a compiler
* classical optimizations
  * independent
    * constant folding
      * replace things that could be calculated beforehand
    * common subexpr elimination
    * memory to register promotion
      * avoid using memory
    * algebraic simplification
    * code mostion
      * hoisting/sink
      * move code out of loop
    * strength reduction/test replacement
      * see if we can replace instr with more lightweight ones
    * dead code elimination
      * remove unused code
    * loop unrolling, fusion
    * procedure/function inlining
  * machine dependent
    * register allocation
    * hardware idioms
    * peephole optimizations
    * instr scheuling
    * cache-sensitive codegen
      * optimize memory access patterns to better use cache
* modern compilers will chain multiple optimizations together
* inhibitors
  * side effects
    * optimizer needs to know when the value of a var might change
  * exception handler
    * exception handling mechanism can be invoked async which might cause side effects
  * aliasing
    * two identifiers refers to the same storage location
    * optimizer needs to know effect of every assignment statement
    * alias may cause unexpected side effects
    * pointer analysis tries to figure out if a variable has an alias
* transformation pass 
  * functionpass
  * modulepass
  * Code -> Optimized Code
  * PassManager chains multiple opt and analysis passes
* register promotion
  * memory load/store more expensive than register accesses on all architectures
  * `mem2reg` performs register promotion for LLVM IR
  * goal: promote memory to registers as much as possible
    * try to put load/stores into registers
  * steps:
    1. detect all alloca instructions that could be promoted. 
       * We do not promise if
         * Used as instructions other than load/store pointer operands (risk of addr taken or aliasing)
         * address taken means memory is **pinned**
         * Aggregate types (arrays/structs)
    2. iterate basic blocks of function
       1. for every load that fetches a local var, replace value with stored value of the last store instruction in the same basic block
       2. if there is no store instruction preceeding the load, create PHI for the variable, and replace the value of the load with PHI
          1. this value is coming from some prior execution
          2. if the entry basic block, then the value is undef
       3. use Post[BB, v] to hold the representative value of the variable v at the end of the block BB
          1. Post[BB, v] is a table to maintain last stored value of variable in basic block
          2. Post[BB, v] = last stored value of v if any
          3. if there is no store instruction for v, Post[BB, v] = PHI instruction created for v in BB
    3. fill incoming edges of PHI instructions based on Post table
       1. if phi instr for v has incoming edge from preceeding block BB, incoming edge should be equal to Post[BB, v]
    4. remove unused PHI
    5. removed load/store accessing promoted vars
    6. remove alloca for promoted vars
    7. eliminate redundant PHI
       1. if all incoming edge of a PHI point to the same value or is self referencing, remove the PHI and replace references with its value
       2. iteratively perform until all possible PHIs can be eliminated'
* Notation
  * @ is C-style pointer deref
  * &x is addr of X
  * variables names ending in P are pointer vars
  * for most optimizations we preferentially force address itmes into @ P + constnt because tihs form fits well with most reg + displacement addressing mode on machines
* If expression involves only constants or other known values, we can calculate the value of the expr at compile time
  * compiler needs to contain the correct calculator
  * cross compiler must calculate in the arithmetic of the target machine
  * extend to common builtin functions
  * arithmetic faults during constant evaluation
  * may need to reorder exprs like 3 + a + 4
* common subexpr elimination
  * if same expr is calculated more than once, we can save the result of the calculation and use it in place
    * challenges:
      * detection
      * heuristics
      * presence of function with sideeffects, aliasing, and exception hndlin gmake this hard
* cache that maps value to expression form
* variable folding
  * if a variable is assigned a computationally simple value we can replace subsequent uses of the variable by the value
  * creates new opportunitis or constant folding and common subexpr elimination
* algebraic simplication
  * simplify or reorder expressions
  * use commutativity and associativity of operators
  * facilitates constant folding and common subexpr elimination
  * careful not to change semantics
  * consider corner cases of under/overflow
* code motion
  * move code out of loops to place where they are executed less freuqently
  * code moved must be loop invariant
  * challenges:
    * correctness
    * side effects, aliasing, exception handling
    * semantics of loops that never execute
    * fixup code after loop
* strength reduction
  * replacement of slow operations (mul/div) with fast ops (add/sub/shl/shr)
  * challenges
    * which ops are sufficiently slow?
    * need to be careful not to change meaning
  * often used to eliminate multiplications in subscript polynomials
* DCE
  * detects and eliminates code that can never be executed
  * computations of values that are never use
* loop unrolling
  * not guaranteed to make things faster
  * expand loop body to enable common subexpr
  * challenges: handle loop remainer
* loop fusion
  * combine or simply two or more loops that share a common index or range
* inlinng
  * replace call or procedure with inline expansion of routine body 
  * eliminates routine call and return overhead
  * does not work very well for recursive procedures
* tail call elimination
  * replace call with jump if recursive call is in tail position
* code hoisting