# 2021-12-08 CUDA Streams

* Occupancy
  * How many threads are running on an SM concurrently vs upper bound of GPU
  * When one warp is stalled, execute a different warp
  * Higher occupancy not necessarily better performance
  * best occupancy limit at around 66%
  * register availability is a limiting factor.
  * if each block uses many registers the nuyumber of blocks on an SM lowers the occupancy of the SM
* Pinned Host memory
  * CUDA runtime has its own mechanism to allocate host memory
  * This pins the memory and GPU can possibly use DMA as physical address is known
* CUDA stream
  * sequence of operations that execute on the device in the order they are issued in the host code
  * operations in different stream run concurrently!
  * default stream has certain features
    * memcopies are blocking
  * can define different stream on host
  * multiple streams mean multiple kernels can run at the same time
  * anything that is not the default stream can use async memcpy
  * cudaDeviceSynchronize is overkill but will sync all kernels
  * cudaStreamSynchronize(str) can sync only until stream is finished
  * within the same stream order is enforced, but gpu controls stream scheduling