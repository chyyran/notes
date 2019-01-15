# 2019-01-14

Want to create a priority queue that is mergeable


|ADT|DS|Insert|Min|Extract|Union|
|-|-|-|-|-|-|
|PQ|Min-Heap|log n|1|log n|NO|
|Mergeable PQ|Min Binomial Heap|log n|log n |log n| log n|

Elements of binomial heaps are stored in a sequence of binomial trees.

A binomial tree \(B_k\) is defined recursively.

For \(k = 0\), \(B_o\) is just a singleton node.
For \(k \geq 1\), 

We attach the root of one tree, and attach it as the *leftmost* child of the other. So the **leftmost child** is going to be \(B_{k-1}\).
```
  O [B_{k-1}]
 /
O [B_{k-1}]
```

Some examples

```
[B_0]

O
```

Take 2 \(B_0\) and connect them together.
```
[B_1]
O
|
O
```

Take 2 \(B_1\) and connect them together
```
[B_2]
  O
 /|
O O
|
O
```


Take 2 \(B_1\) and connect them together
```
[B_3]

Connect the two roots
  
  O----O
 /|   /|
O O  O O
|    |
O    O

Lifting up the right tree to show "tree-ness"

       O
    /  | 
   /  /|
  O  O O
 /|  |
O O  O
|
O
```
It's called  binomial tree because the 
\(B_k\) tree has
  * height \(k\)


A **binomial forest** \(F_n\) of size \(n\) is a sequence of \(B_k\) trees with strictly decreasing \(k\) and a total of \(n\) nodes

For example a binomial forest \(F_9\) of \(n=9\)  

\(n = < 1 0 0 1 >_2 = 2^3 + 2^0 F_9 = < B_3 B_0 >\). Each binomial forest has a unique representation. Decompose \(n\) in binary notation, then select the unique binary tree for that composition.

* \(F_n\) has \(n\) nodes, \(n = <b_t, b_{t-1}, ... ,b_0>_2\) Note that \(t = \log_2 n\).

* \(F_n: < \text{ all trees } B_i \text{ such that bit } b_i = 1\) 

\(\alpha(n)\) = number of 1 in binary representation of \(n\)

* \(F_n\) has \(\alpha(n)\) trees
* \(F_n\) has \(n - \alpha(n)\) edges


A **min binomial heap** of \(n\) elements is a forest such that 

1. Each node of \(F_n\) stores one element
2. Each tree of the forest is min-heap ordered.

Consider 
\(S = 10, 13, 1, 3, 8, 18, 7\)

We want to put \(S\) into \(F_7 = < B_2 B_1 B_0 >_2\)

```
B_0
10

B_1
1
|
13

B_2

  3
 /|
7 8
|
18
```

The comparisons needed to build the heap is equal to the number of edges.

* Take 2 numbers, and construct a tree \(B_1\) out of them. Then take 2 trees and compare the roots.

A binary heap for \(n\) elements can be built in \(O(n)\) key comparisons.

## Memory representation

```
   O<==O
 ^/ ^
/v  |
O==>O
|^
v|
O
```
In each node, store a parent pointer (`|`), left child pointer (`|`), and a right sibling pointer (`=`).

Then we use a hack to use sibling pointers to connect trees.

## Binomial Heap Operations

```rust
trait MergeableMinHeap<T> {
  fn union(mut self, q: Self);
  fn insert(mut self, q: T);
  fn min(self) -> &T;
  fn extract_min(self) -> T;
}
```

**Lemma 1** Can merge 2 min-heap \(B_k\) trees into a single min heap ordered \(B_{k+1}\), with just one comparison.

**Proof**. Consider 2 trees with roots \(x\) and \(y\). Then attach the greater rooted tree as a left child of the tree with the other, to maintain the min-heap property.

eg. if \(y < x\).
```
  BY
 /
BX
```

**Lemma 2** Deleting the root of a min-heap ordered \(B_k\)
 tree gives a min-binomial heap.

 **Proof**
 ```
   O
  /|
 / |
/ /|
2 1 0
 ```

 ```
/ /|
2 10
```
