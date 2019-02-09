# 2019-02-06

> Lab was cancelled today due to weather
> thank mr. gertler

## Counters

```
E -+-----------+-----------+
   |       Q0  |        Q1 |         Q2
   | +----+  | | +-----+ | | +----+  |
   +-|T  Q|--+ +-|T   Q|-+ +-|T  Q|--+
     |    |      |     |     |    |
    -|> Q'|------|>  Q'|-----|> Q'|
     +----+      +-----+     +----+
```


This causes the follwoing timing

```
C _-_-_-_-_-_
0 _--__--__--
1 ___----____
```

They wait for the flipflop before them goes from 1 to 0 (negedge) before they toggle

We can make the thing synchronous
```
E -+---------+------------+
   |         |            |          Q2
   | +----+  |   +-----+  |   +----+  |
   +-|T  Q|--AND-|T   Q|--AND-|T  Q|--+
     |    |      |     |      |    |
  +--|> Q'|  +---|>  Q'|   +--|> Q'|
  |  +----+  |   +-----+   |  +----+
C-+----------+-------------+
     
```

This is a synchronous counter, since this changes at the same time of the clock

If we add an XOR into a multiplexor leading into a D flipflop for each clock timer, we can load a value. (diagram omitted)

## State machines

Consider Steve the monkey with the 3 states

```
    +<-------------------+
    |                    |
    v 00    01     10    |
S->Hungry->Food->Steve-->+
```

With self-transitions on no button press, and shown transitions on a 1. 

Can we implement this state with flipflops and combinational circuits?

Since we have 3 states, we need 2 flipflops, which can store 4 values.

We could use an adder, or a counter, or however other stage

```rust
match state {
  0b00 => "Hungry",
  0b01 => "Food",
  0b10 => "Steve",
  _ => _
}

```


### Counters
With counters, each state is the counter stored in a number. The transition moves from one state to the next on a clock tick, or it doesn't move if not told to transition.

|State|Write|State|
|-----|-----|-----|
|0    | 0   | 0   |
|0    | 1   | 1   |
|1    | 0   | 0   |
|1    | 1   | 2   |
|...  |...  |...  |
|7    | 1   | 0   |


Transitions take place on the clock ticks. We can expand this to specifically take on the value of the flipflops.


|State|Write|State|
|-----|-----|-----|
|000    | 0   | 000   |
|000    | 1   | 001   |
|001    | 0   | 001   |
|001    | 1   | 010   |
|...  |...  |...  |


And this table can be turned into a Karnaugh map.
