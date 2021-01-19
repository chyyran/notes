# 2021-01-11 CPU, Memory, and Processes
* Primary job is to manipulate and interpret numbers
* data representation
  * everything is represented as numbers, we need to be careful
  * avoid thinking of memory only in terms of how you define variables
* How can we interpret a certain number
  * big vs little endianess
  * data vs code
* intel registers have 6 GP registers
  * RAX 64bit
  * EAX 32bit
  * AX 16 bit
  * AH AL (8 bit each)
  * all these are 'register a'
  * process stack grows downwards on intel
* process stack overflow
  * ```c
    void function() {
      char buffer[4];
      strcpy(buffer, "OVERFLOW");
    }
    ```
  * we can get ACE if we write targeted data instead of 
* gdb
  * `break`: defines new breakpoint
  * `run`: start new process
  * `where`: list of current stack frame
  * `up`/`down`: move between stack frames
  * `info frame`: display info on current frame
  * `info args`: list function arguments
  * `info locals`: list local variables
  * `print`: display a variable
  * `x`: display memory contents
* Processes
  * process vs threads
  * program 1 and program 2 separate -- 2 seperate application
  * program 1 with 2 threads shares data, text sections, but has 2 stacks, 2 exec contexts
  * `fork()`
    * copies memory contents of program (including PC and stack) and starts executing
  * `exec()` stops and runs something else, replacing memory of current program