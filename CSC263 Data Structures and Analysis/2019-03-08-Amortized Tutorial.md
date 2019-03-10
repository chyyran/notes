Consider a set \([1, 3, 8]\), and a multiset \([8, 3, 3, 1, 8]\) with two operations `Insert(s, x)` and `Diminish(s)`. A multiset is a set where we count duplicates.

Insert simply adds \(x\) to \(S\), and Diminish discards the \(\lceil n/2 \rceil\) largest elements, or half the largest elements of \(S\). How can we implement such a structure?

Linked List?

How do we implement Diminish? We begin by finding the median of the set. `Median`. We then loop over `s` and delete all the elements greater than the median. The next step is to add `m` as many times as needed to ensure the size (to ensure that there are enough elements (at most half) of the set). 

In this case, `Median` returns the \(\lceil n/2 \rceil\)th largest element.

What is the cost of `Diminish` and `Insert` in terms of comparisons?

* Insert does not do any comparisons, so the cost is 0.
* Diminish could do as many as 6 times the size of the set!
* What is the amortized cost of the operations? How many comparisons do we actually do?
* For a single operation Diminish could cost many.
  * Over a long time, the cost of Diminish could be constant
  
We need to change enough for `Insert` to pay for `Diminish` at any time. 1 credit pays for 1 comparison.
We will change $c credits for an insert, despite insert costing 0. Hence we maintain the environment that there is $cn credits after every operation.

Since each diminish costs 6n, we must have \(6n \geq cn-6n \geq c \frac{n}{2}\). Thence \(c\frac{n}{2} \geq 6n \implies c \geq 12\).

Then 

\(12 n - cost(Diminish) \geq 12n - 6n = 6n = 12 \frac{n}{2} \geq 12 \lfloor \frac{n}{2} \rfloor\), where the floored term is the number of elements left after a diminish. All the credits we have saved up so far is enough to pay for a diminish while still having enough to pay for further diminishes.

\(cn - cost(Diminish)\) is how many will actually be left over while \(c \frac{n}{2}\) is how many we want to be left over.

Hence over any sequence of m operations, we will get at most 12m credits. However these 12m credits are enough to pay for the diminish calls. Thus we will make at most 12m comparisons.