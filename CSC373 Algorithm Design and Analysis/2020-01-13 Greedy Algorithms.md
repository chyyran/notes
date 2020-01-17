# 2020-01-13 Greedy Algorithms

## Interval Scheduling Problem

* Jobs \(j\) start at a time \(s_j\), and finish at \(f_j\). 
* Two jobs are *compatible* if they do not overlap.
* **We want to find the largest subset \(S\) of mutually compatible jobs**. That means no two jobs overlap.
* Bruteforce is \(2^n\) because we need to check all of the possible subsets of size less than \(n\).

What is a **greedy** approach?
* Consider jobs in some **reasonable order**.
* Take jobs one by one, provided each job is compatible with the preivously selected job.
* How do we order?
  * Earliest start time
  * **Earliest finish time**
    * ```haskell
      let s_j = sort j
      do 
        jobs <- get
        if compatible a $ first s_j
            put $ eft $ rest j -- add to list if compatible
        else 
            eft $ rest j -- continue
      ```
    This is in \(O( n \log n)\) due to the sort, and this
    algorithm always gives a solution.
  * Shortest interval
  * Fewest conflicts 
 * Everything except EFT does not result in the correct result.
    * Can be proved incorrect with a trivial counterexample.

### Proof of correctness of EFT Greedy
* Prove that at each step, the subset \(S\) is promising.
  * Up to the \(k^{th}\) iteration, the algorithm returns an optimal solution so far.
  * Define \(L(k)\) as after the \(k\)th step, there exists an optimal solution \(O\) such that \(J(i)\ \in S\) if and only if \(J(i) \in O\) for \(i = 1... k\)
* Base case:
  * If \(k = 0\), \(L(0)\) holds because \(S\) is the empty set and is a subset of \(O\).
* Inductive step.
  * Suppose \(L(k)\), that is there are \(r\) jobs belonging to both \(S\) and \(O\); Want to show that the \(k+1\) iteration selected by the greedy algorithm belongs to an optimal solution. Remember \(S(k)\) is the subset that the algorithm returns after \(k\) iterations, and \(O\) is the optimal (perfect) solution.
    * Case 1:\(J(k+1) \notin S(k+1)\)
      * If \(J(k+1) \notin S(k+1)\), then it can also not be in \(O\).
        * \(S(k+1)\) must return a non-conflicting job. So \(J(k+1) \notin S(k+1)\) is impossible. 
    * Case 2a: \(J(k+1) \in O \implies L(k+1)\)
    * Case 2b: \(J(k+1) \notin O\)
      * The \(r+1\)th job in \(O\) has finish time later than \(J(k+1)\). So by changing the \(r+1\)th job in \(O\) with \(J(k+1)\) we can have an optimal answer whose \(r+1\) first elements are in \(S(k+1) \implies L(k+1)\).