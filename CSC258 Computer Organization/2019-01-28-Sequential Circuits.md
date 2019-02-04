# Sequential Circuits

Consider Tickle-me-Elmo. When you press the same button, a different sound is created.

Sequential circuits remember their state.

```
--+-Input->|Combinational|-+-Out-->
  ^                        |
  |                        v
  +---<----|Storage|---<---+
```

Also we've abstracted away timed inputs. Physical circuits don't change immediately.

> If some command is executed at time \(T\), then the change happens at time \(T + 1\).

If we loop input and output in a feedback look, can we persist some state?

## Feedback AND
```
      +-----+
      |     |
A -+->+ AND +-+-->Q
   |  |     | |
   |  +-----+ v
   +----------+
```

As soon as Q is 0 though, the entire AND gate will be stuck at 0.


## Feedback OR
```
      +-----+
      |     |
A -+->+ OR  +-+-->Q
   |  |     | |
   |  +-----+ v
   +----------+
```

As soon as Q is 1 though, the entire OR gate will be stuck at 1.


## Feedback NAND and NOR

```
      +------+
      |      |
A -+->+ NAND +-+-->Q
   |  |      | |
   |  +------+ v
   +-----------+
```

If we set A=0, then Q will be 1, and we can store Q=1 forever, however, once we set A=1, Q's value can change, then this gate will flip back and forth between 0 and 1. 


```
      +-----+
      |     |
A -+->+ NOR +-+-->Q
   |  |     | |
   |  +-----+ v
   +----------+
```


If we set A=1, we can store Q=0 indefinitely. However, when A=0  Q's value can change, then this gate will flip back and forth between 0 and 1 forever. 

## Latches

Assume \((S', R') = (1, 0)\)

Consider this circuit

```
       +------+
       |      |
S' -+->+ NAND +---+->Q
    |  |      |   |
    |  +------+   |
    +-----------+ |
                ^ |
       +------+ | |
       |      | | +----+
R' -+->+ NAND +-+-->Q' |
    |  |      |        |
    |  +------+        |
    +-------------<----+
```

We connect 2 NAND gates to each other. the \(R'\) input sets output \(Q'\) to 1, setting \(Q\) to 0. Setting \(R'\) to 1 keeps the output value \(Q'\) at 1, which maintains both values.

<!-- 
However, if we start off with \(S', R' = 1\) the \(S'\) input to 0 keeps the  -->