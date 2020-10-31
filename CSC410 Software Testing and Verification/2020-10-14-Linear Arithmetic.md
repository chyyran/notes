# 2020-10-14

* We can not reduce linear arithmetic problems to propositional logic, need new algorithms

* Grammar
  * Formula: Formula ^ Formula | (Formula) | Atom
  * Atom: Sum Op Sum
  * Op: = | <= | <
  * Sum: Term | Sum + Term
  * Term: Ident | Const | Const Ident
  * Const: 0-9 | 0-9/0-9 
    * Rationals and Integers
* Satisfiability for linear arithmetic theory is polynomial for rational numbers, and NP-complete for integers
* Simplex method works as a decision procedure
* Example of linear arithmetic optimizations
  * ```c
    for (i = i; i <= 10; i++) a[j+1] = a[j];
    // transformed to
    asm(
        r4 <- mem[a+r2] /* load a[j] into r4     */
        r5 <- r2 + r1   /* load j + i into r5     */
        mem[a+r5] <- r4 /* store r4 into a[j + i] */
        r1 <- r1 + 1    /* i++ */
    ) 
    ```
   * The load `r4 <- mem[a+r2]` can be optimized out, but only if `a[j]` does not change -- If \(i \geq 1 \wedge i \leq 10 \and j + i = j\) is satifiable, then `a[j]` will be modified, but this formula is not satisfiable, so the optimization is safe.