# 2021-04-09 Memory Layout and GC

* Unions
  * Use each alt as a separate struct decl
  * alignment of ution is alignment of most constrained alt
  * length is the largest alt
  * might need to add fill before alts at the start of union
  * record in syt offset of each field in each alt relative to union start
* local storage
  * allocated when func is called
  * dealloc on return
  * use stack space
  * recursion might have many instances of local storage (stack frame)
  * almost all languages are LIFO stack
  * implemented by hardware on cache lines for optimization
  * activation record is the local storage allocated for a stack frame
    * contains
      * ret address
      * control information required to maintain addressing
      * function call params
      * storage for local vars in function
      * pointers for dynamically allocated vars
      * expr eval storage
      * micro-scope storage
* dynamically allocated storage
  * `new` in C++
  * turns plang allocation into compiler-generated function that manages storage
  * strategies
    * let OS do all storage (sys libc malloc)
      * context switch on every malloc, very expensive
    * allocate arena at init, suballocate on request
      * save a lot of context switch
    * grow stack of activation records from one end and dynamically allocate from other end
  * dealloc
    * programmers responsible
      * easy to implement a compilers
      * runtime library needs to wrap OS syscall for mem management
      * error prone
    * deallocation via GC
      * needs tracing GC
      * overhead of stop-the-world
    * RAII :)
      * unique_ptr
      * rust lifetimes
  * management of heap memory is central issue in impl of many plangs
  * allocate storage in heap with some mechanism for reclaiing unused memory
* GC design
  * roots vs pointer finding
  * moblity of data - only possible to move data object if it is possible to update all pointers
  * reclaim immediacy
  * tolerance to GC collect delay
    * mutation/collection concurrency
  * cost/time
  * cyclic structures
  * reachability
    * program can only access some object if it has memory address
    * roots are base locations that may hold address of allocated address
      * registers
      * variables
      * temporaries
    * object is reachable iff there is some path from a root to the object
  * issues:
    * identifying reachable objects
    * managing and recycling memory efficiently
  * identifiying reachability
    * Refcount
      * every alloc'd object contains ref count
      * count incremented on new pointer
      * count decremented on old pointer
      * refcount = 0 = delete
      * storage management runs concurrently with program
      * invariant
        * refcount = number of pointers
      * high processing cost
        * each assignment requires refcount update
      * correctness is difficult
        * missing update will lead to errors
      * difficult to deal with embedded pointer
        * bulk assignment of structure containing pointers
      * refcount doubles pointer size
      * can not reclaim cyclical structs
        * self-reference causes refcount to never reach 0
      * ref count overflow
    * mark + sweep
      * starts at roots
      * recursively marks reachable nodes
      * unmarked nodes are sweeped
      * naive
        * suspend program
        * start at all roots. 
          * gc thread must see all roots as accessible, even registers
        * trace reachable nodes
          * reaching already seen nodes means stop tracking
          * BFS
        * finishing mark, sweep heap and reclaim unmarked nodes
          * reset mark
        * resume
        * triggered asynchronously when program makes a request for memory that can not be satisfied
        * easily handles cycles
        * no overhead for pointers
        * bulk assignment handled correctly
        * stop-the-world is unsuitable for interactive apps
        * guaranteeing that all roots are accessible is difficult
        * algorithm will thrash as heap occupancy increases
          * time proportional to size of heap
        * leads to high fragmentation
    * conservative
      * sweep available memory for isPointer word
      * check if pointer is pointing to heap or stack
      * check if pointer is outside allocated memory range
* even native apps need some minimal runtime
  * C needs malloc/free
