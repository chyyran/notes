# 2020-01-06 Divide and Conquer

* Paradigm
  * Break problem \(k\) size subproblems of the same type (**usually \(k = 2\)**).
  * We solve each of \(k\) problems recursively
  * Merge \(k\) results in one solution for bigger problem in linear time.
* Bruteforce algorithms that solve in \(\mathcal{O}(n^k)\), but with divide and conquer, we can potentially bring down the time to \(\mathcal{O}(n \log n)\).

## Example: Counting inversions
* Movie tries matching preference in movies with others
  * Rank \(n\) songs
  * Use database to find users with similar tastes
* Measure of closeness (similarity metric) is the number of inversions between two preference lists

| |A|B|C|D|E| 
|-|-|-|-|-|-|
|U1|1|2|3|4|5|
|U2|1|3|4|2|5|

We invert movies \(i\) and \(j\) if \(i < j\). We see here that we can do this in 2 inversions but a bruteforce approach is in exponential time.

Consider the list 
`[1, 5, 4, 8, 10, 2, 6, 9, 3, 7]`

We want to *sort* it and count how many flips are needed to sort.

Split the list into 2,
`L1 = [1, 5, 4, 8, 10]` `L2 = [2, 6, 9, 3, 7]`

Then flips for `L1` is `5-4`, and flips for `L2` is `6-3`, `9-7`

However the merge step is still exponential.
## Master theorem
Recall the master theorem

\[
T(n) \in \begin{cases} \theta(n^d) & a < b^d \\ \theta(n^d \log n) & a = b^d \\ \theta(n^{\log_b a}) & a > b^d\end{cases}
\]

where \(b\) is how many parts we divide the problem into, \(a\) is the amount of recursive calls. \(d\) is the degree of the cost of splitting and combining if \(f(n)\) is polynomial.

and \(T(n) = \begin{cases} k & n \leq B \\ aT(\frac{n}{b}) + cn^d) & n > B\end{cases}\)

## Mergesort

Define \(T(n) =\) max nuber of comparisons to merge two sorted lists in a larger sorted list.

Then our recurrence relation

\[
    T(n) \leq 
    \begin{cases}
        0 & n = 1 \\
        T(\lfloor \frac{n}{2} \rfloor) + (\lceil \frac{n}{2} \rceil) + n & n > 1
    \end{cases}
\]

We want to show \(T(n) \in O(n \log n)\). By recurrence tree, if \(n\) is a power of 2, we have the number of levels in the tree as \(\log n\).