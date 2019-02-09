# Combination circuits

## Timing
circuits take some amount of time

* inputs should not be changing at the same time as the active edge of the clock
  
* Setup time:
  * input should be stable for some time before the edge
* Hold time:
  * Input should be stable for some time immediately after the edge

We need to build some buffer to allow the flipflop to change before the input value. Otherwise there is some chance that the clock will change before the new input value has been set in the flipflop.

* longest propagation delay
  * time period between 2 active clock edges

* Asynchronous clock reset
  * output is reset to 0 immediately, independent of the clock signal
* Synchronous clock reset
  * active edge of the clock

## Register

* shift register
  * bits one at a time
* load register
  * feeds signals into each flipflop, and loads the registers values all at once
  * enable signal to allow a new value to be written into the register
    * enable signal implemented with a d flipflop
    * isn't that what the clock does?
    * clock tells us when things can change
    * enable signal tells which register can change

## T Flipflop

* Output is inverted when the output T is high.
* What happens when a series of T flipflops are connected together in sequence?
* 4 bit ripple counter
  * asynchronous circuit
  * timing isn't quite synchronizied with the rising clock pulse
  * cheap to implement but unreliable for timing