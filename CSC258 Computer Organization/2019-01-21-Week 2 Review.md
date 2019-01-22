# 2019-01-21

# Logic Gates
 * Combinational circuits
 * Circuit reduction
 * Karnaugh maps

How can you express a 2-input XOR as a NAND and NOT?

|W|X|W XOR X|
|-|-|-------|
|0|0|0|
|0|1|1|
|1|0|1|
|1|1|0|

\(= m_1 + m_2 = W'X + W'X = (W + X)(W' + X') = (W + X)(WX)\)

```

```
\((W' + X') = (WX)'\)



How can you create a NOT gate from a 2-input NAND gate?

```
A--+
    NAND--A'
A--+

A--+
    NAND--A'
1--+
```

Because a NAND gate is just a NOT after an AND

## Karnaugh Maps

Given an expression

\(Y = m_0 + m_1 + m+2 + m_5 + m_7 + m_5 + m_9 + m_{10} + m_{13} + m_{15}\)

Can we make a K-map quickly?


|    |C'D'|C'D|CD|CD'|
|----|----|---|---|--
|A'B'|1|1|0|1|
|A'B|0|1|1|0|
|AB|0|1|1|0|
|AB'|0|1|0|0|

Remember the order o 0132/4576/.../

Also notice the corners.
