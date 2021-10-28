# 2021-10-22 Parallel Regions

* Parallel regions denoted by braced scopes
  * Can be conditional with an `if` directive (only one)
  * Can determine degree of concurrency with `num_threads` directive
  * Can determine data handling  `shared`/`private`/`firstprivate`

* Variable semantics
  * Shared: all threads share the same copy of the variable
  * Private: all variables are thread-local
  * Firstprivate: like private but value of each copy is initialized to the value before the parallel directive
  * Example
    ```c#
    var a = 1, b = 2, c = 1
    f = #pragma omp parallel private(B) firstprivate(C)
    {
        ...
    }
    ``` 
    * Initial values inside, andd after the parallel region?
      * `a`: a, f(a)
      * `b`: uninitialized, 1
      * `c`: 1, 1
    * By default, everything is shared or `default`
      * If it is declared inside then it is local
      * `default(shared)` every variable is shared by all threads
      * `default(none)` nothing is decide, throw a compiler error if not all visibility is defined
      * if implicit
        * declared within parallel region are implicitly private
        * variables declared outside parallel block are shared except some loop counters
      * safer to use `default(none)`
    * Shared variables are not atomic unless you use a `reduction` or `atomic` clause
      * `reduction(op: var)`: multiple copies of variables a re combined at the end when the parallel block ends
      * compiler applies the operator for each resultant atomic copy at the end
    * **Remember to pad array so that partitioned work is divisible by number of threads**
      * `#pragma omp for [clause]` automatically partitions this work
        * pragmae
          * `private, firstprivate, lastprivate`
            * `lastprivate` takes the last updated value from whoever finished last and copy it after the block
          * `reduction`
          * `schedule`
          * `nowait`
          * `ordered`
        * can not break within omp for loop
        * sequence of for directives implicitly adds barrier after each one
* Basic approach for working w ith loops
  * find compute intensive loops
  * make loop iterations independent
  * place appropriate OMP directives and test
* Loop carried dependencies
  * Consider following code
    ```c
    int i,j,A[MAX];
    j = 5;
    for (i=0; i< MAX; i++){
        j+=2;
        A[i] = big(j);
    }
    ```
    The new value of `j` depends on the previous value of j`, and OMP will not parallelize a **loop carried dependency**
    **we need `j` as a function of `i`** 