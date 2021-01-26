# 2021-01-20 Other vulnerabilities and Defenses

* Can we exploit without code injection? 
  * What does this mean?
  * exploit occurs when attacker causes unintended data manipulation or code exec
* Return to libc
  * We can reuse functions in libc that are useful
  * May not be able to create our own code
  * Return to `system`
    * `system` executes arguments in the OS shell 
    * Setup stack to execute `system` then return to it
      * Inject stack frame onto stack
      * Before return, change `sp` to `&system`
      * On return, `system` executes and expects arg on top of stack--string we want to execute
* attacks without RA clobber
  * function pointer overwrite
    * attacker can try to overwrite a function pointer that points to arbitrary code
    * common in OOP langs (C++)
    * often used in C to
      * mimic polymorphism
      * dynamic loading
      * kernels to load drivers
      * modular architectures
    * sometimes a buffer will be beside a function pointer rather than RA
      * more convenient to change that and get ACE when program calls function pointer
  * global offset table overwrite
    * Dynamic linking
        * libc, other dylibs is linked at runtime
        * caller and function are compiled to be position independent
        * need to map position independent call to absolute location
        * uses 2 tables: procedure linkage table (PLT) and global offset table (GOT) 
          * tables are usually in a fixed location, because compilers need to know
    * GOT is a table of pointers to function
      * absolute location of dylib functions
    * PLT is a table of code entries
      * one per library function called by program
      * code entry invokes corresponding function pointer in GOT
      * eg. `sprintf@PLT` may invoke `jmp GOT[k]`
      * once corrupted we can control execution of library functions
    * all calls to dynamic libraries jump to PLT
    * on first call, runtime linker is invoked to load library
      * linker updates GOT entry
      * further calls refer to GOT entry 
    * `objdump -x` lets us see where PLT/GOT, which always appear at *known* location
* ROP
  * carefully selected sequences of instruction (gadgets)
  * scavenge snippets of code that exist throughout the binary
  * tail end of functions that exist at the end of functions
  * little bits of code with `ret` on the end
  * overflow the stack and write the desired list of RA we wanted to chain together gadgets
* Deserialization vulns
  * a lot of common deserialization libraries have vulns
  * when reconstructing object in memory, we can corrupt the object to cause code exec
  * data can be manipulated on disk
* integer overflows
  * very easily to combine signed and unsigned values in C
  * `memcpy` can overflow buffer when given a signed int
  * could result in a bad bounds check, reading memory from other processes
* argument overwrite
  * maybe we can hijack the variables of the program
