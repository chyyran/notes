# 2021-10-04 Parallel Algorithms

* Granularity and concurrency
  * Tasks can be fine or coarse grained
  * More concurrency means we can have more tasks or more parallelism
  * *Why can't we just make our tasks very fined grained to increase parallelism?*
  * There are inherent limits to fine-grained decomposition
    * Hitting indivisible tasks
    * Tasks which slow down if split up
  * Consider if a tasks in MxM multiplies one element of A with one element of B to store partial value for C
    * Then all tasks working onf irst row of A have to interact
    * tasks have to write to the same location (write interaction)
      * this is a type of race condition
    * also need to read most recent value of C (read interaction)
  * More tasks also means more dependencies, and more overhead.
* Task interactions
  * A task dependency graph only capture producer/consumer interactions
    * where tasks output is fed in as an input
  * interactions might occur among tasks that are independent in the task dependency graph
    * tasks on different processors might need to exchange data or synchronize
  * read-only interactions
    * tasks only need to read data shared with other tasks
  * read-write interactions
    * tasks need to read or write data shared with other tasks
  * type of sharing can affect which tasks get mapped to which processors
    * read-write interactions should be kept on the same process as much as possible
    * we have complete control on how to control threading
      * threadpool, equal split, single threaded
* mapping tasks to processes
  * mapping is how you assign tasks to processes/threads
  * choice of decomposition affects the ability to select a good mapping
  * goals
    * maximize concurrency
    * minimize completion time
    * minimize cross-process interaction
  * task decomposition and mapping can result in conflicting goals
    * need to find a good balance to optimize for all goals
  * degree of concurrency is affected by decomposition choice, but the mapping affects how much concurrency can be utilized
  * better off keeping result of task in a single process to avoid cache thrashing
    * reuse processes as much as possible
* task size and balance
  * task size is proportional to time needed to complete tasks
  * uniform tasks: roughly same amount of time
  * non-uniform tasks: execution time vary widely
    * we want to have a good mapping
    * it is important to have good equal load
    * if program is not data parallel, then equally dividing compute might not always be the most efficient
    * first goal should be balance, then see profiling
* size of data associated with tasks
  * how much data does each task process
  * impacts task balance
  * affects perf if a task data must be moved from a remote processor
  * input data might be small but output data large, vice versa
* decomposition techniques
  * recursive decomposition 
    * primarily decomposing tasks
    * useful for divide and conquer problems
    * divides problems into subproblems recursively and combine results
    * subproblens can be solved concurrently
    * example
      * mergesort
      * not just for naturally recursive problems
        * even sum can be divide and conquer
      * will this really be that efficient? how much overhead to recurse down to the smallest level of recursion?
      * runtime analysis is a lot similar to the lowest level recursion because we only need to do base steps
        * cache/architecture-agnostic methods
    * we need to tune the size of the base step sometimes, research being done on this tuning
  * data decomposition
    * partitions data to induce task decomposition
    * use data partitioning to perform decomposition of computation into tasks
    * used to exploit concurrency on problems that operate on large data
    * two stages
      * partition the data
      * induce task decomposition from partitioned data
      * iterate
    * two flavours
      * partition input data
      * partition output data
      * partition both
    * matrix-vector example
      * each element of the output can be computed independently
      * this induces a partitioning of the input matrix as well
      * options
        * option 1: we have 4 tasks, and each task computes 2 consecutive elements of result
        * option 2: 2 tasks, each computes 4 consecutive elements of result 
        * option 3: 4 tasks, each computers 2 non-consecutive (strided) elements of result
      * we can't say which one is better without knowing mapping strategy, parallel architecture, or programming model
    * output data partitioning
      * analysis of items bought together frequently
        * input: transactions
        * output: target item sets
      * partition based on output data and decompose into tasks
        * each task computes frequencies of itemsets against all store transactions
    * data movement may be as costly as synchronization
      * matrix-vector row-wise vs column-wise
        * if we partition row-wise, then each task compute one element of C, then tasks must exchange data to get all of B
          * We are only giving the task first row of A, and the first element of B. The entire vector  B must be needed to do the calculation
        * if we partition column-wise, then tasks don't need to exchange data, but need to symchronize data because one element of C is computer with help of all tasks
          * We give the task first column of A and first element of B. This task can then compute partial values of each element in C
          * This requires r/w synchronization 
  * not really a fine line
* 