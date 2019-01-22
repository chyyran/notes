## Transistors II

When a charge difference exists between two regions, an electric field is created. Electrons in the middle are attracted to the positive side, repelled to the negative.

This field causes holes to flow back to the *p* section, and electrons flow back to the *n* . Current caused by the initial electron/hole combination is **diffusion**, but the current caused by the field is called **drift**.

**Forward bias** is when a positive voltage is applied to *p* (shoving electrons into the *n*-type side), the depletion layer starts to slim and then it starts to conduct. When applied to the *n* side, the excess electrons fill up the holes, and the depletion region becomes wider, preventing carriers from passing. Some current exists but is small.

**MOSFET** or Metal Oxide Semiconductor Field Effect Transistor. It sandwiches a p-type material between two *n* types.

```
|n| |n|
|ppppp|
```

If we apply a voltage like so

```
 +   -
|n| |n|
|ppppp|
```
Then the n type material on the left side, then the depletion layer will form on the left *n*, since we have reversed biased it. Same thing if we swap the voltages.

What if we apply a voltage to a metal oxide layer

```
 + + -
|n|_|n|
|ppppp|
```

That layer `_` will become really positively charged, and begins to pull electrons towards it like a magnet.


```
 + + -
|n|_|n|
|eeeee|
|ppppp|
```
This creates a layer of electrons along the two *n*-types, creating a path for the current to conduct. 

There are two types of MOSFET, nMOS as in this example or pMOS, which is inverted. One conducts when the gate is high, and one when it is low.

|VDS|VGS|IDS|
|---|---|---|
|L|L|L|
|L|H|L|
|H|L|L|
|H|H|H|

Now if we combine two MOSFETs, we can create the NOT gate

|A|Y|
|-|-|
|0|1|
|1|0|

If `@|` is a transistor, and `!` negates the input..

```
      -+- 5V
    +!@|
    |  |
A --+  +--Y
    |  |
    +-@|
      -+- 0V
       +
```


\(V_{cc}\) = "Common Collector Voltage". Note that when we say "0V", that doesn't mean that there is no electricity. There is output but it is not a null state. It can be sent to another gate. Since electricity always wants to flow to the ground the quickest way, if the gate goes to 0, then a 0 is written to the output. 

