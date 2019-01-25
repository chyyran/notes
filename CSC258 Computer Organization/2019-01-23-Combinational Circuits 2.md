
## Don't care values.

Consider a 7-seg display that only displays the numbers `0-9`. We **don't care** about the other cases. 

In that case, for those cases in the K-map do not appear, we can make those values whatever we want.

|  |00|10|11|01|
|--|-|-|-|-|
|00|0|1|0|0|
|10|1|0|0|0|
|11|x|x|x|x|
|01|0|0|x|x|


The place marked `x` can be made to be any value to create bigger K-map groups for a smaller, more compact circuit.

## Adder Circuits

How do we add numbers?

What if we add 1 + 1?

```
  1
+ 1
---
  2
```

What about 1 and 9?

```
  1
+ 9
---
 10
```

10 needs 2 digits to store the value!

Consider `6213`. This is `6 * 1000, 2 * 100, 1 * 10, 3 * 1` in base 10.

Any value that overflows goes into the next column!

Consider this in binary.

```
   1
b+ 1
----
  10
```

So now we have the 1s, 2s, 4s, 8s, 16s, 32s, etc... places instead of 1, 10, 100, etc.

```
   11 | Carry
-------
   1010
b+ 0110
-------
  10000
```

We can also divide numbers continually.

|Value|Result after dividing by 2|Remainder|
|-----|------|---------|
|99|49|1|
|49|24|1|
|24|2|0|
|12|6|0|
|6|3|0|
|3|1|1|
|1|0|1|

And the binary representation of 99 is \(01100011_b\)

## Hex numbers

0-9 as in decimal, 10-15 is A-F.

For example
`0000 0101 1111 1010 = 0x05fa`

Each hex digit is a group of 4 bits.

## Unsigned binary addition

Why do we always start from the right to the left hand side? When the numbers overflow, it will overflow over to the left. We need to save the left-handside calculation until we have the result from the right.

## Half Adders
* A 2-input, 1-bit width binary adder that performs the following calcuations

```
  X     0     0     1    1
+ Y   + 0   + 1   + 0  + 1
---   ---   ---   ---  ---
 CS    00    01    01   10
```

When both inputs are high the carry bit `C` is high, so we can use an AND gate.

```
       X Y
       | |
       | |
     +-----+
     |     |
C ---|  HA |
     |     |
     +-----+
        |
        |
        S
```

\(C = XY\)
\(S = XY' + X'Y = X \oplus Y\)



## Full Adders

Similar to half adders, but with an additional carry in bit,
If the carry is low, then acts like a half adder. Otherwise, we get this behavior.


```
  X     0     0     1    1
  Y     0     1     0    1
  Z   + 1   + 1   + 1  + 1
---   ---   ---   ---  ---
 CS    00    10    10   11
```

Notice that the sum is an XOR of the 3 inputs.

\(C = XY + XZ + YZ\), or all the cases where the sum is too high
\(S = X \oplus Y \oplus Z\)

## Ripple-carry binary adder.

If we chain full adders together, we can perform operations on signal vectors.

```    
       XY      XY
      +--+    +--+
<-OUT-|  |<-C-|  |<-...<-IN-
      +--+    +--+
      |        |
      v        v
      S        S
```

## 2's complement

|Binary  |Decimal       |
|--------|--------------|
|00000000|0             |
|00000001|1             |
|11111111|-1 (if signed)|

Signed is more common, and we interpret binary numbers from \([-128, 127]\)

2's complement is finding what number when added will go to 0.

1. Get one's complement
   1. Negate each individual bit (bitwise NOT)

For example

```
  0110 1001
+ 1001 0110
----------
  1111 1111
```

Then add 1 to it, which will overflow the value to 0 to get 2's complement.

```
 1111 1111
+        1
----------
 0000 0000
```