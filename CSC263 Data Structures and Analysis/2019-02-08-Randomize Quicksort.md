# Randomized Quicksort

**input** Set \(S\) of \(n\) distinct keys
**output** Set of keys of \(S\) in increasing order

For some fixed input \(I\), the algorithm behaves randomly to gain good average case behavior for a fixed input.

\(RQS(S)\)
* If \(S\) is empty, then return
* If \(|S| = 1\) , then output the single key in \(S\)
* Select a key \(p \in S\) (pivot) randomly. Comparing \(p\) to every other key in \(S\), split \(S\) into
  * \(S_< = \{s \in S|s < p\}\)
  * \(S_> = \{s \in S|s > p\}\)
* Return \([...RQS(S_<), p, ...RQS(S_>)]\)

## Example execution

```python
S = [2, 8, 7, 1, 3, 4, 6, 5]
Pivot = RandSelect(S)  # 4

# n-1 comparisons with Pivot
S_lt = [2, 1, 3]
S_gt = [8, 7, 6, 5]


Pivot_lt = RandSelect(S_lt) # 3
S_lt_lt = [2, 1]
S_lt_gt = []

Pivot_lt_lt = RandSelect(S_lt_lt) # 1
S_lt_lt_lt = []
S_lt_lt_gt = [2]

# * 1 2 3 * 4 ... similarly for S_gt: 
```

Notice that this algorithm recurses left. It is an in-order traversal of the recursion.

* Which pair of keys are compared?
  * 2 keys are compared if and only if at least one of the keys are pivots
* How many times are a particular pair keys compared?
  * Once, one of them are a pivot, then the other goes left or right in the recurse tree.
* If 2 keys are split apart by a pivoting operation, they will never be compared.
  * for example `[..., 7, 1, ...]` are split by a pivot of `4`, they will never be compared.
* In the worst case, if we select the smallest key at random, the left will be the empty set, and everything will be on the right. If we keep selecting the smallest key in the remaining set we will have \(\theta(n^2)\)
  * we have to be very unlucky for this to happen
* average with respect to (all the possible pivot selections), for a fixed input \(S\)
  * let \(C\) be the number of key comparisons done by \(RQS(S)\). \(C\) is a random variable.
    * for each run of \(RQS(S)\), \(c\) will be a different number.
  * We are trying to find \(E[C]\), the expected value of \(C\).
    * over all possible random pivot selections done by \(RQS(S)\)

## Computing \(E[C]\)

* Let \(Z\) be the sorted set of \(S\), Hence \(z_1, z_2, ..., < z_i < ... < z_j < ... < z_m\), all in \(S\). Note that we have not sorted the set \(S\), but \(Z\) is the elements of \(S\) in sorted order.  Let \(c_{ij}\) be 1 if \(z_i\) and \(z_j\) are compared by \(RSQ(S)\) and 0 otherwise.
* Then the total number of comparisons \(C = \sum_{1 \leq i < j < m} c_{ij}\). Since \(C\) is a sum of random variables, we have 
  
  \[E[C] = E[\sum_{i < j} c_{ij}] = \sum_{i < j} E[c_{ij}] = \cdot P(c_{ij} = 1) + 0 cdot P(c_{ij} = 0) = P(c_{ij} = 1) = P(z_i z_j \text{are compared})\]
  
* claim that this is equal to 2 / j-i + 1
* \(E(C) = \sum_{1 \leq i < j < m} \frac{2}{j-i+1} = ... = 2m(1 + 1/2 + 1/3 + ... + 1/m)\) that sum is the harmonic series, which is close to to order \(\log n\)  



Let \(z_1 < z_2, ... < z_i < ... < z_j, ... < z_m\), the chance it will be compared is either 0 if the pivot is between \(i\) and \(j\). Otherwise, then the probability is 2 over however many choice are between i and j, since there are 2 keys to be compared. 2 adjacent (in order) elements will always be compared at some point. At some point, it needs to split the adjacent elements. Call \([z_i, z_j] = Z_{ij}\) Then \(|Z_{ij}| = j - i + 1\). As long as the pivot isn't within that range, then \(i\) and \(j\) will stay together. Once the algorithm selects a pivot inside the range, then any one of them is equally likely to be selected as a pivot. If the pivot chosen is \(i\) or \(j\), then they will be compared. Hence the probability that they will be compared is \(\frac{2}{j - i + 1}\).