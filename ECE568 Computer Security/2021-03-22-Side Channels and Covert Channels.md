# 2021-03-22 Side Channels and Covert Channels

* side-channels
  * allow unintentional information flow to leak
    * unexpected forms
      * RF leakage
      * timing attacks
        * execution  time of algorithms can sometimes leak information
        * strcmp runtime is proportional to the number of matching characters
        * remote measurement subject to noise
        * security-sensitive algos should have constant or randomized runtime independent of input
      * eletromagnetic side-channel
        * capture signals from computer monitors (CRT) to reconstruct video signals
        * still possible using timing channel of modern LCD monitors
        * same principle can be applied to other IO devices like keyboards
* power analysis
  * power input to circuit is also an unintended output that can leak info
  * eavesdropping on the power usage needed to read certain information
  * use ML to analyse 
  * defenses
    * constant time algorithms
    * hide signal with some noise
    * inject noise in power circuit
    * be less efficient
    * change clocking frequency within tolerances to vary voltage swing timing
* audio analysis
  * keyboard sounds to analyse passwords
* video based attacks
  * analyse video for passwords
  * heat signature attacks
  * reading LCD monitors from reflective coffee pots
* covert channel
  * a channel is created intentionally by an attacker
  * side channels are accidental
  * allow implicit information flow outside of the specified security policy
    * rasppi ethernet adapter is noisy, can be used to send morse code over radio
  * hard to detect
  * live outside of access control
  * affect actions of another process in some way even if there is no explicit communication
* non-interference
  * allows analyzing covert channels
  * a system has noninterference property iff any sequence of inputs to a process produces the same outputs regardless of inputs to other processes
    * this is hard, especially in shared envs
  * ex:
    * user with low clearance working on machine
    * machine should respond the same way whether or not a high-clearance user is working with machine
    * low user should not be able to acquire any info about high user
  * very strict, and very difficult
  * every covert channel identified using non-interference is not usable
    * sender must be able to control output, and receiver must be able to interpret
    * channel must have sufficient capacity/bandwidth to be useful
* cloud envs becoming more homogenous
  * loss of diversity makes attacks more severe 
* IoT covert/side channels