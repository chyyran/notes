# Amortized Analysis 2

## Dynamic Tables

Consider a table `T` with operations `Insert` and `Delete`.

`T : [a, b, c, ], sizeof(T) == 4`

Then, the load factor of T is `count(T) / sizeof(T)`. In this case, the load factor of T is 3/4.

How can we expand `T`? Conceptually we need to allocate a larger table that is larger than `T`, then copy all the items to the new table.

How large should the new table be? Claim that the new size should be twice the size.

1. Allocate a table *twice as large*
2. Copy over the elements to the new table
3. Insert each element to the new table

## Analysis
What is the total cost of a sequence of \(n\) inserts starting from an empty table of size 1?

Then, the total cost divided by \(n\) is the average cost.

Consider \(n\) = 25.

Then 

\(T(n) = 25 + \log 25\) (since we have to do 25 inserts for 25 elements) 

Why is the cost log n?

```
[ ]  + 1 Table Copies
[ , ] + 2 Table Copies
[ , , , ] + 4 Table Copies
```

The table of size 32 will be able to fit 25.

Hence, in general

\[
 T(n) \leq n + \sum_{i=0}^{\lfloor\log_2 n\rfloor} 2^i
\]

Where the summation is the cost of the table expansion (copying items).

Note that the summation is a geeometric series, hence we have

\[
 T(n) \leq n + 2n
\]

And the total is \(T(n) = 3n\), then the average cost is constant (after dividing by \(n\)).

### Accounting Technique

 * how much do you charge per insert?
  
We're going to assign credits to each element, and there is no reserve


```
 0, 0, 0, 0
[a, b, c, d, , , , ]
```


We want to charge at least one value (actual cost of insert), then assign 1 credit for copying e.

* $1 for the cost of insert
* $1 for the credit to move `e` in the future

```
 0, 0, 0, 0  1
[a, b, c, d, e, , , ]
```

However, `e`'s credit only pays for one move!

What if we charge $1 for *one more element from the first half of the array*?

```
 1, 0, 0, 0  1
[a, b, c, d, e, , , ]
```

We do the same for every element we insert


```
 1, 1, 0, 0  1  1
[a, b, c, d, e, f, , ]
```
... et cetera.

Once the table is full, every element will have enough credit to pay for the move. Hence the average cost is 3. 

### What about inserts and deletes?

If we do a lot of inserts, then a lot of deletes, then its a waste of memory.

The idea is the same. If the load factor is too small we will allocate a smaller table and copy over the values to the new table.

If \(\alpha(T)\) becomes small, we allocate a smaller table, then copy all the elements to the smaller table.

How can we augment the structure so memory is not wasted, and the amortize cost per operation is still constant?

So we want

* \(\alpha(T) \geq c\) (minimize waste of memory) 
* Amortized cost is \(\Theta(1)\).

#### Naive Scheme

1. Insert is same as before
2. When \(\alpha(T) = 0.5\), and we delete an element,
3. The size of the new table is half the size of the old one.

However, consider the following bad sequence, where \(n = 2^k\)


* Do \(\frac{n}{2}\) inserts
* Do one more insert (doubling the size of the table) (costs n/2)
* Do 2 deletes (reducing the load factor below 0.5, costing n/2)
* Then two more inserts (costing n/2 due to need of expanding the arraw)


Then after doing this until we've inserted all elements, we will have \(T(n) \geq \frac{n}{4}\cdot\frac{n}{2} \in \Omega(n^2)\).

We can fix this by reallocating only when the load factor goes below 0.25 (one-fourth). This gives us enough breathing room to allow for deletes.

That way, we need at least n/2 inserts for an expansion, and at least n/4 deletes.

How much do we charge? Since we have at least n/2 inserts for expansion, we will have n/2*2 credit, enough for every element.


So Insert is $3
  * $1 is actual cost
  * $2 is credit for future expansion

We can pay for the delete with $2.
  * $1 for the actual delete
  * $1 for credit for future shrinkages.
  * Since there are at least n/4 deletes until contractions, we will jave n/4 credit when that occurs.