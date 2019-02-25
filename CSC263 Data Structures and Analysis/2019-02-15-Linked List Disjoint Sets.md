# 2019-02-15 Tutorial

Recall that a disjoint set has the following operations

* `Make-Set(x)`
  * Makes an element into a set
* `Union(x,y)`
  * Combines two sets together, with two representatives.
  * Only operation that can change the datastructure
* `Find(x)`
  * Returns the representative of the set that contains `x`

* Example of usage (degrees of separation for people)
  * union when 2 people meet
  * very powerful in determining relatedness

## Linked List Implementation

* Naive
  * Initially create 1 element list
  * Representative is the head of the list
  * Union just concatentates 2 list
  * Find returns head of the list

* When we update the head, we have to update the pointers to head for every element
* Find takes O(1)
* Union takes WC O(n)
* Minimize the number of updates to represenativies

* Weighted Union
  * Make the smaller list the tail
  * WC running time still n

**Claim**
> Given any sequence of \(Union\) and \(m\) operations of \(Find\), the total time is \(\mathcal{O}(n \log n + m)\)

**Proof**
* If there was exactly 1 union, then we know the length is exactly 2.
* If there was some other union, x is in a length of at least 2
* We union a set as a tail when its smaller than the other one.
  * then the head list is at least 2.
  * then x is at least 4
    * similarly, for the next union, the tail is at least 4, thus the head is also at least 4, hence x is in a list of at least 8.
* After a union of \(x\), \(k\) times, then \(x\) is in a list of length at least \(2^k\). 