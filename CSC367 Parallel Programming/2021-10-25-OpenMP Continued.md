# 2021-10-25 OpenMP Continued

* `schedule` clause ways to assign iters to threads
  * `static`, `dynamic`, `guided`, and `runtime`
  * Consider Matrix-Matrix multiplication again
    * the outer for loop is the one we want to parallelize
  * `schedule(static, S)` schedule
    * Split iterations into equal chunks of size S assigned to threads round-robin
    * By default iteration space is divided by number of threads
    * If these chunks did not evenly divide this could lead to load imbalance
  * `schedule(dynamic, S)`
    * Load per iteration might not be balanced so equally partitioned tasks might take different execution time.
    * Splits iterations into chunks, and each new chunk is assigned to the thread when idle.
    * If not specified, chunk size is a single iteration.
    * Can also result in load imbalance.
      * 1000 iterations, S = 50 => 20 chunks, 16 thread machine.
        * 12 threads are idle for potentially a long time!
  * `schedule(guided, S)`
    * Chunks get smaller and smaller as computation progresses if load gets imbalanced
    * `S` is the minimum size chunk to use.
    * Creating smaller chunks at the end of the computation results in better load balancing
    * If not specified, default chunksize is 1.
  * `runtime`
    * Delayed decision until runtime using `OMP_SCHEDULE`
    * If no schedule type is identified, then the compiler and runtime will choose the most appropriate schedule called `AUTO`
* We can use `nowait` to a void for loop implicit barrier
* OpenMP allows arbitrarily nested paralalelism and nested locks
* Sections
  * We can have threads execute arbitrary sections in parallel with `#pragma omp sections`
  * Has an implicit barrier at the end but sections are parallel.
  * `#pragma openmp tasks` doesn't  have implicit barrier, and is useful for recursion.
    * Example: fibbonacci
      * ```
        int fib(int n) {
            int x,y;
            if (n < 2) return n;
            x = fib(n-1);
            y = fib(n-2);
            return x + y;
        }
        int main() {
            int NW = 5000;
            fib(NW);
        }
        ```
        This is a parallel impl that is not super efficient.
      * ```
        int fib(int n) {
            int x,y;
            if (n < 2) return n;
            #pragma omp task shared(x)
            x = fib(n-1);
            #pragma omp task shared(y)
            y = fib(n-2);
            #pragma omp taskwait
            return x + y;
        }
        int main() {
            int NW = 5000;
            #pragma omp parallel
            {
                #pragma omp single
                fib(NW);
            }
        }
        ```
        * `taskwait` enforces that a task not complete until all tests below it in the tree are finished
        * `x` and `y` are local to the thread taht execute a task however they must be shared on child tasks
        * One thread executes the single directive but all threads participate in executing tasks.
* Synchronization constructs
  * barriers
    * wait for all threads spawned by closest enclosing `parallel` clause
    * either all or none of the threads must hit the barrier point
    * `for` and `sections` use implicit barriers at the end, unless with `nowait` clause
  * single
    * whatever thread gets assigned first gets this thread
    * only executed in a single block.
    * implicit barrier, unless with nowait.
  * master
    * similar to single, but master thread runs
    * does not have implicit barrier!
  * critical sections
    * regions where threads must serialize to avoid race conditions.
  * atomic
    * when critical section is just an update to single memory location `atomic` is much moree efficient
    * only simple ops (`+-&`.etc)
    * Expression is simple and does not include reference
    * `#p omp atomic = #p omp critical(data) data += 5;`
    * much less overhead than crtical, and can use HW atomics
    * can be fine grained with `read`, `write` `update`
    * smarter to do the atomic update as once per thread by collecting a local variable
  * explicit locks
    * similar to pthread locks
    * can also support nested locks
  * perf profiling
    * always use wallclock on OpenMP
    * time is measured per thread
* Example: integration
  * approximate pi using integration.
  * Serial implementation of \(\Sigma^N_{i=0} \frac{4.0}{1+x_i^2} \Delta x \approx \pi\), where each approximated rectangle has width \(\Delta x\) and height \(F(x_i)\) at the middle of interval \(i\).
    ```cpp
    static long num_steps = 100000;
    double step;
    int main() 
    {
      int i; double x, pi, sum = 0.0;
      step = 1.0/(double) num_steps; // delta X
      for (i = 0; i<num_steps;i++) {
        x = (i + 0.5) * step;
        sum = sum + 4.0/(1.0 + x * x);
      }
      pi = step * sum;
    }
    ```
  * Naive parallel (64Byte cache line)
    ```cpp
    static long num_steps = 100000;
    double step;
    #define NUM_THREADS 2

    int main() 
    {
      int i; double x, pi, sum[NUM_THREADS];
      step = 1.0/(double) num_steps; // delta X
      omp_set_num_threads(NUM_THREADS);
      #pragma omp parallel
      {
        int i, id, nthrds;
        double x;
        id = omp_get_thread_num();
        nthrds = omp_get_num_threads();
        if (id == 0) nthreads = ndthrds;
        for (i = id, sum[id]=0.0; i < num_steps; i = i+nthrds) {
           x = (i + 0.5) * step;
           sum[id] += 4.0/(1.0 + x*x)
        }
      }
      for(i=0, pi=0.0; i < nthreads; i++) pi += sum[i] * step;
    }
    ```
    This is inefficient. The two threads are accessing consecutive elements that are on the same cacheline because of the consecutive strides.
    * Remember cache coherency. 
    * 8 elements of `sum` fit into a cache line
    * As the two threads continuously update their location in `sum` this will cause a ton of false sharing
    * We can eliminate this by padding the array
      *    
         ```cpp
          static long num_steps = 100000;
          double step;
          #define NUM_THREADS 2
          #define CACHE_LINE_SIZE 8
          #define PAD (CACHE_LINE_SIZE / sizeof(double)) // = 8 for 64B L1 cache

          int main() 
          {
            int i; double x, pi, sum[NUM_THREADS][PAD];
            step = 1.0/(double) num_steps; // delta X
            omp_set_num_threads(NUM_THREADS);
            #pragma omp parallel
            {
              int i, id, nthrds;
              double x;
              id = omp_get_thread_num();
              nthrds = omp_get_num_threads();
              if (id == 0) nthreads = ndthrds;
              for (i = id, sum[id]=0.0; i < num_steps; i = i+nthrds) {
                x = (i + 0.5) * step;
                sum[id][0] += 4.0/(1.0 + x*x)
              }
            }
            for(i=0, pi=0.0; i < nthreads; i++) pi += sum[i][0] * step;
          }
          ```
     * Tradeoff is waste of space which can get bad if we need to work on bigger structs
     * We can also use critical sections and get rid of the array
     * Of course, `omp for reduction` is also good, but is slightly slower than the manual implementation
* MSI protocol
  * Each cache line is labeled **M**odified, **I**nvalid, or **S**hared
  * When a processor updates a variable, it updates its own cache, bualso needs to propagate those changes to other processors.
  * Each cache line is flagged that shows the state of the cache line.
  * On update, the updating processor has its cache line marked modifiedand the previously shared cache lines on the other processors iinvalidated.
  * When another processor accesses the modified variable, then botaccessing processors have cache line become shared.
  * This could potentially cause a problem of **false sharing**
    * The cache line is bounced between processors when updating different variables in the same cache line.
* scabalitlity
  * starting parallel OpenMP region does not come for free
  * try to parallellize outer loop possible
  * consider cache locality, false sharing
  * make sure parallel regions get sufficient speedup to overcome overhead
  * overhead is machine/os/compiler dependent
  * keep in midnn amdahls law