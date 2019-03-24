# 2019-03-22 branching

* We can jump, which sets the program counter to the address of a label
* Jump and link -> intent to come back

```mips
main: beq, $t0, $t1, end
A
end: B
```

This is somewhat akin to this

```c
if ($t0 != $t1) {
    A
}
B
```

Notice that we're checking an equality in ASM, but in C we're checking an inequality.

Jumps supply an address. However, branches go forwards or backwards a certain amount, **an offset from the program counter**

```mips
main:  bne $t0, $t1, end # $t0 == $t1
    ...
end: ...
    
```

If the condition **is not** satisfied, then execution is continued. That is if the condition is satisfied, then execution will jump. When the branch condition is met, then the branch is taken otherwise it is not.

This is why we use the opposite instruction.

Since the instruction will always end in 00, we can jst use the immediate value `i`, which is a 16bit offset to add to the current instruction.


How far can the processor branch? Are there any constraints?

PCWrite says jump, PCWriteCondition says branch.

```c
if ( i == j ) {
    i++; //A
} else {
    i--; // B
}
j = j + 1; //C
```

```mips
main:  beq $t1, $t2, mid # branch if i == j
       addi $t1, $t1, -1 # i != j here, so do B
       j end             # jump to end
mid:   addi $t1, $t1, 1  # i == j here.  
end:   add $t2, $t1, $t2 # end
```

Alternatively 

```mips
main:   bne $t1, $t2, ELSE # branch if i != j 
        addi $t1, $t1, 1   # i == j here
        j END
ELSE:   addi $t1, $t1, -1  # i != j here
END:    add $t2, $t2, $t1  # C
```
We can short circuit

```mips
main:   bne $t1, $t2, ELSE
        bne $t1, $t3, ELSE
IF:     addi $t1, $t1, 1
        j END
ELSE:   addi $t2, $t2, -1
END:    add $t2, $t1, $t3
```



Loops are similar

```mips
START: beq $t0, $t1, END
       addi $t0, $t0, 1
       j START
END:
```