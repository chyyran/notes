# Minterms and Maxterms

## Booleans

Consider some boolean variables `A`, `B`, `C`, `D`.

How do we create `F` that is true when all of `A, B, C, D` are true?

`F = A & B & C & D`

If any one of the dependent terms are false, `F` is going to be false.

What if we wanted `F` if all the variables are false?


`F = !A & !B & !C & !D` 

note that 

`F = !(A & B & C & D)` is not the same. This will be true when any of A, B, C, D, are false.

What if something is true when any of the variable are true?

`F = A | B | C | D`, which is also equivalent to `F = !(!A & !B & !C & !D)`

The first two expressions are minterms, and the last two are maxterms.

### Minterms
Minterms are when all the inputs are high, the output is high, but if any input is low, then the output is low. Minterms tells you the one case when a circuit is high. (e.g. `F = A & B & C & D` is \(m_{15}\), where
\(m_{15} = 1111_b = 15\))

For example, if we have some expression `F = A & B`, we can say this circuit goes high on minterm 7 or \(111_b\).

A circuit may go high on multiple minterms. All other cases are false.

For example for four inputs, \(m_{15} = ABCD\).

### Maxterms
Maxterms are when any of the inputs are high, then the output is high. 

For example for four inputs, \(M_{0} = A + B + C + D\). Notice that \(M_0\) is high all the time *except* when all the inputs are 0. 


## Formal definition

> **def'n** Minterm
> A *minterm* is an AND expression with every input present in true or completed form.

> **def'n** Maxterm
> A *maxterm* is an OR expression with every input present in true or complemented form.

If we have a circuit that has both AND and OR, then it is not expressible with solely minterms or maxterms.

We can then join parts of the circuit together as sums of minterms and maxterms.

## Examples

For four inputs \(ABCD\), can we write \(m_9\) for these inputs?

\(m_9 = 1001_b\). Thence, \(AB'C'D\).

\(M_2 = 0010_b\). Thence, on \(ABC'D\), the circuit is off.

\(m_{16}\) .. does not exist, since we only have for inputs, and \(m_16 = 10000_b\)

## Joining Inputs

A single minterm indicates a set of inputs that will make the output go high. So how can we join them minterms?

Consider the minterms

\(F = ABCD\) and \(F = A'B'C'D'\), representing \(m_{15}\) and \(m_0\). If we OR everything together, we get \(m_{15} + m_0\), a sum of minterms.

## Sum, Product of Minterms

\(Y = (m_2 + m_6 + m_7 + m_{10})\)

When we OR something with 1, we get 1. When we AND something with 0, we get 0. 

From then, we can design a circuit, with 4 AND gates, and OR them together.

\(Y = (M_3 \cdot M_5 \cdot M_7 \cdot M_{10})\)

Similarly with maxterms, but with AND terms.

## Boolean Reduction

When we make circuit with minterms it is very inefficient.

### Law of Absorption

\(x(x+y) = x\)
\(x+(xy) = x\)

Consider \(Y = ABC + ABC'\). We get \(Y = AB(C + C') = AB(1)\).

Consider \(Y = ABC + ABC' + ABC' + ABC\). If we combine the last two terms such that \(Y = ABC + ABC' + AB\), this is not actually the cheapest way.

The best way is actually to combine the first and last, and then again.

### DeMorgans

\(x'y' = (x+y)'\)
\(x'+y' = (xy)'\)

From this, we can see that the gates

```
AND --+
      |-OR
AND --+
```
is equivalent to

```
NAND --+
       |-NAND
NAND --+
```
NAND gates are the cheapest gates. By DeMorgan's law, we can turn all circuits in NAND gates.


## Karnaugh Maps

Rather than bruteforce, we can draw a Karnaugh map.

|  | B'C' | B'C | BC | BC' |
|--|------|-----|----|-----|
|A'|0     |0    |1   |0    |
|A |1     |0    |1   |1    |

Adjacent minterms only differ by one value.

Hence we can group terms together to see an easy way to reduce a circuit.

Then look at BC and BC' are neighbours, so we can get 

\(Y = AB + A'C\)


## Minterms table

|    |C'D'|C'D|CD|CD'|
|----|----|---|---|--
|A'B'|0|1|3|2|
|A'B|4|5|7|6|
|AB|12|13|15|14|
|AB'|8|9|11|10|

## Maxterms table

|    |C+D|C+D'|C'+D'|C'+D|
|----|----|---|---|--
|A + B|0|1|3|2|
|A +B'|4|5|7|6|
|A'+B'|12|13|15|14|
|A'+B|8|9|11|10|