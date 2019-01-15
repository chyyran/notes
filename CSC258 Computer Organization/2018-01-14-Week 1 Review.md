---
tags: 
  - transistors
  - week 1 review
  - daddy engels
---

# Week 1 Review

* nMOS has p substrate with n pockets
  * apply voltage to gate
* pMOS has n substrate with p pockets
* T&F, doping gives an overall positive or negative charge
  * false
* What type of bias on pn causes depletion layer to expand
  * reverse (forward causes current to flow)
* Phosphorus has 5 electrons in outer shell. When added in small amounts to silicon, the result is a 
  *n*-type semiconductor / doped
  
* nMOS gates will conduct (1) when current is applied. pMOS gates conduct when (0) ground is applied.

# Boolean Expressions

Take the equation 

\[Y = (A+B)(A'+B')+C\]

How can we express this as a gate?

```
AB  O---+
        |-D--O--Y
A'B'O---+    |
             |
C------------+
```

`O` is an OR gate, and `D` an AND gate.

## Creating complex circuits

Consider 3 inputs ABC, and we want to make Y output high when all the inputs are low, or when AB are low and C is high, or when A and C are low  but B is high, and when A is low, and BC high.

```ABC->Y```

|A|B|C|Y|
|-|-|-|-|
|0|0|0|1|
|0|0|1|1|
|0|1|0|1|
|0|1|1|1|
|1|1|1|0|
|1|1|0|0|
|1|0|1|0|
|1|0|0|0|

\(Y = A'B'C' + A'B'C + ...\)

Since all the outputs of B, and C do not matter; whenever A is 0, Y becomes high. Hence \(Y = A'\).

Basic steps
1. Create a truth table
2. Express as boolean expression
3. Draw the gates

Spending more time on step 2. will result in a more efficient design.

## Minterms and Minterms

* An easier way to express circuit behavior
* Assume standard truth table format, and list which input rows cause high output.

* \(m_n\) where \(n\) is the number expressed in binary by the truth table row.

For example, 

|A|B|C|Y|
|-|-|-|-|
|0|0|0|1|
|0|0|1|1|
|0|1|0|1|
|0|1|1|1|
|1|1|1|0|
|1|1|0|0|
|1|0|1|0|
|1|0|0|0|

We can simplify this as

|\(m_n\)|Y|
|-------|-|
|\(m_0\)|1|
|\(m_1\)|1|
|\(m_2\)|1|

... and so forth.

Then we write \(Y = \Sigma({m_1, m_2, ...})\)

Max terms are 


## Karnaugh maps

Karnaugh maps