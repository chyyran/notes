# 2021-09-22 Single Processor Machines-Performance Model

* performance model for matrix/matrix multiplication
* What type of computation pattern is your algorithm using?
  * 13 dwarfs
    1. Finite State Machine
    2. Combinatorial
    3. Graph Traversal
    4. Structured Grid
    5. Dense Matrix
    6. Sparse Matrix
    7. Spectral (FFT)
    8. Dynamic Programming
    9. N-Body
    10. MapReduce
    11. Backtrack/B&B
    12. Graphical models
    13. Unstructured Grid
* A dense matrix is a matrix that is full of non-zeroes
* Sparse matrix is stored in compressed form, which only stores non-zeroes
* Conventions for matrix layout
  * by colomn or "column major" A(i,j) at `A + i + j * n`
    * Fortran default
  * by row or "row major" A(i, j) at `A+i*n+j` 
    * C default
  * Recursive
* Simple model of memory hierarchy
  * Assume 2 levels of memory hierarchy (fast and slow)
  * All data is initially in slow memory
    * \(m\) number of words moved between fast and slow memory
    * \(t_m\) is the time it takes to access a word from slow memory
    * \(f\) number of arithmetic operations
    * \(t_f\) is the time per arithmetic << \(t_m\)
      * FLOPS are cheap because Moore's law, but accessing memory is very expensive
    * \(q = f/m\) average number of flops per slow meemory access
      * Algorithm efficiency, not much to do with the architecture
  * Minimal processing time is \(f * t_f\) when all data is in fast memory
  * Actual time is \(f * t_f + m * t_m = f * t_f * (1 + t_m / t_f * 1/q\)
    * We can see in the factored equation here that \(q\) must be high to minimize memory access! 
    * The higher \(q\), the execution goes closer to machine peak of \(f * t_f\).
      * We need \(q \geq t_m/t_f\) to get at least half of peak speed
      * Speed is inverse of time so peak speed is \(1/ (f * t_f)\)
    * \(t_m/t_f\) is architecture specific and is called "machine balance".
* Matrix-vector multiplications by themselves are not great at optimization
* If \(q\) is equal to machine balance we will hit max of macrhiine peak

## Warm-up: Matrix-Vector Multiplication
```rust
// implements y = y + A*x
// read x(1:n) into fastmem
// read y(1:n) into fastmem
for i in 1..n {
    // read row i of A into fastmem
    for j in 1..n {
        y[i] = y[i] + A[i, j] * x[j]
    }
    // write y(1:n) to slowmem
}
```
* Assume for simplicity that `x` and `y` and one row of `A` fit into fastmem, without cache lines.
* What are our constants?
  * \(m = 3n + n^2\)
    * Need to load every element of A = \(n^2\) memory accesses
    * 2 reads each from `x` and `y` \(n\) times
    * 1 write to `y` 
  * \(f = 2n^2\)
    * For each element of `y`, we take a row and multiply with `x` = \(n\) multiplications
    * Add (fold) each element = \(n\)
    * \(n\) elements in `y` so \(2n^2\)
  * \(q = f/m = 2\)
* This is terrible for efficiency
  * Matrix-Vector Multiplication is a **memory bound operation!**
  * Almost all runtime is loads and stores
  * For every memory access we only do 2 floating point operations for each element.
  * In matrix-matrix multiplication we are doing more work per memory access
## Naive Matrix Multiply
```rust
// implements C = C + A * B
for i in 1..n {
    // 1. read row i of A into fastmem (n access)
    for j in 1..n {
        // 2. read C(i,j) into fastmem
        // 3. read column j of B into fastmem (n access)
        for k in 1..n {
            C[i,j] = C[i,j] + A[i,k] * B[k,j]
        }
        // 4. write C(i, j) back to slowmem
    }
}
```
* What are our constants?
  * \(m = 4n^2\)
    * If each matrix fits in fast memory, we only make \(3n^2\) memory references, and then \(n^2\) slowmem access to write back into `C`
  * \(m = n^3 + 3n^2\) if not everything fits in fastmem
    * Step 1 needs \(n\) slowmem access in an \(n\)-sized loop = \(n^2\) references
    * Steps 2 and 4 need 1 memory references in an \(n^2\) sized loop = \(2 * n^2\) references
    * Step 3 needs \(n\) slowmem access in \(n^2\) sized loop = \(n^3\) references
  * \(f = 2n^3\)
    * For each element of `A`, we take a row and multiply \(n\) elements in `B` = \(n^2\) multiplications
    * Add (fold) each element = \(n\)
    * \(n\) elements in `y` so \(2n^3\)
  * \(q = f/m = O(n)\) potentially