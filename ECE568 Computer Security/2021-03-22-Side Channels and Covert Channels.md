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