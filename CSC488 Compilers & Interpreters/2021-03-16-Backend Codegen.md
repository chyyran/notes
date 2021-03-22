# 2021-03-16 Backend Codegen
 
* map IR to machine code
  * passed semantic analysis
  * type conversions in IR
  * address calculations in IR
  * CFG is correcte
* codegen
  * assign hardware addre in variables
  * transform IR to machine (usually one linear pass)
  * mechanism to handle branch addr fixup, hardware reg allocations
* challenges
  * runtime
    * memory management
      * stack
      * global 
      * dynamic
      * runtime library
  * codegen
    * translate IR to target machine code
      * instr selection
      * reg alloc
* runtime
  * alloca -> stack allocation
  * global vars -> .bss or .data
  * dynamic allocations -> syscall or runtime libraries
  * challenges:
    * aggregate data structures require compiler to provide a mapping algo to access information stored in a structure
    * how do we organize stack memory when handling chains of function calls?
    * how to manage dynamic memory? garbage collection?
* address for structured data
  * compiler must implement access to non scalar data
  * general case: access contents of data object given only
    * base addr
    * compatible type decl
* array access
  * arrays laid out in row major order
  * straightforward naive layout
    * consecutatively place elements one by one
  * two dimension array
    * consecutive
  * we can formalize the concept with base and **stride** in the ith dimension
* array subscripts can be efficiently calculated
  * two registers
  * ra = base
  * rb = (addr(e1), len_1)
  * rb = multi1
  * ra = ra + rb
  * can be simplified if all of the Li are 0
  * use horners rule to optimize subscript computational
* record and structure
  * several defs for compatible decl
    * strict equiv: declaration used to access structure must be the same used to declare the struct
    * ltr equiv
      * declaration used to access the structure needs to match the structure decl up to the field being accessed
        * must map structure files in ltr order
        * position of fields can not depend on following fields
    * major minor equiv
      * access to embedded substruct only possible given address of substructure and decl of substructure
        * uses same algo for structus and contained substructs
        * position of fields in substruct can only depend on substruct
* structs can be packed
  * causes unaligned data
  * if we align to word boundaries data access will be faster
* simple storage mapping algorithm
  * align: alignment factor for structure
  * offset: offset for strutcure
  * fill: amount of fill in front of field i
  * length: total length of structure
  * uses reflexive mod that finds the next spot that works + fill
    * adds just enough fill in front of field to make field aligned
    * works for ltr, does not have m-m equiv
* depth first storage mapping
  * satisfies m-m equivalence
  * each embedded record must be mapped separately and independently
  * structs mapped inside out
    * most deeply nested subrecod mapped first
    * uses simple algo, but applies it separately to each subrecord or structure, processing embedded structs depth first