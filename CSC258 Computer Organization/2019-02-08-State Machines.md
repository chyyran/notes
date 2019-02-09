# State machines

* Tickle Me Elmo
* Traffic Lights
  * Red -> Green -> Yellow -> Red
* Alarm Clock
  * TimerTick -> Alarm --Snooze-> Timer Tick

## FSM Design

* Draw state diagram
  * number of flipflops that record the current state
* Derive state table
* Assign flipflop configurations to each state
  * \(\log_2{(\text{number of states})}\)
* Redraw state table with flipflop values
* Derive combinational circuits for output for each flipflop input.

## Sequence Recognizer
* Recognize a sequence of input values and raise a signal if that input has been seen
* Example three high values in a row
  * Input has been high for 3 rising clock edges
  * Assumes a single input \(X\) and single output \(Z\).
  * State diagram that records the last three values that were receieved. Since state transitions happen on a tick we can recognize signals
  * Need to form a state transition table from the diagram

* We can simply map each input state to each output state. Enable can be considered as a self-transition.

|F2|F1|F0|En|F2|F1|F0|
|--|--|--|--|--|--|--|
|0|0|0|0|0|0|0|
|0|0|0|1|0|0|1|
|0|0|1|0|0|0|1|
|0|0|1|1|0|1|0|
|0|1|0|0|0|1|0|
|0|1|0|1|0|1|1|
|...|...|...|

We can make Karnaugh maps for each flipflop.

## Two ways to make the state machine

* Moore machine:
  * output of the FSM depends on the current state
* Mealy machine
  * Depeneds on the state an input
  * Bein in state X may result in different output
  * Changes on the edge.

## Timing

We need to consider the timing of the states. For example, if we change from 011 to 110, then for a brief time it might go to 111, then 110. These flipflops don't change at the same time exactly.

Never have a transition between two states that could make transitions bad