# 2021-09-20 Memory system performance

* Memory hierarchy
  * Hierarchy of a single processor can contain multiple levels of cache, memory and storage
* Bandwidth and latency
  * Latency is the time it takes to transfer data from one point to another
    * Can be on the order of ns when we are talking about cache to regs
  * Bandwidth is the amount of data transferred in a fixed period of time
    * For example, memory bandwidth can be 100MB/s
  * Becomes very important in distributed systems as algorithm is bottlenecked by network
  * Latency can be highly variable, on the cloud accessing may be seconds to minutes
* Caches
  * Caches store previously accessed cache lines to reduce RAM ref
  * If data required in processor is in cache it is a cache hit
  * Data accesses not in cache is cache miss
* Temporal locality
  * Reuse data already in the cache
  * Eliminate memory operations by saving values in small, fast memory and reusing them (bandwidth filtering)
* Spatial locality
  * Operate on data stored close to each other in memory and can be brought into cache together
  * Take advantage of better bandwidth by getting chunk of memory into cache or regs and using the whole chunk
* Matrix Multiplication revisitied
  * Matrices were stored in row order
  * Each element is an 8 byte double
  * matrix is 4KB by 4KB
    * How many elements does a row have? 4K
  * cache line size is 64B
    * How many elements fit in a cache line? 8
  * cache is 256KB
    * how many rows can the cache store? 8
  * Data access pattern for ijk
    * i -> j -> k
      * as you grab the cache line each element is 4096 elements apart
  * cache stores 32K elements at a time
  * each memory ref gives us 8 consecutive elements, so how many references are needed to complete the 8K FLOPs to compute C = A x B?
    * 4K multiplications and 4K adds to compute C
    * 1 to get C
    * 4K/8=512 to get each element of A
    * 4K for B since it is not consecutively stored
    * =4096+512+1
    * B has too many accesses
  * If we reorder the loops to go i->k->j we use the same number of FLOPS but reduce number of memory accesses
    * Multiply each element of B with A, then add to each element of C
    * 4K/8=512 to get each element of C
    * 1 for A
    * 4K/8=512 for B
    * =1025
    * Improved special locality!
    * We are also taking advantage of temporal locality since we are reusing A
      * Temporal locality = temporal reuse
* Cold vs warm cache
  * A **cold cache** is when the data in cache is stale and we need to read from memory
  * A  **warm cache** is when relevant data is in cache
  * If we run code once vs 10 times and average, timings may differ because of these cold cache concepts