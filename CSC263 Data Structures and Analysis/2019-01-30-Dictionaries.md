## Dictionary

* Dictionary is An ADT
* Set of elements \(S\) with keys \(k\) from universe \(U\)
* Ops: Insert, Delete, Search

## Direct Access Table 
For small \(|U|\), store \(S\) in a direct access table \(T = [0, 1, ..., U]\)
ELement \(x\) in key \(k\) stored in \(T[k]\).

For example with \(U = \{0, 1, 2, ... 9\}\), then we can store 9 items by index with \(O(1)\) access trivially. We reserve a spot for every item, so \(O(1)\) access for each operation

However, when \(U\) is large, reserving the spot is too space-inefficient. Instead, we use a hash table.

## Hash Table

* Say we have an employee database
* We can use the SIN number as the key
* Don't want to make a table for every SIN number, the universe is too large.

Have to decide how big the hash table is
* We want an idea of the size \(n=|S|\). And some \(m = |T|: T: [0, 1, m-1]\), and \(m << |U|\), where \(T\) is the size of a direct access table.

A hash function maps a key in \(U\) to a number that is between 0 to m.

\(h(k) = i \in \{0, 1, m-1\}\)

When an employee \(x\) comes with key \(k\), we use the hash function to find an index \(i\), and put \(x\) in the space \(T[i]\). 

```
U = (some set of keys k)

T = |0|1|2|...|i|...|j|...|m-1|
```

Say when we hash \(h(k_1) = i\), then we put \(x_{k_1}\) into \(i\), and similarly with \(h(k_2) = j\) for example.

By the pigeonhole principle, there may be *collisions*. For example, say \(h(k_3) = j\). 

One solution is called **hashing with chaining**, where instead of putting items into a fixed array, we put things into an array of doubly-linked list.

```
|T|
|-|
|0|
|1| -> [k_2] -> [k_1]
...
|i| -> [k_5] -> [k_6]
...
|m-1|
```
When an collision occurs, we simply put it in front of the linked list.

Thence, insertion simply costs \(\Theta(1)\).

Given a pointer to an element \(x\), then `Delete(x)` is also constant, since it's just pointer to an element to a doubly linked list.

Search, for an item with key \(k\), 
  * apply hash function to the key \(h(k) = i\)
  * traverse the linked list at \(i\) to find the item with key \(k\)

Search is proportional to the length of the list at \(T[h(k)]\). Is the worse case \(\Theta(n)\)? If every single item hashes to the same number \(i\), then the worse case is \(\Theta(n)\), since every item just ends up in the same linked list.

However, if we make some assumptions, we can make the average expected cost constant.

1. (**SUHA** assumption) (Simple Uniform Hashing Assumption)
   Any key \(k\) is equally likely to hash into any of the \(m\) slots of \(T\) independently of other keys (uniform distribution). That is, \(P[h(k) = i] = \frac{1}{m}\), for \(0 \leq i \leq m-1\)

Given **SUHA**, if we enter \(n\) elements into the hashtable, the expected length \(E[m_i]\) of the chain at any slot \(i\) is \(\frac{n}{m}\). Note that the probability of a collision is a random variable.

Then there 2 cases for search

* \(k \notin S\) 
  * Then we will have to go through the entire chain, hence the cost is \(\frac{n}{m}\)
* \(k \in S\)
  * Then since every item in the chain is equally likely, the expected cost is \(\frac{1}{2} \cdot \frac{n}{m}\)

Hence, the **expected cost of `Search(k)`** is \(\Theta(\frac{n}{m} = \alpha)\) key comparisons.

\(\alpha\) is also called the load factor. It's called the load factor since it gives a value proportional to the number of elements compared to the size of the table.


We want to "pretend" that \(\alpha\) is constant. If we keep the ratio between \(n\) and \(m\) constant, then \(\alpha\) is constant.  
  
Why can we think of \(\alpha\) as constant?
 * When we "overflow" the hash table, that is when we can reallocate the table an rehash, growing \(m\) to maintain the ratio.

Hence the second assumption: \(m = \Theta(n)\). Now we maintain the ratio, and can think of \(\alpha\) as constant.

## Hash functions

We want an number from 0 to \(m-1\) (\(m\)) is decided. If we take some integer and divide it by \(m\), the remainder is some number from \(0\) to \(m-1\). We don't want to divide by some number that is a common factor. If we choose an \(m\) to be a prime number (smallest above the minimum that we need), then \(h(k) = {k\mod m}\)
