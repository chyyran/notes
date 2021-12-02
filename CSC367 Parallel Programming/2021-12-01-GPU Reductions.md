# 2021-12-01 GPU Reductions

* Frequently used
  * 
    ```cpp
    int lane = threadIdx.x % warpSize; // thread ID inside a warp
    int lane = threadIdx.x & (warpSize - 1); // warp is a power of 2!
    int warp_id = threadIdx.x / warpSize; // warp ID inside a thread block
    ```
  * Dynamically allocate shhared memory
    * `reduce1<<<dimGrid, dimBlock, shMemSize>>>(d_idata, d_odata)`
    * dynamicaly allocated in `extern __shared__ int sdata[]`
* Parallel reduce
  * tree based approach
  * we need multiple thread blocks
  * each thread block reduces a portion of the array
  * how are partial results commuinicated between thread blocks?
    * do we use syncthreads? we need to wait for previous results!
    * syncthreads only synchronizes inside a block
    * can not global synchronize
  * we need to split off mutliple kernels
* Kernel decomposition
  * decompose computation into multiple kernel level invocations
    * see different impls in upcoming slides that reach gpu peak perf
    * reductions are memory bound!
* Impl 1 interleav address
  * each thread loads one element from global to shared mem
  * a thread reduces 2 elements: thread1 adds first 2 elements, thread2 address next two and so on
  * half threads are deactivated after each step
  * when only one thread is left we terminate
  * every even thread does work
    * this impl is very divergent since we stall on even numbered threads
    * the odd threads are not workign!
    * `%` is also a very expensive operation

* Impl 2: interleave addressing without divergence
  * we access threads inside the same warp in a numeric order
  * first 64 threads (first 2 warps) do work for me
  * this implementation has bank conflicts
    * 2-way bank conflicts happen at every step
    * there are more than 16 threads!
* impl 3: sequential access
  * every thread in a warp access the same bank
  * we can potentially get rid of if statements
  * this is wasteful since each thread grabs 1 element and reduces it
  * if array is bigger than that size your kernel needs to take care of tail
* impl 4: read 2 elements and add during load
  * half the number of blocks, each thread reads 2 elements and adds during load
  * instruction  bottleneck
  * memory bandwidth is still underutilitized
  * there is arithmetic and loop overhead!
  * we need to unroll loops to eliminate extra instructions
* impl 5: unroll last warp
  * consider the last step inside a single warp
  * halfwarps will eventually have to stall in the if, but we don't need it and just throw away the unused work
  * we also dont need syncthreads because warps are automatically synchronized
  * `if (tid < 32) warpReduce(sdata, td)` = unrolled reduce
  * we need `volatile` to ensure correctness to avoid register loading
* impl 6: complete unrolling
  * use templates to unroll up all the way