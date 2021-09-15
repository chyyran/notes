# 2021-09-13 Introduction

* Scinet
  * Will have downtimes
  * Work in groups of two
  * Cluster might go down during assignment due dates
  * login node will do scheduling, decide which computer will run job

* Why the fastest computers are parallel?
  * now all computers are parallel (since 2005)
  * including laptops, handhelds
* Tunnel Vision
  * back in 90s, people were hyped about parallel computing
  * back in 90s, idea was to connect single threaded machines through a (low-latency) network
  * communication is a huge bottleneck
  * Moore's Law
    * Transistor density would double roughly every 18 months
    * Gordon Moore 1965
    * "free" compute power over time
    * frequency roughly followed transistor count from 1970s to 2000
    * after the year 2000, frequency scaling stopped
      * dynamic power is proportional to V^2fC
      * C is capacitance
      * increasing frequency (f) also increases supply voltage (V)
      * the effect of frequency scaling here is cubic
      * increasing cores increases capacitance (C) linearly
      * we can save power by lowering clock speed, 
      * concurrent systems are more power efficient
      * high performance serial processors waste more power!
      * frequency scaling plateaus around 2005, while chip density increases
    * number of processor cores start doubling rather than scaling frequency
* units of measure
  * FLOP: floating point operation (double precision)
  * FLOP/s: flop/second
  * fastest supercomputer can do exaflops
* Parallel Computers
  * In a single computer we have a processor with L1/L2 cache in one unit
  * DRAM attached outside, and L3 cache closer to computer
  * hierachical cache to bring items from slow to fast memory
  * parallel computers have multiple cores with independent caches, memory, etc
  * between each layer we have potential interconnects (via network) or shared cache
* Does performance engineering matter?
  * Example: Dense matrix/matrix multiplication
  * Given a haswell CPU
    * 2.9GHz, 2 chips, 9 cores, with 2-way hyperthreading and 8 fmadd per core per cycle
    * (2.9 x 10^9) x 2 cores x 9 threads x 16 (multiply + add) flops = 836 GFLOPS
  * Simply changing loop order could affect running time of matrix/matrix mult by a factor of 15?
    * This is because of memory hierachy and cache (spacial) locality
    * temporal locality: use data more frequently while its in the cache to prevent eviction
    * matrices are stored in row-major order
* Cache
  * Each processor reads and writes from main memory in contiguous cache lines
  * previously accessed cache lines are stored in smaller memory called cache
  * if data required by processor resides in cache we have cache hit
  * data access not in cache is slow, (cache miss)
  https://utoronto.zoom.us/j/84418692578
* We can use `valgrind`, `perf` or other profiling tools to check cache miss rate
* Some compiler optimizations will be able to reeorder loops
  * Max optimization is not necessarily faster, benchmarks are needed
* Parallelization
  * The outer for loop in matrix/matrix has no data dependencies on the inner loops
    * ```c++
      for (int i=0; i< n; ++i) {
        for (int k=0; k < n; ++k) {
          for (int j=0; j < n; ++j) {
            C[i][j] += A[i][k] * B[k][j]
          }
        }
      }
      ```
    * this loop is 'embarassingly parallel' so using OpenMP `#pragma ompparallel for` will give us free speedup
    * We still only get 5% parallelizatioN!
  * We can go further, and can we can reach up to 40% of machine peak
    * tiling
    * SIMD vectorization
    * matrix transposition
    * alignment
* Writing fast code
  * Think, code, run, profile, repeat
* Topics
  * Memory Hierarchies
  * Perf engineering on single processor
  * Shared memory parallelism with pthreads and openMP
  * Distributed parallelism with MPI
  * Locality and paralllism
  * parallel algos
  * GPU programming on CUDA
  * (maybe) Cloud computing