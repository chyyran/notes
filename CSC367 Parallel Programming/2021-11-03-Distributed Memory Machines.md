# 2021-11-03 Distributed Memory Machines
* Logical view
  * each process is a separate entitty with its own memoery
  * each process runs separate instance of same program
  * process must access other process memory via **explicit messages**
  * message passing implies distributed address space
* physical view
  * underlying architecture could be either distributed  memory or shared memory
  * message passing on physical shared can be simulated by copying or mapping into diff program memory space
  * MPI can simulate distributed environment on shared memory machine
* vs. openMP/pthreads
  * let proceses compute indepedently
  * coordinate only rarely to exchange information
  * communication is expensive and should be done rarely
  * partition data so that a lot of work can be done locally on machine
    * maximize locality, minimize transfers
    * coarse grained parallelism might work better
* interactions carried out via passing messages between processes
  * `send(void *sbuf, int n, int dest)`
  * `recv(void *rbuf, int n, int src)`
  * complexity lies in how operations are carried out
  * consider this code
    ```c
        // p0
        msg = 5;
        send(&msg, 1, 1);   
        msg = 200
        // p1
        recv(&msg, 1, 0);
        printf("%d", msg);
    ```
      * if send/recv is blockign then p1 will receive 5, otherwise may receive 200
* blocking operations
  * only return from an operation once its safe to do so
  * just need to guarantee semantics, not necessarily when msg received
  * non-buffered blocking send/recv
    * send does not return until recv is encountered and communication operation is completed
    * both machines have to stall until both send and receive is ready
    * deadlocks can occur with certain ordering due to blocking in non-buffered
      * both processes wait for the other one to send
        ```c
        // p0 
        send(&m1, 1, 1);
        recv(&m2, 1, 1);
        // p1
        send(&m1, 1, 0);
        recv(&m2, 1, 1);
        ``` 
      * we can fix this by switching order but there is no place for the messages to go if we don't have a buffer
  * buffered blocking send recv
    * sender copies data into buffer and returns once buffer copy is completed
    * receiver stores data into buffer until it reaches the matching receive
    * with hardware support
      * sender copies to buffer
      * communication handled by hardware, receiver can copy from buffer once send is complete
    * without hardware support
      * receiver has buffer (no buffer on send side or vice versa)
      * send interupts receiver and deposits data in buffer
      * receiver grabs data once done.
    * buffers are finite and can overflow
      ```rust
      //p0
      for (0..100000) {
        create_message(&m);
        send(&m, 1, 1);  // don't need to wait, it just sends and go
      }
      //p1
      for (0..100000) {
          recv(&m, 1, 0);
          digest_message(&m);
      }
      ```
      we are sending too many things too fast before the other side can empty the buffer
    * deadlocks still possible
      ```c
      //po
      recv(&m1, 1, 1);
      send(&m2, 1, 1);
      //p1
      recv(&m1, 1, 0);
      send(&m2, 1, 0);
      ``` 
      recv blocks, and both processes are waiting for a recv that will never come.
* non-blocking
  * better performance!
  * user is responsible to ensure that data is not changed until its safe
  * typically check-status operation indicates if correctness could be violated by an in-flight transfer
  * can be buffered or nonbuffered, with/without hardware support
  * without hardware support
    * send issues request to send and returns immediately
    * when receive is encountered, communication initiates.
    * period of time between send request and receive, underlying data may change
  * with DMA
    * does not help unsafe period
    * under the hood data is being transfered 
    * recv end might even change data as it is being received
  * programmer must explicitly ensure semantics by polling to verify completion
  * no deadlocks!
* hardware features
  * network interface can transfer messages from buffer memory to desired location without CPU intervention
  * DMA allows copying of data from one memory location to another without CPU support
* takeaways
  * consider implementation gurantees
* MPI
  * standard library for message parsing
  * portable message passing algorithms
  * can have multiple communication worlds
  * basic routines
    * `MPI_Init`: initialize
      * Called once at start by one thread to init environment
    * `MPI_Finalize`: terminate MPI environment
    * `MPI_Comm_size`: get number of processes
    * `MPI_Comm_rank`: get process ID of caller
    * `MPI_Send`: send message
    * `MPI_Recv`: receive messages
  * MPI communication domain 
    * set of prcesses alloweed to communicate with each other
    * communicators `MPI_Comm` stores information about communication domain
    * `MPI_COMM_WORLD` contains all machines
    * special cases, we may want to perform tasks in separate or overlapping domains
    * metadata can be accessed with `MPI_Comm_size(MPI_Comm comm, int *size)` where the process is part of `comm`
  * MPI data types
    * equivalent to built-in C types except `MPI_BYTE`, `MPI_PACKED`
    * ensures standard among machines
    * may have check bits attached
    * `MPI_PACKED` allows for more efficient packed sends
  * flavours of communication
    * collective
      * all processes in communicator participate
      * barrier, broadcast, reduce, scatter/gather, all-to-all, etc.
      * preferred in cloud
    * point-to-point
      * processor explicitly communicates with another processor in send/recv
      * very messy but high performance potentially
      * MPI fault tolerance is not that great