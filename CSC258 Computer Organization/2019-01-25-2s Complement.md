
# 2's Complement

For 8 bits, we have 7 bits worth of representatin, or a range from -128 to 127. (by doing a bitwise NOT then adding 1). By definition, the first bit in a negative number will always be 1, but that bit **is not a sign bit!**.

|Decimal|Unsigned|Signed 2's|
|-------|--------|----------|
|7|111|---|
|6|110|---|
|5|101|---|
|4|100|---|
|3|011|011|
|2|010|010|
|1|001|001|
|0|000|000|
| -1|---|111|
| -2|---|110|
| -3|---|101|
| -4|---|100|

* The most negative number is 1 followed by all 0s
* The most positive number is 0 followed by all 1s.

## Signed Subtraction Example.

* 7-3

```
  0111
- 0011
------
```
Is the same as

```
  0111 | 7
+ 1101 | 3 in 2's complement
------ |
  0100 | 4 (1 carry bit lost)
```

If we feed in 1 as the carry bit, and NOT the sum bit (Y), we can implement a subtraction.

We can expand the full adder circuit to incorporate subtraction
```
              +---------+-<-SUB
              | Y       |
              | |       |
            X NOR       |
            |  |        |
          +-----+       | 
          |     |       |
 <--COUT--+     |<--CIN-+
          |     |
          +-----+
             | 
             |
             V
             S

```
If `SUB` is on, then Y will invert and CIN will be high (implementing 2's complement).

## Sign and magnitude
Reserves high first bit for sign, and 7 bits for value.

# Comparators

* Takes in 2 vectors, and determines if the first is greater than, less than, or equal to the circuit.

|A|B|Result|Circuit|
|-|-|-|-
|0|0|A = B|\(AB + A'B'\)|
|0|1|A < B|\(A'B\)|
|1|0|A > B|\(AB'\)|
|0|1|A = B|\(AB + A'B'\)|

If we chain comparators together, we can compare bigger numbers. However, we look at things the reverse way from adders. We simply look at the most significant digit first. As soon as we see a difference, we can stop.

\(A==B \equiv (A_1B_1 + A_1' B_1') (A_0B_0 + A_0'B_0')\)
\(A<B \equiv (A_1'B_1) +(A_1B_1 + A_1' B_1') (A_0'B_0)\)
\(A>B \equiv (A_1B_1') +(A_1B_1 + A_1' B_1') (A_0B_0')\)

## Comparators in Verilog

We can use comparators as Verilog primitives

```verilog
assign a_gt_b = (a > b);
assign a_lt_b = (a < b);
assign a_eq_b = (a == b);
```