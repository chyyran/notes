# Binomial Heaps

Recall binomial trees \(B_k\).


You have a node \(B_k\), and its children \(B_0, B_1, B_2, ..., B_{k-1}\)

A forest is a unique set of binary trees with \(n\) nodes. 

\(n = 9 = < 1001>_b = 2^3 + 2^0 = B_3 + B_0\)

A **min binomial heap** of \(n\) elements is a **Binomial Forest \(F_n\)** such that 

1. each node of \(F_n\)
2. each \(B_k\) tree of \(F_n\) is in min-heap order where
   1. the root key is smaller than its children
   2. roots are unsorted.

How do we do an operation in \(log_n\) time?

> **Lemma 1**:
> Can merge 2 min-heap ordered \(B_k\) trees into a single min heap ordered \(B_{k+1}\) tree with just one key comparison
>
> We can compare the two roots, and compare the smaller root the parent of the larger root.

> **Lemma 2**
> Deleting the root of a min heap ordered tree \(B_k\) tree gives min binomial heap. 
>
> We can delete the root of a min heap-ordered \(B_k\) tree, and we get a min-binomial heap

\(S: Union(T,Q)\)
> \(T\) is a binomial heap of size \(n = 3 = <11>_2\), and \(Q\) a binomial heap \(n = 7 = <111>_2\).
>
> Well, consider adding 7 to 3. in binary we get a carry.
```
  111 # carry.
----- 
   11
+ 111
-----
```

```
3 + 6 => 3-6 
2-4 + 1-8 => carry (1-8)-(2-4), drop 3-6.
...
```

For each merge, carry the resulting tree over, and drop the previous tree as the new.

\(S: Insert(T, x)\)
> We simply create \(B_0\) containing only \(x\), then do the union. Then the union between \(T\) and \(B_0\). Costing \(\log n\)

\(Min(T)\)
> Loop on the roots, there are \(\log n\) roots. 

\(ExtractMin(T)\)
> When we remove a root, we get a binomial heap back \(B_U\), and the rest of it, \(B_S\). Then we union the two heaps.

## Some more operations
Given a pointer to a node \(x\) in a binomial heap \(T\), we can
* \(DecreaseKey(T, x, k)\), that decreases the key at node \(x\) at \(k\). But having a small key in the middle should be in the root. To fix this, we can compare it with the parent, and swap if necessary, bubbling up to the root.
* \(Remove(T, x)\), that removes the key at node \(x\). 
  * \(DecreaseKey(T, x, 0)\)
  * \(ExtractMin(T)\)
  * \(= O(\log n)\).
* How do we \(IncreaseKey(T, x, k)\)?

## Cost of \(k\) successive inserts?

Consider a binomial heap \(T\) with \(n\) elements. Then for \(k\) successive inserts...

\(Insert(T, x_1), Insert(T, x_2), ... , Insert(T, x_k)\).

Would that then be

\(O(\log n) + O(\log {n + 1}) + ... + O(\log{n + k}) = O(k \log{(n+k)})\)?

But is the cost of \(k\) successive inserts lower? 

**Example**
Give \(T = 27 = <11011>_2\)

```
       11
    ------
  T| 11011
+ x|     1
----------
     11100
```

When we add 100 to 011, note that we don't need to compare keys, just drop down. Thus this costs 2.

Then continuing..

```
    ------
  T| 11100
+ x|     1
----------
     11101
```

This costs nothing.

```
        1
    ------
  T| 11101
+ x|     1
----------
     11110
```

This costs 1 comparison


```
         1
    ------
  T| 11110
+ x|     1
----------
     11111
```
This is also free.

```
    11111
    ------
  T| 11111
+ x|     1
----------
    100000
```

This costs 5.

For 5 insertions, we have \(2 + 0 + 1 + 0 + 5 = 8\) comparisons, so the average cost is good. 

Initially, \(T\) has \(27 - \alpha(27) = 27 - 4 = 23\) edges.
After 5 insertions, \(T\) has \(32 - \alpha(32) = 32 - 1 = 31\) edges.

**You don't add an edge unless you do a comparison** 
Can we lower our bound for successive \(k\) inserts?

> **Claim** If \(k > \log_2 n\), then the total cost is at most \(2k\) key comparisons, which is much smaller than \(k \log_2 n\).
> **Proof** in *A2 Q4`*

Thence the average cost per int is \(2k / k \leq 2\) comparisons. Intuitively, in the average case, we will hit a 0 when merging heaps very within 2 comparisons.
