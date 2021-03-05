# 2021-03-04 IR Codegen

* Ultimate goal of a compiler is to transfer a program from source lang to machine instructions
* Two step process
  * translate syntactic repr to IR (Frontend)
  * translate IR to machine code (backend)
* IR is generally easy to generate and manipulate
* machine independent optimizations by IR manipulation
* AST directed translation
  * Write code translation as AST visitor
  * emit LLVM IR statement by statement
    * map global vars to LLVM globalvars
    * map local vars to LLVM alloca
    * use LLVM virtregs to hold temp results
      * store result in assign instr
  * stackalloc for local vars is straightforward
  * stack memory slower than virtregs
    * all good, we'll deal with this later
  * IR param vars must satisfy SSA
    * cannot modify parameter variables in function body
  * non-constant param?
    * create local tempvar on stack for each param
    * store original param to tempvar
    * treat param vars as normal local vars after
* Expr codegen
  * depth first
  * virtregs may be required to hold intermediate results
  * use symbol table to track LLVM alloc and global vars associated with each program var
  * record mapping between exprs to generated LLVM IR
* Assignment codegen
  * store expr subvalue
  * need tweak to handle array expr alignment
    * use GEP
* Control flow
  * basic block
    * piece of the program with **one entry** and **one exit**
    * expr, sequence of non branching statements
    * branch statements cause a change in control flow
  * control flow graph for a program describes all possible flows of control between basic blocks
  * IR builders can set basic block to insert IR via `SetInsertionPoint`
  * short circuiting
    * `&&` and `||` short circuit
    * two basic blocks needed
      * slow_path: if we need to eval second subexpr
      * out: exit basic block
    1. translate first subexpr
    2. Generate conditional branch on subexpr res
       * if true/false for &&/||, jump to slow_path, otherwise to out
    3. set insertion point to slow_path basic block
    4. translate second subexpr
    5. set insertion point to out basic block
    6. generate `phi` to merge results
       * this generates an `i1` to eval in the if. 
  * IF statements
     1. create then, else, out BBs
        1. out for follow up
     2. translate conditional expr
     3. generate conditional branch to jump on block baed on conditional expr
     4. set insertion to then_bb, recursively translate branch statements
     5. generate unconditional branch to jump to out
     6. set insertion to else, recursively translate
     7. generate unconditional branch to out
     8. if no else branch, ignore
        1. might be nested control statements, so branch instrs must not be in then/else
     9. be careful of return statements
  * WHILE loop
    1. cond, body, and out
    2. set cond_bb as insertion
    3. translate condexpr
    4. generate condbranch that jumps to body or out based on value of cond
    5. set body as insertion
    6. translate while body
    7. generate conditional branch to cond block
  * FOR loop
    1. cond, body, out
    2. translate init expr
    3. set cond as insertion
    4. translate condexpr
    5. generate cond branch that jumps to body or out based on value of condexpr
    6. set bb as insert
    7. translate for body
    8. translate step expr
    9. unconditional jump to condbb 
  * BREAK
    * record exit_bb inside loop and generate unconditional jump to exit_bb
  * CONTINUE
    * generate unconditional jump to cond_bb
    *  for loops: need to create basic block for **step expr** separate from body, and jump to this step block
* funcdecls
  * perform semantic analysis on func header
  * record formal param decls in symbol type table
  * record type of func retval 
  * func body
    * create entrance basic block
    * emit prologue to setup runtime env for function
    * process local var decls
    * emit epilogue (not necessary in minic)
  * record generated IR handle in symbol table
  * prologue
    * allocates resources
    * for native code, save registers
    * miniC: need to setup tempvar stack space for non constant params
  * epilogue
    * destructors
    * return from func
    * miniC: return default value defined by language for the function if there is no return statement
* caveats
  * terminator
    * every basic block an only have one terminator
    * if you insert more than one, IRBuilder will insert instr in the wrong place
    * skip some of the bracnh statements if previous statement is already a terminator when translating if/for statements
  * argument passing
    * how to impl call by reference?
      * pass memory location/pointers as arg
  * call expr
    * call instr assumes pass by value
    * for call by ref, need to modify function signature to convert param into pointer type then pass addr pointer of argument variable
* exports/imports
  * symbol table management issue
* class
  * single instance: treat as struct
    * allocate storage in enclosing major scope
    * control access to class data via symbol table scope
  * multiple instance
    * allocate storage separately
    * give member functions access to class instant data via extra param or hidden pointer
  * template classes
    * monomorphization
    * pointer maps