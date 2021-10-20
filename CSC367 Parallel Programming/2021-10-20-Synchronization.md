# 2021-10-20 Synchronization
* Mutual exclusion
  * Given \(n\) threads \(T_0, ..., T_n\)
  * A set of resources shared between threads
  * a segment of code acessing the shared resource called the *critical section*
  * We want to ensure that only one thread at a time access the critical section
  * Mutex locks
    * associated with resource to ensure single access and ensures mutual exclusion
  * Both reads and writes to shared data must be locked, if a concurrent write is possible.
  * If a thread never releases a lock, all other waiting threads are stuck
    * **deadlocks**
* Coarse vs finegrained locking
  * locking large sections of the code limits efficiency/concurrency
  * fine grained locking: lock only **what is needed**
    * reduce unnecessary waiting/blockingn, more parallelism
    * separate locks can run in parallel at a higher degree of concurrency
    * must be careful with fine grained locking!
      * must be aware of program semantics!
      * both RW to same critical section should be locked under the same borrows
    * deadlock
      * must be careful of deadlocks when locks are taken by different threads at **different orders**
      * mutual blocking of a set of threads
      * **enforce same orderign in every piece of code where we acquire more than 1 lock**s
      * consider
        * `lock(E, 1), lock(M,2), lock(M,1), lock(E,2), unlock(E,1), unlock(M,2)`
        * deadlock when thread 2 attemps to acquire M
* overhead of locking
  * when threads access the same lock we have **lock contention**
  * if lots of threads contend the same lock we impact performance
  * even with no contention acquiring a lock has big overhead
  * **localize** as much as possible and use synchronization scarcely
* barriers
  * threads that reach barrier stop until all threads reach it
* OpenMP
  * POSIX has drawbacks
    * overhead of thread creation is high
    * data race bugs are intermittent and nasty to find
    * deadlocks are also intermittent 
  * helps with some but doesnt make them disappear
  * Open specification for  multiprocessing
  * high level API for programming
    * preprocessor compiler directives (~80%) 
      * `#pragma omp construct [clause*]`
    * library calls in `<omp.h>` (~19%)
    * environment variables (~1%)
  * requires compiler support (C, C++, Fortran)
  * main set of OpenMP constructs
    * `#pragma omp parallel`
    * `int omp_get_thread_num()` `int omp_get_num_threads()`
    * `double omp_get_wtime()`
    * `setenv OMP_NUM_THREADS N`
    * `#pragma omp barrier` `#pragma omp critical`
    * `#pragma omp for` `#pragma omp parallel for`
    * `reduction(op:list)`
    * `schedule(dynamic[, chunk])` / `schedule(static[,chunk])`
    * `nowait`
    * `#pragma omp single`
    * `#pragma omp task` `#pragma omp section` `#pragma omp taskwait`
  * lacks atomics here because OpenMP does it for you at a high level (e.g. reductions)
* fork/join model
  * start with single master thread
  * create group of worker threads (fork)
    * everything in parallel block is executed by thread
  * all threads synchronize at end of parallel block (join)
  * worker threads share same address space
  * openMP provides ability to distinguish shared/private
* if you don't set number of threads, X number of threads will be automatrically spawned for X cores (or 2X if hyperthreading)