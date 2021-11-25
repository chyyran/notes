# 2021-11-22 Compression
* Recall CSR format
      * sparse matrix can be compressed in many ways
      * compressed sparse row
      * val vector stores all non-zero value sin matrix
      * ind vector stores column index of non-zero values
      * ptr vector points to beginning of each row in val and
* Matrix-vector multiply kernel = y = y + Ax
    ```
    for each row i # coloured blocks
      for k = ptr[i] + ptr[i + 1]-1 do # bounds for each block
        y[i] = y[i] + val[k]*x[ind[k]] # actual multiplication
    ```
* This code is very hard to optimize by the compiler
  * It is impossible where in x we are accessing and the information is known at runtime
  * The minute we know the sparsity pattern we can optimize like in a JIT but there is no compiler like that so far
  * If we have each thread take care of a row we will have load imbalance
  * Data is not well aligned and we need to use padding often
  * Computation order and patern is irregular so finding well balanced tasks to run in parallel is challenging
  * Indirection introduced makes this very diffficult to optimize 