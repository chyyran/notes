# 2019-04-01

Convert this to assembly.

```c
int series(int i) {
    int n = 0;
    for (int j=0; j < 100; j++) {
        n += j;
    }
    return n;
}
```

```mips
.data
i: .space 4
n: .word  0
j: .word  0

.text
series: la   $s1, j              # Load &j to $s1
        la   $s2, n              # Load &n to $s2
        lw   $t9, 0($s1)         # Load *&j to $t9
        lw   $t8  0($s2)         # Load *&n to $t8

        addi $t7, $zero, 100     # Load 100 to $t1

loop:   beq  $t9, $t7, end       # Break if $t8 >= $t7 (100)
        add  $t8, $t9, $t8       # *&n += *&j
        sw   $t8, 0($s2)         # Update value of $t8 back into $s2

        addi $t9, $t9, 1         # increment $t0
        sw   $t9, 0($s1)         # Update value of j back into $s1
        j loop

end:    jr $ra                   # jump to return address
      
```


## Nested Function Issues

```c
sum = 3;
function_X(sum); // jal FUNCTION_S
sum = 5;
```

```c
void function_X(int sum) {
    // do something
    function_Y(...);
    return //jr $ra
}
```

We need to store the value of `$ra` somewhere for safekeeping before jumping. We just keep pushing stuff onto the stack pointer ($sp). The stack uses LIFO. What happens when we used nested function calls?

We use the stack to store function arguments, and return values.

* Push
  * Decrement stack pointer to appropriate bytes
* Pop
  * Do a load (or as many loads as needed)
  * Deallocate space by incrementing stack pointer

The stack is just a location in memory

```mips
lw $ra 0($sp) # pop a word off the stack
addi $sp, $sp, 4 # Move stack pointer a word
```

```mips
addi $sp, $sp, -4 # Move stack pointer back a word
sw $ra, 0($sp)
```

We use the stack to pass parameters into functions

```mips
$v0, $v1 # Use to hold return values
$a0 - $a3 # Used to pass function arguments
```

What if we want to return more than 2 values? What do we do to pass function arguments.

Usually we just abandon the return addresses and just store everything on the stack. 

When compiling functions, the compiler knows how many values to push and pop off the stack.

For example...

```c
void strcpy(char x[], char y[]) {
    int i;
    i = 0;
    while ((x[i] = y[i]) != '\0') i += 1;
    return 1;
}
```

* Init
  * What values do we need to store
  
```mips
    lw $t0 0($sp)    # pop word off the stack
    addi $sp $sp 4   # move stack pointer by a word

    addi $sp $sp -4  # move stack pointer one word
    sw $t0 0($sp)    # push word onto the stack
```

Remember that the stack start from the end of memory, so we increase the pointer when popping values off and decrease the pointer when popping values on.

```mips
strcpy: lw   $a0, 0($sp)        # pop &x
        addi $sp, $sp 4    
        lw   $a1, 0($sp)        # pop &y
        addi $sp, $sp 4 
        add  $t0, $zero, $zero  # allocate i = 0

        add  $t1, $t0, $a0      # t1 = &x + i
        lb   $t2 0($t1)
        add  $t3, $t0, $a1      # t3 = &y + i
        ...

```

## Maintaining Register Values
Caller vs. callee calling conventions:

How do we know that a function we called didn't overwrite registers we were using?

(`$t0-$t9`) are caller-saved registers.
    * The caller should save these to the stack before calling a function.
(`$s0-$s9`) are callee-saved registers.
    * Registers that the callee should save and later restore them
    * Push them to the stack first thing in the function body
* Before calling a function
  * Push registers onto the stack
  * Push input parameters onto the stack

* At the start of a subroutine
  * Pop the input parameters from the stack
* At the end of a subroutine
  * Push the return values onto the stack
* Coming back from the subroutine call
  * Pop the return values from the stack
  * Pop the saved register values and restore them

## Recursion
```c
int fact(int x) {
    if (x == 0) return 1;
    else return x * fact(x-1);
}
```

```mips
fact:     lw    $t0 0($sp)
          addi  $sp, $sp, 4
          beq   0 $t0 fact_ret
          addi  $t1 $t0 - 1
          sw    $t0 $sp
          addi  $sp, $sp, -1
          sw    $t1 $sp
          addi  $sp, $sp, -1
          jal   fact

          lw    ...
fact_ret:
```

* Interrupts takes place when an external event requires a change in execution
* Ex: arithmetic overflow, syscalls, undefined instructions
* Usually signaled by an external input wire

* Polled handling
  * The processor branches to the address of interrupt handling code, which begins a sequence of instructions that check the cause of the exception.
  * This is what vectored handling uses
* Vectored handling
  * Processor branches to a different address for each type of exception. Each exception address is separated by only one word. 

In polled handling, the processor jumps to exception handler code based on the value of the cause register.

