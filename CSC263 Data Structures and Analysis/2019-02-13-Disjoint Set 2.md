# 2019-02-13

* no insert in disjoint sets
* know its the root when there is no parent
  * that is the representative
* cost of the find is the cost of traversing the find path
* union is usual very cheap for tree disjoint sets*
  * if we're not careful, we could do \(n-1\) unions and then we create a degenerate tree linked list
* we need to **reduce the height** of the trees formed during the execution of \(\sigma\) (arbitrary sequence of unions and finds).
  * one way to do this is to use weighted union by size (make the smaller tree the child, the bigger tree the parent)

```

              
           - B
          / / \
       - / /   \
      /   /  L  \
     /   /       \
    /   /---------\
   A
  / \
 / S \
/-----\
```

With WU, any tree \(T\) created during the execution of \(\sigma\) has height at most \(\log n\) Then the worse case is \(O(m \log n)\) for \(\sigma\) 

## Path Compression


``` 
          +---Root
          |  / \
          | /---\
          | 
      +---Z 
      |  / \
      | /---\
      |
  +---Y
  |  / \
  | /---\
  | 
  X 
 / \
/---\
```

For the first traversal of the tree, we do a full traversal to the root through each tree.

However, after the first traversal, we update parent pointer to the root
directory (we have to scan again).



``` 
      +-----Root
     /       / \
    /       /---\
   /         
  +-------Z 
  |      / \
  |     /---\
  |    
  +---Y
  |  / \
  | /---\
  | 
  X 
 / \
/---\
```

Then the price of the **first find** is \(O(2 \times\text{price of old find x})\).

Notice that none of the children **lower than `X`** are changed.



```
      +------Root
     /      
    /
   /
  +------ Y
  |      / \
  |     /---\
  X
 / \
X1  X2
```

However, the children of X still benefit! Their path becomes shorter.

The initial find of an element becomes more expensive (by a constant factor), but the cost of subsequent finds become cheaperx, and the average cost decreases! Notice that each find is still within \(O(f(x))\) where \(f(x)\) is the cost of a find.

* What is the cost of \(\sigma\) with both weighted-unions and path compression?
  * Without PC, we have cost \(O(m \log n)\)
  * ... we lack the tools to analyze this so far.
  
## Analyzing \(\sigma\) with PC.

Define \(2^{*n}\) such that \(2^{*0} = 1\), and \(2^{*n+1} = 2^{2^{*n}}\).

then \(2^{*0} = 1, 2^{*1} = 2^{2^{*0}} = 2, 2^{*2} = 2^{2^{*1}} = 4, ...\)

Note that \(2^{*5} = 2^{65536} \approx 10^{19729} \)

This number grows extremely fast with \(n\).

Define \(\log^*{n}\), where \(\log^* n  = \min{\{k:2^{*k} \geq n\}}\).

This number grows extremely slowly!

For example, \(\log^*{10^{19729}} = 5\)!. It is almost the inverse of \(2^{*n}\). Note that although \(\log^*{n}\) grows extremely slowly, it is not a constant, it still grows. Be careful when bounding this number in proofs.


**Theorem**
>With WU and PC, executing \(\sigma\) takes \(O(m \log^{*} n)\) time.
> * Every such \(\sigma\) will take **at most** \(m \log^*{n}\) time, for large \(m, n\), within a constant factor.
>  * No proof of this result in this course :(

Is there some \(\sigma\) that takes at least \(m \log^* n\) time?

Then, can we prove the following?
**Claim**
> With WU and PC, executing every such \(\sigma\) takes \(O(m)\) time?

In other words, the contrapositive, is there some sequence of operations \(\sigma\) that actually costs \(m \log^* n\)? If so, then we can say \(\Theta(m \log^{*} n)\). 

## Analysis of Disjoint Forest History

* **1964**
  * Forest implementation introduced
  * Bernard A. Galler, 
  * Michael J. Fischer
* **1973**
  * Proof of \(O(m \log^* n)\) upper bound for Forest Implementation
  * John E. Hopcroft
  * Jeffrey D. Ullman
  * **9 years!!**
* **1975**
  * Proof of \(O(m \cdot \alpha(m,n))\) upper bound for Forest Implementation
  * Robert E. Tarjan
  * \(\alpha\) is the inverse Ackermann function
* **1979**
  * Proof of \(\Omega(m \cdot \alpha(m,n))\) lower bound for *any* Disjoint-Set data structure (that satisfies some "technical assumptions")
  * Robert E. Tarjan
  * Any Disjoint-Set datastructure has a sequence that at least costs \(m \cdot \alpha(m,n)\), there is at least one bad sequence.
* **1989**
  *  Proof of \(\Omega(m \cdot \alpha(m,n))\)  for **any** Disjoint-Set data structure
  *  Michael L. Friedman
  *  Michael E. Saks