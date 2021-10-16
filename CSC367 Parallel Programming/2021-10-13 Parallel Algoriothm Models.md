# 2021-10-13


* A parallel algorithm model is
  * 1 decompositiont ype + 1 mapping type + strategies to minimize itneractions
  * common models
    * data parallel model
    * work pool model
    * master-slave model
* Data parallel model
  * decomposition
    * typically static and uniform data partitioning
    * typically done on the data first
  * mapping
    * mostly static
    * we know task size and helps with locality
  * same operaations on different data items, i.e. **data parallelism**
  * possible optimization strategies
    * choose a locality preserving decomposition
    * overlap computation with interaction
    * scales really well with problem size by adding more processes
* Work pool model
  * Tasks are taken by processes from a common pool of work
  * decomposition
    * highly problem dependent
    * can be data, recursively
    * can be statically available at the start, or dynamically create more tasks during execution, if need be
  * mapping
    * dynamic
    * any task can be performed by any process
  * possible strategies
    * adjust granularity, trade off between load imbalance and overhead of accessing work pool
* Master-slave model
  * commonly used in distributed parallel architecture
  * very similar to work-pool model
  * master process generates work and allocates to slave processes
    * could have several masters or a hierarchy of master processes
  * decomposiotion
    * highly depends on the problem
    * might be static if tasks are easy to break down a priori or dynamic
  * mapping
    * often dynamic
    * any worker could be assigned any task
  * stragiries for reducing intersction
    * choose granularity carefully so master does not bottleneck
    * overlap computation on workers with master generating further tasks
  * high end machines become the master and are very reliable
    * keep critical data structures on the master 
    * if worker machines die so be it
  * drawbacks
    * workers idle before masters decide next sequence of tasks
      * can be mitigated with workers having some preloaded task
* Parallel performance model
  * Sources of overhead in parallel programs
    * Parallel execution over N processes rarely results in N-fold performance gain
    * overheads of **inter-process communication**, **idling**, **excess computation**
  * when we spawn off tasks we have to wait for the last one to finish
  * speedup
    * performance gain of parallel algorithm over sequential
    * \(S = T_s / T_p\) where \(T_s\) is the serial execution and \(T_p\) time to execute on \(p\) processors
    * example: sum of elements of array where each process handles one element has \(\theta(\log n)\) time because we are reducing each element by half every step, so the speedup is \(\theta(n / \log n)\)
  * calculate based on the best serial implementation of the algorithm
    * first improve serial baseline, and optimize improced serial implementation on \(p\) processors
  * best speedup is **linear speedup**
    * each process takes \(p\) times less than \(T_s\), so \(S = p\)
  * If \(S > p\) we g et **superlinear speedup**
    * superlinear speedup can only happen if sequential algorithm is at a disavantage compared to parallel version
    * for example, data too large to fit into one processors cache
    * if program needs to stream the data \(n\) times, the data does not fit in cache so data has to be moved between memory and cache \(n\) times.