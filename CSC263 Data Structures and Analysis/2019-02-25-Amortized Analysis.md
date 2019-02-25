# Amortized Analysis

Given a datastructure with some ops, and an arbitrary sequence of \(n\) operations,

\(T(n)\) is the worse case total cost of doing a sequence of \(n\) opts.

We would like to compute the average cost per operation 

\[\frac{T(n)}{n}\]

which is the average, or *amortized* cost.

Some operations may be cheap, some may be expensive, so the average cost may be much cheaper than the worst operation in the sequence.

This is the *average worst-case* cost, of an arbitrary, rather, all possible sequences.

If the max cost of an operation in the sequence is \(x\), then we have an upper bound on \(T(n) \leq nx\). However, we hope that the actual cost, or average cost, is actually \(T(n) \ll nx\).

Binomial Heaps has an average constant time, for example.

## Aggregate analysis.
### Binary counter
Let A be an array \(A[0 ...k-1]\) of bits, initially full of 0s. The only operation is an increment operation, `Increment(A)`, that increments the bit vector by one bit. Then the cost of this will **depend on the carry bits**.


Let \(T(n)\) be the cost of a sequence of \(n\) increments. Then obviously we see the cost is the number of bits flipped. The naive upper bound here is \(T(n) \leq nk\). We flip at most \(k\) bits, and we can potentially do this \(n\) times.

However, the worst case only occurs when all bits are 1, and increasing the bits involves flipping each \(k\) bits.

It turns out that we can show that \(T(n) \leq n\).

Consider a sequence of \(n\) increments on \(k\) bits.

```
Index 2 1 0
      -----
      0 0 0
      0 0 1
      0 1 0
      0 1 1
      1 0 0
      1 0 1
      1 1 0
      1 1 1
```


How many times is the bit at index 0 flipped? \(n\) times. Every time an increment happens, bit 0 is flipped.

At index 1, it is flipped \(\lfloor\frac{n}{2}\rfloor\) time., or every other time.

Finally, at index 2,  \(\lfloor\frac{n}{2^2}\rfloor\).

For arbitrary size \(k\), the bit at index \(i\) from right to left, the number of times the bit at index \(i\) flipped is \(\lfloor\frac{n}{2^i}\rfloor\).

What is the total number of bit flips?

\(T(n) = \sum_{i=0}^{k-1} \lfloor \frac{n}{2^i} \rfloor \leq n\sum_{i=0}^{\infty} \frac{1}{2^i} = 2n \) (from the harmonic series)

Then obviously the average case is \(2\), or \(\Theta(1)\), after dividing by \(n\) to find the amortized cost.

## Accounting method.

Consider an analogy where each operation takes some cost in time \(T\$\). If we have \(T\$\) \(c\) originally, after doing \(n\) operations, we save the remaining \(T\$\) \(c - n\).

* Charge \(i\)th, or \(T\$\) \(\hat{C}_i\)
* Some operations are charged more than the actual cost and some are charged less.
* Extra charge is a "credit" that can be used to pay for future expensive operations.
  * We overcharge early in the future, so we can pay for expensive operations later on
* Credits are assigned to parts of the datastructure
  * easy way to track the overall credit at any time.

**Requirements**
\(C_i\), the actual cost of the \(i\)th operation, and \(\hat{C}_i\) the amortized cost of the \(i\)th operation (amount charged for the operation). 

Then, we must have 

\[
    \sum_{i=1}^n \hat{C}_i \geq \sum_{i=1}^n C_i
\]

for any sequence of \(n\) operations.

The hope is that we have overestimated enough in the beginning to pay for operations in the future.

### Example with binary counter

For each increment, we have to charge some amount. Some bits are flipped, and bits can be flipped from 0 to 1, or 1 to 0. In each increment, we do at most **1** bit flip from *0 to 1*. 

Call *setting a bit* a flip from 0 to 1, and *resetting a bit* a flip from 1 to 0.

Hence, we a have at least one set, and at most \(k\) resets.

We claim that if we charge \(T\$\) \(2\) per increment, then the invariant above will be true.

If we use one dollar for setting 0 to 1, then we have a remaining dollar to attach as a credit for a bit set. The credit is used to pay for the bit *resetting* in the future.

```
0 0 0 RESULT
    2 CHARGE
    1 CREDIT
0 0 1 RESULT
  2 1 CHARGE
  1 0 CREDIT (use one credit from before)
0 1 0 RESULT
...
```
And so forth. The reserve is sufficient to pay for bit flips from one to zero.

Why is the invariant true? The total credit at any point are the number of ones in the bit vector, so it is always non-negative. 